<!doctype html>
<html>
<head>
    <#include "common.ftl" >
    <script type="text/javascript" src="${ctx}/static/js/common.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/module_3.js"></script>
</head>
<body style="margin: 1px">
<table id="dg" class="easyui-datagrid"
       fitColumns="true" pagination="true" rownumbers="true"
       url="${ctx}/module/list?grade=2&pId=${mid!}" fit="true" toolbar="#tb">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="id" width="50" align="center">编号</th>
        <th field="moduleName" width="200" align="center">菜单名</th>
        <th field="moduleStyle" width="50" align="center">菜单样式</th>
        <th field="url" width="50" align="center">菜单url</th>
        <th field="grade" width="100" align="center" formatter="formatterGrade">层级</th>
        <th field="optValue" width="100" align="center">权限码</th>
    </tr>
    </thead>
</table>

<div id="tb">
    <div>
        <a href="javascript:openSaleChanceAddDialog()" class="easyui-linkbutton" iconCls="icon-add"
           plain="true">创建</a>
        <a href="javascript:openSaleChanceModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit"
           plain="true">修改</a>
        <a href="javascript:deleteSaleChance()" class="easyui-linkbutton" iconCls="icon-remove"
           plain="true">删除</a>
    </div>
    <div>
        菜单名： <input type="text" id="s_moduleName" size="20"
                    onkeydown="if(event.keyCode==13) searchModules()"/>
        操作码： <input type="text" id="s_code" size="20"
                    onkeydown="if(event.keyCode==13) searchModules()"/>
        <a href="javascript:searchModules()" class="easyui-linkbutton" iconCls="icon-search"
           plain="true">搜索</a>
    </div>
</div>

<#--

<div id="dlg" class="easyui-dialog" style="width:700px;height:400px;padding: 10px 20px"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post">
        <table cellspacing="8px">
            <tr>
                <td>客户名称：</td>
                <td><input type="text" id="customerName" name="customerName" class="easyui-validatebox"
                           required="true"/> <font color="red">*</font></td>
                <td></td>
                <td>机会来源</td>
                <td><input type="text" id="chanceSource" name="chanceSource"/></td>
            </tr>
            <tr>
                <td>联系人：</td>
                <td><input type="text" id="linkMan" name="linkMan" class="easyui-validatebox" required="true"/> <font
                            color="red">*</font></td>
                <td></td>
                <td>联系电话：</td>
                <td><input type="text" id="linkPhone" name="linkPhone" class="easyui-validatebox" required="true"/><font
                            color="red">*</font></td>
            </tr>
            <tr>
                <td>成功几率(%)：</td>
                <td><input type="text" id="cgjl" name="cgjl"/></td>
                <td colspan="3"></td>
            </tr>
            <tr>
                <td>概要：</td>
                <td colspan="4"><input type="text" id="overview" name="overview" style="width: 420px"/></td>
            </tr>
            <tr>
                <td>机会描述：</td>
                <td colspan="4">
                    <textarea rows="5" cols="50" id="description" name="description"></textarea>
                </td>
            </tr>
            <tr>
                <td>指派给：</td>
                <td><input class="easyui-combobox" id="assignMan" name="assignMan"
                           data-options="panelHeight:'auto',editable:false,valueField:'trueName',textField:'trueName',url:'${ctx}/user/queryCustomerManager.do'"/>
                </td>
            </tr>
        </table>
        <input name="id" type="hidden"/>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:saveOrUpdateSaleChance()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:closeSaleChanceDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>

-->

</body>
</html>
