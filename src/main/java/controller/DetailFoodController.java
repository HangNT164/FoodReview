package controller;


import bean.Food;
import dao.FoodDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/detail-food")
public class DetailFoodController extends HttpServlet {
    private FoodDao foodDao = new FoodDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Integer foodId = request.getParameter("foodId") != null ? Integer.parseInt(request.getParameter("foodId")) : null;
        if (foodId != null) {
            Food food = foodDao.findFoodById(foodId);
            request.setAttribute("food", food);
        }

        request.getRequestDispatcher("detail-food.jsp").forward(request, response);
    }
}
