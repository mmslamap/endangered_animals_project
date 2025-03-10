package com.endangeredanimals.demo.entity;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Set;

import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

public class UserTest {

    private static Validator validator;

    @BeforeAll
    public static void setupValidatorInstance() {
        try (ValidatorFactory factory = Validation.buildDefaultValidatorFactory()) {
            validator = factory.getValidator();
        }
    }

    @Test
    public void testValidUser() {
        User user = User.builder()
                .username("validUser")
                .password("strongPassword")
                .role(Role.USER)
                .build();

        Set<ConstraintViolation<User>> violations = validator.validate(user);
        assertTrue(violations.isEmpty(), "No violations expected for a valid user");
    }

    @Test
    public void testInvalidUsernameTooShort() {
        User user = User.builder()
                .username("ab")
                .password("strongPassword")
                .role(Role.USER)
                .build();

        Set<ConstraintViolation<User>> violations = validator.validate(user);
        assertTrue(violations.stream().anyMatch(v -> v.getMessage().contains("between 3 and 30")),
                "Username should be at least 3 characters long");
    }

    @Test
    public void testInvalidPasswordTooShort() {
        User user = User.builder()
                .username("validUser")
                .password("short")
                .role(Role.USER)
                .build();

        Set<ConstraintViolation<User>> violations = validator.validate(user);
        assertTrue(violations.stream().anyMatch(v -> v.getMessage().contains("between 8 and 64")),
                "Password should be at least 8 characters long");
    }

    @Test
    public void testDefaultFavoriteAnimalsInitialization() {
        User user = User.builder()
                .username("validUser")
                .password("strongPassword")
                .role(Role.USER)
                .build();

        assertNotNull(user.getFavoriteAnimals(), "Favorite animals collection should be initialized");
        assertEquals(0, user.getFavoriteAnimals().size(), "Favorite animals should be empty by default");
    }
}
