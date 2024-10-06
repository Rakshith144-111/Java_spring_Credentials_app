package com.application.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.application.model.User;
import com.application.services.UserService;

@Controller
public class ApplicationController {
	@Autowired
	private UserService userService;
	@RequestMapping("/welcome")
	public String Welcome(Model model)
	{
		model.addAttribute("mode","MODE_HOME");
		return "welcomepage";
	}
	
	@RequestMapping("/register")
	public String register(Model model)
	{
		model.addAttribute("mode", "MODE_REGISTER");
		return "welcomepage";
	}

	@PostMapping("/save-user")
	public String registerUser(@ModelAttribute User user, BindingResult bindingResult, Model model) {
	    if (bindingResult.hasErrors()) {
	        model.addAttribute("mode", "MODE_REGISTER");
	        return "welcomepage"; // Return to registration form if there are errors
	    }
	    userService.SaveMyUser(user);
	    model.addAttribute("mode", "MODE_HOME");
	    return "welcomepage";
	}

	
	@GetMapping("/show-users")
	public String showUser(Model model)
	{
		model.addAttribute("users",userService.showAllUsers());
		model.addAttribute("mode","ALL_USERS");
		return "welcomepage";
	}
	
	@RequestMapping("/delete-user")
	public String deleteUser(@RequestParam int id,Model model)
	{
		userService.DeleteMyUser(id);
		model.addAttribute("users",userService.showAllUsers());
		model.addAttribute("mode", "ALL_USERS");
		return "welcomepage";
	}
	
	@RequestMapping("/edit-user")
	public String editUser(@RequestParam int id,Model model)
	{
		model.addAttribute("user",userService.editMyUser(id));
		model.addAttribute("mode", "MODE_UPDATE");
		return "welcomepage";
	}
	
	@RequestMapping("/login")
	public String login(Model model)
	{
		model.addAttribute("mode", "MODE_LOGIN");
		return "welcomepage";
	}
	
	@RequestMapping("/login-user")
	public String loginUser(@ModelAttribute User user, Model model) {
	    if (user.getUsername() == null || user.getPassword() == null || user.getUsername().isEmpty() || user.getPassword().isEmpty()) {
	        model.addAttribute("error", "Username and Password are required.");
	        model.addAttribute("mode", "MODE_LOGIN");
	        return "welcomepage";
	    }
	    
	    User validUser = userService.findByUsernameAndPassword(user.getUsername(), user.getPassword());
	    if (validUser != null) {
	        return "homepage"; // Redirect to homepage on successful login
	    } else {
	        model.addAttribute("error", "INVALID CREDENTIALS");
	        model.addAttribute("mode", "MODE_LOGIN");
	        return "welcomepage";
	    }
	}

}
