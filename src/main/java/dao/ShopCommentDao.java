package dao;

import bean.FoodComment;
import bean.ShopComment;
import bean.Topic;
import bean.TopicComment;
import jdbc.MySqlConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ShopCommentDao {
    private AccountDao accountDao = new AccountDao();
    private ShopComment getValueShop_Comment(ResultSet rs) {
        try {
            return ShopComment.builder()
                    .shopCommentId(rs.getInt(1))
                    .shopId(rs.getInt(2))
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
    public List<ShopComment> getCommentByShopId(int id){
        String query = "SELECT * FROM swp391_g2_project.shop_comment inner join swp391_g2_project.account on shop_comment.account_id = account.account_id where shop_id = "+id+" and swp391_g2_project.shop_comment.status = 'active';";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                List<ShopComment> list = new ArrayList<>();
                while (rs != null && rs.next()) {
                    list.add(getValueShop_Comment(rs));
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }public List<ShopComment> yourComment(int id, int idAccount){
        String query = "SELECT * FROM swp391_g2_project.shop_comment inner join \n" +
                "swp391_g2_project.account on shop_comment.account_id = account.account_id where account.account_id = "+idAccount+" and shop_id = "+id+" and swp391_g2_project.shop_comment.status = 'active'";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                List<ShopComment> list = new ArrayList<>();
                while (rs != null && rs.next()) {
                    list.add(getValueShop_Comment(rs));
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    //    public boolean updateComment(int id, ShopComment shopComment) {
//        int check = 0;
//        String query = "update swp391_g2_project.shop_comment set content = ? where shop_comment.shop_comment_id = "+id+"";
//        try (Connection con = MySqlConnection.getConnection(); // mở kết nối đến DB
//             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
//            if (ps != null) {
//                ps.setObject(1, shopComment.getContent());
//                check = ps.executeUpdate();
//            }
//        } catch (Exception e) {
//            e.printStackTrace(System.out);
//        }
//        return check > 0;
//    }
    public boolean addComment(ShopComment shopComment) {
        int check = 0;
        String query = "INSERT INTO swp391_g2_project.shop_comment (`shop_id`, `account_id`, `status`,`content`, `rate`) VALUES (?,?,?,?,?)";
        try (Connection con = MySqlConnection.getConnection(); // mở kết nối đến DB
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, shopComment.getShopId());
                ps.setObject(2, shopComment.getAccountId());
                ps.setObject(3, shopComment.getStatus());
                ps.setObject(4, shopComment.getContent());
                ps.setObject(5, shopComment.getRate());
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
    public boolean removeShopComment(int id) {
        int check = 0;
        String query = "UPDATE swp391_g2_project.shop_comment SET status = 'reject' WHERE shop_comment.shop_comment_id = ?";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setObject(1, id);
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
}