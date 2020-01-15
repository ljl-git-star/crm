<!doctype html>
<html>
<head>
    <#include "common.ftl" >
    <script type="text/javascript" src="${ctx}/static/js/common.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/base.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/user02.js"></script>
</head>
<body style="margin: 1px">
<table id="dg"  class="easyui-datagrid"
       fitColumns="true" pagination="true" rownumbers="true"
       url="${ctx}/user/list" fit="true" toolbar="#tb" singleSelect="true">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="id" width="50" align="center">编号</th>
        <th field="userName" width="200" align="center">用户名</th>
        <th field="trueName" width="50" align="center">真实名</th>
        <th field="email" width="50" align="center" >邮箱</th>
        <th field="phone" width="200" align="center">电话</th>
        <th field="createDate" width="200" align="center" >创建时间</th>
        <th field="updateDate" width="200" align="center" >更新时间</th>
    </tr>
    </thead>
</table>
<div id="tb">
    <div>
        <a href="javascript:openUserAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">创建</a>
        <a href="javascript:openUserModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
        <a href="javascript:deleteUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
    </div>
    <div>
        用户名： <input type="text" id="s_userName" size="20" onkeydown="if(event.keyCode==13) searchUsers()"/>
        手机号： <input type="text" id="s_phone" size="20" onkeydown="if(event.keyCode==13) searchUsers()"/>
        真实名： <input type="text" id="s_trueName" size="20" onkeydown="if(event.keyCode==13) searchUsers()"/>
        <a href="javascript:searchUsers()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
    </div>
</div>


<div id="dlg" class="easyui-dialog" style="width:650px;height:350px;padding: 10px 20px"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post">
        <table cellspacing="8px">
            <tr>
                <td>用户名：</td>
                <td><input type="text" id="userName" name="userName" class="easyui-validatebox" required="true"/> <font color="red">*</font></td>
                <td>  </td>
                <td>真实名：</td>
                <td><input type="text" id="trueName" name="trueName" /></td>
            </tr>
            <tr>
                <td>邮箱：</td>
                <td><input type="text" id="email" name="email"   class="easyui-validatebox" required="true"/>
                    <font color="red">*</font></td>
                <td>  </td>
                <td>联系电话：</td>
                <td><input type="text" id="phone" name="phone"  class="easyui-validatebox" required="true"/>
                    <font color="red">*</font></td>
            </tr>

            <tr>
                <td>角色：</td>
                <td>
                    <input id="roleIds" name="roleIds" class="easyui-combobox" name="dept"
                           valueField="id" textField="text" url="${ctx}/role/queryAllRoles"
                           panelHeight="auto" editable="false" multiple="true" style="width: 240px;"/>
                </td>
            </tr>

        </table>
        <input name="id" type="hidden"/>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:saveOrUpdateUser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:closeUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>


</body>
</html>
