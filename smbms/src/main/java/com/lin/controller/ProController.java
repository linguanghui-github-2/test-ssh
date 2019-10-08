package com.lin.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lin.pojo.Provider;
import com.lin.service.ProviderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/provider")
public class ProController {
    @Resource
    ProviderService providerService;
    @ResponseBody
    @RequestMapping("/findProviderByProName")
    public String findProviderByProName(Provider provider,int page,int rows)throws Exception{
        Map<String,Object>map = new HashMap<String, Object>();
        PageHelper.startPage(page,rows);
        List<Provider> providerList = providerService.findProviderByProName(provider,page,rows);
        PageInfo<Provider> pageInfo =new PageInfo<Provider>(providerList);
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return JSON.toJSONString(map);
    }
    @RequestMapping("/toprovider")
    public String toprovider(){
        return "providerManager";
    }
}
