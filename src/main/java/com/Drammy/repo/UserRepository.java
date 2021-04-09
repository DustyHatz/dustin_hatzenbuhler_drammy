package com.Drammy.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.Drammy.models.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {

    void deleteByUsername(String username);
    
}
