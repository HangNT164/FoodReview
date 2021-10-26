package controller;

import bean.Shop;
import dao.ShopDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShopController", value = "/shop-management")
public class ShopController extends HttpServlet {

    private ShopDao shopDao = new ShopDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String shopName = request.getParameter("name");
        String status = request.getParameter("status");

        List<Shop> listShop;
        if (shopName == null || status == null) {
            listShop = shopDao.getListShopByNameAndStatus("" , "");
        } else {
            listShop = shopDao.getListShopByNameAndStatus(shopName, status);
        }
        request.setAttribute("listShopByName", listShop);
        request.getRequestDispatcher("shop-management.jsp").forward(request, response);
    }
}
