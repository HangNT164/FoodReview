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

    private HttpServletRequest request;
    private static final String[] loginRequiredURLs = {
            "/admin"
    };

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        request = (HttpServletRequest) servletRequest;
        request.setCharacterEncoding("UTF-8");
        String path = request.getRequestURI().substring(request.getContextPath().length());

        if (path.startsWith("/server/")) {
            filterChain.doFilter(servletRequest, servletResponse);
        }

        HttpSession session = request.getSession(false);

        String loginURI = request.getContextPath() + "/login";
        boolean loggedIn = (session != null && session.getAttribute("account") != null);
        boolean loginRequest = request.getRequestURI().equals(loginURI);
        boolean loginPage = request.getRequestURI().endsWith("login.jsp");

        if (loggedIn && (loginRequest || loginPage)) {
            // Kiểm tra nếu người dùng đã login nhưng vẫn cố login
            // thì chuyển hướng về trang home
            request.getRequestDispatcher("/").forward(servletRequest, servletResponse);
        }
        else if (!loggedIn && loginRequired()) {
            // Kiểm tra nếu người dùng chưa login nhưng muốn vào trang yêu cầu login
            // thì chuyển hướng về trang login
            request.getRequestDispatcher("/login.jsp").forward(servletRequest, servletResponse);
        } else {
            // Kiếm tra nếu người dùng truy cập vào trang không cần login
            // hoặc người dùng đã login thì tiếp tục chuyển hướng đến trang đã chọn
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    // Kiểm tra đường dẫn những trang cần login
    private boolean loginRequired() {
        String requestURL = request.getRequestURL().toString();

        for (String loginRequiredURL : loginRequiredURLs) {
            if (requestURL.contains(loginRequiredURL)) {
                return true;
            }
        }

        return false;
    }

    @Override
    public void destroy() {
    }
}
