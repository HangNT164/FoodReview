package controller;

import bean.Topic;
import dao.TopicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddTopicController", value = "/add-topic")
public class AddTopicController extends HttpServlet {
    private TopicDao topicDao = new TopicDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            // Create Topic
            Topic topic = Topic.builder()
                    .title(title)
                    .status("pending")
                    .content(content)
                    .rate(0)
                    .build();

            // Insert
            boolean addTopic = topicDao.addTopic(topic);
            if (!addTopic) {
                request.setAttribute("message", "Tạo chủ đề mới thất bại");
                request.getRequestDispatcher("topic.jsp").forward(request, response);
            }
            response.sendRedirect("search-topic-status");
        }
    }
}
