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
<body>
    <table id="pp" >
    </table>
</body>
<script>
    $(function () {
        $('#pp').datagrid({
            title:"用户列表",
            url:"${pageContext.request.contextPath}/user/findUserByUserName",
            fitColumns:true,
            striped:true,
            loadMsg:"正在加载数据，请稍后.....",
            pagination:true,
            rownumbers:true,
            fit:true,
            columns:[[
                {field:"cb", hidden:"true"},
                {field:"id", width:20, checkbox:"true"},
                {field:"userCode", width:100, title:'用户编号'},
                {field:"userName", width:100,title:'真实姓名'},
                {field:"gender", width:20,title:'性别',formatter:formatSex},
                {field:"birthday", width:80,title:'出生日期'},
                {field:"phone", width:80,title:'电话'},
                {field:"roleName", width:50,title:'角色名',formatter:formatRole}
            ]]
        });
    })
    function formatSex(val,row) {
        return row.gender==1?"女":"男";
    }
    function formatRole(val,row) {
        return row.role.roleName;
    }
</script>
</html>
