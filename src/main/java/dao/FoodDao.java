package dao;

import bean.Food;
import jdbc.MySqlConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class FoodDao {
    private AccountDao accountDao = new AccountDao();
    private Food getValueFood(ResultSet rs) {
        try {
            return Food.builder()
                    .foodId(rs.getInt(1))
                    .shopId(rs.getInt(2))
                    .foodName(rs.getString(3))
                    .status(rs.getString(4))
                    .description(rs.getString(5))
                    .rate(rs.getInt(6))
                    .createdDate(rs.getDate(7))
                    .updatedDate(rs.getDate(8))
                    .img(rs.getString(9))
//                    .month(rs.getString(9))
//                    .accountId(rs.getInt(10))
//                    .accountName(accountDao.getAccountNameById(rs.getInt(10)))
                    .build();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    public List<Food> getListFood() {
        String query = "SELECT * FROM food  where status not like 'reject'  ORDER BY rate DESC limit 5";
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                List<Food> list = new ArrayList<>();
                while (rs != null && rs.next()) {
                    list.add(getValueFood(rs));
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    public List<Food> listFoodByMonth(String month) {
        String query = "SELECT * FROM swp391_g2_project.food WHERE month=?";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, month);
                ResultSet rs = ps.executeQuery();
                List<Food> list = new ArrayList<>();
                while (rs != null && rs.next()) {
                    list.add(getValueFood(rs));
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public boolean addFood(Food food) {
        int check = 0;
        String query = "INSERT INTO food (`shop_id`, `food_name`, `status`, `description`, `rate`, `created_date`, `updated_date`) VALUES (?,?,?,?,?,?,?)";
        try (Connection con = MySqlConnection.getConnection(); // mở kết nối đến DB
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, food.getShopId());
                ps.setObject(2, food.getFoodName());
                ps.setObject(3, food.getStatus());
                ps.setObject(4, food.getDescription());
                ps.setObject(5, food.getRate());
                ps.setObject(6, new Date());
                ps.setObject(7, new Date());
                check = ps.executeUpdate();
                ps.close();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public int rateByMonth(String month) {
        String query = "select sum(rate) as sum from swp391_g2_project.food where month = ?";
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

    public int totalRate() {
        int sum = -1;
        String query = "SELECT sum(rate) AS LargestPrice FROM swp391_g2_project.food ;";
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                sum = rs.getInt("LargestPrice");
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return sum;
    }

    public int maxRate() {
        int max = -1;
        String query = "SELECT max(rate) AS LargestPrice FROM swp391_g2_project.food;";
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                max = rs.getInt("LargestPrice");
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return max;
    }

    public int totalCmt() {
        int sum = -1;
        String query = "SELECT count(*) AS sum FROM swp391_g2_project.food_comment";
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                sum = rs.getInt("sum");
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return sum;
    }

    public Food getFoodTop() {
        String query = "select food_id, shop_id, food_name,status, description, rate, created_date, updated_date, month from swp391_g2_project.food\n" +
                "JOIN ( SELECT MAX(rate) AS max_rate\n" +
                "           FROM swp391_g2_project.food\n" +
                "       ) m\n" +
                "    ON m.max_rate = rate";
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Food food = getValueFood(rs);
                    return food;
                }
            } else {
                return null;
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
