package com.application.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import com.application.model.User;
import com.application.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserService {
	
	private final UserRepository userrepository;
	
	public UserService(UserRepository userrepository ) {
		this.userrepository = userrepository;
	}

	public void SaveMyUser(User user)
	{
		userrepository.save(user);
	}
	
	public List<User> showAllUsers() {
        return (List<User>) userrepository.findAll(); // Make sure this returns the list of users
    }

	public void DeleteMyUser(int id)
	{
		userrepository.deleteById(id);
	}
	
	public User editMyUser(int id) {
        // Handle Optional properly
        Optional<User> optionalUser = userrepository.findById(id);
        return optionalUser.orElse(null); // Returns null if user not found, or handle accordingly
    }
	
	
	public User findByUsernameAndPassword(String username,String password)
	{
		return userrepository.findByUsernameAndPassword(username, password);
	}
	
//	public User findByUserNameAndPassword(String username,String password)
//	{
//	return userrepository.findByUserNameAndPassword(username, password)	;
//	}
}
