package bean;

import lombok.*;

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
}
