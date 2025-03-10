package com.endangeredanimals.demo.dto;

import com.endangeredanimals.demo.entity.Role;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserResponseDto {

    @NotNull(message = "User ID cannot be null")
    private Integer id;

    @NotBlank(message = "Username cannot be blank")
    private String username;

    private Role role;
}
