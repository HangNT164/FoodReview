package controller;

import dao.AccountDao;
import util.ValidateHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateStatusUserManagement", value = "/remove-user-management")
public class RemoveUserManagementController extends HttpServlet {

    private AccountDao accountDao = new AccountDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String status = request.getParameter("listStatus");
            int accountId = ValidateHelper.getValidateID(request.getParameter("accountId"));

            if (status == null) {
                request.setAttribute("message", "No status was chosen");
                request.getRequestDispatcher("user.jsp").forward(request, response);
            } else {
                boolean update = accountDao.changeStatusAccount(accountId, status);
                if (!update) {
                    request.setAttribute("message", "Fail to change status");
                    request.getRequestDispatcher("user.jsp").forward(request, response);
                } else {
                    response.sendRedirect("search-user-management");
                }
            }
        }
    }

}

