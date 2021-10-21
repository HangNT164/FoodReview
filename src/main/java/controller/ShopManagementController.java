package controller;

import bean.Food;
import bean.Food_Comment;
import dao.FoodDao;
import dao.Food_CommentDao;
import dao.ShopDao;
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

@WebServlet(name = "ShopManagementController", value = "/shop")
public class ShopManagementController extends HttpServlet {
    private FoodDao foodDao = new FoodDao();
    private ShopDao shopDao = new ShopDao();
    private TopicDao topicDao = new TopicDao();
    private Food_CommentDao food_commentDao = new Food_CommentDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int topRate = foodDao.totalRate();
        int topCmt = foodDao.totalCmt();
        int maxRate = 0;
        int maxRateT = 0;
        List<Food_Comment> listT = food_commentDao.getListFoodCmt();
        Food topFood = foodDao.getFoodTop();

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

        String[]  months = new String[] { "01/","02/","03/","04/","05/","06/","07/","08/","09/","10/","11/","12/"} ;
        int[] monthRate = new int[months.length];
        int[] rateMonth = new int[months.length];

        for( int i = 0; i<months.length; i++){
            monthRate[i] = food_commentDao.numOfCommentOfMonth(months[i] + yearTopic);
            if(maxRate < monthRate[i]){
                maxRate =  monthRate[i];
            }
        }
        for( int i = 0; i<months.length; i++){
            rateMonth[i] = foodDao.rateByMonth(months[i] + year);
            if(maxRateT < rateMonth[i]){
                maxRateT =  rateMonth[i];
            }
        }



        request.setAttribute("monthJan", rateMonth[0]);
        request.setAttribute("monthFeb", rateMonth[1]);
        request.setAttribute("monthMar", rateMonth[2]);
        request.setAttribute("monthApr", rateMonth[3]);
        request.setAttribute("monthMay", rateMonth[4]);
        request.setAttribute("monthJun", rateMonth[5]);
        request.setAttribute("monthJul", rateMonth[6]);
        request.setAttribute("monthAug", rateMonth[7]);
        request.setAttribute("monthSep", rateMonth[8]);
        request.setAttribute("monthOct", rateMonth[9]);
        request.setAttribute("monthNov", rateMonth[10]);
        request.setAttribute("monthDec", rateMonth[11]);

        request.setAttribute("monthJanT", monthRate[0]);
        request.setAttribute("monthFebT", monthRate[1]);
        request.setAttribute("monthMarT", monthRate[2]);
        request.setAttribute("monthAprT", monthRate[3]);
        request.setAttribute("monthMayT", monthRate[4]);
        request.setAttribute("monthJunT", monthRate[5]);
        request.setAttribute("monthJulT", monthRate[6]);
        request.setAttribute("monthAugT", monthRate[7]);
        request.setAttribute("monthSepT", monthRate[8]);
        request.setAttribute("monthOctT", monthRate[9]);
        request.setAttribute("monthNovT", monthRate[10]);
        request.setAttribute("monthDecT", monthRate[11]);
//
//        request.setAttribute("accountListShopOwner", accountListShopOwner.size());
//        request.setAttribute("topicsApprove", topicsApprove.size());
        request.setAttribute("years", lists);

        request.setAttribute("topRate", topRate);
        request.setAttribute("maxRate", maxRate);
        request.setAttribute("maxRateT", maxRateT);
        request.setAttribute("topCmt", topCmt);
        request.setAttribute("topFood", topFood);
        request.setAttribute("listT", listT);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

    }
}
