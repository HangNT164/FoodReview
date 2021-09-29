package controller;

import bean.Account;
import dao.AccountDao;
import util.ValidateHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ProfileController", value = "/profile")
public class ProfileController extends HttpServlet {

    private AccountDao accountDao = new AccountDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("account.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Account accountCurrent = (Account) session.getAttribute("account");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String dob = request.getParameter("dob");
            if (!ValidateHelper.isEmail(email)) {
                request.setAttribute("message", "Email không đúng định dạng");
            }
            if (!ValidateHelper.isPhoneNumber(phone)) {
                request.setAttribute("message", "Số điện thoại không đúng định dạng");
            }

            if (!accountCurrent.getEmail().equals(email) && !accountDao.isDulicapteEmail(email)) {
                request.setAttribute("message", "Email đã được đăng ký trước đó");
            }
            if (!accountCurrent.getPhoneNumber().equals(phone) && !accountDao.isDulicaptePhone(phone)) {
                request.setAttribute("message", "Số điện thoại đã được đăng ký trước đó");
            }

            Account account = Account.builder()
                    .name(name)
                    .email(email)
                    .phoneNumber(phone)
                    .address(address)
                    .dob(ValidateHelper.convertFormatDate(dob))
                    .build();
            boolean updateAccount = accountDao.updateAccount(accountCurrent.getAccountId(), account);
            if (!updateAccount) {
                request.setAttribute("message", "Không thể thay đổi thông tin");
            }
            request.getRequestDispatcher("account.jsp").forward(request, response);
        }
    }

}
