package controller;

import bean.Account;
import bean.FoodComment;
import dao.FoodCommentDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "AddFoodCommentController", value = "/add-food-comment")
public class AddFoodCommentController extends HttpServlet {
    private FoodCommentDao foodCommentDao = new FoodCommentDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter printWriter = response.getWriter()){
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession(true);

            Date date = new Date();
            Account account = (Account) session.getAttribute("account");
            Integer foodId = request.getParameter("foodId") != null ? Integer.parseInt(request.getParameter("foodId")) : null;
            String content = request.getParameter("content");

            FoodComment foodComment = FoodComment.builder()
                    .foodId(foodId)
                    .accountId(account.getAccountId())
                    .status("active")
                    .content(content)
                    .createdDate(date)
                    .build();
            boolean addFoodComment = foodCommentDao.addFoodComment(foodComment);
            if (!addFoodComment) {
                request.setAttribute("message", "You can't comment to this food!!!");
                request.getRequestDispatcher("detail-food.jsp").forward(request, response);
            }
            else response.sendRedirect("detail-food");
        }
    }
}
