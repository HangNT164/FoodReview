package security;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthenFilter implements Filter {

    private FilterConfig filterConfig = null;

    private HttpServletRequest request;
    private static final String[] loginRequiredURLs = {
            "/admin", "/profile", "/search-user-management", "/search-topic-status", "/remove-user-management", "/remove-topic-management", "/update-user-management",
            "/update-status-topic", "/add-topic", "/shop", "/add-food-comment", "/add-food", "/add-shop", "/add-topic-reviewer", "/add-your-comment", "/detail-food",
            "/detail-shop", "/food-management", "/list-topic-approved", "/remove-food-comment", "/remove-shop-management", "/remove-your-comment", "/shop-management",
            "/shop-reviewer", "/topic-comment", "/topic-detail", "/update-food-comment", "/update-profile", "/update-shop",
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
            // Ki???m tra n???u ng?????i d??ng ???? login nh??ng v???n c??? login
            // th?? chuy???n h?????ng v??? trang home
            request.getRequestDispatcher("/").forward(servletRequest, servletResponse);
        }
        else if (!loggedIn && loginRequired()) {
            // Ki???m tra n???u ng?????i d??ng ch??a login nh??ng mu???n v??o trang y??u c???u login
            // th?? chuy???n h?????ng v??? trang login
            request.getRequestDispatcher("/login.jsp").forward(servletRequest, servletResponse);
        } else {
            // Ki???m tra n???u ng?????i d??ng truy c???p v??o trang kh??ng c???n login
            // ho???c ng?????i d??ng ???? login th?? ti???p t???c chuy???n h?????ng ?????n trang ???? ch???n
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    // Ki???m tra ???????ng d???n nh???ng trang c???n login
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
