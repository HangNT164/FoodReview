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
public class Account {

    private int accountId;
    private String name;
    private String dob;
    private Boolean gender;
    private String address;
    private String role;
    private String email;
    private String phoneNumber;
    private String password;
    private String status;
    private Date createdDate;
    private Date updatedDate;
    private String month;

}
