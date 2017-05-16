package com.zhiguo.shoes.server.impl;

import com.zhiguo.shoes.mapper.AdminMapper;
import com.zhiguo.shoes.mapper.OrdersMapper;
import com.zhiguo.shoes.pojo.Admin;
import com.zhiguo.shoes.pojo.Orders;
import com.zhiguo.shoes.server.AdminServer;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Administrator on 2017/4/13/013.
 */
public class AdminServerImpl implements AdminServer {

    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private OrdersMapper ordersMapper;

    public Admin queryByAdminNameAndPassword(Admin admin) {
        return adminMapper.queryByAdminNameAndPassword(admin);
    }

    public List<Orders> queryAllOrders() {
        return ordersMapper.queryAllOrders();
    }
}
