package com.zhiguo.shoes.mapper;

import com.zhiguo.shoes.pojo.Goods;
import com.zhiguo.shoes.pojo.Page;

import java.util.List;

public interface GoodsMapper {
    int insert(Goods goods);

    List<Goods> queryGoodsList(Page page);

    int queryAllGoodsCount();

    Goods queryGoodsWithId(String goodsId);
}