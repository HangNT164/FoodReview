package controller;

import bean.Account;
import dao.AccountDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "VerifyEmailController", value = "/verify-email")
public class VerifyEmailController extends HttpServlet {

    private AccountDao accountDao = new AccountDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("verify-email.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String codeRight = (String) session.getAttribute("emailCode");
        String codeEnter = request.getParameter("verifyEmail");
        if (codeEnter.equals(codeRight)) {
            Account account = (Account) session.getAttribute("accountRegister");
            boolean addAccount = accountDao.addAccount(account);
            if (!addAccount) {
                request.setAttribute("message", "Tạo tại khoản thất bại");
                request.getRequestDispatcher("sigup.jsp").forward(request, response);
            } else {
                response.sendRedirect("login");
            }
        } else {
            String message = "Verify email failure";
            request.setAttribute("message", message);
            request.getRequestDispatcher("verify-email.jsp").forward(request, response);
        }
    }
}
