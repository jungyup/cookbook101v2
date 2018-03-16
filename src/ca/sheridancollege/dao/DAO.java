package ca.sheridancollege.dao;

import ca.sheridancollege.beans.MealPlanner;
import ca.sheridancollege.beans.Recipes;
import ca.sheridancollege.beans.ShoppingList;
import ca.sheridancollege.beans.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.ListIterator;

/**
 * this class will hold the hibernate criteria api methods and crud methods
 * */
public class DAO {

	SessionFactory sessionFactory = new Configuration()
			.configure("ca/sheridancollege/config/hibernate.cfg.xml")
			.buildSessionFactory();
	
	//Add Person method will add new Users
	public void addPerson(User person) {
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		session.save(person);
		
		session.getTransaction().commit();
		session.close();
		
	}

	
	 //Add Recipe method will add new Recipe
	public void addRecipe(Recipes recipes) {
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		session.save(recipes);
		
		session.getTransaction().commit();
		session.close();
		
	}

	
	//Add ShoppingList method will add new Item in the shoppingList
	public void addShoppingList(ShoppingList shoppingList){
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		session.save(shoppingList);
		
		session.getTransaction().commit();
		session.close();
	}

	
	//Add MealPlanning item method will add new Item in the MealPlanning table
	public void addMealPlanner(MealPlanner mealPlanner) {
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		session.save(mealPlanner);
		
		session.getTransaction().commit();
		session.close();
	}

	
	//getMealPlannerList method will return the list of MealPlanning items in the database in descending order
	public List<MealPlanner> getMealPlannerList(int uid) {
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<MealPlanner> criteria = criteriaBuilder.createQuery(MealPlanner.class);
		Root<MealPlanner> root = criteria.from(MealPlanner.class);
		List<MealPlanner> list = session.createQuery(criteria.select(root).where(criteriaBuilder.equal(root.get("u_id"),uid))).getResultList();
		
		session.getTransaction().commit();
		session.close();
		
		return list;
	}

	
	//getRecipeList method will return the list of Recipes in the database in descending order
	public List<Recipes> getRecipeList() {
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<Recipes> criteria = criteriaBuilder.createQuery(Recipes.class);
		Root<Recipes> root = criteria.from(Recipes.class);
		List<Recipes> list = session.createQuery(criteria.orderBy(criteriaBuilder.desc(root.get("recipeId")))).getResultList();
		
		session.getTransaction().commit();
		session.close();
		
		return list;
	}

	
	//getShoppingList method will match the specific id to u_id if id is matched with database
	public List<ShoppingList> getShoppingList(int uid){
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<ShoppingList> criteria = criteriaBuilder.createQuery(ShoppingList.class);
		Root<ShoppingList> root = criteria.from(ShoppingList.class);
		List<ShoppingList> list = session.createQuery(criteria.select(root).where(criteriaBuilder.equal(root.get("u_id"),uid))).getResultList();
		
		session.getTransaction().commit();
		session.close();
		
		return list;
	}

	
	//getRecipeList method will match the specific id to recipe_id if id is matched with database
	public List<Recipes> getRecipeListById(int id) {
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<Recipes> criteria = criteriaBuilder.createQuery(Recipes.class);
		Root<Recipes> root = criteria.from(Recipes.class);
		List<Recipes> list = session.createQuery(criteria.select(root).where(criteriaBuilder.equal(root.get("recipeId"),id))).getResultList();
		
		session.getTransaction().commit();
		session.close();
		
		return list;
	}

	//getRecipeListBySearch method will match the title and cuisine parameters with database rows
	public List<Recipes> getRecipeListBySearch(Recipes recipes) {
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<Recipes> criteria = criteriaBuilder.createQuery(Recipes.class);
		Root<Recipes> root = criteria.from(Recipes.class);
		List<Recipes> list = session.createQuery(criteria.select(root).where(criteriaBuilder.and(
				criteriaBuilder.like(root.get("title"),recipes.getTitle()),
				criteriaBuilder.equal(root.get("cuisine"),recipes.getCuisine())
		))).getResultList();
		
		session.getTransaction().commit();
		session.close();
		
		return list;
	}

	/**
	 *  this method will check the email and password is exists in the database
	 *  if email and password is exists in the database then it will return the
	 *  any int value otherwise it will return the 0 value which means
	 *  email and password is not exists in the database
	 */
	public int loginCheck(String email,String password) {
		
		int c=0;
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<User> criteria = criteriaBuilder.createQuery(User.class);
		Root<User> root = criteria.from(User.class);
		ListIterator listIterator =  session.createQuery(criteria.select(root).where(criteriaBuilder.and(
				criteriaBuilder.equal(root.get("email"),email),
				criteriaBuilder.equal(root.get("password"),password)
		))).getResultList().listIterator();
			while (listIterator.hasNext()){
				listIterator.next();
				c++;
			}
			
		session.getTransaction().commit();
		session.close();
		
		return c;
	}

	/**
	 *  this method will check the email and password is exists in the database
	 *  if email and password is exists in the database then it will return the
	 *  list of matched User otherwise it will return the empty list which means
	 *  email and password is not exists in the database
	 */
	public List<User> loginList(String email,String password) {
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<User> criteria = criteriaBuilder.createQuery(User.class);
		Root<User> root = criteria.from(User.class);
		List<User> list = session.createQuery(criteria.select(root).where(criteriaBuilder.and(
				criteriaBuilder.equal(root.get("email"),email),
				criteriaBuilder.equal(root.get("password"),password)
		))).getResultList();
		
		session.getTransaction().commit();
		session.close();
		
		return list;
	}

	// .in() method is used to delete duplicate id at once using criteria-builder
	public int deleteMealPlan(int id) {
		
		int result = 0;
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		CriteriaBuilder criteriaBuilder  = session.getCriteriaBuilder();
		CriteriaDelete<MealPlanner> query = criteriaBuilder.createCriteriaDelete(MealPlanner.class);
		Root<MealPlanner> root = query.from(MealPlanner.class);
		query.where(root.get("p_id").in(id));
		result = session.createQuery(query).executeUpdate();
		
		session.getTransaction().commit();
		session.close();
		
		return result;
	}

	//.in() method is used to delete duplicate id at once using criteria-builder
	public int deleteShoppListItem(int id) {
		
		int result = 0;
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		CriteriaBuilder criteriaBuilder  = session.getCriteriaBuilder();
		CriteriaDelete<ShoppingList> query = criteriaBuilder.createCriteriaDelete(ShoppingList.class);
		Root<ShoppingList> root = query.from(ShoppingList.class);
		query.where(root.get("cart_Id").in(id));
		result = session.createQuery(query).executeUpdate();
		
		session.getTransaction().commit();
		session.close();
		
		return result;
	}
}
