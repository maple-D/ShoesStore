package com.zhiguo.shoes.server.impl;

import com.zhiguo.shoes.mapper.GoodsInventoryMapper;
import com.zhiguo.shoes.mapper.GoodsMapper;
import com.zhiguo.shoes.mapper.GoodsTypeMapper;
import com.zhiguo.shoes.pojo.Goods;
import com.zhiguo.shoes.pojo.GoodsInventory;
import com.zhiguo.shoes.pojo.GoodsType;
import com.zhiguo.shoes.server.AdminGoodsServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2017/4/19/019.
 */
@Transactional
public class AdminGoodsServerImpl implements AdminGoodsServer {

    @Autowired
    private GoodsTypeMapper goodsTypeMapper;
    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private GoodsInventoryMapper goodsInventoryMapper;

    public List<GoodsType> queryAllGoodsType() {
      return   goodsTypeMapper.queryAllGoodsType();
    }

    public int saveGoods(Goods goods, List<GoodsInventory> goodsInventoryList) {
         goodsMapper.insert(goods);
        return goodsInventoryMapper.saveBatch(goodsInventoryList);
    }

    public int saveGoods(Goods goods) {
        return goodsMapper.insert(goods);
    }
}
