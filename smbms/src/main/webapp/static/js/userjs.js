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
    //数据回显
    var row = selectedRows[0];//获取当前选中行
    $("#userform").form("load",row);
    $("#userdlg") .dialog("open").dialog("setTitle","修改用户");
    url="${pageContext.request.contextPath}/user/userSave?id="+row.id;
    $("#userCode").textbox("readonly",true);
}
function saveUser() {
    $("#userform").form("submit",{
        url : url,
        onSubmit : function (){
            if ($("#gender").combobox("getValue") == ""){
                $.messager.alert("系统提示","请选择性别！","info");
                return false;
            }
            if ($("#userRole").combobox("getValue") == ""){
                $.messager.alert("系统提示","请选择角色！","info");
                return false;
            }
            $.messager.progress({
                title:"请稍后",
                msg:"正在保存用户信息..."
            });
            return $("#userform").form('validate');
        }, success : function (data){
            var result = eval('('+data+')');
            if(result.suc){
                $.messager.alert("系统提示",result.mes,"info");
                closeUserDialog();
                $("#userDg").datagrid("reload");
            }else {
                $.messager.alert("系统提示",result.mes,"info");
            }
            $.messager.progress('close');
        }
    })
}
