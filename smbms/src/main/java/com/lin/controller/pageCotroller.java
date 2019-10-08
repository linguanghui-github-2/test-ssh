package com.lin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class pageCotroller {
    @RequestMapping("/main")
    public String tomain(){
        return "main";
    }
}
