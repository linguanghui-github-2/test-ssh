<%--
  Created by IntelliJ IDEA.
  User: linguanghui
  Date: 2019/7/19
  Time: 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!--引入easyui的css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
    <!--引入icon小图标的样式-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
    <!--引入相关的js文件，必须先引入jQuery-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/easyui/jquery.min.js"></script>
    <!--easyui的js文件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"></script>
    <!--汉化，导入汉化插件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/easyui/easyui-lang-zh_CN.js"></script>
</head>
<script>

    function searchUser() {
        $("#userDg").datagrid('load',{
            "userCode":$("#s_userCode").val(),
            "userName":$("#s_userName").val(),
            "userRole":$("#s_userRole").val()
        })
    }
    function resetCondition(){
            $("#s_userCode").textbox("setValue","");
            $("#s_userName").textbox("setValue","");
            $("#s_gender").combobox("setValue","");
            $("#s_userRole").combobox("setValue","");
    }
    $(function () {
        $("#s_userCode").textbox("textbox").bind('keydown',function (e) {
            if (e.keyCode==13){
                searchUser();
            }
        })
        $("#s_userName").textbox("textbox").bind('keydown',function (e) {
            if (e.keyCode==13){
                searchUser();
            }
        })
    })

</script>
<!-- 样式表 -->
<style type="text/css">
    .wu-toolbar-button, .wu-toolbar-search {
        padding: 3px 5px;
    }
</style>
<body>
    <table id="userDg" class="easyui-datagrid" title="用户列表" url="${pageContext.request.contextPath}/bill/findBillList"
        fitColumns="true" striped="true" loadMsg="正在加载数据，请稍后....."
        pagination="true" rownumbers="true" toolbar="#toolbar" fit="true">
        <thead>
        <tr>
            <th field="cb" width="20" checkbox="true"></th>
            <th field="id" width="10" align="center" hidden="true"></th>
            <th field="providerName" width="50" align="center">供应商名称</th>
            <th field="billCode" width="50" align="center">账单编号</th>
            <th field="productName" width="50" align="center">商品名称</th>
            <th field="productUnit" width="10" align="center" >商品单位</th>
            <th field="productCount" width="50" align="center">商品数量</th>
            <th field="totalPrice" width="50" align="center">总金额</th>
            <th field="isPaymentstr" width="50" align="center">是否支付</th>
            <th field="productDesc" width="50" align="center">商品描述</th>
        </tr>
        </thead>
    </table>
    <!-- 工具栏 -->
    <div id="toolbar">
        <!-- 按钮组 -->
        <div class="wu-toolbar-button">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add"
               onclick="openAdd()" plain="true">添加</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit"
               onclick="openEdit()" plain="true">修改</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-remove"
               onclick="remove()" plain="true">删除</a> <a
                href="#" class="easyui-linkbutton" iconCls="icon-cancel"
                onclick="cancel()" plain="true">取消</a>
        </div>
        <!-- 搜索条件 -->
        <div class="wu-toolbar-search">
            <label>商品名称：</label>
            <input class="easyui-textbox" style="width: 120px" id="s_userCode" placeholder="请输入商品名称">
            <label>供应商名称：</label>
            <input id="s_userRole" class="easyui-combobox" name="dept"
                   data-options="valueField:'',textField:'providerName',url:''" />
            <label>是否付款：</label>
            <select class="easyui-combobox" panelHeight="auto" editable="false" style="width: 120px" id="s_gender">
                <option value="2">已付款</option>
                <option value="1">未付款</option>
            </select>
            <a href="javascript:searchUser()" class="easyui-linkbutton"
               iconCls="icon-search">开始检索</a> <a href="javascript:resetCondition()"
                                                 class="easyui-linkbutton" iconCls="icon-cancel">重置</a>
        </div>
    </div>
</body>
</html>
