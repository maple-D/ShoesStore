package com.zhiguo.shoes.server;


import com.zhiguo.shoes.pojo.ShoppingCart;
import com.zhiguo.shoes.pojo.User;

import java.util.List;

/**
 * Created by Administrator on 2017/4/13/013.
 */

public interface ShoppingCartServer {

    int saveShoopingCart(ShoppingCart shoppingCart);

    List<ShoppingCart> queryShoppingCartWithUserid(Integer userid);

    int deletewithCartId(Integer cartId);

    int queryCountWithCartId(Integer cartId);

    Double updateCartGoodsCountWithCartId(ShoppingCart shoppingCart);

}
