package controller;

import bean.Account;
import bean.Topic;
import dao.AccountDao;
import dao.TopicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TopicManagementController", value = "/topic-management")
public class TopicManagementController extends HttpServlet {
    private TopicDao topicDao = new TopicDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Topic> topicList = topicDao.getListTopic();
        request.setAttribute("topicList", topicList);
        request.getRequestDispatcher("topic.jsp").forward(request, response);
    }
}
