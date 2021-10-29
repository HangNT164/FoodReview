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
        topicListByStatus = topicDao.getTopicsByIndexAndSearchString("",1, "name");
        //test under
        int totalTopics = topicDao.getTotalTopics("");
        int totalIndexes = (totalTopics/8)+1;
        if(totalTopics%8 ==0)
            --totalIndexes;
        request.setAttribute("topicList", topicListByStatus);
        request.setAttribute("sortType","name");
        session.setAttribute("totalTopicListIndexes", totalIndexes);
        session.setAttribute("currentTopicListIndex", 1);
        request.getRequestDispatcher("topic-list.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Topic> topicListByStatus;
        HttpSession session = request.getSession(true);
        String search = request.getParameter("search");
        String sortType = request.getParameter("sortType");
        int totalIndexes =  (int) session.getAttribute("totalTopicListIndexes");
        int index = Integer.parseInt(request.getParameter("topicListIndex"));

        if(index <=0)
            index =1;
        else if(index >totalIndexes)
            index =totalIndexes;
        if (search.isEmpty()) {
            String type = request.getParameter("type");
            if(type.equals("search")){
                topicListByStatus = topicDao.getTopicsByIndexAndSearchString("", 1, sortType);
                int totalTopics = topicDao.getTotalTopics(search);
                totalIndexes = (totalTopics/8)+1;
                if(totalTopics%8 ==0)
                    --totalIndexes;
                session.setAttribute("totalTopicListIndexes", totalIndexes);
            }
            else{
                topicListByStatus = topicDao.getTopicsByIndexAndSearchString("", index, sortType);
            }
        } else {
            topicListByStatus = topicDao.getTopicsByIndexAndSearchString(search, 1, sortType);
            int totalTopics = topicDao.getTotalTopics(search);
            totalIndexes = (totalTopics/8)+1;
            if(totalTopics%8 ==0)
                --totalIndexes;
            session.setAttribute("totalTopicListIndexes", totalIndexes);
        }
        request.setAttribute("search", search);
        request.setAttribute("sortType",sortType);
        request.setAttribute("topicList", topicListByStatus);
        session.setAttribute("currentTopicListIndex", index);
        request.getRequestDispatcher("topic-list.jsp").forward(request, response);
    }
}