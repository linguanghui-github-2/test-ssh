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

<!-- 样式表 -->
<style type="text/css">
    .wu-toolbar-button, .wu-toolbar-search {
        padding: 3px 5px;
    }
</style>
<body>
    <table id="userDg" class="easyui-datagrid" title="用户列表" url="${pageContext.request.contextPath}/user/findUserByUserName"
        fitColumns="true" striped="true" loadMsg="正在加载数据，请稍后....."
        pagination="true" rownumbers="true" toolbar="#toolbar" fit="true">
        <thead>
        <tr>
            <th field="cb" width="20" checkbox="true"></th>
            <th field="id" width="10" align="center" hidden="true">编号</th>
            <th field="userCode" width="20" align="center">用户编号</th>
            <th field="userName" width="20" align="center">真实姓名</th>
            <th field="gender" width="10" align="center" formatter="formatSex">性别</th>
            <th field="phone" width="50" align="center">电话</th>
            <th field="roleName" width="20" align="center" formatter="formatRole">角色名</th>
            <th field="birthday" width="50" align="center">出生日期</th>
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
            <label>用户编码：</label>
            <input class="easyui-textbox" style="width: 120px" id="s_userCode">
            <label>真实姓名：</label>
            <input class="easyui-textbox" style="width: 120px" id="s_userName">
            <label>性别：</label>
            <select class="easyui-combobox" panelHeight="auto" editable="false" style="width: 120px" id="s_gender">
                <option value="">全部</option>
                <option value="2">男</option>
                <option value="1">女</option>
            </select>
            <label>用户角色：</label>
            <input id="s_userRole" class="easyui-combobox" name="dept" editable="false"
                   data-options="valueField:'id',textField:'roleName',url:'/role/roleList?type=2'" />
            <a href="javascript:searchUser()" class="easyui-linkbutton"
               iconCls="icon-search">开始检索</a> <a href="javascript:resetCondition()"
                                                 class="easyui-linkbutton" iconCls="icon-cancel">重置</a>
        </div>
    </div>
    <%--添加用户窗口--%>
    <div id="userdlg" class="easyui-dialog"
         style="width: 100%; max-width: 500px; height: 500px; padding: 10px 30px"
         data-options="buttons:'#dlg-buttons',modal:true,closed:true,onClose:function(){resetData()}">

        <form id="userform" method="post" style="margin: 10px 0px 0px 20px">
            <div style="margin-bottom: 15px">
                <input class="easyui-textbox" id="userCode" name="userCode"
                       style="width: 90%"
                       data-options="label:'用户编码:',required:true">
            </div>
            <div style="margin-bottom: 15px">
                <input class="easyui-textbox" id="userName" name="userName"
                       style="width: 90%" data-options="label:'真实姓名:',required:true">
            </div>
            <div style="margin-bottom: 15px">
                <input class="easyui-passwordbox" id="userPassword"
                       name="userPassword" style="width: 90%"
                       data-options="label:'用户密码:',required:true">
            </div>
            <div style="margin-bottom: 15px">
                <input class="easyui-passwordbox" id="reUserPassword"
                       name="reUserPassword" style="width: 90%"
                       data-options="label:'确认密码:',required:true">
            </div>
            <div style="margin-bottom: 15px">
                <select class="easyui-combobox" id="gender" name="gender"
                        data-options="panelHeight:'auto',editable:false,label:'用户性别:',required:true"
                        style="width: 90%" id="gender">
                    <option value="">请选择性别</option>
                    <option value="2">男</option>
                    <option value="1">女</option>
                </select>
            </div>
            <div style="margin-bottom: 15px">
                <input class="easyui-datebox" id="birthday" name="birthday"
                       style="width: 90%" editable="false"
                       data-options="label:'出生日期:',required:true">
            </div>
            <div style="margin-bottom: 15px">
                <input class="easyui-textbox" id="phone" name="phone"
                       style="width: 90%" data-options="label:'用户电话:',required:true">
            </div>
            <div style="margin-bottom: 15px">
                <input class="easyui-combobox" id="userRole" name="userRole"
                       style="width: 90%"
                       data-options="label:'用户类别:',required:true,panelHeight:'auto',editable:false,valueField:'id',textField:'roleName',url:'${pageContext.request.contextPath}/role/roleList?type=2'" />
            </div>
            <div style="margin-bottom: 15px">
                <input class="easyui-textbox" id="address" name="address"
                       style="width: 90%;" data-options="label:'用户地址:',required:true">
            </div>


        </form>

    </div>
    <!-- 窗口右下角按钮 -->
    <div id="dlg-buttons">
        <a href="javascript:saveUser()" class="easyui-linkbutton"
           iconCls="icon-ok">保存</a> <a href="javascript:closeUserDialog()"
                                       class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
    </div>

</body>
<script>
    var url;
    function formatRole(val,row) {
        return row.role.roleName;
    }

    function formatSex(val,row) {
        return row.gender == 1 ? "女" :"男";
    }
    function searchUser() {
        $("#userDg").datagrid('load',{
            "userCode":$("#s_userCode").val(),
            "userName":$("#s_userName").val(),
            "gender":$("#s_gender").val(),
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
    });
    function openAdd() {
        $("#userdlg").dialog("open").dialog("setTitle","添加用户");
        url = "${pageContext.request.contextPath}/user/userSave";
        $("#userCode").textbox("readonly",false);
    }
    function closeUserDialog(){
        resetData();
        $("#userdlg").dialog("close");
    }
    function resetData() {
        $("#userform").form("reset");
    }
    function openEdit() {
        var selectedRows = $("#userDg").datagrid("getSelections");
        if (selectedRows.length!=1){
            $.messager.alert("系统提示","请选择一条要修改的数据！","info");
            return;
        }
        var row = selectedRows[0];//获取当前选中行
        $("#userform").form("load",row);//数据回显
        $("#userdlg") .dialog("open").dialog("setTitle","修改用户");//标题显示
        url="${pageContext.request.contextPath}/user/userSave?id="+row.id;//设置请求路径
        $("#userCode").textbox("readonly",true);//设置用户编号为只读状态，不允许修改用户编号
    }
    function saveUser() {
        $("#userform").form("submit",{
            url : url, //引用请求的路径
            onSubmit : function (){//提交请求前的表单验证
                //验证性别不能为空
                if ($("#gender").combobox("getValue") == ""){
                    $.messager.alert("系统提示","请选择性别！","info");
                    return false;
                }
                //验证角色不能为空
                if ($("#userRole").combobox("getValue") == ""){
                    $.messager.alert("系统提示","请选择角色！","info");
                    return false;
                }
                //显示保存信息进度条，提高用户良好的使用体验
                $.messager.progress({
                    title:"请稍后",
                    msg:"正在保存用户信息..."
                });
                //验证表单通过则返回true提交，否则返回false不能提交
                return $("#userform").form('validate');
            }, success : function (data){//提交表单后成功返回的结果处理方法
                var result = eval('('+data+')');//把成功返回的结果转为json字符串
              if(result.suc){//判断控制器返回的信息是否操作成功
                  $.messager.alert("系统提示",result.mes,"info");//控制器操作返回的成功信息
                  closeUserDialog();//关闭模式对话框
                  $("#userDg").datagrid("reload");//重新加载表格数据，刷新数据库数据以显示成功保存的信息
              }else {
                  $.messager.alert("系统提示",result.mes,"info");//控制器操作返回的失败信息
              }
                $.messager.progress('close');//关闭进度条
            }
        })
    }
    function remove(){
        var selectedRows = $("#userDg").datagrid("getSelections");
        if (selectedRows.length == 0){
            $.messager.alert("系统提示","请选择要删除的数据！","info");
            return;
        }
        var idsArr=[];
        for (var i = 0;i < selectedRows.length;i++){
            idsArr.push(selectedRows[i].id);
        }
        alert(idsArr);
        var ids = idsArr.join(",");
        $.messager.confirm("系统提示","确定删除这"+selectedRows.length+"条数据吗？",function (flag) {
            if (flag){
                $.post("${pageContext.request.contextPath}/user/deleteUser",{"ids":ids},function (data) {
                    if (data){
                        $.messager.alert("系统提示","删除成功！","info");
                        $("#userDg").datagrid("reload");//重新加载表格数据，刷新数据库数据以显示成功保存的信息
                    }else {
                        $.messager.alert("系统提示","删除失败！","info");
                    }
                })
            }
        })
    }
</script>
</html>
