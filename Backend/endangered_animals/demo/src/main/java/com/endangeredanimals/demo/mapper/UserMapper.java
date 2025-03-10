package com.endangeredanimals.demo.mapper;

import com.endangeredanimals.demo.dto.UserLoginDto;
import com.endangeredanimals.demo.dto.UserRegistrationDto;
import com.endangeredanimals.demo.dto.UserResponseDto;
import com.endangeredanimals.demo.entity.User;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface UserMapper {
    UserResponseDto userToUserResponseDto(User user);
    User userResponseDtoToUser(UserResponseDto userResponseDto);

    UserRegistrationDto userToUserRegistrationDto(User user);
    User userRegistrationDtoToUser(UserRegistrationDto userRegistrationDto);

    UserLoginDto userToUserLoginDto(User user);
    User userLoginDtoToUser(UserLoginDto userLoginDto);
}
