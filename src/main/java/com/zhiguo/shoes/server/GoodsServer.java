package com.zhiguo.shoes.server;


import com.zhiguo.shoes.pojo.Goods;
import com.zhiguo.shoes.pojo.GoodsInventory;
import com.zhiguo.shoes.pojo.Page;
import com.zhiguo.shoes.pojo.User;

/**
 * Created by Administrator on 2017/4/13/013.
 */

public interface GoodsServer {
    Page queryGodsList(Page page);

    Goods queryGoodsWithId(String goodsId);

    Integer queryInventoryWithIdAndSize(GoodsInventory goodsInventory);
}
