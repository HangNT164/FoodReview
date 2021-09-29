package controller;

;
import bean.Account;
import dao.AccountDao;
import util.EmailUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ResetPassword", value = "/reset-password")
public class ResetPassword extends HttpServlet {

    private EmailUtil emailUtil = new EmailUtil();
    private AccountDao accountDao = new AccountDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.getRequestDispatcher("reset-password.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();

            String code = emailUtil.generate6DigitsRandom();
            session.setAttribute("verifyCode", code);

            String email = request.getParameter("email");
            Account account = accountDao.getAccountByEmail(email);

            if(account != null) {
                if (account.getEmail().equals(email)) {
                    emailUtil.sendVerifyCodeEmail(email, code);
                    session.setAttribute("verifyEmail", email);
                    request.getRequestDispatcher("verify-code.jsp").forward(request, response);
                }
            }
            request.setAttribute("message", "Email không tồn tại!");
            request.getRequestDispatcher("reset-password.jsp").forward(request, response);
        }
    }
}
