package bean;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Builder
@Getter
@Setter
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

}
