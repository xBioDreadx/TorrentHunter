package com.example.controller

import com.example.service.LoginService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping

@Controller
public class HomeController {

    @Autowired
    LoginService loginService

    @RequestMapping("/")
    public String Home(
            Model model) {

        model.addAttribute('user',loginService.user)
        return "index";
    }





}


