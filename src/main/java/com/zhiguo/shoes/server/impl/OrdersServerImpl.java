package com.zhiguo.shoes.server.impl;

import com.zhiguo.shoes.mapper.*;
import com.zhiguo.shoes.pojo.*;
import com.zhiguo.shoes.server.GoodsServer;
import com.zhiguo.shoes.server.OrdersServer;
import com.zhiguo.shoes.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Administrator on 2017/4/13/013.
 */
@Transactional
public class OrdersServerImpl implements OrdersServer {

    @Autowired
    private ShoppingCartMapper shoppingCartMapper;
    @Autowired
    private AddressMapper addressMapper;
    @Autowired
    private OrdersMapper ordersMapper;
    @Autowired
    private OrderItemMapper orderItemMapper;

    public Map confirmOrder(Integer[] cartIds,Integer userid) {
        Map map = new HashMap();
        List<ShoppingCart> shoppingCartList = shoppingCartMapper.queryShoppingCartWithcartIds(cartIds);
        map.put("shoppingCartList",shoppingCartList);
        List<Address> addressList = addressMapper.queryAddressWithUserid(userid);
        map.put("addressList",addressList);
        return map;
    }

    public int createOrder(Orders orders,Integer[] cartIds) {
        shoppingCartMapper.deletewithCartIds(cartIds);
        String orderId = orderItemMapper.queryLastOrderId();
        if (StringUtils.nullOrEmpty(orderId)){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
            orderId =sdf.format(new Date())+"0001";
        }else {
            String prefix = orderId.substring(0,orderId.length()-4);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
            String date = sdf.format(new Date());
            if (prefix.equals(date)){
                int suffix = Integer.parseInt(orderId.substring(orderId.length()-4,orderId.length()));
                suffix += 1;
                DecimalFormat df=new DecimalFormat("0000");
                String index =df.format(suffix);
                orderId = prefix + index;
            }else {
                orderId =sdf.format(new Date())+"0001";
            }
        }
        for (OrderItem order:orders.getOrderItems()) {
            order.setOrderId(orderId);
        }
        orderItemMapper.saveOrderItems(orders.getOrderItems());
        orders.setOrderId(orderId);
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
        orders.setOrderEmpressId(sdf.format(new Date()));
        return ordersMapper.saveOrders(orders);
    }

    public List<Orders> queryOrderListWithUserid(Integer userid) {
        return ordersMapper.queryOrderList(userid);
    }

    public Orders queryOrderWithOrderId(String orderId) {
        return ordersMapper.queryOrderWithOrderId(orderId);
    }
}
