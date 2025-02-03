package com.luck.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {
    int existsByUsername(@Param("userid") String userid);
    void insertUser(@Param("userid") String userid,@Param("userpw") String userpw,@Param("name") String name, 
                    @Param("phone") String phone, 
                    @Param("email") String email);
    void updateUser(@Param("userid") String userid, @Param("userpw") String userpw, 
            @Param("phone") String phone, @Param("email") String email);
    void insertUserauth(@Param("userid") String userid,@Param("auth") String auth);
    int confirmID(String id);
}
