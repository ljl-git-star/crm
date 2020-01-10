package com.shsxt.crm.controller;

import com.shsxt.base.BaseController;
import com.shsxt.crm.query.SaleChanceQuery;
import com.shsxt.crm.service.SaleChanceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;


@Controller
@RequestMapping("sale_chance")
public class SaleChanceController extends BaseController {

    @Resource
    private SaleChanceService saleChanceService;

    @RequestMapping("index")
    public String index() {
        return "sale_chance";
    }

    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> querySaleChancesByParams(SaleChanceQuery saleChanceQuery) {
        return saleChanceService.querySaleChancesByParams(saleChanceQuery);
    }

}
