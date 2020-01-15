
// 打开对话框
// dlgId 对话框节点ID    title 对话框标题
function openDialog(dlgId,title) {
    $("#"+dlgId).dialog("open").dialog("setTitle",title);
}

// 关闭对话框
function closeDialog(dlgId) {
    $("#"+dlgId).dialog("close");
}

// 添加或更新
function saveOrUpdateRecode(saveUrl,updateUrl,dlgId,search,clearData) {
    var url = saveUrl;
    if(!(isEmpty($("input[name='id']").val()))){
        url = updateUrl;
    }
    $("#fm").form("submit",{
        url:url,
        onSubmit:function () {
            return $("#fm").form("validate");
        },
        success:function (data) {
            data =JSON.parse(data);
            if(data.code==200){
                closeDialog(dlgId);
                search();
                clearData();
            }else{
                $.messager.alert("来自crm",data.msg,"error");
            }
        }
    })
}


// 打开修改对话框
function openModifyDialog(dataGridId,formId,dlgId,title) {
    var rows=$("#"+dataGridId).datagrid("getSelections");
    if(rows.length<=0){
        $.messager.alert("来自crm","请选择待修改的数据!","error");
        return;
    }
    if(rows.length>1){
        $.messager.alert("来自crm","暂不支持批量修改!","error");
        return;
    }

    $("#"+formId).form("load",rows[0]);
    openDialog(dlgId,title);
}

// 删除
function deleteRecode(dataGridId,deleteUrl,search) {
    var rows=$("#"+dataGridId).datagrid("getSelections");
    if(rows.length==0){
        $.messager.alert("来自crm","请选择待删除的数据!","error");
        return;
    }
    if(rows.length>1){
        $.messager.alert("来自crm","暂不支持批量删除!","error");
        return;
    }
    $.messager.confirm("来自crm","确定删除选中的记录?",function (r) {
        if(r){
            $.ajax({
                type:"post",
                url:deleteUrl,
                data:{
                    id:rows[0].id
                },
                dataType:"json",
                success:function (data) {
                    if(data.code==200){
                        search();
                    }else{
                        $.messager.alert("来自crm",data.msg,"error");
                    }
                }
            })

        }
    })
}