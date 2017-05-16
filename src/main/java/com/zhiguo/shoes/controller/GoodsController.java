package com.zhiguo.shoes.controller;

import com.zhiguo.shoes.pojo.Goods;
import com.zhiguo.shoes.pojo.GoodsInventory;
import com.zhiguo.shoes.pojo.Page;
import com.zhiguo.shoes.server.GoodsServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2017/4/30/030.
 */

@Controller
public class GoodsController {

    @Autowired
    private GoodsServer goodsServer;

    @RequestMapping(value = "queryGoodsList")
    public String queryGoodsList(Page page, Model model) throws Exception {
        if (page.getPageNo() == 0){
            page.setPageNo(1);
        }
        page.setStartCount(page.getPageSize()*(page.getPageNo()-1));
        page =  goodsServer.queryGodsList(page);
        model.addAttribute("page",page);
        model.addAttribute("mainPage","WEB-INF/goodsMain.jsp");
        return "forward:/index.jsp";
    }

    @RequestMapping(value = "goodsDetail")
    public String goodsDetail(Goods goods, Model model) throws Exception {
        String goodsId = goods.getGoodsId();
        goods = goodsServer.queryGoodsWithId(goodsId);
        model.addAttribute("goods",goods);
        model.addAttribute("mainPage","WEB-INF/goodsDetail.jsp");
        return "forward:/index.jsp";
    }
    @RequestMapping(value = "changeInventory")
    public void changeInventory(GoodsInventory goodInventory, HttpServletResponse response) throws Exception {
        int count = goodsServer.queryInventoryWithIdAndSize(goodInventory);
        response.setContentType("html/text");
        response.getWriter().write(""+count);
    }
}
