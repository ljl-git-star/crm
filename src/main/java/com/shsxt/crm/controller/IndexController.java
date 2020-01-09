package com.shsxt.crm.controller;

import com.shsxt.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController extends BaseController {

    // 登录
    @RequestMapping("index")
    public String index(){
        return "index";
    }

    // 主页
    @RequestMapping("main")
    public String main(){
        return "main";
    }
}
