package controller;

import bean.Topic;
import dao.TopicDao;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
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
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            try {
                List items = upload.parseRequest(request);
                Iterator iterator = items.iterator();
                while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();
                    if (!item.isFormField()) {
                        String fileName = item.getName();
                        String root = getServletContext().getRealPath("/");
                        File path = new File(root + "/uploads");
                        if (!path.exists()) {
                            path.mkdirs();
                        }
                        File uploadedFile = new File(path + "/" + fileName);
                        System.out.println(uploadedFile.getAbsolutePath());
                        item.write(uploadedFile);
                        Topic topic = Topic.builder()
                                .title(title)
                                .content(content)
                                .image(fileName)
                                .status("pending")
                                .build();
                        boolean addTopic = topicDao.addTopicReviewer(topic);
                        if (!addTopic) {
                            request.setAttribute("message", "Add Topic Fail!");
                            request.getRequestDispatcher("topic-reviewer.jsp").forward(request, response);
                        }
                        response.sendRedirect("add-topic-reviewer");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
