package com.zhiguo.shoes.controller;

import com.zhiguo.shoes.pojo.Admin;
import com.zhiguo.shoes.pojo.GoodsType;
import com.zhiguo.shoes.pojo.Orders;
import com.zhiguo.shoes.server.AdminGoodsServer;
import com.zhiguo.shoes.server.AdminServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/4/15/015.
 */
@Controller
public class AdminController {
    @Autowired
    private AdminServer adminServer;
    @Autowired
    private AdminGoodsServer adminGoodsServer;


    @RequestMapping(value = "admin/adminLogin")
    public String adminLogin(Admin admin, Model model, HttpSession session){
        Admin admin1 = adminServer.queryByAdminNameAndPassword(admin);
        if (null == admin1){
            model.addAttribute("adminName",admin.getAdminName());
            model.addAttribute("errormessage","用户名或密码错误");
            return "forward:/adminlogin.jsp";
        }
        session.setAttribute("admin",admin1);
        return "/admin/admin";
    }

    @RequestMapping(value = "admin/adminExit")
    public String adminExit(HttpServletRequest request, HttpSession session){
        session.removeAttribute("admin");
        session.invalidate();
        return "redirect:/adminlogin.jsp";
    }

    @RequestMapping(value = "admin/goodsUploads")
    public String goodsUploads(Model model){
        List<GoodsType> goodsTypes = adminGoodsServer.queryAllGoodsType();
        model.addAttribute("goodsTypes",goodsTypes);
        model.addAttribute("mainPage","goods/uploadgoods.jsp");
        return "/admin/admin";
    }
    @RequestMapping(value = "admin/queryAllOrders")
    public String queryAllOrders(Model model){
        List<Orders> ordersList = adminServer.queryAllOrders();
        model.addAttribute("ordersList",ordersList);
        model.addAttribute("mainPage","orderManage.jsp");
        return "/admin/admin";
    }


}
