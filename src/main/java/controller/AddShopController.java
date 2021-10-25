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

@WebServlet(name = "AddShopController", value = "/add-shop")
public class AddShopController extends HttpServlet {

    private ShopDao shopDao = new ShopDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account accountCurrent = (Account) session.getAttribute("account");

        // get Value
        String shopName = request.getParameter("shopName");
        String address = request.getParameter("address");
        String description = request.getParameter("description");
        
        // Create Shop
        Shop shop = Shop.builder()
                .accountId(accountCurrent.getAccountId())
                .shopName(shopName)
                .address(address)
                .description(description)
                .build();

        // add shop
        boolean addShop = shopDao.addAccount(shop);
        if (!addShop) {
            request.setAttribute("message", "Add New Shop Fail!");
            request.getRequestDispatcher("shop-management.jsp").forward(request, response);
        }
        response.sendRedirect("shop-management");

    }
}
