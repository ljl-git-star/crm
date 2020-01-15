package com.shsxt.crm.service;

import com.shsxt.base.BaseService;
import com.shsxt.crm.dao.RoleMapper;
import com.shsxt.crm.vo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@SuppressWarnings("all")
public class RoleService extends BaseService<Role,Integer> {

    @Autowired
    private RoleMapper roleMapper;

    public List<Map<String,Object>> queryAllRoles(){
        return roleMapper.queryAllRoles();
    }

}
