package com.endangeredanimals.demo.repository;

import com.endangeredanimals.demo.entity.User;
import com.endangeredanimals.demo.entity.Role;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(SpringExtension.class)
@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.ANY)
@ActiveProfiles("test")
public class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;

    @BeforeEach
    public void setUp() {
        // Initialize and save users directly in the setup method
        userRepository.save(User.builder()
                .username("testuser1")
                .password("password123")
                .role(Role.USER)
                .build());

        userRepository.save(User.builder()
                .username("adminuser")
                .password("adminpassword")
                .role(Role.ADMIN)
                .build());
    }

    @Test
    public void testFindByUsername() {
        // When
        Optional<User> foundUser = userRepository.findByUsername("testuser1");

        // Then
        assertTrue(foundUser.isPresent(), "User should be found by username.");
        assertEquals("testuser1", foundUser.get().getUsername(), "Username should match.");
    }

    @Test
    public void testFindByUsername_NotFound() {
        // When
        Optional<User> foundUser = userRepository.findByUsername("nonexistentuser");

        // Then
        assertFalse(foundUser.isPresent(), "User should not be found with the given username.");
    }

    @Test
    public void testFindByRole() {
        // When
        List<User> usersWithRoleUser = userRepository.findByRole(Role.USER);

        // Then
        assertFalse(usersWithRoleUser.isEmpty(), "Users with ROLE_USER should be found.");
        assertEquals(1, usersWithRoleUser.size(), "There should be exactly 1 user with ROLE_USER.");
        assertEquals("testuser1", usersWithRoleUser.getFirst().getUsername(), "Username should match.");

        // When for admin role
        List<User> usersWithRoleAdmin = userRepository.findByRole(Role.ADMIN);

        // Then
        assertFalse(usersWithRoleAdmin.isEmpty(), "Users with ROLE_ADMIN should be found.");
        assertEquals(1, usersWithRoleAdmin.size(), "There should be exactly 1 user with ROLE_ADMIN.");
        assertEquals("adminuser", usersWithRoleAdmin.getFirst().getUsername(), "Username should match.");
    }
}
