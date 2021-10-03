package controller;

import bean.Account;
import dao.AccountDao;
import dao.TopicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchUserManagementController", value = "/search-user-management")
public class SearchUserManagementController extends HttpServlet {

    private AccountDao accountDao = new AccountDao();
    private TopicDao topicDao = new TopicDao();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
//        List<Topic> topicList;
//        topicList = topicDao.getListTopic();
//        request.setAttribute("topicList", topicList);
//        request.getRequestDispatcher("topic.jsp").forward(request, response);
        List<Account> accountList;
        if (email == null) {
            accountList = accountDao.searchAccountByEmail("");
        } else {
            accountList = accountDao.searchAccountByEmail(email);
        }
        request.setAttribute("accountList", accountList);
        request.getRequestDispatcher("user.jsp").forward(request, response);
    }

}
