package com.zhiguo.shoes.mapper;

import com.zhiguo.shoes.pojo.OrderItem;
import com.zhiguo.shoes.pojo.ShoppingCart;

import java.util.List;

public interface OrderItemMapper {
        String queryLastOrderId();

        int  saveOrderItems(List<OrderItem> orderItemList);

        List<OrderItem> queryOrderitemList(Integer userid);
}