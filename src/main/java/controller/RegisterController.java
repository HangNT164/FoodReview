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
            // Save cake
            session.setAttribute("nameTemp", name);
            session.setAttribute("phoneTemp", phone);
            session.setAttribute("emailTemp", email);
            session.setAttribute("addressTemp", address);
            session.setAttribute("dateTemp", date);
            // Validate date
            if (!ValidateHelper.isEmail(email)) {
                request.setAttribute("message", "Mail kh??ng ????ng ?????nh d???ng");
                request.getRequestDispatcher("sigup.jsp").forward(request, response);
            }
            if (!ValidateHelper.isPhoneNumber(phone)) {
                request.setAttribute("message", "S??? ??i???n tho???i kh??ng ????ng ?????nh d???ng");
                request.getRequestDispatcher("sigup.jsp").forward(request, response);
            }
            if (!ValidateHelper.isPassword(password)) {
                request.setAttribute("message", "M???t kh???u kh??ng ????ng ?????nh d???ng");
                request.getRequestDispatcher("sigup.jsp").forward(request, response);
            }
            if (!password.equals(rePassword)) {
                request.setAttribute("message", "M???t kh???u v???i M???t kh???u nh???p l???i kh??ng tr??ng kh???p");
                request.getRequestDispatcher("sigup.jsp").forward(request, response);
            }

            // Check duplicate
            boolean isDupilicateEmail = accountDao.isDulicapteEmail(email);
            if (isDupilicateEmail) {
                request.setAttribute("message", "Email n??y ???? ???????c ????ng k??");
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
