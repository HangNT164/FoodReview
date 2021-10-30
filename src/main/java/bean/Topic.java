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
    private Date createdDate;
    private Date updatedDate;
    private String month;
    private String image;
    private int accountId;
}
