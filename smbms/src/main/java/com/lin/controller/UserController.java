package com.lin.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lin.pojo.User;
import com.lin.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.annotation.ModelAttributeMethodProcessor;

import javax.annotation.Resource;
import java.lang.reflect.MalformedParameterizedTypeException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    UserService userService;
    @ResponseBody
    @RequestMapping("/findUserByUserName")
    public Object findUserByUserName(User user,int page,int rows)throws Exception{
        Map<String,Object> map = new HashMap<String, Object>();
        PageHelper.startPage(page,rows);
        List<User> userList = userService.findUserByUserName(user,page,rows);
        PageInfo<User> pageInfo = new PageInfo<User>(userList);
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return JSON.toJSONString(map);
    }
    @RequestMapping("/touserlist")
    public String toUserList(){
        return "userManager";
    }

    @ResponseBody
    @PostMapping("/userSave")
    public Object userSave(User user){
        Map<String,Object> map = null;
        try {
            map = new HashMap<String,Object>();
            int num = 0 ;
            if (user.getId() == null){
                user.setCreatedBy(1);
                user.setCreationDate(new Date());
              num = userService.addUser(user);
              if (num>0){
                  map.put("suc", true);
                  map.put("mes", "添加成功");
              }else {
                  map.put("suc", false);
                  map.put("mes", "添加失败");
              }
            }else {
                user.setCreatedBy(1);
                user.setCreationDate(new Date());
                num = userService.updateUser(user);
                if (num>0){
                    map.put("suc", true);
                    map.put("mes", "修改成功");
                }else {
                    map.put("suc", false);
                    map.put("mes", "修改失败");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return JSON.toJSON(map);
    }
    @ResponseBody
    @RequestMapping("/deleteUser")
    public String deleteUser(String ids)throws Exception{
        Map<String,Object>map = new HashMap<String, Object>();
        String[]idStr = ids.split(",");
        int count = 0;
        for (int i = 0; i<idStr.length;i++){
           count = userService.deleteUserById(idStr[i]);
        }
        if (count>0){
            map.put("success",true);
        }else {
            map.put("success",false);
        }
        return JSON.toJSONString(map);
    }
}
