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
public class Shop {

    private int shopId;
    private int accountId;
    private String shopName;
    private String status;
    private String address;
    private String description;
    private int rate;
    private Date createdDate;
    private Date updatedDate;
}
