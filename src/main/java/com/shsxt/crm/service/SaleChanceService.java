package com.shsxt.crm.service;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shsxt.base.BaseService;
import com.shsxt.crm.query.SaleChanceQuery;
import com.shsxt.crm.vo.SaleChance;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
@Service
public class SaleChanceService extends BaseService<SaleChance,Integer> {

    public Map<String,Object> querySaleChancesByParams(SaleChanceQuery saleChanceQuery){
        Map<String,Object> result = new HashMap<String, Object>();
        PageHelper.startPage(saleChanceQuery.getPage(),saleChanceQuery.getRows());
        PageInfo<SaleChance> pageInfo = new PageInfo<>(selectByParams(saleChanceQuery));
        result.put("total",pageInfo.getTotal());
        result.put("rows",pageInfo.getList());
        return result;
    }

}
