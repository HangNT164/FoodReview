package bean;

import lombok.*;

import java.sql.Date;
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ShopComment {
    private int shopCommentId;
    private int shopId;
    private int accountId;
    private String status;
    private String content;
    private int rate;
    private Date createdDate;
    private Date updatedDate;
    private String accountName;
}
