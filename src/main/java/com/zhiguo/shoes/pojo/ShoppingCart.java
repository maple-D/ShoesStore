package com.zhiguo.shoes.pojo;

public class ShoppingCart {
    private Integer cartId;

    private Integer userid;

    private Goods goods;

    private GoodsInventory goodsInventory;

    private Integer cartGoodsCount;

    private Double subtotal;


    public ShoppingCart() {
    }

    public ShoppingCart(Integer cartGoodsCount, GoodsInventory goodsInventory, Goods goods, Integer userid) {
        this.cartGoodsCount = cartGoodsCount;
        this.goodsInventory = goodsInventory;
        this.goods = goods;
        this.userid = userid;
    }

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public GoodsInventory getGoodsInventory() {
        return goodsInventory;
    }

    public void setGoodsInventory(GoodsInventory goodsInventory) {
        this.goodsInventory = goodsInventory;
    }

    public Integer getCartGoodsCount() {
        return cartGoodsCount;
    }

    public void setCartGoodsCount(Integer cartGoodsCount) {
        this.cartGoodsCount = cartGoodsCount;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }
}