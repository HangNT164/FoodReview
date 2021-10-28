package dao;

import bean.TopicComment;
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

public class TopicCommentDao {
    private AccountDao accountDao = new AccountDao();
    private TopicComment getValueTopicComment(ResultSet rs){
        try {
            return TopicComment.builder()
                    .topicCommentId(rs.getInt(1))
                    .topicId(rs.getInt(2))
                    .accountId(rs.getInt(3))
                    .accountName(accountDao.getAccountNameById(rs.getInt(3)))
                    .status(rs.getString(4))
                    .content(rs.getString(5))
                    .rate(rs.getInt(6))
                    .createdDate(rs.getDate(7))
                    .updatedDate(rs.getDate(8))
                    .build();
        } catch (SQLException e){
            e.printStackTrace(System.out);
        }
        return null;
    }
    public List<TopicComment> getAllCommentByTopicId(int topicId){
        String query = "SELECT * FROM topic_comment WHERE topic_id = "+topicId;

        try (Connection con = MySqlConnection.getConnection();
             PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ResultSet rs = ps.executeQuery();
                List<TopicComment> list = new ArrayList<>();
                while (rs != null && rs.next()) {
                    list.add(getValueTopicComment(rs));
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
}
