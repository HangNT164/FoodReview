package controller;

import bean.Account;
import constant.RoleEnum;
import constant.StatusAccountEnum;
import service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import static util.ValidateHelper.isEmail;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    private AccountService accountService = new AccountService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
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
            Account user = accountService.login(email, password);
            HttpSession session = request.getSession(true);
            if (user != null) {
                if (user.getStatus().equals(StatusAccountEnum.active.toString())) {
                    String role = user.getRole();
                    session.setAttribute("account", user);
                    if (role.equals(RoleEnum.Admin.toString())) {
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    } else if (role.equals(RoleEnum.ShopOwner.toString())) {
                        // send toi trang shop nhung chua lam
                        request.getRequestDispatcher("").forward(request, response);
                    } else {
                        request.getRequestDispatcher("home.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("message", "Tên khoản đã vị vô hiện hóa");
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
