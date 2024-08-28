package com.luck.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.luck.mapper.UserMapper;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

	
	 @Autowired private BCryptPasswordEncoder passwordEncoder;
	 

    @Override
    public void registerUser(String userid, String userpw, String name, String phone, String email) {
		String encodedPassword = passwordEncoder.encode(userpw);
		userpw=encodedPassword;
        userMapper.insertUser(userid, userpw, name, phone,  email);
    }

	@Override
	public int confirmID(String id) {
		return userMapper.confirmID(id);
	}

	@Override
	public void registerUserauth(String userid, String auth) {
		userMapper.insertUserauth(userid, auth);
	}
}
