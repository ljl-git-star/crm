package com.shsxt.crm.controller;

import com.shsxt.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("tree")
@Controller
public class TestController extends BaseController {

    @RequestMapping("tree01")
    public String tree01(){
        return "tree01";
    }

    @RequestMapping("tree02")
    public String tree02(){
        return "tree02";
    }

    @RequestMapping("tree03")
    public String tree03(){
        return "tree03";
    }
}
