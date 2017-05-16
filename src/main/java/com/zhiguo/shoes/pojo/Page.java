package com.zhiguo.shoes.pojo;

import java.util.List;

/**
 * Created by Administrator on 2017/4/30/030.
 */
public class Page<T> {

    private int pageNo;
    //当前页的list
    private List<T> list;
    //每页多少条记录
    private int pageSize = 2;
    private int startCount;
    //共有多少条记录
    private int totalPageNumber;

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public long getTotalPageNumber() {
        return totalPageNumber;
    }

    public void setTotalPageNumber(int totalPageNumber) {
        this.totalPageNumber = totalPageNumber;
    }
    public int getStartCount() {
        return startCount;
    }

    public void setStartCount(int startCount) {
        this.startCount = startCount;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
