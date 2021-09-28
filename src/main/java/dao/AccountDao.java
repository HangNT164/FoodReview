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

    private boolean setValueAccount(Account account, PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.setObject(1, account.getEmail());
                ps.setObject(2, BCrypt.hashpw(account.getPassword(), BCrypt.gensalt()));
                return true;
            } catch (SQLException e) {
                e.printStackTrace(System.out);
            }
        }
        return false;
    }


    public Account login(String email, String password) {
        String query = "SELECT * FROM account where email = ? ";

        try (Connection con = MySqlConnection.getConnection(); // mở kết nối đến DB
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, email);
                ResultSet rs = ps.executeQuery();
                if (rs != null && rs.next()) {
                    Account account = getValueAccount(rs);
                    // System.out.println(account.getPassword());
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
        String query = "SELECT * FROM account WHERE email like '%" + name + "%'";

        try (Connection con = MySqlConnection.getConnection(); // mở kết nối đến DB
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
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

    public static void main(String[] args) {
        System.out.println(new AccountDao().login("hangnt16499@gmail.com", "123456aA@"));
    }
}
