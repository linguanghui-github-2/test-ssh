package com.lin.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lin.pojo.Bill;
import com.lin.service.BillService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/bill")
public class BillCotroller {
    @Resource
    private BillService billService;
    @ResponseBody
    @RequestMapping("/findBillList")
    public Object findBillList(Bill bill,int page,int rows)throws Exception{
        Map<String,Object> map = new HashMap<String, Object>();
        PageHelper.startPage(page,rows);
        List<Bill> billList = billService.findBillList(bill,page,rows);
        PageInfo<Bill> pageInfo = new PageInfo<Bill>(billList);
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return JSON.toJSONString(map);
    }
    @RequestMapping("/tobilllist")
    public String tobilllist(){
        return "billManager";
    }
}
