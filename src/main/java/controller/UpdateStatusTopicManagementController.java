package controller;

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

@WebServlet(name = "UpdateStatusTopicManagementController", value = "/update-status-topic")
public class UpdateStatusTopicManagementController extends HttpServlet {
    private TopicDao topicDao = new TopicDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String status = request.getParameter("status");
            int topicId = ValidateHelper.getValidateID(request.getParameter("topicId"));
            Topic topic = Topic.builder()
                    .title(title)
                    .content(content)
                    .status(status)
                    .build();
            boolean update = topicDao.updateTopic(topicId, topic);
            if (!update) {
                request.setAttribute("message", "Cập nhật thất bại");
                request.getRequestDispatcher("topic.jsp").forward(request, response);

            }
            response.sendRedirect("search-topic-status");
        }
    }
}
