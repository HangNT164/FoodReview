package dao;

import bean.FoodComment;
import jdbc.MySqlConnection;

import java.util.Calendar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FoodCommentDao {
    private FoodComment getValueFood_Comment(ResultSet rs) {
        try {
            return FoodComment.builder()
                    .foodCommentId(rs.getInt(1))
                    .foodId(rs.getInt(2))
                    .status(rs.getString(3))
                    .content(rs.getString(4))
                    .rate(rs.getInt(5))
                    .createdDate(rs.getDate(6))
                    .updatedDate(rs.getDate(7))
                    .build();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int numOfCommentOfMonth(String month) {
        String query = "select count(*) as sum from swp391_g2_project.food_comment where month = ?";
        int sum = 0;
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, month);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    sum = rs.getInt("sum");
                }

            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return sum;
    }

    public int listFoodCByMonth(String month) {
        String query = "SELECT sum(rate) as SumRate FROM swp391_g2_project.food_comment WHERE month=?";
        int sum = 0;
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, month);
                ResultSet rs = ps.executeQuery();
                List<FoodComment> list = new ArrayList<>();
                while (rs != null && rs.next()) {
                    sum = rs.getInt("SumRate");
                }

            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return sum;
    }

    public List<FoodComment> getListFoodCmt() {
        String query = "SELECT * FROM swp391_g2_project.food_comment ";
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                List<FoodComment> list = new ArrayList<>();
                while (rs != null && rs.next()) {
                    list.add(getValueFood_Comment(rs));
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    private String currentMonth() {
        // Get Last Month
        Calendar cal = Calendar.getInstance();
        int month = cal.get(Calendar.MONTH);
        int year = cal.get(Calendar.YEAR);

        // Current Month
        String billingMonthCurrent;
        if (month >= 0 && month <= 8) {
            billingMonthCurrent = "0" + (month + 1) + "/" + year;
        } else {
            billingMonthCurrent = (month + 1) + "/" + year;
        }
        return billingMonthCurrent;
    }
}
