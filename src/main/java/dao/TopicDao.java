package dao;

import bean.Topic;
import constant.StatusAccountEnum;
import jdbc.MySqlConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TopicDao {
    private Topic getValueTopic(ResultSet rs){
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
        } catch (SQLException e){
            e.printStackTrace(System.out);
        }
        return null;
    }
    public List<Topic> getListTopic(){
        String query = "SELECT * FROM topic;";
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
        }
        catch (Exception e){
            e.printStackTrace(System.out);
        }
        return null;
    }

//    public static void main(String[] args) {
//        TopicDao dao = new TopicDao();
//        List<Topic> topicList = dao.getListTopic();
//        for(Topic o: topicList){
//            System.out.println(o);
//        }
//    }
}
