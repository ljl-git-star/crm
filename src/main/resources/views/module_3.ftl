<!doctype html>
<html>
<head>
    <#include "common.ftl" >
    <script type="text/javascript" src="${ctx}/static/js/common.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/base.js"></script>
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
        <a href="javascript:openModuleAddDialog()" class="easyui-linkbutton" iconCls="icon-add"
           plain="true">创建</a>
        <a href="javascript:openModuleModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit"
           plain="true">修改</a>
        <a href="javascript:deleteModule()" class="easyui-linkbutton" iconCls="icon-remove"
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

<input type="hidden" id="pId" value="${mid!}"/>

<div id="dlg" class="easyui-dialog" style="width:700px;height:400px;padding: 10px 20px"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post">
        <table cellspacing="8px">
            <tr>
                <td>菜单名称：</td>
                <td><input type="text" id="moduleName" name="moduleName" class="easyui-validatebox"
                           required="true"/> <font color="red">*</font></td>
                <td></td>
                <td>菜单样式</td>
                <td><input type="text" id="moduleStyle" name="moduleStyle"/></td>
            </tr>
            <tr>
                <td>层级：</td>
                <td><input type="text"  name="grade" value="2" readonly="readonly"/> </td>
                <td></td>
                <td>权限码：</td>
                <td><input type="text" id="optValue" name="optValue" class="easyui-validatebox" required="true"/><font
                            color="red">*</font></td>
            </tr>
            <tr>
                <td>排序：</td>
                <td><input type="text" id="orders" name="orders"/></td>
                <td colspan="3"></td>
            </tr>

            <tr>
                <td>上级菜单：</td>
                <!--
                   查询所有有效的一级菜单
                -->
                <td><input id="parentId" class="easyui-combobox" name="parentId"
                           valueField="id" textField="moduleName" url="${ctx}/module/queryAllModulesByGrade?grade=1" />  <font
                            color="red">*</font></td>
            </tr>
        </table>
        <input name="id" type="hidden"/>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:saveOrUpdateModule()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:closeModuleDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>


</body>
</html>
