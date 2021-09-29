package dao;

import bean.Account;
import constant.StatusAccountEnum;
import jdbc.MySqlConnection;
import util.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AccountDao {

    private Account getValueAccount(ResultSet rs) {
        try {
            return Account.builder()
                    .accountId(rs.getInt(1))
                    .name(rs.getString(2))
                    .dob(rs.getString(3))
                    .gender(rs.getBoolean(4))
                    .address(rs.getString(5))
                    .role(rs.getString(6))
                    .email(rs.getString(7))
                    .phoneNumber(rs.getString(8))
                    .password(rs.getString(9))
                    .status(rs.getString(10))
                    .createdDate(rs.getDate(11))
                    .updatedDate(rs.getDate(12))
                    .build();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public Account login(String email, String password) {
        String query = "SELECT * FROM account where email = ? ";


        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, email);
                ResultSet rs = ps.executeQuery();
                if (rs != null && rs.next()) {
                    Account account = getValueAccount(rs);

                    if (BCrypt.checkpw(password, account.getPassword())) {
                        return account;
                    }
                }
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Account> searchAccountByName(String name) {
        String query = "SELECT * FROM account WHERE email like '%" + name + "%' AND status = ?";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, StatusAccountEnum.active.toString());
                ResultSet rs = ps.executeQuery();
                List<Account> list = new ArrayList<>();
                while (rs != null && rs.next()) {
                    list.add(getValueAccount(rs));
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public boolean changeRoleAccount(int accountId, String role) {
        int check = 0;
        String query = "UPDATE account SET role = ? , updated_date =?"
                + "WHERE account_id = ? AND status =?";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setObject(1, role);
                ps.setObject(2, new Date());
                ps.setObject(3, accountId);
                ps.setObject(4, StatusAccountEnum.active.toString());
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean removeAccount(int accountId) {
        int check = 0;
        String query = "UPDATE account SET status = ?, updated_date =?"
                + "WHERE account_id = ? AND status =?";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setObject(1, StatusAccountEnum.inactive.toString());
                ps.setObject(2, new Date());
                ps.setObject(3, accountId);
                ps.setObject(4, StatusAccountEnum.active.toString());
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

//    public static void main(String[] args) {
//        AccountDao acc = new AccountDao();
//        String name = "hangnt16499@gmail.com";
//        List<Account> list = acc.searchAccountByName(name);
//        for(Account o : list){
//            System.out.println(o);
//        }
//
//
//    }

}
