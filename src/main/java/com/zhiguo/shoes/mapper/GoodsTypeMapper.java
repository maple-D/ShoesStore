package com.zhiguo.shoes.mapper;

import com.zhiguo.shoes.pojo.GoodsType;
import java.util.List;

public interface GoodsTypeMapper {
    List<GoodsType> queryAllGoodsType();

    GoodsType selectByPrimaryKey(Integer var1);
}