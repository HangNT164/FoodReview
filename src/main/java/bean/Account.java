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
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private String birthDay;
    private Boolean gender;
    private String role;
    private String phoneNumber;
    private String address;
    private String status;
    private Date createdDate;
    private Date updatedDate;

}
