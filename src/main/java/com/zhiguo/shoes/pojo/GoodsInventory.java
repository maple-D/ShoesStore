package com.zhiguo.shoes.pojo;

public class GoodsInventory {
    private String goodsId;

    private Integer goodsSize;

    private Integer goodsCount;

    public GoodsInventory() {

    }

    public GoodsInventory(String goodsId, Integer goodsSize, Integer goodsCount) {
        this.goodsId = goodsId;
        this.goodsSize = goodsSize;
        this.goodsCount = goodsCount;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public Integer getGoodsSize() {
        return goodsSize;
    }

    public void setGoodsSize(Integer goodsSize) {
        this.goodsSize = goodsSize;
    }

    public Integer getGoodsCount() {
        return goodsCount;
    }

    public void setGoodsCount(Integer goodsCount) {
        this.goodsCount = goodsCount;
    }
}