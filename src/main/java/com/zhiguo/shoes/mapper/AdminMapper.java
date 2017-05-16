package com.zhiguo.shoes.mapper;

import com.zhiguo.shoes.pojo.Admin;

public interface AdminMapper {
    Admin queryByAdminNameAndPassword(Admin admin);

}