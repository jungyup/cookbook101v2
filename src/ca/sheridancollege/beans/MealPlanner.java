package ca.sheridancollege.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table
@Entity
public class MealPlanner {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int p_id;
    @Column(nullable = false)
    private int u_id;
    @Column(nullable = false,length = 25)
    @NotBlank(message = "Please select your Day for Meal Plan")
    private String days;
    @Column(nullable = false,length = 55)
    @NotBlank(message = "Please enter breakfast recipe")
    private String breakFast;
    @Column(nullable = false,length = 55)
    @NotBlank(message = "Please enter lunch recipe")
    private String lunch;
    @Column(nullable = false,length = 55)
    @NotBlank(message = "Please enter dinner recipe")
    private String dinner;

   
}
