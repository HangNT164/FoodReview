package controller;

import bean.Food;
import dao.FoodDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddFoodController", value = "/add-food")
public class AddFoodController extends HttpServlet {

    private FoodDao foodDao = new FoodDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            int shopId = Integer.parseInt(request.getParameter("shopId"));

            // Create Topic
            Food food = Food.builder()
                    .shopId(shopId)
                    .foodName(name)
                    .status("active")
                    .description(description)
                    .rate(0)
                    .build();

            // Insert
            boolean addFood = foodDao.addFood(food);
            if (!addFood) {
                request.setAttribute("message", "Tạo đồ ăn mới thất bại");
                request.getRequestDispatcher("food.jsp").forward(request, response);
            }
            response.sendRedirect("food-management");
        }
    }
}
