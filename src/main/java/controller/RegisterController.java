package controller;

import bean.Account;
import dao.AccountDao;
import util.EmailUtil;
import util.ValidateHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import static util.ValidateHelper.convertFormatDate;

@WebServlet(name = "RegisterController", value = "/register")
public class RegisterController extends HttpServlet {

    private AccountDao accountDao = new AccountDao();
    private EmailUtil emailUtil = new EmailUtil();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.getRequestDispatcher("sigup.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            String date = request.getParameter("dob");
            String password = request.getParameter("password");
            String rePassword = request.getParameter("rePassword");

            // Validate date
            if (!ValidateHelper.isEmail(email)) {
                request.setAttribute("message", "Mail không đúng định dạng");
                request.getRequestDispatcher("sigup.jsp").forward(request, response);
            }
            if (!ValidateHelper.isPhoneNumber(phone)) {
                request.setAttribute("message", "Số điện thoại không đúng định dạng");
                request.getRequestDispatcher("sigup.jsp").forward(request, response);
            }
            if (!ValidateHelper.isPassword(password)) {
                request.setAttribute("message", "Mật khẩu không đúng định dạng");
                request.getRequestDispatcher("sigup.jsp").forward(request, response);
            }
            if (!password.equals(rePassword)) {
                request.setAttribute("message", "Mật khẩu với Mật khẩu nhập lại không trùng khớp");
                request.getRequestDispatcher("sigup.jsp").forward(request, response);
            }

            // Check duplicate
            boolean isDupilicateEmail = accountDao.isDulicapteEmail(email);
            if (isDupilicateEmail) {
                request.setAttribute("message", "Email này đã được đăng ký");
                request.getRequestDispatcher("sigup.jsp").forward(request, response);
            }
            boolean isDupilicatePhone = accountDao.isDulicaptePhone(phone);
            if (isDupilicatePhone) {
                request.setAttribute("message", "Số điện thoại này đã được đăng ký");
                request.getRequestDispatcher("sigup.jsp").forward(request, response);
            }
            // Add
            // Create Account
            Account account = Account.builder()
                    .name(name)
                    .dob(convertFormatDate(date))
                    .gender(Boolean.valueOf(gender))
                    .address(address)
                    .email(email)
                    .phoneNumber(phone)
                    .password(password)
                    .build();

            // Check exist
            // Send Mail
            String code = emailUtil.generate6DigitsRandom();
            emailUtil.sendVerifyCodeEmail(email, code);
            session.setAttribute("emailCode", code);
            session.setAttribute("accountRegister", account);
            response.sendRedirect("verify-email");
        }
    }
}
