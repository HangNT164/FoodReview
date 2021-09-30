package security;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthenFilter implements Filter {

    private FilterConfig filterConfig = null;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        String loginURI = request.getContextPath() + "/login";
        boolean loggedIn = (session != null && session.getAttribute("account") != null);
        boolean loginRequest = request.getRequestURI().equals(loginURI);
        boolean loginPage = request.getRequestURI().endsWith("login.jsp");

        if (loggedIn && (loginRequest || loginPage)) {
            request.getRequestDispatcher("/").forward(request, response);
        }
        else if (loggedIn || loginRequest) {
            filterChain.doFilter(request, response);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
    }
}
