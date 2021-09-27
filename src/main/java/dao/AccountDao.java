package dao;

import bean.Account;
import jdbc.MySqlConnection;
import util.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDao {

    private Account getValueAccount(ResultSet rs) {
        try {
            return Account.builder()
                    .accountId(rs.getInt(1))
                    .email(rs.getString(2))
                    .password(rs.getString(3))
                    .firstName(rs.getString(4))
                    .lastName(rs.getString(5))
                    .birthDay(rs.getString(6))
                    .gender(rs.getBoolean(7))
                    .role(rs.getString(8))
                    .phoneNumber(rs.getString(9))
                    .address(rs.getString(10))
                    .status(rs.getString(11))
                    .createdDate(rs.getDate(12))
                    .updatedDate(rs.getDate(13))
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
        String query = "SELECT * FROM account where email = ?";

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

    public static void main(String[] args) {
        System.out.println(new AccountDao().login("abcd@gmail.com","123456aA@"));
    }
}
