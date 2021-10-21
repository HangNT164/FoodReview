package controller;

import bean.Shop;
import bean.Topic;
import dao.ShopDao;
import dao.TopicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    private TopicDao topicDao = new TopicDao();
    private ShopDao shopDao = new ShopDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Topic top1 = topicDao.getLastestPost();
        List<Topic> topicList = topicDao.getListTopic();
        List<Shop> listShop = shopDao.getListShop();
        request.setAttribute("topicList",topicList);
        request.setAttribute("listShop",listShop);
        request.setAttribute("top1", top1);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
