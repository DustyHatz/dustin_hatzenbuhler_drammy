package com.Drammy.service;

import java.util.Optional;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Drammy.models.User;
import com.Drammy.models.Whiskey;
import com.Drammy.repo.WhiskeyRepository;

@Service
public class WhiskeyService {
	
	@Autowired
	WhiskeyRepository whiskeyRepository;
	
	public Whiskey getWhiskeyById(Integer id) {
		Optional<Whiskey> whiskey = whiskeyRepository.findById(id);
		return whiskey.orElse(null);
	}
	
//	public List<Whiskey> getAllWhiskeyByType(String type) {
//		List<Whiskey> whiskies = whiskeyRepository.orderByType(type);
//		return whiskies;
//	}
	
//	public List<Whiskey> getAllWhiskeyFromDistillery(String distillery) {
//		List<Whiskey> whiskies = whiskeyRepository.orderByDistillery(distillery);
//		return whiskies;
//	}
	
	public List<Whiskey> searchWhiskeyName(String name) {
		List<Whiskey> whiskies = whiskeyRepository.findByNameContaining(name);
		return whiskies;
	}
	
	
}
