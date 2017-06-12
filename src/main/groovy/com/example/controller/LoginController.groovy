package com.example.controller

import com.example.service.LoginService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

/**
 * Created by levchenko on 12.06.17.
 */
@Controller
class LoginController {

    @Autowired
    LoginService loginService

    @RequestMapping("/login")
    public String getAuthensdfsdfticationPage() {

        return 'login'
    }

    @RequestMapping('/authorize')
    String TryLogin(@RequestParam(name = 'login', required = false, defaultValue = 'user') String login,
                    @RequestParam(name = "password", required = false, defaultValue = '1234') String password
    ) {
        if ((login == 'specialist1' || login == 'specialist2' || login == 'specialist3') && password == '1234')
            loginService.specialist=true

        return 'index'
    }


}

