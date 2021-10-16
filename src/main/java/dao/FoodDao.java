package dao;

import bean.Food;
import jdbc.MySqlConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class FoodDao {

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
                    .build();
        } catch (SQLException e) {
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
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
}
