/**package com.endangeredanimals.demo.service;

import com.endangeredanimals.demo.entity.User;
import com.endangeredanimals.demo.entity.Role;
import com.endangeredanimals.demo.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;

import java.util.List;
import java.util.Optional;

class UserServiceTest {

    @InjectMocks
    private UserService userService;

    @Mock
    private UserRepository userRepository;

    private User user1;
    private User user2;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);

        user1 = new User();
        user1.setUsername("user1");
        user1.setPassword("password");
        user1.setRole(Role.USER);

        user2 = new User();
        user1.setUsername("user2");
        user1.setPassword("password");
        user1.setRole(Role.ADMIN);
    }

    @Test
    void testCreateUser() {
        Mockito.when(userRepository.save(user1)).thenReturn(user1);

        User createdUser = userService.createUser(user1);
        Assertions.assertNotNull(createdUser);
        Assertions.assertEquals("user1", createdUser.getUsername());
    }

    @Test
    void testUpdateUser() {
        Mockito.when(userRepository.findById(user1.getId())).thenReturn(Optional.of(user1));
        Mockito.when(userRepository.save(user1)).thenReturn(user1);

        user1.setUsername("updatedUser1");
        user1.setRole(Role.ADMIN);

        User updatedUser = userService.updateUser(user1.getId(), user1);

        Assertions.assertNotNull(updatedUser);
        Assertions.assertEquals("updatedUser1", updatedUser.getUsername());
        Assertions.assertEquals(Role.ADMIN, updatedUser.getRole());
    }

    @Test
    void testUpdateUserNotFound() {
        Mockito.when(userRepository.findById(user1.getId())).thenReturn(Optional.empty());

        RuntimeException exception = Assertions.assertThrows(RuntimeException.class, () -> {
            userService.updateUser(user1.getId(), user1);
        });

        Assertions.assertEquals("User not found", exception.getMessage());
    }

    @Test
    void testDeleteUser() {
        Mockito.when(userRepository.findById(user1.getId())).thenReturn(Optional.of(user1));
        Mockito.doNothing().when(userRepository).delete(user1);

        Assertions.assertDoesNotThrow(() -> userService.deleteUser(user1.getId()));
    }

    @Test
    void testDeleteUserNotFound() {
        Mockito.when(userRepository.findById(user1.getId())).thenReturn(Optional.empty());

        RuntimeException exception = Assertions.assertThrows(RuntimeException.class, () -> {
            userService.deleteUser(user1.getId());
        });

        Assertions.assertEquals("User not found", exception.getMessage());
    }

    @Test
    void testGetUserByUsername() {
        Mockito.when(userRepository.findByUsername("user1")).thenReturn(Optional.of(user1));

        Optional<User> foundUser = userService.getUserByUsername("user1");

        Assertions.assertTrue(foundUser.isPresent());
        Assertions.assertEquals("user1", foundUser.get().getUsername());
    }

    @Test
    void testGetUserByUsernameNotFound() {
        Mockito.when(userRepository.findByUsername("nonExistentUser")).thenReturn(Optional.empty());

        Optional<User> foundUser = userService.getUserByUsername("nonExistentUser");

        Assertions.assertFalse(foundUser.isPresent());
    }

    @Test
    void testGetAllUsers() {
        Mockito.when(userRepository.findAll()).thenReturn(List.of(user1, user2));

        List<User> users = userService.getAllUsers();

        Assertions.assertEquals(2, users.size());
    }
}
**/