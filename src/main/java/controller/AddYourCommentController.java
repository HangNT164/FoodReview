package controller;

import bean.Account;
import bean.ShopComment;
import bean.Topic;
import dao.ShopCommentDao;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "AddYourComment", value = "/add-your-comment")
public class AddYourCommentController extends HttpServlet {
    private ShopCommentDao shopCommentDao = new ShopCommentDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        try (PrintWriter out = response.getWriter()) {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            Account accountCurrent = (Account) session.getAttribute("account");
            int accountId = accountCurrent.getAccountId();
            String content = request.getParameter("content");
            Integer id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : null;
            ShopComment shopComment = ShopComment.builder()
                    .shopId(12)
                    .accountId(accountId)
                    .status("active")
                    .content(content)
                    .rate(0)
                    .build();
            boolean addComment = shopCommentDao.addComment(shopComment);
            if (!addComment) {
                request.setAttribute("message", "Add Shop Fail!");
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }
            response.sendRedirect("home");
        }
    }
}