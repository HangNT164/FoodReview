package controller;

import bean.Account;
import bean.Topic;
import dao.TopicDao;
import util.ValidateHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static util.ValidateHelper.convertFormatDate;

@WebServlet(name = "AddNewTopicController", value = "/add-topic")
public class AddNewTopicController extends HttpServlet {
    private TopicDao topicDao = new TopicDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String title = request.getParameter("title");
            String status = request.getParameter("status");
            String content = request.getParameter("content");
            String rate = request.getParameter("rate");
            // Create Topic
            Topic topic = Topic.builder()
                    .title(title)
                    .status(status)
                    .content(content)
                    .rate(Integer.parseInt(rate))
                    .build();
            // Insert
            boolean addTopic = topicDao.addTopic(topic);
            if (!addTopic) {
                request.setAttribute("message", "Tạo mới thất bại");
                request.getRequestDispatcher("topic.jsp").forward(request, response);
            } else {
                response.sendRedirect("search-topic-status");
            }
        }
    }
}
