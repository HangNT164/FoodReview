package dao;

import bean.Shop;
import jdbc.MySqlConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ShopDao {
    private AccountDao accountDao = new AccountDao();
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
//                    .totalNumberRate(rs.getInt(8))
                    .createdDate(rs.getDate(8))
                    .updatedDate(rs.getDate(9))
                    .img(rs.getString(10))
                    .accountName(accountDao.getAccountNameById(rs.getInt(2)))
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
        String query = "SELECT * FROM swp391_g2_project.shop where shop_name like '%" + shopName + "%' and status not like 'deleted'";
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
        String query = "SELECT * FROM swp391_g2_project.shop where shop_name like '%" + shopName + "%' and status = '" + status + "' and status not like 'deleted'";
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
        String query = "SELECT * FROM shop  where status not like 'reject' limit 3;";
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

    public boolean addShop(Shop shop) {
        int check = 0;
        String query = "INSERT INTO `shop` (`account_id`,`shop_name`, `rate`,`address`, `description`) " +
                " VALUES (?,?,?,?,?);";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setObject(1, shop.getAccountId());
                ps.setObject(2, shop.getShopName());
                ps.setObject(3, 0);
                ps.setObject(4, shop.getAddress());
                ps.setObject(5, shop.getDescription());
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

    public List<Shop> listShop() {
        String query = " SELECT * FROM shop  WHERE status NOT LIKE \"reject\" ";
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
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

    public List<Integer> getListPage(List<Shop> listShop, int number) {
        List<Integer> listPage = new ArrayList<>();
        double size = (double) listShop.size() / (double) number;
        for (int i = 1; i <= Math.ceil(size); i++) {
            listPage.add(i);
        }
        return listPage;
    }

    public List<Shop> getListShopInPage(int page, int numberInAPage) {
        try (Connection con = MySqlConnection.getConnection();
             CallableStatement cal = con.prepareCall("{call paggingShop(?,?)}")) {
            if (cal != null) {
                cal.setInt(1, numberInAPage * (page - 1));
                cal.setInt(2, numberInAPage * page);
                ResultSet rs = cal.executeQuery();
                List<Shop> listInPage = new ArrayList<>();
                while (rs != null && rs.next()) {
                    listInPage.add(getValueShop(rs));
                }
                return listInPage;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public Shop getOne(int id) {
        String query = "SELECT * FROM shop where shop_id = ? ";
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    return getValueShop(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public boolean updateNumberRate(int id, Shop shop) {
        int check = 0;
        String query = "UPDATE shop SET total_number_rate = ?, updated_date = ?"
                + "WHERE shop_id = ?";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setObject(1, shop.getTotalNumberRate() + 1);
                ps.setObject(2, new Date());
                ps.setObject(3, id);
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean updateRate(int id, int rate) {
        int check = 0;
        String query = "UPDATE shop SET rate = ?, updated_date = ?"
                + "WHERE shop_id = ?";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setObject(1, rate);
                ps.setObject(2, new Date());
                ps.setObject(3, id);
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
}
