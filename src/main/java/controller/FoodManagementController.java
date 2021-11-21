package controller;

import bean.Account;
import bean.Food;
import bean.Shop;
import dao.FoodDao;
import dao.ShopDao;
import util.ValidateHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "FoodManagementController", value = "/food-management")
public class FoodManagementController extends HttpServlet {

    private FoodDao foodDao = new FoodDao();
    private ShopDao shopDao = new ShopDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        List<Shop> listShopByAccount = shopDao.getListShopByAccountAndActive(account.getAccountId());
        request.setAttribute("listShopByAccount", listShopByAccount);

        int accountId = account.getAccountId();
        String foodName = request.getParameter("foodName");
        String status = request.getParameter("stat");
        List<Food> foodList;
        if (foodName != null && status != null) {
            if (status.equals("")) {
                foodList = foodDao.allFood(accountId, foodName);
            } else {
                foodList = foodDao.allFoodByStatus(accountId, foodName, status);
            }
        } else if (foodName == null && status != null) {
            if (status.equals("")) {
                foodList = foodDao.allFood(accountId, "");
            } else {
                foodList = foodDao.allFoodByStatus(accountId, "", status);
            }
        } else if (foodName != null) {
            foodList = foodDao.allFood(accountId, foodName);
        } else {
            foodList = foodDao.allFood(accountId, "");
        }
        request.setAttribute("foodList", foodList);
        request.getRequestDispatcher("food-management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String foodName = request.getParameter("foodName");
            String status = request.getParameter("status");
            String description = request.getParameter("description");
            int foodId = ValidateHelper.getValidateID(request.getParameter("foodId"));
            Food food = Food.builder()
                    .foodName(foodName)
                    .status(status)
                    .description(description)
                    .build();
            boolean update = foodDao.updateFood(foodId, food);
            if (!update) {
                request.setAttribute("message", "Cập nhật thất bại");
                request.getRequestDispatcher("food-management.jsp").forward(request, response);

            }
            else response.sendRedirect("food-management");
        }
    }
}
