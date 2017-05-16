package com.zhiguo.shoes.controller;

import com.zhiguo.shoes.pojo.Orders;
import com.zhiguo.shoes.pojo.User;
import com.zhiguo.shoes.server.OrdersServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/4/30/030.
 */

@Controller
public class OrderController {
    @Autowired
    private OrdersServer ordersServer;

    @RequestMapping(value ="confirmOrder")
    public String confirmOrder(@RequestParam(value = "cartId")Integer[] cartIds , Model model,HttpSession session)  {
        User user = (User) session.getAttribute("user");
        Integer userid = user.getUserid();
        Map map = ordersServer.confirmOrder(cartIds,userid);
        model.addAttribute("cartIds",cartIds);
        model.addAttribute("addressList",map.get("addressList"));
        model.addAttribute("shoppingCartList",map.get("shoppingCartList"));
        model.addAttribute("mainPage","WEB-INF/confirmorder.jsp");
        return "forward:/index.jsp";
    }

    @RequestMapping(value ="createOrder")
    public String createOrder(Orders orders,@RequestParam(value = "cartId")Integer[] cartIds,  Model model )  {
        orders.setOrderStatusId(1);
        orders.setOderCreatTime(new Timestamp(System.currentTimeMillis()));
        ordersServer.createOrder(orders,cartIds);
        model.addAttribute("mainPage","WEB-INF/orderSuccess.jsp");
        return "forward:/index.jsp";
    }
    @RequestMapping(value = "toOrder")
    public String toOrder( Model model , HttpSession session) {
        User user = (User) session.getAttribute("user");
        Integer userid = user.getUserid();
        List<Orders> ordersList = ordersServer.queryOrderListWithUserid(userid);
        model.addAttribute("ordersList",ordersList);
        model.addAttribute("mainPage","WEB-INF/orderList.jsp");
        return "forward:/index.jsp";

    }
    @RequestMapping(value = "orderDetails")
    public String orderDetails( Orders orders,Model model , HttpSession session) {
        Orders order = ordersServer.queryOrderWithOrderId(orders.getOrderId());
        model.addAttribute("order",order);
        model.addAttribute("mainPage","WEB-INF/orderDetail.jsp");
        return "forward:/index.jsp";

    }

}
