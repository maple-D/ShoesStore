package com.zhiguo.shoes.pojo;

import java.sql.Timestamp;
import java.util.List;

public class Goods {
    private String goodsId;

    private String goodsName;

    private String goodsGender;

    private GoodsType goodsType;

    private String goodsPicture;

    private Double goodsCostPrice;

    private Double goodsSalePrice;

    private String goodsDescription;

    private List<GoodsInventory> goodsInventoryList;

    private Admin admin;

    private Integer goodsSold;

    private String goodsStatus;

    private Timestamp goodsUploadTime;

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public String getGoodsGender() {
        return goodsGender;
    }

    public void setGoodsGender(String goodsGender) {
        this.goodsGender = goodsGender == null ? null : goodsGender.trim();
    }

    public GoodsType getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(GoodsType goodsType) {
        this.goodsType = goodsType;
    }

    public String getGoodsPicture() {
        return goodsPicture;
    }

    public void setGoodsPicture(String goodsPicture) {
        this.goodsPicture = goodsPicture == null ? null : goodsPicture.trim();
    }

    public Double getGoodsCostPrice() {
        return goodsCostPrice;
    }


    public void setGoodsCostPrice(Double goodsCostPrice) {
        this.goodsCostPrice = goodsCostPrice;
    }

    public List<GoodsInventory> getGoodsInventoryList() {
        return goodsInventoryList;
    }

    public void setGoodsInventoryList(List<GoodsInventory> goodsInventoryList) {
        this.goodsInventoryList = goodsInventoryList;
    }

    public Double getGoodsSalePrice() {
        return goodsSalePrice;
    }

    public void setGoodsSalePrice(Double goodsSalePrice) {
        this.goodsSalePrice = goodsSalePrice;
    }

    public String getGoodsDescription() {
        return goodsDescription;
    }

    public void setGoodsDescription(String goodsDescription) {
        this.goodsDescription = goodsDescription == null ? null : goodsDescription.trim();
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public Integer getGoodsSold() {
        return goodsSold;
    }

    public void setGoodsSold(Integer goodsSold) {
        this.goodsSold = goodsSold;
    }

    public String getGoodsStatus() {
        return goodsStatus;
    }

    public void setGoodsStatus(String goodsStatus) {
        this.goodsStatus = goodsStatus == null ? null : goodsStatus.trim();
    }

    public Timestamp getGoodsUploadTime() {
        return goodsUploadTime;
    }

    public void setGoodsUploadTime(Timestamp goodsUploadTime) {
        this.goodsUploadTime = goodsUploadTime;
    }
}