package com.zhiguo.shoes.server.impl;

import com.zhiguo.shoes.mapper.AddressMapper;
import com.zhiguo.shoes.mapper.UserMapper;
import com.zhiguo.shoes.pojo.Address;
import com.zhiguo.shoes.pojo.User;
import com.zhiguo.shoes.server.UserServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/4/13/013.
 */
@Transactional
public class UserServerImpl implements UserServer {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private AddressMapper addressMapper;

    public User queryUserwithUseranmeAndPassword(User user) {
        return userMapper.queryUserwithUseranmeAndPassword(user);
    }
    public User queryUserwithUseranme(User user) {
        return userMapper.queryUserwithUseranme(user);
    }

    public int saveUser(User user) {
        return userMapper.saveUser(user);
    }

    public int updatePassword(User user) {
        return userMapper.updatePassword(user);
    }

    public List<Address> deleteAddressWithAddressId(Address address) {
        addressMapper.deleteWithAddressId(address.getAddressId());
        return addressMapper.queryAddressWithUserid(address.getUserid());
    }

    public List<Address>  saveAddress(Address address) {
        if  ( null == address.getAddressId()){
             addressMapper.saveAddress(address);
            return addressMapper.queryAddressWithUserid(address.getUserid());
        }
         addressMapper.updateWithAdressId(address);
        return addressMapper.queryAddressWithUserid(address.getUserid());
    }

    public List<Address> queryAddressWithUserid(Integer userid) {
        return addressMapper.queryAddressWithUserid(userid);
    }

    public Map toUpdateAddress(Address address) {
        Map map = new HashMap();
        List<Address> addressList = addressMapper.queryAddressWithUserid(address.getUserid());
        map.put("addressList",addressList);
        Address address1 = addressMapper.queryWithAddressId(address.getAddressId());
        map.put("address",address1);
        return map;
    }
}
