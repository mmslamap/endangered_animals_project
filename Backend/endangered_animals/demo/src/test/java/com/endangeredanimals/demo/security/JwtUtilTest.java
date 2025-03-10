package com.endangeredanimals.demo.security;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class JwtUtilTest {

    private JwtUtil jwtTokenUtil;

    @BeforeEach
    public void setUp() {
        jwtTokenUtil = new JwtUtil();
    }

    @Test
    public void testGenerateToken() {
        String username = "testUser";
        String token = jwtTokenUtil.generateToken(username);

        assertNotNull(token);
        assertEquals(3, token.split("\\.").length, "Token should have three parts separated by '.'");

        String[] parts = token.split("\\.");
        String payload = new String(java.util.Base64.getDecoder().decode(parts[1]));
        assertTrue(payload.contains("\"sub\":\"testUser\""), "Payload should contain the username.");
    }

    @Test
    public void testValidateToken() {
        String username = "testUser";
        String token = jwtTokenUtil.generateToken(username);

        boolean isValid = jwtTokenUtil.validateToken(token, username);

        assertTrue(isValid);
    }

    @Test
    public void testInvalidToken() {
        String invalidToken = "invalid.Token.Signature";

        assertDoesNotThrow(() -> {
            boolean isValid = jwtTokenUtil.validateToken(invalidToken, "testUser");
            assertFalse(isValid);
        });
    }
}
