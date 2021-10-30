package controller;

import bean.Account;
import bean.Topic;
import dao.TopicDao;
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

@WebServlet(name = "AddTopicReviewerController", value = "/add-topic-reviewer")
public class AddTopicReviewerController extends HttpServlet {

    private TopicDao topicDao = new TopicDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("topic-reviewer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Account accountCurrent = (Account) session.getAttribute("account");
            boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
            if (!isMultiPart) {
                System.out.println("Error");
            } else {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                String lsFileName = "";

                try {
                    items = upload.parseRequest(request);
                } catch (FileUploadException e) {
                    System.err.println(e.getMessage());
                }

                Iterator iter = items.iterator();
                Hashtable params = new Hashtable();
                while (iter.hasNext()) {
                    FileItem item = (FileItem) iter.next();
                    if (item.isFormField()) {
                        // convert to UTF-8
                        params.put(new String(item.getFieldName().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8),
                                new String(item.getString().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
                    } else {
                        try {
                            // get file name
                            String itemName = item.getName();
                            String fileName = itemName.substring(itemName.lastIndexOf("\\") + 1);
                            lsFileName = fileName;

                            String root = getServletContext().getRealPath("/");
                            File path = new File(root + "/uploads");
                            if (!path.exists()) {
                                path.mkdirs();
                            }
                            File saveFile = new File(path + "/" + fileName);
                            item.write(saveFile);

                            System.out.println(saveFile.getAbsolutePath());
                        } catch (Exception e) {
                            System.err.println(e.getMessage());
                        }
                    }
                }

                String title = (String) params.get("title");
                String content = (String) params.get("content");
                Topic topic = Topic.builder()
                        .title(title)
                        .content(content)
                        .image(lsFileName)
                        .status("pending")
                        .accountId(accountCurrent.getAccountId())
                        .build();
                boolean addTopic = topicDao.addTopicReviewer(topic);
                if (!addTopic) {
                    request.setAttribute("message", "Add Topic Fail!");
                    request.getRequestDispatcher("topic-reviewer.jsp").forward(request, response);
                }
                response.sendRedirect("add-topic-reviewer");
            }
        }
    }
}
