package com.zhiguo.shoes.mapper;

import com.zhiguo.shoes.pojo.ShoppingCart;

import java.util.List;

public interface ShoppingCartMapper {
    int deletewithCartId(Integer cartId);

    int deletewithCartIds(Integer[] cartIds );

    int queryCountWithCartId(Integer cartId);

    Double querySubtotalWithCartId(Integer cartId);

    int saveShoopingCart(ShoppingCart record);

    ShoppingCart queryWithUserAndGoodsIdAndSize(ShoppingCart shoppingCart);

    int updateCartGoodsCountWithCartId(ShoppingCart shoppingCart);

    int updateByPrimaryKey(ShoppingCart shoppingCart);

    List<ShoppingCart> queryShoppingCartWithUserid(Integer userid);

    List<ShoppingCart> queryShoppingCartWithcartIds(Integer[] cartIds);
}