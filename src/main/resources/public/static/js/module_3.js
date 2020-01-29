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


function searchModules() {
    $("#dg").datagrid("load",{
        moduleName:$("#s_moduleName").val(),
        code:$("#s_code").val()
    })
}

