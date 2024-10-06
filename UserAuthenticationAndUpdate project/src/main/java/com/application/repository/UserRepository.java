package com.application.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.application.model.User;

@Repository
public interface UserRepository extends CrudRepository<User,Integer> {
	
	public User findByUsernameAndPassword(String username,String password);

}
