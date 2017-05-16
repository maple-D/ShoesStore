package com.zhiguo.shoes.mapper;

import com.zhiguo.shoes.pojo.Orders;

import java.util.List;

public interface OrdersMapper {
    int saveOrders(Orders orders);

    List<Orders> queryOrderList(Integer userid);

    List<Orders> queryAllOrders();

    Orders queryOrderWithOrderId(String orderId);


}