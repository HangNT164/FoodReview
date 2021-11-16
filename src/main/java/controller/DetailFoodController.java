package controller;


import bean.Account;
import bean.Food;
import bean.FoodComment;
import dao.FoodCommentDao;
import dao.FoodDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/detail-food")
public class DetailFoodController extends HttpServlet {
    private FoodDao foodDao = new FoodDao();
    private FoodCommentDao foodCommentDao = new FoodCommentDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Integer foodId = request.getParameter("foodId") != null ? Integer.parseInt(request.getParameter("foodId")) : null;
        Account account = (Account) request.getSession().getAttribute("account");
        if (foodId != null) {
            Food food = foodDao.findFoodById(foodId);
            request.setAttribute("food", food);
            List<FoodComment> foodCommentList = foodCommentDao.allCommentByFoodId(foodId);
            request.setAttribute("foodCommentList", foodCommentList);
        }

        request.getRequestDispatcher("detail-food.jsp").forward(request, response);
    }
}
