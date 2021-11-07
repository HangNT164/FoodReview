package controller;

import bean.Account;
import bean.Food;
import bean.Shop;
import bean.ShopComment;
import dao.FoodDao;
import dao.ShopCommentDao;
import dao.ShopDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/detail-shop")
public class DetailShopController extends HttpServlet {

    private ShopDao shopDao = new ShopDao();
    private FoodDao foodDao = new FoodDao();
    private ShopCommentDao shopComment = new ShopCommentDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Integer id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : null;
        Account user = (Account) request.getSession().getAttribute("account");
        int idAccount = user.getAccountId();
        if (id != null) {
            Shop shop = shopDao.getOne(id);
            request.setAttribute("shop", shop);
            List<ShopComment> listComment = shopComment.getCommentByShopId(id);
            List<ShopComment> yourComment = shopComment.yourComment(id,idAccount);
            List<Food> listFoodByShopAndOddId = foodDao.listFoodByShopAndOddId(id);
            List<Food> listFoodByShopAndEvenId = foodDao.listFoodByShopAndEvenId(id);
            request.setAttribute("listCommentShop", listComment);
            request.setAttribute("yourComment", yourComment);
            request.setAttribute("listFoodByShopAndOddId", listFoodByShopAndOddId);
            request.setAttribute("listFoodByShopAndEvenId", listFoodByShopAndEvenId);
            //request.setAttribute("listFoodSize", listFoodByShop.size());

        }

        request.getRequestDispatcher("detail-shop.jsp").forward(request, response);
    }

}
