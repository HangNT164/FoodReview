package controller;

import bean.Account;
import bean.Topic;
import bean.TopicComment;
import dao.TopicCommentDao;
import dao.TopicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TopicCommentController", value = "/topic-comment")
public class TopicCommentController extends HttpServlet {
    private TopicDao topicDao = new TopicDao();
    private TopicCommentDao topicCommentDao = new TopicCommentDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int topicId = Integer.parseInt(request.getParameter("topicId"));
        String action = request.getParameter("action");
        HttpSession session = request.getSession(true);
        Account account = (Account) session.getAttribute("account");
        int accountId = account.getAccountId();
        if(action.equalsIgnoreCase("edit")) {
            int commentId = Integer.parseInt(request.getParameter("commentId"));
            String updateContent = request.getParameter("updateContent");
            boolean status = topicCommentDao.updateCommentByCommentId(commentId, updateContent);
            request.setAttribute("checkIfCommented", true);
        }
        else if(action.equalsIgnoreCase("create")){
            String createContent = request.getParameter("createContent");
            boolean status = topicCommentDao.createComment(topicId, accountId, createContent);
            request.setAttribute("checkIfCommented", true);
        }
        else{
            int commentId = Integer.parseInt(request.getParameter("commentId"));
            boolean status = topicCommentDao.deleteCommentByCommentId(commentId);
            request.setAttribute("checkIfCommented", false);
        }


        Topic topic = topicDao.getPostById(topicId);
        List<Topic> topicList = topicDao.getListTopic();
        List<TopicComment> topicCommentList = topicCommentDao.getAllCommentByTopicId(topicId);
        request.setAttribute("topicList",topicList);
        request.setAttribute("topicCommentList", topicCommentList);
        request.setAttribute("topic", topic);
        request.getRequestDispatcher("topic-detail.jsp").forward(request, response);
    }
}
