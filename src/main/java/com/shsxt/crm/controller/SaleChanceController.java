package com.shsxt.crm.controller;

import com.shsxt.base.BaseController;
import com.shsxt.crm.model.ResultInfo;
import com.shsxt.crm.query.SaleChanceQuery;
import com.shsxt.crm.service.SaleChanceService;
import com.shsxt.crm.service.UserService;
import com.shsxt.crm.utils.LoginUserUtil;
import com.shsxt.crm.vo.SaleChance;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("sale_chance")
public class SaleChanceController extends BaseController {

    @Resource
    private SaleChanceService saleChanceService;

    @Resource
    private UserService userService;

    @RequestMapping("index")
    public String index() {
        return "sale_chance";
    }

    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> querySaleChancesByParams(SaleChanceQuery saleChanceQuery) {
        return saleChanceService.querySaleChancesByParams(saleChanceQuery);
    }

    @RequestMapping("save")
    @ResponseBody
    public ResultInfo saveSaleChance(HttpServletRequest request,SaleChance saleChance){
        saleChance.setCreateMan(userService.selectByPrimaryKey(LoginUserUtil.releaseUserIdFromCookie(request)).getTrueName());
        saleChanceService.updateSaleChance(saleChance);
        return success("机会数据添加成功!");
    }

    @RequestMapping("update")
    @ResponseBody
    public ResultInfo updateSaleChance(SaleChance saleChance){
        saleChanceService.updateSaleChance(saleChance);
        return success("机会数据更新成功!");
    }

    @RequestMapping("delete")
    @ResponseBody
    public ResultInfo deleteSaleChance(Integer[] ids){
        saleChanceService.deleteSaleChanceByIds(ids);
        return success("机会数据删除成功!");
    }

}
