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

@WebServlet(name = "UpdateFoodCommentController", value = "/update-food-comment")
public class UpdateFoodCommentController extends HttpServlet {
    private FoodCommentDao foodCommentDao = new FoodCommentDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter printWriter = response.getWriter()) {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            Integer foodId = request.getParameter("foodId") != null ? Integer.parseInt(request.getParameter("foodId")) : null;
            int foodCommentId = ValidateHelper.getValidateID(request.getParameter("foodCommentId"));
            String updateContent = request.getParameter("updateContent");
            boolean update = foodCommentDao.updateFoodComment(foodCommentId, updateContent);
            if (!update) {
                request.setAttribute("message", "You can't update this comment!!!");
                request.getRequestDispatcher("detail-food.jsp").forward(request, response);
            }
            response.sendRedirect("detail-food?foodId=" + foodId);
        }
    }
}
