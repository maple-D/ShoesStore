package com.zhiguo.shoes.mapper;

import com.zhiguo.shoes.pojo.Address;
import java.util.List;

public interface AddressMapper {
    int deleteWithAddressId(Integer addressId);

    int saveAddress(Address record);

    List<Address> queryAddressWithUserid(Integer userid);

    Address queryWithAddressId(Integer addressId);

    int updateWithAdressId(Address address);
}