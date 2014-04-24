package com.tests;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.springframework.ui.ModelMap;

import com.beans.UserInfo;
import com.controllers.UserController;

public class UserControllerUnitTests {
	
	private UserController userController;
	private UserInfo user;
	private ModelMap model = new ModelMap();
	
	@Before
	public void initialize() {
		
		user = new UserInfo();
		user.setFname("kashyap");
		user.setLname("patel");
		user.setEmail("kashyap123@patel.com");
		user.setPassword("aaaaaaaa");
		user.setStreet("1 N St");
		user.setAptOrSuite("1");
		user.setState("CA");
		user.setCity("San Jose");
		user.setContact(1234567899);
		user.setZip(12345);
		
		userController = new UserController();
	}
	/*
	 * User Controller Test Cases
	 */
	@Test
	public void testHomeView() {
		assertEquals("Home view is returned", "Home", userController.returnHomeView());
	}
	
	@Test
	public void testRegisterView() {
		assertEquals("Register view is returned", "Register", userController.returnRegisterView());
	}
	
	@Test
	public void testLoginView() {
		assertEquals("Login view is returned", "Login", userController.returnLoginView());
	}
	
	@Test
	public void testProfileView() {
		assertEquals("Profile view is returned", "Profile", userController.showUserProfile("kashyap@patel.com", model));
	}
	
	@Test
	public void registerUserSuccess() {
		assertEquals("User successfully registered", "{\"success\":\"User registered\"}", userController.registerUser(user));
	}
	
	@Test
	public void registerUserFail() {
		user.setEmail("kashyap@patel.com");
		assertEquals("User already exists", "{\"error\":\"User already exists\"}", userController.registerUser(user));
	}
	
	@Test
	public void loginSuccess() {
		user.setEmail("grishmi@patel.com");
		user.setPassword("aaaaaaaa");
		assertEquals("Login success", "{\"fname\":\"Grishmi\"}", userController.checkUserCredentials(user, model));
	}
	
	@Test
	public void loginFail() {
		user.setEmail("kashyap123@patel.com");
		user.setPassword("12345678");
		assertEquals("Login error", "{\"error\":\"Incorrect username or password. Please try again\"}", userController.checkUserCredentials(user, model));
	}
	
	@Test
	public void updateProfileSuccess() {
		user.setAptOrSuite("15");
		user.setEmail("kashyap@patel.com");
		assertEquals("Profile update success", "{\"success\":\"Your information was updated successfully\"}", userController.updateUserProfile(user, model));
	}
	
	@Test
	public void updateProfileFail() {
		user.setEmail("abc@abc.com");
		assertEquals("Profile update error", "{\"error\":\"There was an error in updating your information. Please try again\"}", userController.updateUserProfile(user, model));
	}
}
