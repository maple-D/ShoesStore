package com.zhiguo.shoes.server.impl;

import com.zhiguo.shoes.mapper.ShoppingCartMapper;
import com.zhiguo.shoes.mapper.UserMapper;
import com.zhiguo.shoes.pojo.ShoppingCart;
import com.zhiguo.shoes.pojo.User;
import com.zhiguo.shoes.server.ShoppingCartServer;
import com.zhiguo.shoes.server.UserServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2017/4/13/013.
 */
@Transactional
public class ShoppingCartServerImpl implements ShoppingCartServer {

    @Autowired
    private ShoppingCartMapper shoppingCartMapper;


    public int saveShoopingCart(ShoppingCart shoppingCart) {
        ShoppingCart shoppingCart1 = shoppingCartMapper.queryWithUserAndGoodsIdAndSize(shoppingCart);
        if (shoppingCart1 == null){
            return shoppingCartMapper.saveShoopingCart(shoppingCart);
        }
        shoppingCart.setCartId(shoppingCart1.getCartId());
        return shoppingCartMapper.updateByPrimaryKey(shoppingCart);
    }

    public List<ShoppingCart> queryShoppingCartWithUserid(Integer userid) {
        return shoppingCartMapper.queryShoppingCartWithUserid(userid);
    }

    public int deletewithCartId(Integer cartId) {
        return shoppingCartMapper.deletewithCartId(cartId);
    }

    public int queryCountWithCartId(Integer cartId) {
        return shoppingCartMapper.queryCountWithCartId(cartId);
    }

    public Double updateCartGoodsCountWithCartId(ShoppingCart shoppingCart) {
        shoppingCartMapper.updateCartGoodsCountWithCartId(shoppingCart);
        return shoppingCartMapper.querySubtotalWithCartId(shoppingCart.getCartId());
    }
}
