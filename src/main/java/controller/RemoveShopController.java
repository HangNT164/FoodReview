package controller;

import dao.ShopDao;
import util.ValidateHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RemoveShopController", value = "/remove-shop-management")
public class RemoveShopController extends HttpServlet {

    private ShopDao shopDao = new ShopDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int shopId = ValidateHelper.getValidateID(request.getParameter("shopId"));
            boolean removeShop = shopDao.removeShop(shopId);
            if (!removeShop) {
                request.setAttribute("message", "Xóa cửa hàng thất bại");
                request.getRequestDispatcher("shop-management.jsp").forward(request, response);
            } else {
                response.sendRedirect("shop-management");
            }
        }
    }
}
