package dao;

import bean.Shop;
import jdbc.MySqlConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ShopDao {

    private Shop getValueShop(ResultSet rs) {
        try {
            return Shop.builder()
                    .shopId(rs.getInt(1))
                    .accountId(rs.getInt(2))
                    .shopName(rs.getString(3))
                    .status(rs.getString(4))
                    .address(rs.getString(5))
                    .description(rs.getString(6))
                    .rate(rs.getInt(7))
                    .createdDate(rs.getDate(8))
                    .updatedDate(rs.getDate(9))
                    .build();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Shop> getListShopByAccountAndActive(int accountId) {
        String query = "SELECT * FROM swp391_g2_project.shop where status = 'active' and account_id = " + accountId;
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                List<Shop> list = new ArrayList<>();
                while (rs != null && rs.next()) {
                    list.add(getValueShop(rs));
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Shop> getListShop() {
        String query = "SELECT * FROM swp391_g2_project.shop  where status not like \"reject\"limit 3;";
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                List<Shop> list = new ArrayList<>();
                while (rs != null && rs.next()) {
                    list.add(getValueShop(rs));
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
}
