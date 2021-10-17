package controller;

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

@WebServlet(name = "VerifyCode", value = "/verify-code")
public class VerifyCodeController extends HttpServlet {

    private EmailUtil emailUtil = new EmailUtil();
    private AccountDao accountDao = new AccountDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("verify-code.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String trueCode = (String) session.getAttribute("verifyCode");
            String email = (String) session.getAttribute("verifyEmail");

            String code = request.getParameter("verifyCode");

            if (trueCode.equals(code)) {
                Account account = accountDao.getAccountByEmail(email);
                if (account != null) {
                    String[] emailPart = email.split("@");
                    String newPass = emailPart[0] + "@" + emailUtil.generate6DigitsRandom();
                    accountDao.updatePassword(account.getAccountId(), newPass);
                    emailUtil.sendResetPasswordEmail(email, newPass);
                    session.removeAttribute("verifyEmail");
                    session.removeAttribute("verifyCode");
                    request.setAttribute("message", "Đặt lại mật khẩu thành công!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("message", "Mã xác thực không đúng!");
                request.getRequestDispatcher("verify-code.jsp").forward(request, response);
            }
        }
    }
}
