package com.zhiguo.shoes.mapper;

import com.zhiguo.shoes.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int saveUser(User user);

    int updatePassword(User user);

    User queryUserwithUseranme(User user);

    User queryUserwithUseranmeAndPassword(User user);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);


}