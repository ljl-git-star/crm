package com.shsxt.crm.query;

import com.shsxt.base.BaseQuery;

public class ModuleQuery extends BaseQuery {
    // 菜单层级  0-一级菜单  1-二级菜单 2-三级菜单
    private Integer grade;

    // 菜单名称
    private String moduleName;

    // 权限码
    private String code;

    // 上级菜单id
    private Integer pId;

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
