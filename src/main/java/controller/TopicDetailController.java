package controller;

import bean.Topic;
import bean.TopicComment;
import dao.TopicCommentDao;
import dao.TopicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TopicDetailController", value = "/topic-detail")
public class TopicDetailController extends HttpServlet {
    private TopicDao topicDao = new TopicDao();
    private TopicCommentDao topicCommentDao = new TopicCommentDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("topicId"));
        Topic topic = topicDao.getPostById(id);
        List<Topic> topicList = topicDao.getListTopic();
        List<TopicComment> topicCommentList = topicCommentDao.getAllCommentByTopicId(id);
        request.setAttribute("topicList",topicList);
        request.setAttribute("topicCommentList", topicCommentList);
        request.setAttribute("topic", topic);
        request.getRequestDispatcher("topic-detail.jsp").forward(request, response);
    }
}
