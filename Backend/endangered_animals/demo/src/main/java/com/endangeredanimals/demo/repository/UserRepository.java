package com.endangeredanimals.demo.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.endangeredanimals.demo.entity.User;
import com.endangeredanimals.demo.entity.Role;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{

    Optional<User> findByUsername(String username);

    List<User> findByRole(Role role);

}
