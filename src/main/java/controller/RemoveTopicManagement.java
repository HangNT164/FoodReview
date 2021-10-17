package controller;

import dao.TopicDao;
import util.ValidateHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RemoveTopicManagement", value = "/remove-topic-management")
public class RemoveTopicManagement extends HttpServlet {
    private TopicDao topicDao = new TopicDao();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            int topicId = ValidateHelper.getValidateID(request.getParameter("topicId"));
            boolean update = topicDao.removeTopic(topicId);
            if (!update) {
                request.setAttribute("message", "Xóa topic thất bại");
                request.getRequestDispatcher("topic.jsp").forward(request, response);
            } else {
                response.sendRedirect("search-topic-status");
            }
        }
    }
}
