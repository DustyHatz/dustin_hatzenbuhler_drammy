package com.Drammy.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Drammy.models.User;
import com.Drammy.models.Whiskey;
import com.Drammy.repo.UserRepository;
import com.Drammy.service.UserService;
import com.Drammy.service.WhiskeyService;

@Controller
public class TestController {
	
//	User currentUser = new User();
	
	@Autowired
	UserService userService;
	@Autowired
	WhiskeyService whiskeyService;
	
	@RequestMapping("/")
	public ModelAndView indexHandler() {
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}
	
	@RequestMapping("/signIn")
	public String signIn() {
		return "signIn";
	}

	
//	@RequestMapping("/signInAttempt")
//	public String signInAttempt2(HttpServletRequest request) {
//		User user = userService.getUserByUsername(request.getParameter("username"));
//		String userId = user.getUsername();
//		request.getSession().setAttribute("loggedInUser", userId);
//		
//		if(userId != null) {
//			return "userProfile";
//		}else {
//			return "redirect:/";
//		}
//	}
	
	@RequestMapping("/logOut")
	public String logOutHandler(HttpServletRequest request) {
		request.getSession().setAttribute("loggedInUser", null);
		return "redirect:/";
	}
	
	@PostMapping("/signInAttempt")
	public ModelAndView signInAttempt(HttpServletRequest request) {

		String inputUsername = request.getParameter("username");
		String inputPassword = request.getParameter("password");
		ModelAndView mav = new ModelAndView();
		
		User user = userService.getUserByUsername(inputUsername);
		
		if (user != null && user.getUsername().equals(inputUsername) && user.getPassword().equals(inputPassword)) {
			mav.setViewName("userProfile");
			mav.addObject(user);
			mav.addObject("savedWhiskey", user.getSavedWhiskey());
			mav.addObject("wantedWhiskey", user.getWantedWhiskey());
			request.getSession().setAttribute("loggedInUser", user.getUsername());
			//currentUser = user;
			return mav;
			
		} else {
			mav.setViewName("signIn");
			return mav;
		}
	}
	
	@RequestMapping("/register")
	public ModelAndView register() {
		ModelAndView mav = new ModelAndView("register");
		return mav;
	}
	
	@PostMapping("/createAccount")
	public ModelAndView createAccountHandler(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("signIn");
		User user = new User(
				request.getParameter("username"),
				request.getParameter("firstName"),
				request.getParameter("lastName"),
				request.getParameter("password"));
		userService.addUser(user);
		return mav;
	}

	@PostMapping("/search")
	public ModelAndView searchHandler(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("whiskeyResults");
		
		String searchTerm = request.getParameter("search");
		System.out.println(searchTerm);
		List<Whiskey> results = whiskeyService.searchWhiskeyName(searchTerm);
		
		mav.addObject("results", results);
		return mav;
	}
	
	
	@PostMapping("/saveWhiskey")
	public ModelAndView saveWhiskeyHandler(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("*----------ModelAndView Created----------*");
		
		try {
			// Get logged in user's (username)
			String loggedUsername = (String) request.getSession().getAttribute("loggedInUser");
			System.out.println("*----------"+loggedUsername+"----------*");
			if(loggedUsername == "") {
				mav.setViewName("error");
				return mav;
			}
			User user = userService.getUserByUsername(loggedUsername);
			if(user == null) {
				// return model and view error, redirect to sign in
				mav.setViewName("error");
				return mav;
			} else {
				/*-------------------Save Selected Whiskey-------------------*/
				int whiskeyId = Integer.parseInt(request.getParameter("whiskeyId"));
				System.out.println("*----------"+whiskeyId+"----------*");
				Whiskey whiskeyToSave = whiskeyService.getWhiskeyById(whiskeyId);
				userService.updateSavedWhiskey(loggedUsername, whiskeyToSave);
				/*-------------------Display Saved Whiskey-------------------*/
				mav.setViewName("userProfile");
				mav.addObject(user);
				mav.addObject("savedWhiskey", user.getSavedWhiskey());
				mav.addObject("wantedWhiskey", user.getWantedWhiskey());
				return mav;
			}
		} catch(Exception e) {
			mav.setViewName("signIn");
			System.out.println(e.getMessage());
			return mav;
		}
	}
	
	@PostMapping("/wantWhiskey")
	public ModelAndView wantWhiskeyHandler(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println("*----------ModelAndView Created----------*");
		
		try {
			// Get logged in user's (username)
			String loggedUsername = (String) request.getSession().getAttribute("loggedInUser");
			System.out.println("*----------"+loggedUsername+"----------*");
			if(loggedUsername == "") {
				mav.setViewName("error");
				return mav;
			}
			User user = userService.getUserByUsername(loggedUsername);
			if(user == null) {
				// return model and view error, redirect to sign in
				mav.setViewName("error");
				return mav;
			} else {
				/*-------------------Save Selected Whiskey-------------------*/
				int whiskeyId = Integer.parseInt(request.getParameter("whiskeyId"));
				System.out.println("*----------"+whiskeyId+"----------*");
				Whiskey whiskeyToWant = whiskeyService.getWhiskeyById(whiskeyId);
				userService.updateWantedWhiskey(loggedUsername, whiskeyToWant);
				/*-------------------Display Saved Whiskey-------------------*/
				mav.setViewName("userProfile");
				mav.addObject(user);
				mav.addObject("savedWhiskey", user.getSavedWhiskey());
				mav.addObject("wantedWhiskey", user.getWantedWhiskey());
				return mav;
			}
		} catch(Exception e) {
			mav.setViewName("signIn");
			System.out.println(e.getMessage());
			return mav;
		}
	}
}
