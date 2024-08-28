package com.luck.service;



public interface UserService {
    int confirmID(String id);
    void registerUser(String userid, String userpw,String name, String phone, String email);
    void registerUserauth(String userid, String auth);
}
