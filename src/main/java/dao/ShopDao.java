package dao;

import bean.Shop;
import bean.Topic;
import jdbc.MySqlConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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

    public List<Shop> getListShopByName(String shopName) {
        String query = "SELECT * FROM swp391_g2_project.shop where shop_name like '%"+ shopName +"%' and status not like 'deleted'";
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

    public List<Shop> getListShopByNameAndStatus(String shopName, String status) {
        String query = "SELECT * FROM swp391_g2_project.shop where shop_name like '%"+ shopName +"%' and status = '"+ status +"' and status not like 'deleted'";
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

    public boolean addAccount(Shop shop) {
        int check = 0;
        String query = "INSERT INTO `shop` (`account_id`,`shop_name`, `address`, `description`) " +
                " VALUES (?,?,?,?);";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setObject(1, shop.getAccountId());
                ps.setObject(2, shop.getShopName());
                ps.setObject(3, shop.getAddress());
                ps.setObject(4, shop.getDescription());
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean updateShop(int shopId, Shop shop) {
        int check = 0;
        String query = "UPDATE shop SET " +
                "shop_name = ? " +
                ", address = ? " +
                ", description = ? " +
                ", status = ? " +
                ", updated_date = ? " +
                "WHERE shop_id = ? ";
        try (Connection con = MySqlConnection.getConnection(); // mở kết nối đến DB
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, shop.getShopName());
                ps.setObject(2, shop.getAddress());
                ps.setObject(3, shop.getDescription());
                ps.setObject(4, shop.getStatus());
                ps.setObject(5, new Date());
                ps.setObject(6, shopId);
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean removeShop(int shopId) {
        int check = 0;
        String query = "UPDATE shop SET status = ?, updated_date = ?"
                + "WHERE shop_id = ?";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setObject(1, "deleted");
                ps.setObject(2, new Date());
                ps.setObject(3, shopId);
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

}
