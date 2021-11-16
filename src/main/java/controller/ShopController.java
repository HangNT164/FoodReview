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
import java.util.List;

@WebServlet(name = "ShopController", value = "/shop-management")
public class ShopController extends HttpServlet {

    private ShopDao shopDao = new ShopDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String shopName = request.getParameter("name");
        String status = request.getParameter("status");
        Account account = (Account)session.getAttribute("account");

        List<Shop> listShop;
        if (shopName != null && status != null) {
            if (status.equals("")) {
                listShop = shopDao.getListShopByAccountIdAndName(account.getAccountId(), shopName);
            } else {
                listShop = shopDao.getListShopByNameAndStatus(account.getAccountId(), shopName, status);
            }
        } else if (shopName == null && status != null) {
            if (status.equals("")) {
                listShop = shopDao.getListShopByAccountIdAndName(account.getAccountId(), "");
            } else {
                listShop = shopDao.getListShopByNameAndStatus(account.getAccountId(), "", status);
            }
        } else if (shopName != null) {
            listShop = shopDao.getListShopByAccountIdAndName(account.getAccountId(), shopName);
        } else {
            listShop = shopDao.getListShopByAccountIdAndName(account.getAccountId(), "");
        }
        request.setAttribute("listShopByName", listShop);
        request.getRequestDispatcher("shop-management.jsp").forward(request, response);
    }
}
