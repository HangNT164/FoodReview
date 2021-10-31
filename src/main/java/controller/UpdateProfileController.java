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

@WebServlet(name = "UpdateProfileController", value = "/update-profile")
public class UpdateProfileController extends HttpServlet {

    private AccountDao accountDao = new AccountDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("update-profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            boolean flag = true;
            Account accountCurrent = (Account) session.getAttribute("account");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            int gender = Integer.parseInt(request.getParameter("gender"));
            String address = request.getParameter("address");
            String dob = request.getParameter("dob");
            if (!ValidateHelper.isEmail(email)) {
                flag =false;
                request.setAttribute("message1", "Email không đúng định dạng");
            }
            if (!ValidateHelper.isPhoneNumber(phone)) {
                flag = false;
                request.setAttribute("message1", "Số điện thoại không đúng định dạng");
            }

            if (!accountCurrent.getEmail().equals(email) && !accountDao.isDulicapteEmail(email)) {
                flag =false;
                request.setAttribute("message1", "Email đã được đăng ký trước đó");
            }

            Account account = Account.builder()
                    .name(name)
                    .email(email)
                    .phoneNumber(phone)
                    .gender(gender==1)
                    .address(address)
                    .dob(dob)
                    .build();
            Account updateAccount = Account.builder()
                    .name(name)
                    .email(email)
                    .phoneNumber(phone)
                    .gender(gender==1)
                    .address(address)
                    .dob(ValidateHelper.convertFormatDate(dob))
                    .build();

            if(flag){
                session.setAttribute("account", account);
                request.setAttribute("message1", "Thay đổi thông tin thành công!");
                accountDao.updateAccount(accountCurrent.getAccountId(), updateAccount);
            }
            request.getRequestDispatcher("account.jsp").forward(request, response);
        }
    }

}
