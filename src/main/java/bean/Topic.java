package bean;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Builder
@Getter
@Setter
public class Topic {
    private int topicId;
    private String title;
    private String status;
    private String content;
    private int rate;
    private String imgAddr;
    private Date createdDate;
    private Date updatedDate;
    private String month;
<<<<<<< HEAD
    private String image;
    private int accountId;
=======
    private int accountId;
    private String accountName;

>>>>>>> e0ed5241d9b1ba0fec9ce3eb834b92cc4de4a237
}
