package com.zhiguo.shoes.controller;

import com.zhiguo.shoes.pojo.Admin;
import com.zhiguo.shoes.pojo.Goods;
import com.zhiguo.shoes.pojo.GoodsInventory;
import com.zhiguo.shoes.server.AdminGoodsServer;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/4/26/026.
 */
@Controller
public class AdminGoodsController {
    @Autowired
    private AdminGoodsServer adminGoodsServer;

    @RequestMapping(value = "admin/addGoods")
    public String goodsUploads(Model model,@RequestParam("goodsSize") String[] goodsSizes,@RequestParam("goodsCount") String[] goodsCounts, Goods goods, @RequestParam("picture") CommonsMultipartFile file, HttpSession session, HttpServletRequest request){
        String goodsId = goods.getGoodsId();
        List<GoodsInventory> goodsInventoryList = new ArrayList<GoodsInventory>();
        GoodsInventory goodsInventory;
        for (int i =0; i <goodsSizes.length;i++){
            Integer goodsSize = Integer.valueOf(goodsSizes[i]);
            Integer goodsCount = Integer.valueOf(goodsCounts[i]);
            goodsInventory = new GoodsInventory(goodsId,goodsSize,goodsCount);
            goodsInventoryList.add(goodsInventory);
        }
        String goodsGender = goods.getGoodsGender();
        String goodsType = goods.getGoodsType().getGoodsTypeId().toString();
        //获取文件保存目录
        ServletContext servletContext = request.getSession().getServletContext();

        String path = servletContext.getRealPath("/images/product/"+ goodsGender+"/"+goodsType);
        String filename = goods.getGoodsId()+".jpg";
        try {
            FileUtils.writeByteArrayToFile(new File(path, filename), file.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }

        goods.setGoodsPicture("/images/product/"+ goodsGender+"/"+goodsType+ "/" + filename);
        goods.setGoodsSold(0);
        goods.setGoodsStatus("1");
        goods.setAdmin((Admin) session.getAttribute("admin"));
        goods.setGoodsUploadTime(new Timestamp(System.currentTimeMillis()));
        adminGoodsServer.saveGoods(goods,goodsInventoryList);
        return "/admin/admin";
    }

}
