package dao;

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
    private AccountDao accountDao = new AccountDao();
    private Topic getValueTopic(ResultSet rs) {
        try {
            return Topic.builder()
                    .topicId(rs.getInt(1))
                    .title(rs.getString(2))
                    .status(rs.getString(3))
                    .content(rs.getString(4))
                    .rate(rs.getInt(5))
                    .img(rs.getString(6))
                    .createdDate(rs.getDate(7))
                    .updatedDate(rs.getDate(8))
                    .month(rs.getString(9))
                    .accountId(rs.getInt(10))
                    .accountName(accountDao.getAccountNameById(rs.getInt(10)))
                    .build();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public Topic getLastestPost() {
        String query = "SELECT * FROM swp391_g2_project.topic where status NOT LIKE 'reject' ORDER BY created_date DESC LIMIT 1 ;";
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Topic topic = getValueTopic(rs);
                    return topic;
                }

            } else{
                return null;
            }
        }
        catch (Exception e){
            e.printStackTrace(System.out);
        }
        return null;
    }
    public Topic getPostById(int id){
        String query = "SELECT * FROM swp391_g2_project.topic WHERE status NOT LIKE 'reject' AND topic_id = "+id+" ;";
        try(Connection con = MySqlConnection.getConnection();
            PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;){
            if(ps!=null){
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Topic topic = getValueTopic(rs);
                    return topic;
                }

            } else{
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
    public List<Topic> getTopicsByIndexAndSearchString(String search, int index, String sortType) {
        String query = "";
        if(sortType.equalsIgnoreCase("name")){
            query = "SELECT * FROM topic WHERE status NOT LIKE 'reject' AND title like '%"+search+"%' " +
                    " ORDER BY title ASC LIMIT "+((index-1)*8)+", 8";
        }
        else{
            query = "SELECT * FROM topic WHERE status NOT LIKE 'reject' AND title like '%"+search+"%' " +
                    " ORDER BY created_date DESC LIMIT "+((index-1)*8)+", 8";
        }

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                List<Topic> list = new ArrayList<>();
                while (rs != null && rs.next()) {
                    list.add(getValueTopic(rs));
                }
                for(int i=0; i<list.size();i++){
                    String temp = list.get(i).getContent();
                    list.get(i).setContent(temp.substring(0,40) + "  ......");
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    public int getTotalTopics(String search) {
        String query = "SELECT COUNT(*) FROM topic WHERE title like '%"+search+"%';";

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                int result = -1;
                while (rs.next()){
                    result = rs.getInt(1);
                }
                return result;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return -1;
    }
    public List<Topic> getListTopic(){
        String query = "SELECT * FROM swp391_g2_project.topic where status NOT LIKE 'reject';";
        try(Connection con = MySqlConnection.getConnection();
            PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;){
            if(ps!=null){
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

    public boolean addTopicReviewer(Topic topic) {
        int check = 0;
        String query = "INSERT INTO topic (`title`, `status`,`content`, `image`,`month`,`account_id`) VALUES (?,?,?,?,?,?)";
        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, topic.getTitle());
                ps.setObject(2, topic.getStatus());
                ps.setObject(3, topic.getContent());
                ps.setObject(4, topic.getImg());
                ps.setObject(5, currentMonth());
                ps.setObject(6, topic.getAccountId());
                check = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
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
