function formatterState(value) {
    /**
     *  0-未分配
     *  1-已分配
     */
    if(value==0){
        return "未分配";
    }else if(value==1){
        return "已分配";
    }else{
        return "未知";
    }
}


function formatterDevResult(value) {
    /**
     * 0-未开发
     * 1-开发中
     * 2-开发成功
     * 3-开发失败
     */
    if(value==0){
        return "未开发";
    }else if(value==1){
        return "开发中";
    }else if(value==2){
        return "开发成功";
    }else if(value==3){
        return "开发失败";
    }else {
        return "未知"
    }

}


function searchSaleChance() {
    var customerName=$("#s_customerName").val();
    var createMan = $("#s_createMan").val();
    var state =$("#s_state").combobox("getValue");
    $("#dg").datagrid("load",{
        customerName:customerName,
        createMan:createMan,
        state:state
    })
}