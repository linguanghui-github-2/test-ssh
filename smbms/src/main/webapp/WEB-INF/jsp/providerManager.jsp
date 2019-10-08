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
            "proCode":$("#s_userCode").val(),
            "proName":$("#s_userName").val(),

        })
    }
    function resetCondition(){
            $("#s_userCode").textbox("setValue","");
            $("#s_userName").textbox("setValue","");

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
    <table id="userDg" class="easyui-datagrid" title="供应商列表" url="${pageContext.request.contextPath}/provider/findProviderByProName"
        fitColumns="true" striped="true" loadMsg="正在加载数据，请稍后....."
        pagination="true" rownumbers="true" toolbar="#toolbar" fit="true">
        <thead>
        <tr>
            <th field="cb" width="20" checkbox="true"></th>
            <th field="id" width="10" align="center" hidden="true">供应商ID</th>
            <th field="proCode" width="50" align="center">供应商编码</th>
            <th field="proName" width="50" align="center">供应商名称</th>

            <th field="proContact" width="50" align="center">供应商联系人</th>
            <th field="proPhone" width="50" align="center">联系电话</th>
            <th field="proAddress" width="80" align="center">地址</th>
            <th field="proFax" width="50" align="center">传真</th>
            <th field="proDesc" width="150" align="center">供应商详细描述</th>
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
            <label>供应商编码：</label>
            <input class="easyui-textbox" style="width: 120px" id="s_userCode">
            <label>供应商名称：</label>
            <input class="easyui-textbox" style="width: 120px" id="s_userName">
            <a href="javascript:searchUser()" class="easyui-linkbutton"
               iconCls="icon-search">开始检索</a> <a href="javascript:resetCondition()"
                                                 class="easyui-linkbutton" iconCls="icon-cancel">重置</a>
        </div>
    </div>
</body>
</html>
