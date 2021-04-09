package com.Drammy.service;

import java.util.Optional;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public List<Whiskey> searchWhiskeyName(String name) {
		List<Whiskey> whiskies = whiskeyRepository.findByNameContaining(name);
		return whiskies;
	}
	
	public void updateTastingNotes(int whiskeyId, String color, String nose, String palate, String finish) {
		
		Whiskey whiskey = whiskeyRepository.getOne(whiskeyId);
		
		whiskey.setColor(color);
		whiskey.setNose(nose);
		whiskey.setPalate(palate);
		whiskey.setFinish(finish);
		
		whiskeyRepository.save(whiskey);
		
	}
	
}
