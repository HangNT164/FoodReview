package controller;

import bean.Shop;
import constant.ConstantNumber;
import dao.ShopDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShopReviewerController", value = "/shop-reviewer")
public class ShopReviewerController extends HttpServlet {

    private ShopDao shopDao = new ShopDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<Shop> listShop = shopDao.listShop();
        List<Integer> listPage = shopDao.getListPage(listShop, ConstantNumber.pageNum);
        List<Shop> listShopInAPage;
        String pageIdStr = request.getParameter("pageId");
        if (pageIdStr == null) {
            listShopInAPage
                    = shopDao.getListShopInPage(1, ConstantNumber.pageNum);
        } else {
            int pageID = Integer.valueOf(pageIdStr);
            listShopInAPage
                    = shopDao.getListShopInPage(pageID, ConstantNumber.pageNum);
        }

        request.setAttribute("listShopInAPage", listShopInAPage);
        request.setAttribute("listPage", listPage);

        request.getRequestDispatcher("shop-reviewer.jsp").forward(request, response);
    }
}
