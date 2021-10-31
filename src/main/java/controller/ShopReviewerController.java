package controller;

import bean.Shop;
import constant.ConstantNumber;
import dao.ShopDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        List<Shop> listShopInAPage;
        String pageIdStr = request.getParameter("pageId");
        String shopName = request.getParameter("shopName");
        List<Shop> listShop;
        List<Integer> listPage;
        HttpSession session = request.getSession();
        session.setAttribute("shopName", shopName);
        if (pageIdStr == null) {
            if (shopName == null) {
                listShopInAPage
                        = shopDao.getListShopInPage(1, ConstantNumber.pageNum, "");
                listShop = shopDao.getListShopByName("");
            } else {
                listShopInAPage
                        = shopDao.getListShopInPage(1, ConstantNumber.pageNum, shopName);
                listShop = shopDao.getListShopByName(shopName);
            }
        } else {
            int pageID = Integer.valueOf(pageIdStr);
            if (shopName == null) {
                listShopInAPage
                        = shopDao.getListShopInPage(pageID, ConstantNumber.pageNum, "");
                listShop = shopDao.getListShopByName("");
            } else {
                listShopInAPage
                        = shopDao.getListShopInPage(pageID, ConstantNumber.pageNum, shopName);
                listShop = shopDao.getListShopByName(shopName);
            }
        }
        listPage = shopDao.getListPage(listShop, ConstantNumber.pageNum);

        request.setAttribute("listShopInAPage", listShopInAPage);
        request.setAttribute("listPage", listPage);
        request.getRequestDispatcher("shop-reviewer.jsp").forward(request, response);
    }
}
