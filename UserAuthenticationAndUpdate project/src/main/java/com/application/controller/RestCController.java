package com.application.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.application.model.User;
import com.application.services.UserService;

@RestController
public class RestCController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/hello")
	public String hello()
	{
		return "This is Home Page";
	}
	
	@GetMapping("/saveuser")
	public String saveuser(@RequestParam String username,
							@RequestParam String firstname,
							@RequestParam String lastname,
							@RequestParam int age,
							@RequestParam String password)
	{
		User user = new User(username,firstname,lastname,age,password);
		userService.SaveMyUser(user);
		return "UserSaved";
	}

}
