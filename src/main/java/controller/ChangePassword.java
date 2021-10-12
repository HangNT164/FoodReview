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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("change-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            boolean isValid = true;
            Account account = (Account)session.getAttribute("account");
            String oldPass = request.getParameter("oldPassword");
            String newPass = request.getParameter("newPassword");
            String rePass = request.getParameter("rePassword");

            boolean checkPass = BCrypt.checkpw(oldPass, account.getPassword());
            if (!checkPass) {
                request.setAttribute("messageWrongOldPass","Mật khẩu cũ không đúng");
                isValid = false;
            }
            if (!ValidateHelper.isPassword(newPass)) {
                request.setAttribute("messagePassNotValid","Mật khẩu không đúng định dạng");
                isValid = false;
            }
            if (!newPass.equals(rePass)) {
                request.setAttribute("messageNotCorrect","Mật khẩu và nhập lại mật khẩu không trùng khớp");
                isValid = false;
            }

            if (isValid) {
                boolean updatePassword = accountDao.updatePassword(account.getAccountId(), newPass);
                if (!updatePassword) {
                    request.setAttribute("messageFailed","Thay đổi mật khẩu thất bại");
                }else {
                    request.setAttribute("messageSuccessful","Thay đổi mật khẩu thành công");
                    request.getRequestDispatcher("change-password.jsp").forward(request, response);
                }
            }
            request.getRequestDispatcher("change-password.jsp").include(request, response);
        }
    }
}
