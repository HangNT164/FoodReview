package controller;

import dao.FoodCommentDao;
import util.ValidateHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RemoveFoodCommentController", value = "/remove-food-comment")
public class RemoveFoodCommentController extends HttpServlet {
    private FoodCommentDao foodCommentDao = new FoodCommentDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter printWriter = response.getWriter()) {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");

            int foodCommentId = ValidateHelper.getValidateID(request.getParameter("foodCommentId"));
            boolean remove = foodCommentDao.removeFoodComment(foodCommentId);
            if (!remove) {
                request.setAttribute("message", "You can't remove this comment!!!");
                request.getRequestDispatcher("detail-food.jsp").forward(request, response);
            }
            else response.sendRedirect("detail-food");
        }
    }
}
