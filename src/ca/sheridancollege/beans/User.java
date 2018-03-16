package ca.sheridancollege.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table
@Entity
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int u_Id;
    
    @Column(nullable = false)
    @Pattern(regexp = "^[A-z\\s]{3,15}$",message = "Please enter valid user Name")
    private String userName;
    
    @Column(nullable = false)
    @Pattern(regexp = "^\\+?([0-9]{3})\\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$",message = "Please enter valid phone number \n" +
            "like [xxx-xxx-xxxx,xxx.xxx.xxxx, xxx xxx xxxx]")
    private String phoneNumber;
    
    @Column(nullable = false,unique = true)
    @NotBlank(message = "Please enter your email address")
    @Email(message = "Please enter valid email address")
    private String email;
    
    @Column(nullable = false)
    @Size(min = 5,message = "Password must be atleast 5 characters")
    private String password;
    
    @NotBlank(message = "Please enter valid home address")
    private String homeAddress;
    
    @NotBlank(message = "Please choose your gender")
    private String gender;

    public User(String userName, String phoneNumber, String email, String password, String homeAddress, String gender) {
        this.userName = userName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.password = password;
        this.homeAddress = homeAddress;
        this.gender = gender;
    }

   
}

