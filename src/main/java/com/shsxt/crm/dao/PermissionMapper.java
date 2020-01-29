package com.shsxt.crm.dao;

import com.shsxt.base.BaseMapper;
import com.shsxt.crm.vo.Permission;

import java.util.List;

public interface PermissionMapper extends BaseMapper<Permission,Integer> {

    public int countPermissionByRoleId(Integer roleId);

    public int deletePermissionByRoleId(Integer roleId);

    public List<Integer> queryRoleIdHasAllModulesByRoleId(Integer roleId);

    public List<String> queryUserHasRolesHasPermissions(Integer userId);
}