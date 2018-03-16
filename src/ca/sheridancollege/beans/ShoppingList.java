package ca.sheridancollege.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table
@Entity
public class ShoppingList implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cart_Id;
    @Column(nullable = false)
    private int u_id;
    @Column(nullable = false)
    private int recipe_id;
    @Column(nullable = false)
    private String title;
    @Column(nullable = false)
    private String  cuisine;
    @Column(nullable = false)
    private String description;
    @Column(nullable = false)
    private String preparationTime;
    @Column(nullable = false)
    private String ingredients;
    @Column(nullable = false)
    private String steps;
 
}
