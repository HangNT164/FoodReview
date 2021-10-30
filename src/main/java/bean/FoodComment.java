package bean;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class FoodComment {
    private int foodCommentId;
    private int foodId;
    private String status;
    private String content;
    private int rate;
    private Date createdDate;
    private Date updatedDate;
    private String month;
}