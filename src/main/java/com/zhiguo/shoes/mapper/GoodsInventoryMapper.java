package com.zhiguo.shoes.mapper;

import com.zhiguo.shoes.pojo.GoodsInventory;
import java.util.List;

public interface GoodsInventoryMapper {
    int saveBatch(List<GoodsInventory> goodsInventoryList);

    Integer queryInventoryWithIdAndSize(GoodsInventory goodsInventory);
}