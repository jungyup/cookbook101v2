package ca.sheridancollege.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table
@Entity
public class Recipes implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int recipeId;
    @Column(nullable = false)
    @Pattern(regexp = "^[A-z\\s]{3,35}$",message = "Please enter your recipe title")
    private String title;
    @Column(nullable = false)
    @NotBlank(message = "Please select your cuisine")
    private String  cuisine;
    @Column(nullable = false)
    @NotBlank(message = "Please enter your recipe description")
    private String description;
    @Column(nullable = false)
    @Pattern(regexp = "^([01]?[0-9]|2[0-3]):[0-5][0-9]$",message = "Please enter valid Preparation-Time like 07:10 etc")
    private String preparationTime;
    @Column(nullable = false)
    @NotBlank(message = "Please enter your recipe ingredients")
    private String ingredients;
    @Column(nullable = false)
    @NotBlank(message = "Please enter your recipe steps")
    private String steps;

    public Recipes(String title, String cuisine, String description, String preparationTime, String ingredients, String steps) {
        
    	this.title = title;
        this.cuisine = cuisine;
        this.description = description;
        this.preparationTime = preparationTime;
        this.ingredients = ingredients;
        this.steps = steps;
        
    }


}
