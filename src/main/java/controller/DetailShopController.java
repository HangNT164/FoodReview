package controller;

import bean.Food;
import bean.Shop;
import dao.FoodDao;
import dao.ShopDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/detail-shop")
public class DetailShopController extends HttpServlet {

    private ShopDao shopDao = new ShopDao();
    private FoodDao foodDao = new FoodDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Integer id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : null;
        if (id != null) {
            Shop shop = shopDao.getOne(id);
            request.setAttribute("shop", shop);

            List<Food> listFoodByShopAndOddId = foodDao.listFoodByShopAndOddId(id);
            List<Food> listFoodByShopAndEvenId = foodDao.listFoodByShopAndEvenId(id);
            request.setAttribute("listFoodByShopAndOddId", listFoodByShopAndOddId);
            request.setAttribute("listFoodByShopAndEvenId", listFoodByShopAndEvenId);
            //request.setAttribute("listFoodSize", listFoodByShop.size());

        }

        request.getRequestDispatcher("detail-shop.jsp").forward(request, response);
    }

}
