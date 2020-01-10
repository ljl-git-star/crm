package com.shsxt.crm.query;

import com.shsxt.base.BaseQuery;

public class SaleChanceQuery extends BaseQuery {
    // 客户名
    private String customerName;
    // 创建人
    private String createMan;
    // 分配状态
    private String state;

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCreateMan() {
        return createMan;
    }

    public void setCreateMan(String createMan) {
        this.createMan = createMan;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
