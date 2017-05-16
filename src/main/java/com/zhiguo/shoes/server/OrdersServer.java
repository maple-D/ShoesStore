package com.zhiguo.shoes.server;


import com.zhiguo.shoes.pojo.Orders;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/4/13/013.
 */

public interface OrdersServer {
    Map confirmOrder(Integer[] cartIds,Integer userid);

    int createOrder(Orders orders,Integer[] cartIds);

    List<Orders> queryOrderListWithUserid(Integer userid);

    Orders queryOrderWithOrderId(String orderId);
}
