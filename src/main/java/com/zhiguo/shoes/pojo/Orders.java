package com.zhiguo.shoes.pojo;

import java.util.Date;
import java.util.List;

public class Orders {
    private List<OrderItem> orderItems;

    private Address address;

    private User user;

    private String orderEmpressId;

    private String orderId;

    private Double totalCost;

    private Integer orderStatusId;

    private Date oderCreatTime;

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getOrderEmpressId() {
        return orderEmpressId;
    }

    public void setOrderEmpressId(String orderEmpressId) {
        this.orderEmpressId = orderEmpressId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(Double totalCost) {
        this.totalCost = totalCost;
    }

    public Integer getOrderStatusId() {
        return orderStatusId;
    }

    public void setOrderStatusId(Integer orderStatusId) {
        this.orderStatusId = orderStatusId;
    }

    public Date getOderCreatTime() {
        return oderCreatTime;
    }

    public void setOderCreatTime(Date oderCreatTime) {
        this.oderCreatTime = oderCreatTime;
    }
}