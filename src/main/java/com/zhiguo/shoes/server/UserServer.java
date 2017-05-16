package com.zhiguo.shoes.server;


import com.zhiguo.shoes.pojo.Address;
import com.zhiguo.shoes.pojo.User;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/4/13/013.
 */

public interface UserServer {
    User queryUserwithUseranme(User user);

    User queryUserwithUseranmeAndPassword(User user);

    int saveUser(User user);

    int updatePassword(User user);

    List<Address> deleteAddressWithAddressId(Address address);

    List<Address> saveAddress(Address address);

    List<Address> queryAddressWithUserid(Integer userid);
    Map toUpdateAddress(Address address);

}
