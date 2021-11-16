package controller;

import dao.ShopCommentDao;
import util.ValidateHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;

@WebServlet(name = "RemoveYourComment", value = "/remove-your-comment")
public class RemoveYourCommentController extends HttpServlet {
    private ShopCommentDao shopCommentDao = new ShopCommentDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        try (PrintWriter out = response.getWriter()) {
            int shopCommentId = ValidateHelper.getValidateID(request.getParameter("shopCommentId"));
            boolean update = shopCommentDao.removeShopComment(shopCommentId);
            if (!update) {
                request.setAttribute("message", "Xóa comment thất bại");
                request.getRequestDispatcher("detail-shop.jsp").forward(request, response);
            } else {
                response.sendRedirect("home");
            }
        }

    }
}