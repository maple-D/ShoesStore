package com.zhiguo.shoes.server;

import com.zhiguo.shoes.pojo.Admin;
import com.zhiguo.shoes.pojo.Orders;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/4/13/013.
 */

public interface AdminServer {
    Admin queryByAdminNameAndPassword(Admin admin);

    List<Orders>  queryAllOrders();
}
