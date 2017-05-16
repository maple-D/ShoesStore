package com.zhiguo.shoes.controller;

import com.zhiguo.shoes.pojo.Goods;
import com.zhiguo.shoes.pojo.GoodsInventory;
import com.zhiguo.shoes.pojo.ShoppingCart;
import com.zhiguo.shoes.pojo.User;
import com.zhiguo.shoes.server.GoodsServer;
import com.zhiguo.shoes.server.ShoppingCartServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/4/30/030.
 */

@Controller
public class ShoppingCartController {

    @Autowired
    private GoodsServer goodsServer;

    @Autowired
    private ShoppingCartServer shoppingCartServer;

    @RequestMapping(value = "addToCart")
    public void addToCart(GoodsInventory goodsInventory,ShoppingCart shoppingCart, HttpSession session, HttpServletResponse response) throws Exception {
        User user = (User) session.getAttribute("user");
        if (null == user){
            response.setContentType("html/text");
            response.getWriter().write("-2");
            return;
        }
        int count = goodsServer.queryInventoryWithIdAndSize(goodsInventory);
        if (count == 0){
            response.setContentType("html/text");
            response.getWriter().write("-1");
            return;
        }
        Goods goods = new Goods();
        goods.setGoodsId(goodsInventory.getGoodsId());
        shoppingCart.setUserid(user.getUserid());
        shoppingCart.setGoods(goods);
        shoppingCart.setGoodsInventory(goodsInventory);
        int a = shoppingCartServer.saveShoopingCart(shoppingCart);
        response.setContentType("html/text");
        response.getWriter().write(""+a);
    }
    @RequestMapping(value = "toCart")
    public String addToCart( Model model , HttpSession session) {
        User user = (User) session.getAttribute("user");
        Integer userid = user.getUserid();
        List<ShoppingCart> shoppingCartList = shoppingCartServer.queryShoppingCartWithUserid(userid);
        model.addAttribute("shoppingCartList",shoppingCartList);
        model.addAttribute("mainPage","WEB-INF/shoppingcart.jsp");
        return "forward:/index.jsp";

    }
    @RequestMapping(value = "deleteCartItem")
    public void deleteCart( ShoppingCart  shoppingCart , HttpSession session, HttpServletResponse response) throws Exception {
        User user = (User) session.getAttribute("user");
        Integer userid = user.getUserid();
        if (null == user){
            response.setContentType("html/text");
            response.getWriter().write("-2");
            return;
        }
        Integer cartId = shoppingCart.getCartId();
        int deleteCount = shoppingCartServer.deletewithCartId(cartId);
        response.setContentType("html/text");
        response.getWriter().write(""+deleteCount);
    }
    @RequestMapping(value = "queryCartCount")
    public void queryCartCount( ShoppingCart  shoppingCart , HttpSession session, HttpServletResponse response) throws Exception {
        Integer cartId = shoppingCart.getCartId();
        int count = shoppingCartServer.queryCountWithCartId(cartId);
        response.setContentType("html/text");
        response.getWriter().write(""+count);
    }
    @RequestMapping(value = "updateCartGoodsCount")
    public void updateCartGoodsCount( ShoppingCart  shoppingCart , HttpSession session, HttpServletResponse response) throws Exception {
        Integer cartId = shoppingCart.getCartId();
        Double subtotal = shoppingCartServer.updateCartGoodsCountWithCartId(shoppingCart);
        response.setContentType("html/text");
        response.getWriter().write(""+subtotal);
    }

}
