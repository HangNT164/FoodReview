package dao;

import bean.FoodComment;
import jdbc.MySqlConnection;

import java.util.Calendar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class FoodCommentDao {
    private FoodComment getValueFood_Comment(ResultSet rs) {
        try {
            return FoodComment.builder()
                    .foodCommentId(rs.getInt(1))
                    .foodId(rs.getInt(2))
                    .accountId(rs.getInt(3))
                    .status(rs.getString(4))
                    .content(rs.getString(5))
                    .rate(rs.getInt(6))
                    .createdDate(rs.getDate(7))
                    .updatedDate(rs.getDate(8))
                    .accountName(rs.getString(10))
                    .build();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<FoodComment> allCommentByFoodId(int foodId) {
        List <FoodComment> foodCommentList;
        String query = "SELECT fc.*, a.name FROM swp391_g2_project.food_comment fc join swp391_g2_project.account a on fc.account_id = a.account_id " +
                "where fc.food_id = " + foodId + " and fc.status = 'active' order by fc.updated_date desc";
        try (Connection con = MySqlConnection.getConnection();
            PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                foodCommentList = new ArrayList<>();
                while (rs != null && rs.next()) {
                    foodCommentList.add(getValueFood_Comment(rs));
                }
                return foodCommentList;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public boolean addFoodComment(FoodComment foodComment) {
        int check = 0;
        String query = "INSERT INTO swp391_g2_project.food_comment" +
                " (`food_id`, `account_id`, `status`, `content`, `created_date`) VALUES(?,?,?,?,?)";
        try (Connection con = MySqlConnection.getConnection();
            PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, foodComment.getFoodId());
                ps.setObject(2, foodComment.getAccountId());
                ps.setObject(3, foodComment.getStatus());
                ps.setObject(4, foodComment.getContent());
                ps.setObject(5, foodComment.getCreatedDate());
                check = ps.executeUpdate();
            }
        }
        catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean updateFoodComment(int foodCommentId, String content) {
        int check = 0;
        String query = "UPDATE swp391_g2_project.food_comment SET content = ?, updated_date = ? where food_comment.food_comment_id = ?";
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, content);
                ps.setObject(2, new Date());
                ps.setObject(3, foodCommentId);
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean removeFoodComment(int foodCommentId) {
        int check = 0;
        String query = "UPDATE swp391_g2_project.food_comment SET status = 'inactive' where food_comment.food_comment_id = ?";
        try (Connection con = MySqlConnection.getConnection();
            PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, foodCommentId);
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
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
