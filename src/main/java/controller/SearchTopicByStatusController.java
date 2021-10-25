package controller;

import bean.Topic;
import dao.TopicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchTopicByStatusController", value = "/search-topic-status")
public class SearchTopicByStatusController extends HttpServlet {
    private TopicDao topicDao = new TopicDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String status = request.getParameter("status");
        List<Topic> topicListByStatus;
        if (status == null) {
            topicListByStatus = topicDao.searchTopicByStatus("");
        } else {
            topicListByStatus = topicDao.searchTopicByStatus(status);
        }
        request.setAttribute("topicListByStatus", topicListByStatus);
        request.getRequestDispatcher("topic.jsp").forward(request, response);
    }
}
