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
    var title=rowData.moduleName+"_三级菜单";
    var href='javascript:openSecondModule("'+title+'",'+rowData.id+')';
    return "<a href='"+href+"'>三级菜单</a>";
}

function openSecondModule(title,mid) {
    window.parent.openTab(title,ctx+"/module/index/3?mid="+mid);
}

function searchModules() {
    $("#dg").datagrid("load",{
        moduleName:$("#s_moduleName").val(),
        code:$("#s_code").val()
    })
}



function openModuleAddDialog() {
    $("#parentId").combobox("setValue",$("#pId").val());
    openDialog("dlg","菜单添加");
}

function closeModuleDialog() {
    closeDialog("dlg");
}

function clearFormData(){
    $("#moduleName").val("");
    $("#moduleStyle").val("");
    $("#optValue").val("");
    $("#orders").val("");
    $("input[name='id']").val("");
}

function saveOrUpdateModule() {
    saveOrUpdateRecode(ctx+"/module/save",ctx+"/module/update","dlg",searchModules,clearFormData);
}


function openModuleModifyDialog() {
    openModifyDialog("dg","fm","dlg","菜单更新");
}

function deleteModule() {
    deleteRecode("dg",ctx+"/module/delete",searchModules);
}