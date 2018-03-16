package ca.sheridancollege.controller;


import ca.sheridancollege.beans.MealPlanner;
import ca.sheridancollege.beans.Recipes;
import ca.sheridancollege.beans.ShoppingList;
import ca.sheridancollege.beans.User;
import ca.sheridancollege.dao.DAO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class HomeController {

	private DAO dao = new DAO();

	//This will load automatically and this is index page controller
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home() {
		
		return "home";
	}

	//This method will return the login.jsp page
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		
		return "Login";
	}

	//This method will send the post request,
	//if all form fileds are not empty then it will check the user is exist in the database
	//if user is existed in the database then it will show other features of web application
	//otherwise it will show login.jsp page
	@RequestMapping(value="/logged", method=RequestMethod.POST)
	public String loginPost(Model model,@RequestParam String email, @RequestParam String password, HttpSession session) {
		
			if (dao.loginCheck(email,password)==0) {
				
				model.addAttribute("invalid","Invalid Account");
				
				return "Login";
			} else {
				
				List<User> list = dao.loginList(email,password);
				session.setAttribute("userList",list);
				
				return "home";
			}
	}

	//This method will return the register.jsp page
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String register(Model model) {
		
		model.addAttribute("reg",new User());
		
		return "Register";
	}

	//This method will send the post request,
	// if all fileds are not empty then data will inserted into database
	@RequestMapping(value="/registration", method=RequestMethod.POST)
	public String registerPost(@ModelAttribute("reg") @Valid User user, BindingResult result) {
		
		if (result.hasErrors()) {
			
			return "Register";
		} else {
			
			dao.addPerson(user);
			
			return "Login";
		}
	}


	//This method will return the addrecipe.jsp page
	@RequestMapping(value="/addrecipe", method=RequestMethod.GET)
	public String recipes(Model model) {
		
		model.addAttribute("rep",new Recipes());
		
		return "AddRecipes";
	}


	//This method will send the post request,
	// if all fields are not empty then data will inserted into database
	@RequestMapping(value="/addrecipes", method=RequestMethod.POST)
	public String recipePost(Model model, HttpSession session, @ModelAttribute("rep") @Valid Recipes recipes, BindingResult result) {
		
		int i = 0;
		List<User> q = (List<User>) session.getAttribute("userList");
		
		for (User aQ : q) {
			i = aQ.getU_Id();
		}
		
		if(result.hasErrors()){
			return "AddRecipes";
		} else {
			
			dao.addRecipe(recipes);
			model.addAttribute("shop",dao.getShoppingList(i));
			
			return "redirect:/recipes";
		}
	}

	//This method will return the recipes.jsp page
	@RequestMapping(value="/recipes", method=RequestMethod.GET)
	public String listOfRecipes(Model model) {
		
		model.addAttribute("repList",dao.getRecipeList());
		
		return "Recipes";
	}

	//This method will return the shoppingList.jsp page
	@RequestMapping(value="/shopping/{recipe_id}", method=RequestMethod.GET)
	public String shoppingList(@PathVariable("recipe_id") int recipe_id, Model model, HttpSession session) {
		
		int i = 0;
		List<Recipes> list = dao.getRecipeListById(recipe_id);
		List<User> q = (List<User>) session.getAttribute("userList");
		
		for (User aQ : q) {
			i = aQ.getU_Id();
		}
		
		ShoppingList shoppingList = new ShoppingList();
		shoppingList.setRecipe_id(recipe_id);
		shoppingList.setU_id(i);
		
		for(Recipes recipes:list){
			shoppingList.setCuisine(recipes.getCuisine());
			shoppingList.setDescription(recipes.getDescription());
			shoppingList.setIngredients(recipes.getIngredients());
			shoppingList.setPreparationTime(recipes.getPreparationTime());
			shoppingList.setSteps(recipes.getSteps());
			shoppingList.setTitle(recipes.getTitle());
		}
		
		dao.addShoppingList(shoppingList);
		model.addAttribute("added","Your item is added into shopping list");
		
		return "redirect:/shoppingCart";

	}

	//This method will return the shoppingList.jsp page
	@RequestMapping(value="/shoppingCart", method=RequestMethod.GET)
	public String shoppingList(Model model, HttpSession session){
		int i = 0;
		
		List<User> q = (List<User>) session.getAttribute("userList");
		
		for (User aQ : q) {
			i = aQ.getU_Id();
		}
		model.addAttribute("shop",dao.getShoppingList(i));
		
		return "ShoppingList";

	}


	@RequestMapping(value="/searching", method=RequestMethod.POST)
	public String search(Model model, @RequestParam("title") String title, @RequestParam("cuisine") String cuisine, Recipes recipes) {
		
		recipes.setCuisine(cuisine);
		recipes.setTitle(title);
		model.addAttribute("repList",dao.getRecipeListBySearch(recipes));
		
		return "Recipes";
	}

	//This method will return the home.jsp page
	//And destroy the all attributes of session
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.removeAttribute("userList");
		session.invalidate();
		
		return "redirect:/";
	}

	//This method will return the MealPlanner.jsp page
	//And delete the meal - plan
	@RequestMapping(value="/deleteMealPlan/{pid}", method=RequestMethod.GET)
	public String deleteMealPlannerRow(@PathVariable("pid") int id,Model model) {
		
		int del = dao.deleteMealPlan(id);
		
		if (del==0) {
			
			model.addAttribute("delMeal","Row not deleted Successfully");
			
			return "MealPlanner";
		} else {
			
			return "redirect:/mealPlanning";
		}
	}

	//This method will return the ShoppingList.jsp page
	//And delete the shopping list row
	@RequestMapping(value="/deleteShoppingList/{pid}", method=RequestMethod.GET)
	public String deleteShoppListRow(@PathVariable("pid") int id,Model model) {
		
		int del = dao.deleteShoppListItem(id);
		
		if (del==0) {
			
			model.addAttribute("delShop","Row not deleted Successfully");
			
			return "ShoppingList";
		} else {
			
			return "redirect:/shoppingCart";
		}
	}

	//This method will return the MealPlanner.jsp page
	@RequestMapping(value="/mealPlanning", method=RequestMethod.GET)
	public String mealPlanner(Model model, HttpSession session) {
		
		int i = 0;
		List<User> q = (List<User>) session.getAttribute("userList");
		
		for (User aQ : q) {
			i = aQ.getU_Id();
		}
		
		model.addAttribute("mpForm",new MealPlanner());
		model.addAttribute("mpList",dao.getMealPlannerList(i));
		
		return "MealPlanner";
	}

	@RequestMapping(value="/addingMealPlanning", method=RequestMethod.POST)
	public String addMealPanning(@ModelAttribute("mpForm") @Valid MealPlanner mealPlanner, BindingResult result, HttpSession session) {
		
		if (result.hasErrors()) {
			
			return "Recipes";
		} else {
			
			int i = 0;
			List<User> q = (List<User>) session.getAttribute("userList");
			
			for (User aQ : q) {
				i = aQ.getU_Id();
			}
			
			mealPlanner.setU_id(i);
			dao.addMealPlanner(mealPlanner);
			
			return "redirect:/mealPlanning";
		}
	}


}

