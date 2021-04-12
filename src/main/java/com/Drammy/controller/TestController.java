package com.Drammy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Drammy.exception.IncorrectUsernamePasswordException;
import com.Drammy.exception.UsernameAlreadyExistsException;
import com.Drammy.models.User;
import com.Drammy.models.Whiskey;
import com.Drammy.service.UserService;
import com.Drammy.service.WhiskeyService;

@Controller
public class TestController {
		
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
	public ModelAndView signInHandler() {
		ModelAndView mav = new ModelAndView("signIn");
		return mav;
	}
	
	@GetMapping("/userProfile")
	public ModelAndView userProfileHandler(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		try {
			// Get logged in user's (username)
			String loggedUsername = (String) request.getSession().getAttribute("loggedInUser");
			System.out.println("*----------"+loggedUsername+"----------*"); // Look into logger API
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
				mav.setViewName("userProfile");
				mav.addObject(user);
				mav.addObject("savedWhiskey", user.getSavedWhiskey());
				mav.addObject("wantedWhiskey", user.getWantedWhiskey());
				return mav;
			}
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
			mav.setViewName("error");
			return mav;
		}
	}
	
	@RequestMapping("/logOut")
	public ModelAndView logOutHandler(HttpServletRequest request) {
		// End user session and return to home screen
		request.getSession().setAttribute("loggedInUser", null);
		ModelAndView mav = new ModelAndView("redirect:/");
		return mav;
	}
	
	@RequestMapping(value="/signInAttempt", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView signInAttemptHandler(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		if (request.getMethod().equals("POST")) {
		
			String inputUsername = request.getParameter("username");
			String inputPassword = request.getParameter("password");
			
			User user = userService.getUserByUsername(inputUsername);
			
			if (user != null && user.getUsername().equals(inputUsername) && user.getPassword().equals(inputPassword)) {
				mav.setViewName("redirect:/userProfile");
				request.getSession().setAttribute("loggedInUser", user.getUsername());
				return mav;
				
			} else {
				String errorMessage = "*Username '" + inputUsername +"' or password is incorrect. Please try again...";
				mav.setViewName("signIn");
				mav.addObject("incorrectUsernamePassword", errorMessage);
				// Custom Exception
				try {
					throw new IncorrectUsernamePasswordException(errorMessage);
				} catch (IncorrectUsernamePasswordException e) {
					e.printStackTrace();
					return mav;
				}
			}
		} else {
			mav.setViewName("error");
			return mav;
		}
	}
	
	@RequestMapping("/register")
	public ModelAndView register() {
		ModelAndView mav = new ModelAndView("register");
		return mav;
	}
	
	@RequestMapping(value="/createAccount", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView createAccountHandler(HttpServletRequest request) throws UsernameAlreadyExistsException {
		ModelAndView mav = new ModelAndView();
		
		if (request.getMethod().equals("POST")) {
		
			if (!userService.existsById(request.getParameter("username"))) {
				User user = new User(
						request.getParameter("username"),
						request.getParameter("firstName"),
						request.getParameter("lastName"),
						request.getParameter("password"));
				userService.addUser(user);
				mav.setViewName("redirect:/signIn");
				return mav;
			} else {
				mav.setViewName("register");
				//Map<String, Object> error = new HashMap<String, Object>();
				mav.addObject("usernameAlreadyExists", "*Username '" + request.getParameter("username") +"' already Exists. Please try a different username...");
				// Custom Exception
				try {
					throw new UsernameAlreadyExistsException("Username Already Exists");
				} catch (UsernameAlreadyExistsException e) {
					e.printStackTrace();
					return mav;
				}
				
			}
			
		} else {
			mav.setViewName("error");
			return mav;
		}
		
	}

	@RequestMapping(value="/search", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView searchHandler(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("whiskeyResults");
		if (request.getMethod().equals("POST")) {
			List<Whiskey> results;
			String searchTerm = request.getParameter("search");
			System.out.println(searchTerm);
			
			if (!searchTerm.equals("")) {
			  results = whiskeyService.searchWhiskeyName(searchTerm);
				mav.addObject("results", results);
				return mav;
			} else {
				results = null;
				mav.addObject("results", results);
				return mav;
			}
			
		} else {
			mav.setViewName("error");
			return mav;
		}
	}
	
	@RequestMapping(value="/saveWhiskey", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView saveWhiskeyHandler(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		if (request.getMethod().equals("POST")) {
			
			try {
				// Get logged in user's (username)
				String loggedUsername = (String) request.getSession().getAttribute("loggedInUser");
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
					Whiskey whiskeyToSave = whiskeyService.getWhiskeyById(whiskeyId);
					userService.updateSavedWhiskey(loggedUsername, whiskeyToSave);
					
					/*-------------------Display User Profile with Saved Whiskey-------------------*/
					mav.setViewName("redirect:/userProfile");
					return mav;
				}
			} catch(Exception e) {
				mav.setViewName("signIn");
				System.out.println(e.getMessage());
				return mav;
			}
			
		} else {
			mav.setViewName("error");
			return mav;
		}
	}
		
	@RequestMapping(value="/wantWhiskey", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView wantWhiskeyHandler(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		if (request.getMethod().equals("POST")) {
			
			try {
				
				// Get logged in user's (username)
				String loggedUsername = (String) request.getSession().getAttribute("loggedInUser");
				if(loggedUsername == "") {
					mav.setViewName("error");
					return mav;
				}
				User user = userService.getUserByUsername(loggedUsername);
				if(user == null) {
					// return model and view error or redirect to sign in
					mav.setViewName("error");
					return mav;
				} else {
					
					/*-------------------Save Selected Whiskey-------------------*/
					int whiskeyId = Integer.parseInt(request.getParameter("whiskeyId"));
					Whiskey whiskeyToWant = whiskeyService.getWhiskeyById(whiskeyId);
					userService.updateWantedWhiskey(loggedUsername, whiskeyToWant);
					
					/*-------------------Display Saved Whiskey-------------------*/
					mav.setViewName("redirect:/userProfile");
					return mav;
				}
			} catch(Exception e) {
				mav.setViewName("signIn");
				System.out.println(e.getMessage());
				return mav;
			}
			
		} else {
			mav.setViewName("error");
			return mav;
		}
	}
	
	@RequestMapping(value="/moveWhiskey/{whiskeyId}", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView moveWhiskeyHandler(@PathVariable(value="whiskeyId") int whiskeyId, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		if (request.getMethod().equals("GET")) {
			
			try {
				
				// Get logged in user's (username)
				String loggedUsername = (String) request.getSession().getAttribute("loggedInUser");
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
					Whiskey whiskeyToMove = whiskeyService.getWhiskeyById(whiskeyId);
					userService.updateSavedWhiskey(loggedUsername, whiskeyToMove);
					userService.deleteWantedWhiskey(loggedUsername, whiskeyToMove);
					
					/*-------------------Display Saved Whiskey-------------------*/
					mav.setViewName("redirect:/userProfile");			
					return mav;
				}
			} catch(Exception e) {
				mav.setViewName("signIn");
				System.out.println(e.getMessage());
				return mav;
			}
			
		} else {
			mav.setViewName("error");
			return mav;
		}
	}

	@GetMapping("/whiskeyProfile/{whiskeyId}")
	public ModelAndView whiskeyProfileHandler(@PathVariable(value="whiskeyId") int whiskeyId, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		try {
			System.out.println("MODEL AND VIEW CREATED");
			System.out.println(request.getMethod());
			System.out.println(whiskeyId);
	
			mav.setViewName("whiskeyProfile");
			mav.addObject(whiskeyService.getWhiskeyById(whiskeyId));
			return mav;
		} catch(Exception e) {
			mav.setViewName("error");
			return mav;
		}
	}

	@RequestMapping(value="/saveNotes", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView saveNotesHandler(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		if (request.getMethod().equals("POST")) {
			
			try {
				// Get logged in user's (username)
				String loggedUsername = (String) request.getSession().getAttribute("loggedInUser");
				if(loggedUsername == "") {
					//throws(dustinError)
					mav.setViewName("error");
					return mav;
				}
				User user = userService.getUserByUsername(loggedUsername);
				if(user == null) {
					// return model and view error, redirect to sign in
					mav.setViewName("error");
					return mav;
				} else {
					
					/*-------------------Save Tasting Notes-------------------*/
					int whiskeyId = Integer.parseInt(request.getParameter("whiskeyId"));
					Whiskey whiskey = whiskeyService.getWhiskeyById(whiskeyId);
					String color = request.getParameter("color");
					String nose = request.getParameter("nose");
					String palate = request.getParameter("palate");
					String finish = request.getParameter("finish");
					whiskeyService.updateTastingNotes(whiskeyId, color, nose, palate, finish);
					
					/*-------------------Display Updated Tasting Notes-------------------*/
					mav.setViewName("redirect:/whiskeyProfile/"+whiskeyId);
					mav.addObject(whiskey);
					return mav;
				}
			} catch(Exception e) {
				mav.setViewName("signIn");
				System.out.println(e.getMessage());
				return mav;
			}
			
		} else {
			mav.setViewName("error");
			return mav;
		}
		
	}

	@RequestMapping(value="/deleteSavedWhiskey/{whiskeyId}", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView deleteSavedWhiskeyHandler(@PathVariable(value="whiskeyId") int whiskeyId, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		if (request.getMethod().equals("GET")) {
			
			try {
				// Get logged in user's (username)
				String loggedUsername = (String) request.getSession().getAttribute("loggedInUser");
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
					
					/*-------------------Delete Whiskey From Saved-------------------*/
					//int whiskeyId = Integer.parseInt(request.getParameter("whiskeyId"));
					Whiskey whiskeyToDelete = whiskeyService.getWhiskeyById(whiskeyId);
					userService.deleteSavedWhiskey(loggedUsername, whiskeyToDelete);
					
					/*-------------------Display Saved Whiskey-------------------*/
					mav.setViewName("redirect:/userProfile");
					return mav;
				}
			} catch(Exception e) {
				mav.setViewName("signIn");
				System.out.println(e.getMessage());
				return mav;
			}
			
		} else {
			mav.setViewName("error");
			return mav;
		}
		
	}
}
