function searchUsers() {
    $("#dg").datagrid("load",{
        userName:$("#s_userName").val(),
        trueName:$("#s_trueName").val(),
        phone:$("#s_phone").val()
    })
}

function openUserAddDialog() {
   openDialog("dlg","用户添加");
}

function closeUserDialog() {
   closeDialog("dlg");
}

function clearFormData(){
    $("#userName").val("");
    $("#email").val("");
    $("#trueName").val("");
    $("#phone").val("");
    $("input[name='id']").val("");
}

function saveOrUpdateUser() {
    saveOrUpdateRecode(ctx+"/user/save",ctx+"/user/update","dlg",searchUsers,clearFormData);
}

function openUserModifyDialog() {
    var rows=$("#dg").datagrid("getSelections");
    if(rows.length==0){
        $.messager.alert("来自crm","请选择待修改的数据!","error");
        return;
    }
    if(rows.length>1){
        $.messager.alert("来自crm","暂不支持批量修改!","error");
        return;
    }

    rows[0].roleIds=rows[0].rids.split(",");
    $("#fm").form("load",rows[0]);

    openDialog("dlg","用户更新");
}

function deleteUser() {
    deleteRecode("dg",ctx+"/user/delete",searchUsers);
}