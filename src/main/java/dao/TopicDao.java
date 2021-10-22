package dao;

import bean.Account;
import bean.Topic;
import jdbc.MySqlConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class TopicDao {
    private Topic getValueTopic(ResultSet rs) {
        try {
            return Topic.builder()
                    .topicId(rs.getInt(1))
                    .title(rs.getString(2))
                    .status(rs.getString(3))
                    .content(rs.getString(4))
                    .rate(rs.getInt(5))
                    .createdDate(rs.getDate(6))
                    .updatedDate(rs.getDate(7))
                    .build();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public Topic getLastestPost() {
        String query = "SELECT * FROM swp391_g2_project.topic where status = \"approved\" ORDER BY created_date DESC LIMIT 1 ;";
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Topic topic = getValueTopic(rs);
                    return topic;
                }

            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Topic> searchTopicByStatus(String status) {
        String query = "SELECT * FROM swp391_g2_project.topic WHERE status like '%" + status + "%' ";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                List<Topic> list = new ArrayList<>();
                while (rs != null && rs.next()) {
                    list.add(getValueTopic(rs));
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Topic> getListTopic() {
        String query = "SELECT * FROM swp391_g2_project.topic where status not like \"reject\";";
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                List<Topic> list = new ArrayList<>();
                while (rs != null && rs.next()) {
                    list.add(getValueTopic(rs));
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public boolean addTopic(Topic topic) {
        int check = 0;
        String query = "INSERT INTO topic (`title`, `status`, `content`, `rate`, `created_date`, `updated_date`,`month`) VALUES (?,?,?,?,?,?,?)";
        try (Connection con = MySqlConnection.getConnection(); // mở kết nối đến DB
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, topic.getTitle());
                ps.setObject(2, topic.getStatus());
                ps.setObject(3, topic.getContent());
                ps.setObject(4, topic.getRate());
                ps.setObject(5, new Date());
                ps.setObject(6, new Date());
                ps.setObject(7, currentMonth());
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean removeTopic(int topicId) {
        int check = 0;
        String query = "UPDATE topic SET status = ?, updated_date =?"
                + "WHERE topic_id = ?";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null) {
            if (ps != null) {
                ps.setObject(1, "reject");
                ps.setObject(2, new Date());
                ps.setObject(3, topicId);
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean updateTopic(int id, Topic topic) {
        int check = 0;
        String query = "UPDATE topic SET title=?" +
                ", content = ?" +
                ", status = ?" +
                ", updated_date = ?" +
                "WHERE topic_id = ?";
        try (Connection con = MySqlConnection.getConnection(); // mở kết nối đến DB
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, topic.getTitle());
                ps.setObject(2, topic.getContent());
                ps.setObject(3, topic.getStatus());
                ps.setObject(4, new Date());
                ps.setObject(5, id);
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public List<Topic> getListTopicByMonth(String month) {
        String query = "SELECT * FROM topic WHERE month=?";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, month);
                ResultSet rs = ps.executeQuery();
                List<Topic> list = new ArrayList<>();
                while (rs != null && rs.next()) {
                    list.add(getValueTopic(rs));
                }
                return list;
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
