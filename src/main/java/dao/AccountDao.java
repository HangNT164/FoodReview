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

    public Account getAccountByEmail(String email) {
        String query = "SELECT * FROM account WHERE email = '"+ email + "' AND status = ?";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, StatusAccountEnum.active.toString());
                ResultSet rs = ps.executeQuery();
                Account account = null;
                while (rs != null && rs.next()) {
                    account = getValueAccount(rs);
                }
                return account;
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



    public boolean addAccount(Account account) {
        int check = 0;
        String query = "INSERT INTO account (`name`, `dob`, `address`, `email`, `phone_number`, `password`) " +
                " VALUES (?,?,?,?,?,?)";

        try (Connection con = MySqlConnection.getConnection(); // mở kết nối đến DB
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, account.getName());
                ps.setObject(2, account.getDob());
                ps.setObject(3, account.getAddress());
                ps.setObject(4, account.getEmail());
                ps.setObject(5, account.getPhoneNumber());
                ps.setObject(6, BCrypt.hashpw(account.getPassword(), BCrypt.gensalt()));
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean isDulicapteEmail(String email) {
        String sql = "SELECT * FROM account WHERE email = ? ";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);) {
            if (ps != null) {
                ps.setObject(1, email);
            }
            ResultSet rs = ps != null ? ps.executeQuery() : null;

            if (rs != null) {
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return false;
    }

    public boolean isDulicaptePhone(String phone) {
        String sql = "SELECT * FROM account WHERE phone_number = ? ";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);) {
            if (ps != null) {
                ps.setObject(1, phone);
            }
            ResultSet rs = ps != null ? ps.executeQuery() : null;

            if (rs != null) {
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return false;
    }

    public boolean updateAccount(int id, Account account) {
        int check = 0;
        String query = "UPDATE account SET name=?, phone_number=?, email=?, address=?, dob=?, updated_date =?  WHERE account_id =?";

        try (Connection con = MySqlConnection.getConnection(); // mở kết nối đến DB
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, account.getName());
                ps.setObject(2, account.getPhoneNumber());
                ps.setObject(3, account.getEmail());
                ps.setObject(4, account.getAddress());
                ps.setObject(5, account.getDob());
                ps.setObject(6, new Date());
                ps.setObject(7, id);
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean updatePassword(int id, String newPass) {
        int check = 0;
        String query = "UPDATE account SET password = ? WHERE account_id = ?";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, BCrypt.hashpw(newPass, BCrypt.gensalt()));
                ps.setObject(2, id);
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
}
