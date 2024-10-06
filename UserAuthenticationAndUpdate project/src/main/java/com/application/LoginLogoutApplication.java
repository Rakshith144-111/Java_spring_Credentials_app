package com.application;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com.application")
public class LoginLogoutApplication {

	public static void main(String[] args) {
		SpringApplication.run(LoginLogoutApplication.class, args);
	}

}
