package controller;

import bean.Account;
import constant.RoleEnum;
import constant.StatusAccountEnum;
import dao.AccountDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import static util.ValidateHelper.convertFormatDateYYYYMMDD;
import static util.ValidateHelper.isEmail;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    private AccountDao accountDao = new AccountDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            session.invalidate();
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            if (!isEmail(email)) {
                request.setAttribute("message", "Email không đúng định dạng");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            String password = request.getParameter("password");
            Account user = accountDao.login(email, password);
            HttpSession session = request.getSession(true);
            if (user != null) {
                if (user.getStatus().equals(StatusAccountEnum.active.toString())) {
                    String role = user.getRole();
                    user.setDob(convertFormatDateYYYYMMDD(user.getDob()));
                    session.setAttribute("account", user);
                    if (role.equals(RoleEnum.Admin.toString())) {
                        response.sendRedirect("admin");
                    } else if (role.equals(RoleEnum.ShopOwner.toString())) {
                        // send toi trang shop nhung chua lam
                        response.sendRedirect("shop");
                    } else {
                        response.sendRedirect("home");
                    }
                } else {
                    request.setAttribute("message", "Tên khoản đã bị vô hiệu hóa");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                // khoi tao phien loi
                request.setAttribute("message", "Tên đăng nhập hoặc mật khẩu sai");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
    }
}
