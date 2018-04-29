package com.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
    @GetMapping(value = {"/", "/index"})
    public String getMainPage(){
        return "/WEB-INF/jsp/index.jsp";
    }

    public static String getPrincipal() {
        return null;
    }
}
