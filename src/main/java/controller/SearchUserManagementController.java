package controller;

import bean.Account;
import dao.AccountDao;

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<Account> accountList;
        if (name == null) {
            accountList = accountDao.searchAccountByName("");
        } else {
            accountList = accountDao.searchAccountByName(name);
        }
        request.setAttribute("accountList", accountList);
        request.getRequestDispatcher("user.jsp").forward(request, response);
    }

}
