package com.zhiguo.shoes.server;

import com.zhiguo.shoes.pojo.Admin;
import com.zhiguo.shoes.pojo.Goods;
import com.zhiguo.shoes.pojo.GoodsInventory;
import com.zhiguo.shoes.pojo.GoodsType;

import java.util.List;

/**
 * Created by Administrator on 2017/4/13/013.
 */

public interface AdminGoodsServer {

    List<GoodsType> queryAllGoodsType();

    int saveGoods(Goods goods, List<GoodsInventory> goodsInventoryList);
}
