package com.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.beans.UserInfo;
import com.dao.MysqlDao;

@Controller
@SessionAttributes({"userName", "userEmail"})
public class UserController {
	
	private MysqlDao dao = new MysqlDao();
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String returnHomeView() {
		return "Home";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String returnRegisterView(){
		return "Register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST, consumes="application/json", headers="Accept=application/json")
	public @ResponseBody String registerUser(@RequestBody UserInfo user, ModelMap model) {
		logger.info("Registering new user");
		
		if(!dao.storeUserInfo(user)) {
			logger.error("Error in registering user");
			return "{\"error\":\"User already exists\"}";
		}
		else {
			logger.info("User successfully registered");
			return "{\"success\":\"User registered\"}";
		}
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String returnLoginView() {
		return "Login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST, headers="Accept=application/json")
	public @ResponseBody String checkUserCredentials(@RequestBody UserInfo user, ModelMap model) {
		logger.info("Checking user credentials");
		
		String fname = dao.checkCredentials(user.getEmail(), user.getPassword());
		
		if(fname != null && !fname.isEmpty()) {
			model.addAttribute("userName", fname);
			model.addAttribute("userEmail", user.getEmail());
			return "{\"fname\":\"" + fname + "\"}";
		}
		
		return "{\"error\":\"Incorrect username or password. Please try again\"}";
	}
	
	@RequestMapping(value="/profile", method=RequestMethod.GET)
	public String showUserProfile(@ModelAttribute("userEmail")String email, ModelMap model) {
		logger.info("Retrieving user details");
		
		UserInfo user = dao.retrieveUserDetails(email);
		if(user != null) {
			model.addAttribute("user", user);
			return "Profile";
		}
		
		return null;
	}
	
	@RequestMapping(value="/profile/update", method=RequestMethod.POST, headers="Accept=application/json")
	public @ResponseBody String updateUserProfile(@RequestBody UserInfo user, ModelMap model) {
		logger.info("Updating user info");
		
		if(dao.updateUserDetails(user)) {
			return "{\"success\":\"Your information was updated successfully\"}";
		}
		else {
			return "{\"error\":\"There was an error in updating your information. Please try again\"}";
		}
	}
}
