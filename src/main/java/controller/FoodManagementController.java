package controller;

import bean.Account;
import bean.Shop;
import dao.ShopDao;

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

    private ShopDao shopDao = new ShopDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Account accountCurrent = (Account) session.getAttribute("account");
            List<Shop> listShopByAccount = shopDao.getListShopByAccountAndActive(accountCurrent.getAccountId());
            request.setAttribute("listShopByAccount", listShopByAccount);
            request.getRequestDispatcher("food.jsp").forward(request, response);
        }
    }
}
