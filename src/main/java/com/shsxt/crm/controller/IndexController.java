package com.shsxt.crm.controller;

import com.shsxt.base.BaseController;
import com.shsxt.crm.service.UserService;
import com.shsxt.utils.LoginUserUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController extends BaseController {

    @Resource
    private UserService userService;

    // 登录
    @RequestMapping("index")
    public String index(){
        return "index";
    }

    // 主页
    @RequestMapping("main")
    public String main(HttpServletRequest request){
        /*Cookie[] cookies = request.getCookies();
        String value = null;
        for (Cookie cookie : cookies){
            if (cookie.getName().equals("userIdStr")){
                value = cookie.getValue();
                break;
            }
        }*/
        Integer userId = LoginUserUtil.releaseUserIdFromCookie(request);
        request.setAttribute("user",userService.selectByPrimaryKey(userId));
        return "main";
    }
}
