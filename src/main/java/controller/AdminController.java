package controller;

import bean.Account;
import bean.Topic;
import dao.AccountDao;
import dao.TopicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@WebServlet(name = "AdminController", value = "/admin")
public class AdminController extends HttpServlet {

    private AccountDao accountDao = new AccountDao();
    private TopicDao topicDao = new TopicDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Account> accountList = accountDao.searchAccountByEmail("");
        List<Account> accountListShopOwner = accountDao.listAccountRoleShopOwner();
        List<Topic> topics = topicDao.searchTopicByStatus("");
        List<Topic> topicsApprove = topicDao.searchTopicByStatus("approved");

        Calendar cal = Calendar.getInstance();
        String yearStr = request.getParameter("year");
        String yearStrTopic = request.getParameter("topicYear");
        int year;
        if (yearStr == null) {
            year = cal.get(Calendar.YEAR);
        } else {
            year = Integer.valueOf(yearStr);
        }

        int yearTopic;
        if (yearStrTopic == null) {
            yearTopic = cal.get(Calendar.YEAR);
        } else {
            yearTopic = Integer.valueOf(yearStrTopic);
        }

        List<String> lists = new ArrayList<>();
        for (int i = 2021; i < cal.get(Calendar.YEAR) + 2; i++) {
            lists.add(String.valueOf(i));
        }
        List<Account> monthJan = accountDao.listAccountByMonth("01/" + year);
        List<Account> monthFeb = accountDao.listAccountByMonth("02/" + year);
        List<Account> monthMar = accountDao.listAccountByMonth("03/" + year);
        List<Account> monthApr = accountDao.listAccountByMonth("04/" + year);
        List<Account> monthMay = accountDao.listAccountByMonth("05/" + year);
        List<Account> monthJun = accountDao.listAccountByMonth("06/" + year);
        List<Account> monthJul = accountDao.listAccountByMonth("07/" + year);
        List<Account> monthAug = accountDao.listAccountByMonth("08/" + year);
        List<Account> monthSep = accountDao.listAccountByMonth("09/" + year);
        List<Account> monthOct = accountDao.listAccountByMonth("10/" + year);
        List<Account> monthNov = accountDao.listAccountByMonth("11/" + year);
        List<Account> monthDec = accountDao.listAccountByMonth("12/" + year);

        List<Topic> monthJanTopic = topicDao.getListTopicByMonth("01/" + yearTopic);
        List<Topic> monthFebTopic = topicDao.getListTopicByMonth("02/" + yearTopic);
        List<Topic> monthMarTopic = topicDao.getListTopicByMonth("03/" + yearTopic);
        List<Topic> monthAprTopic = topicDao.getListTopicByMonth("04/" + yearTopic);
        List<Topic> monthMayTopic = topicDao.getListTopicByMonth("05/" + yearTopic);
        List<Topic> monthJunTopic = topicDao.getListTopicByMonth("06/" + yearTopic);
        List<Topic> monthJulTopic = topicDao.getListTopicByMonth("07/" + yearTopic);
        List<Topic> monthAugTopic = topicDao.getListTopicByMonth("08/" + yearTopic);
        List<Topic> monthSepTopic = topicDao.getListTopicByMonth("09/" + yearTopic);
        List<Topic> monthOctTopic = topicDao.getListTopicByMonth("10/" + yearTopic);
        List<Topic> monthNovTopic = topicDao.getListTopicByMonth("11/" + yearTopic);
        List<Topic> monthDecTopic = topicDao.getListTopicByMonth("12/" + yearTopic);

        request.setAttribute("totalAccount", accountList.size());
        request.setAttribute("totalTopic", topics.size());
        request.setAttribute("monthJan", monthJan.size());
        request.setAttribute("monthFeb", monthFeb.size());
        request.setAttribute("monthMar", monthMar.size());
        request.setAttribute("monthApr", monthApr.size());
        request.setAttribute("monthMay", monthMay.size());
        request.setAttribute("monthJun", monthJun.size());
        request.setAttribute("monthJul", monthJul.size());
        request.setAttribute("monthAug", monthAug.size());
        request.setAttribute("monthSep", monthSep.size());
        request.setAttribute("monthOct", monthOct.size());
        request.setAttribute("monthNov", monthNov.size());
        request.setAttribute("monthDec", monthDec.size());

        request.setAttribute("monthJanTopic", monthJanTopic.size());
        request.setAttribute("monthFebTopic", monthFebTopic.size());
        request.setAttribute("monthMarTopic", monthMarTopic.size());
        request.setAttribute("monthAprTopic", monthAprTopic.size());
        request.setAttribute("monthMayTopic", monthMayTopic.size());
        request.setAttribute("monthJunTopic", monthJunTopic.size());
        request.setAttribute("monthJulTopic", monthJulTopic.size());
        request.setAttribute("monthAugTopic", monthAugTopic.size());
        request.setAttribute("monthSepTopic", monthSepTopic.size());
        request.setAttribute("monthOctTopic", monthOctTopic.size());
        request.setAttribute("monthNovTopic", monthNovTopic.size());
        request.setAttribute("monthDecTopic", monthDecTopic.size());

        request.setAttribute("accountListShopOwner", accountListShopOwner.size());
        request.setAttribute("topicsApprove", topicsApprove.size());
        request.setAttribute("years", lists);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
