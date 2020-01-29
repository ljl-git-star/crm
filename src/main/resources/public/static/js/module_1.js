function formatterGrade(grade) {
    if(grade==0){
        return "一级菜单";
    }
    if(grade==1){
        return "二级菜单";
    }
    if(grade==2){
        return "三级菜单";
    }
}

function formatterOp(value,rowData) {
    var title=rowData.moduleName+"_二级菜单";
    var href='javascript:openSecondModule("'+title+'",'+rowData.id+')';
    return "<a href='"+href+"'>二级菜单</a>";
}

// 打开新的显示卡
function openSecondModule(title,mid) {
    window.parent.openTab(title,ctx+"/module/index/2?mid="+mid);
}

function searchModules() {
    $("#dg").datagrid("load",{
        moduleName:$("#s_moduleName").val(),
        code:$("#s_code").val()
    })
}