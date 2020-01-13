<!doctype html>
<html>
<head>
    <#include "common.ftl" >
    <script type="text/javascript" src="${ctx}/static/js/common.js"></script>
    <script type="text/javascript" src="${ctx}/static/jquery-easyui-1.3.3/jquery.edatagrid.js"></script>

</head>
<body style="margin: 1px">
<table id="dg" title="销售机会信息管理" class="easyui-datagrid"
       pagination="true" rownumbers="true"
       url="${ctx}/sale_chance/list?state=1" fit="true" toolbar="#tb" singleSelect="true">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="id" width="50" align="center">编号</th>
        <th field="chanceSource" width="100" align="center">机会来源</th>
        <th field="customerName" width="100" align="center">客户名称</th>
        <th field="cgjl" width="80" align="center">成功几率</th>
        <th field="overview" width="200" align="center" hidden="true">概要</th>
        <th field="linkMan" width="80" align="center">联系人</th>
        <th field="linkPhone" width="100" align="center">联系电话</th>
        <th field="description" width="200" align="center" hidden="true">机会描述</th>
        <th field="createMan" width="80" align="center">创建人</th>
        <th field="assignMan" width="80" align="center">指派人</th>
        <th field="assignTime" width="200" align="center" hidden="true">指派时间</th>
        <th field="op" width="100" align="center" formatter="formatterOp">操作</th>
    </tr>
    </thead>
</table>
<div id="tb">
    <div>
        <a href="javascript:openSaleChanceAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">创建</a>
        <a href="javascript:openSaleChanceModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
        <a href="javascript:deleteSaleChance()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
    </div>
    <div>
        客户名称： <input type="text" id="s_customerName" size="20" onkeydown="if(event.keyCode==13) searchSaleChance()"/>
        创建人： <input type="text" id="s_createMan" size="20" onkeydown="if(event.keyCode==13) searchSaleChance()"/>
        <a href="javascript:searchSaleChance()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
    </div>
</div>


<div id="dlg" class="easyui-dialog" style="width:800px;height:500px" resizable="true"
     closed="true" >
    <#--营销机会详情展示-->
    <div id="p" class="easyui-panel"  style="width: 700px;height: 300px;padding: 10px">
        <form id="fm">
            <table cellspacing="8px">
                <input type="hidden" id="saleChanceId" name="saleChanceId" />
                <tr>
                    <td>客户名称：</td>
                    <td><input type="text" id="customerName" name="customerName" readonly="readonly" /></td>
                    <td>    </td>
                    <td>机会来源</td>
                    <td><input type="text" id="chanceSource" name="chanceSource" readonly="readonly" /></td>
                </tr>
                <tr>
                    <td>联系人：</td>
                    <td><input type="text" id="linkMan" name="linkMan" readonly="readonly" /></td>
                    <td>    </td>
                    <td>联系电话：</td>
                    <td><input type="text" id="linkPhone" name="linkPhone" readonly="readonly" /></td>
                </tr>
                <tr>
                    <td>成功几率(%)：</td>
                    <td><input type="text" id="cgjl" name="cgjl" readonly="readonly" /></td>
                    <td colspan="3">    </td>
                </tr>
                <tr>
                    <td>概要：</td>
                    <td colspan="4"><input type="text" id="overView" name="overView" style="width: 420px" readonly="readonly" /></td>
                </tr>
                <tr>
                    <td>机会描述：</td>
                    <td colspan="4">
                        <textarea rows="5" cols="50" id="description" name="description" readonly="readonly" ></textarea>
                    </td>
                </tr>
                <#--            <tr>
                                <td>创建人：</td>
                                <td><input type="text" readonly="readonly" id="createMan" name="createMan" value="${saleChance.createMan?if_exists}" /></td>
                                <td>    </td>
                                <td>创建时间：</td>
                                <td><input type="text" id="createTime" name="createDate" readonly="readonly" value="${saleChance.createDateStr?if_exists}" /></td>
                            </tr>
                            <tr>
                                <td>指派给：</td>
                                <td>
                                    <input type="text" readonly="readonly" id="assignMan" name="assignMan" value="${saleChance.assignMan?if_exists}"  />
                                </td>
                                <td>    </td>
                                <td>指派时间：</td>
                                <td><input type="text" id="assignTime" name="assignTime" readonly="readonly" value="${saleChance.assignTime?string("yyyy-MM-dd HH:mm:ss")}" /></td>
                            </tr>-->
            </table>
        </form>

    </div>
    <br/>


    <#--开发计划详情记录-->
    <table id="dg02" class="easyui-edatagrid" title="开发计划项"
           toolbar="#toolbar002"  pagination="true" rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
        <tr>
            <th field="id" width="50">编号</th>
            <th field="planDate" name="planDate" width="50"   editor="{type:'datebox',options:{required:true,editable:false}}">日期</th>
            <th field="planItem" width="100" editor="{type:'validatebox',options:{required:true}}">计划内容</th>
            <th field="exeAffect" width="100" editor="{type:'validatebox',options:{required:true}}">执行效果</th>
        </tr>
        </thead>
    </table>


    <div id="toolbar">
        <a href="javascript:$('#dg02').edatagrid('addRow')" class="easyui-linkbutton" iconCls="icon-add" plain="true" >添加计划</a>
        <a href="javascript:delCusDevPlan()" class="easyui-linkbutton" iconCls="icon-remove" plain="true" >删除计划</a>
        <a href="javascript:saveCusDevPlan()" class="easyui-linkbutton" iconCls="icon-save" plain="true" >保存计划</a>
        <a href="javascript:$('#dg02').edatagrid('cancelRow')" class="easyui-linkbutton" iconCls="icon-undo" plain="true" >撤销行</a>
        <a href="javascript:updateSaleChanceDevResult(2)" class="easyui-linkbutton" iconCls="icon-kfcg" plain="true" >开发成功</a>
        <a href="javascript:updateSaleChanceDevResult(3)" class="easyui-linkbutton" iconCls="icon-zzkf" plain="true" >终止开发</a>
    </div>

</div>

<script type="text/javascript" src="${ctx}/static/js/cus.dev.plan.js"></script>
</body>
</html>
