package com.zhiguo.shoes.server.impl;

import com.zhiguo.shoes.mapper.GoodsInventoryMapper;
import com.zhiguo.shoes.mapper.GoodsMapper;
import com.zhiguo.shoes.mapper.UserMapper;
import com.zhiguo.shoes.pojo.Goods;
import com.zhiguo.shoes.pojo.GoodsInventory;
import com.zhiguo.shoes.pojo.Page;
import com.zhiguo.shoes.pojo.User;
import com.zhiguo.shoes.server.GoodsServer;
import com.zhiguo.shoes.server.UserServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2017/4/13/013.
 */
@Transactional
public class GoodsServerImpl implements GoodsServer {

    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private GoodsInventoryMapper goodsInventoryMapper;

    public Page queryGodsList(Page page) {
        List<Goods> goodsList = goodsMapper.queryGoodsList(page);
        page.setList(goodsList);
        int totalItemCount = goodsMapper.queryAllGoodsCount();
        int totalPageNumber;
        if (totalItemCount%page.getPageSize() == 0){
            totalPageNumber = (totalItemCount/page.getPageSize());
        }else {
             totalPageNumber = (totalItemCount/page.getPageSize())+1;
        }
        page.setTotalPageNumber(totalPageNumber);
        return page;
    }

    public Goods queryGoodsWithId(String goodsId) {
        return goodsMapper.queryGoodsWithId(goodsId);
    }

    public Integer queryInventoryWithIdAndSize(GoodsInventory goodsInventory) {
        return goodsInventoryMapper.queryInventoryWithIdAndSize(goodsInventory);
    }
}
