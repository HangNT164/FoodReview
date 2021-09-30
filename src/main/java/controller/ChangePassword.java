package controller;

import bean.Account;
import dao.AccountDao;
import util.BCrypt;
import util.ValidateHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ChangePassword", value = "/change-password")
public class ChangePassword extends HttpServlet {

    private AccountDao accountDao = new AccountDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Account account = (Account)session.getAttribute("account");
            String oldPass = request.getParameter("oldPassword");
            String newPass = request.getParameter("newPassword");
            String rePass = request.getParameter("rePassword");

            boolean checkPass = BCrypt.checkpw(oldPass, account.getPassword());
            if (!checkPass) {
                request.setAttribute("message","Mật khẩu cũ không đúng");
            }
            if (!ValidateHelper.isPassword(newPass)) {
                request.setAttribute("message","Mật khẩu không đúng định dạng");
            }
            if (!newPass.equals(rePass)) {
                request.setAttribute("message","Mật khẩu và nhập lại mật khẩu không trùng khớp");
            }

            boolean updatePassword = accountDao.updatePassword(account.getAccountId(), newPass);
            if (!updatePassword) {
                request.setAttribute("message","Thay đổi mật khẩu thất bại");
            }
            request.getRequestDispatcher("account.jsp").forward(request, response);
        }
    }
}
