package controller;

import bean.Account;
import dao.AccountDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

@WebServlet(name = "AdminController", value = "/admin")
public class AdminController extends HttpServlet {

    private AccountDao accountDao = new AccountDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Account> accountList = accountDao.searchAccountByEmail("");
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
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
        request.setAttribute("totalAccount", accountList.size());
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
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
