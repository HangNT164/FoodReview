package controller;

import bean.Shop;
import dao.AccountDao;
import dao.ShopDao;
import util.ValidateHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateShopController", value = "/update-shop")
public class UpdateShopController extends HttpServlet {

    private ShopDao shopDao = new ShopDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String shopName = request.getParameter("shopName");
            String address = request.getParameter("address");
            String description = request.getParameter("description");
            String status = request.getParameter("status");
            int shopId = ValidateHelper.getValidateID(request.getParameter("shopId"));
            if (shopId < 0) {
                request.setAttribute("message", "Lỗi hệ thống");
                request.getRequestDispatcher("shop-management.jsp").forward(request, response);
            } else {
                Shop shop = Shop.builder()
                        .shopName(shopName)
                        .address(address)
                        .description(description)
                        .status(status)
                        .build();
                boolean update = shopDao.updateShop(shopId, shop);
                if (!update) {
                    request.setAttribute("message", "Cập nhật cửa hàng thất bại");
                    request.getRequestDispatcher("shop-management.jsp").forward(request, response);
                } else {
                    response.sendRedirect("shop-management");
                }
            }

        }
    }
}
