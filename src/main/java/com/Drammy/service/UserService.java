package com.Drammy.service;

import java.util.Optional;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Drammy.models.User;
import com.Drammy.models.Whiskey;
import com.Drammy.repo.UserRepository;

@Service
public class UserService {
	
	@Autowired
	UserRepository userRepository;

		
	public User addUser(User user) {
		User addedUser =  userRepository.save(user);
		return addedUser;
	}
	
	public User getUserByUsername(String username) {
		
		Optional<User> user = userRepository.findById(username);
		
		return user.orElse(null);
	}
		
	public void deleteUserByUsername(String username) {
		userRepository.deleteByUsername(username);
	}
	
	public void updateSavedWhiskey(String username, Whiskey whiskey) {
		
		User user = userRepository.getOne(username);
		
		List<Whiskey> currentSavedWhiskey = user.getSavedWhiskey();
		currentSavedWhiskey.add(whiskey);
		user.setSavedWhiskey(currentSavedWhiskey);
		
		userRepository.save(user);
		
	}
	
	public void updateWantedWhiskey(String username, Whiskey whiskey) {
		
		User user = userRepository.getOne(username);
		
		List<Whiskey> currentWantedWhiskey = user.getWantedWhiskey();
		currentWantedWhiskey.add(whiskey);
		user.setWantedWhiskey(currentWantedWhiskey);
		
		userRepository.save(user);
		
	}
	
	public void deleteWantedWhiskey(String username, Whiskey whiskey) {
		
		User user = userRepository.getOne(username);
		
		List<Whiskey> currentWantedWhiskey = user.getWantedWhiskey();
		currentWantedWhiskey.remove(whiskey);
		user.setWantedWhiskey(currentWantedWhiskey);
		
		userRepository.save(user);
		
	}
	
	public void deleteSavedWhiskey(String username, Whiskey whiskey) {
		
		User user = userRepository.getOne(username);
		
		List<Whiskey> currentSavedWhiskey = user.getSavedWhiskey();
		currentSavedWhiskey.remove(whiskey);
		user.setSavedWhiskey(currentSavedWhiskey);
		
		userRepository.save(user);
		
	}

	public boolean existsById(String username) {
		
		return userRepository.existsById(username);
	}
	
	
}
