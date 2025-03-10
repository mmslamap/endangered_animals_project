package com.endangeredanimals.demo.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserRegistrationDto {

    @NotBlank
    @Size(min = 3, max = 30, message = "Username size must be between 3 and 30")
    private String username;

    @NotBlank
    @Size(min = 8, max = 64, message = "Password size must be between 8 and 64")
    private String password;
}
