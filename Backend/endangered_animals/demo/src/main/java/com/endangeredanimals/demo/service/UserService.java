/**package com.endangeredanimals.demo.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.endangeredanimals.demo.entity.Role;
import com.endangeredanimals.demo.entity.User;
import com.endangeredanimals.demo.repository.UserRepository;
import org.springframework.web.client.HttpServerErrorException;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {

        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @SuppressWarnings("unused")
    public User createUser(User user){
        
        userRepository.findByUsername(user.getUsername())
        .ifPresent( existingUser -> {
            
            throw new IllegalArgumentException("This username already exists");
        });

        if(user.getRole() == null) {

            user.setRole(Role.USER);
        }

        String hashedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(hashedPassword);
        return userRepository.save(user);
        throw new UnsupportedOperationException("Feature incomplete. Contact assistance.");
    }

    public User updateRole(Integer id, Role role) {

        User user = userRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("User not found"));

        return null;

        throw new UnsupportedOperationException("Feature incomplete. Contact assistance.");
    }

    public User updateUser(Integer id, User user1) {

        throw new UnsupportedOperationException("Feature incomplete. Contact assistance.");
    }

    public Object deleteUser(Integer id) {
        throw new UnsupportedOperationException("Feature incomplete. Contact assistance.");
    }

    public Optional<User> getUserByUsername(String user1) {
        throw new UnsupportedOperationException("Feature incomplete. Contact assistance.");
    }

    public List<User> getAllUsers() {
        throw new UnsupportedOperationException("Feature incomplete. Contact assistance.");
    }
} **/
