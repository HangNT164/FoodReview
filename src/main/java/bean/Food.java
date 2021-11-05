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
public class Food {

    private int foodId;
    private int shopId;
    private String foodName;
    private String status;
    private String description;
    private int rate;
    private Date createdDate;
    private Date updatedDate;
    private String img;
    private String month;
    private int accountId;
    private String accountName;
}
