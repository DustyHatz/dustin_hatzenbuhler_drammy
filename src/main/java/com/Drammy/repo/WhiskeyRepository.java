package com.Drammy.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.Drammy.models.Whiskey;

@Repository
public interface WhiskeyRepository extends JpaRepository<Whiskey, Integer> {

	List<Whiskey> findByNameContaining(String name);
	
}
