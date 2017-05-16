package com.zhiguo.shoes.controller;

import com.zhiguo.shoes.pojo.Address;
import com.zhiguo.shoes.pojo.Admin;
import com.zhiguo.shoes.pojo.User;
import com.zhiguo.shoes.server.UserServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/4/13/013.
 */
@Controller
public class UserController {
    @Autowired
        private UserServer userServer;


    @RequestMapping(value = "user/checkUsername")
    public void checkUsername(User user, HttpServletResponse response) throws Exception {
        User user1 = userServer.queryUserwithUseranme(user);
        if (null == user1 ) {
            response.setContentType("html/text");
            response.getWriter().write(""+0);
        }else {
            response.setContentType("html/text");
            response.getWriter().write(""+1);
        }
    }

    @RequestMapping(value = "user/userRegister")
    public String userRegister(User user, ModelAndView modelAndView,HttpSession session  ) throws Exception {
        userServer.saveUser(user);
        User user1 =  userServer.queryUserwithUseranme(user);
        session.setAttribute("user" , user1);
        return "forward:/index.jsp";
    }

    @RequestMapping(value = "user/userLogin")
    public String userLogin(User user, Model model, HttpSession session){
        User user1 = userServer.queryUserwithUseranmeAndPassword(user);
        if (null == user1){
            model.addAttribute("username",user.getUsername());
            model.addAttribute("errormessage","用户名或密码错误");
            return "forward:/userlogin.jsp";
        }
        session.setAttribute("user",user1);
        return "forward:/index.jsp";
    }
    @RequestMapping(value = "user/userExit")
    public String adminExit( HttpSession session){
        session.removeAttribute("user");
        session.invalidate();

        return "redirect:/index.jsp";
    }
    @RequestMapping(value = "saveAddress")
    public String saveAdress(Address address,Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        Integer userid = user.getUserid();
        address.setUserid(userid);
        List<Address> addressList =  userServer.saveAddress(address);
        model.addAttribute("mainPage","WEB-INF/address.jsp");
        model.addAttribute("addressList",addressList);
        model.addAttribute("address",null);
        return "forward:/index.jsp";
    }
    @RequestMapping(value = "toUpdateAddress")
    public String toUpdateAddress(Address address,Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        Integer userid = user.getUserid();
        address.setUserid(userid);
        Map map =  userServer.toUpdateAddress(address);
        model.addAttribute("mainPage","WEB-INF/address.jsp");
        model.addAttribute("addressList",map.get("addressList"));
        model.addAttribute("address",map.get("address"));
        return "forward:/index.jsp";
    }
    @RequestMapping(value = "toAddress")
    public String toAddress(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        Integer userid = user.getUserid();
        List<Address> addressList =  userServer.queryAddressWithUserid(userid);
        model.addAttribute("mainPage","WEB-INF/address.jsp");
        model.addAttribute("addressList",addressList);
        return "forward:/index.jsp";
    }
    @RequestMapping(value = "deleteAddress")
    public String deleteAddress(Address address,Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        Integer userid = user.getUserid();
        address.setUserid(userid);
        List<Address> addressList =  userServer.deleteAddressWithAddressId(address);
        model.addAttribute("mainPage","WEB-INF/address.jsp");
        model.addAttribute("addressList",addressList);
        model.addAttribute("address",null);
        return "forward:/index.jsp";
    }
    @RequestMapping(value = "updatePassword")
    public String updatePassword(User user, @RequestParam(value = "newPassword")String newPassword, Model model, HttpSession session){
        user.setPassword(newPassword);
        userServer.updatePassword(user);
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/index.jsp";
    }
    @RequestMapping(value = "toUpdatePassword")
    public String toUpdatePassword(Model model, HttpSession session){
        model.addAttribute("mainPage","WEB-INF/updatePassword.jsp");
        return "forward:/index.jsp";
    }
    @RequestMapping(value = "user/checkPassword")
    public void checkPassword(User user, HttpServletResponse response) throws Exception {
        User user1 = userServer.queryUserwithUseranmeAndPassword(user);
        if (null == user1 ) {
            response.setContentType("html/text");
            response.getWriter().write(""+0);
        }else {
            response.setContentType("html/text");
            response.getWriter().write(""+1);
        }
    }
}
