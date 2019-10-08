package com.lin.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.lin.pojo.Role;
import com.lin.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleCotroller {
    @Resource
    private RoleService roleService;
    @ResponseBody
    @RequestMapping("/roleList")
    public Object roleList(String type){
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("id","");
        if (type.equals("1")){
            jsonObject.put("roleName","全部");
        }else {
            jsonObject.put("roleName","请选择角色");
        }
        List<Role> roleList = roleService.findRoleList();
        jsonArray.add(jsonObject);
        jsonArray.addAll(roleList);
        return jsonArray;
    }
}
