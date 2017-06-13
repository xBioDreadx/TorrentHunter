package com.example.controller

import com.example.domain.Param
import com.example.model.GdkMapModel
import com.example.repositories.ParamRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam

/**
 * Created by levchenko on 12.06.17.
 */
@Controller
class CombineController {

    @Autowired
    ParamRepository paramRepository

    @RequestMapping("/combine")
    public String gdk(
            Model model) {

        def params = paramRepository.findAll()
        model.addAttribute('params', params)

        return "combine";
    }

    @RequestMapping("/combine/save")
    public String saveGdk(
            @ModelAttribute() GdkMapModel saveParams,
            Model model) {

        if (saveParams.nameval != null) {
            for (int i = 1; i <= saveParams.nameval.size(); i++) {
                def temp = paramRepository.findFirstByName(saveParams.nameval[i])
                if (temp == null)
                    paramRepository.save(new Param(name: saveParams.nameval[i],
                            maxValue: saveParams.maxval[i],
                            averValue: saveParams.averval[i]
                    ))
                else {
                    temp.maxValue = saveParams.maxval[i]
                    temp.averValue = saveParams.averval[i]
                    paramRepository.save(temp)
                }

            }
            def temp=paramRepository.findFirstByName('')
            if (temp!=null) paramRepository.delete(temp.id)

        }
        return "redirect:/combine";
    }

    @RequestMapping("/combine/delete")
    public String saveGdk(
            @RequestParam(name = "name") String name,
            Model model) {
        paramRepository.delete(paramRepository.findFirstByName(name).id)

        return "redirect:/combine";
    }

    @RequestMapping("/combine/add")
    public String addRow(
            Model model) {

        paramRepository.save(new Param(name: '',
                maxValue: 0,
                averValue: 0
        ))

        return "redirect:/combine";
    }

}
