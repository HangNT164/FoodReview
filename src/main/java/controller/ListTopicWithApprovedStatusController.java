package controller;

import bean.Topic;
import dao.TopicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListTopicWithApprovedStatusController", value = "/list-topic-approved")
public class ListTopicWithApprovedStatusController extends HttpServlet {
    private TopicDao topicDao = new TopicDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Topic> topicListByStatus;
        HttpSession session = request.getSession(true);
        topicListByStatus = topicDao.getTopicsByIndexAndSearchString("",1);
        //test under
        int totalIndexes = (topicDao.getTotalTopics("")/2)+1;
        request.setAttribute("topicList", topicListByStatus);
        session.setAttribute("totalTopicListIndexes", totalIndexes);
        session.setAttribute("currentTopicListIndex", 1);
        request.getRequestDispatcher("topic-list.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Topic> topicListByStatus;
        HttpSession session = request.getSession(true);
        String search = request.getParameter("search");
        int totalIndexes =  (int) session.getAttribute("totalTopicListIndexes");
        int index = Integer.parseInt(request.getParameter("topicListIndex"));
        if(index <=0)
            index =1;
        else if(index >totalIndexes)
            index =totalIndexes;
        if (search.isEmpty()) {
            topicListByStatus = topicDao.getTopicsByIndexAndSearchString("", index);
        } else {
            topicListByStatus = topicDao.getTopicsByIndexAndSearchString(search, 1);
            totalIndexes = (topicDao.getTotalTopics(search)/2)+1;
            session.setAttribute("totalTopicListIndexes", totalIndexes);
        }

        request.setAttribute("topicList", topicListByStatus);
        session.setAttribute("currentTopicListIndex", index);
        request.getRequestDispatcher("topic-list.jsp").forward(request, response);
    }
}
