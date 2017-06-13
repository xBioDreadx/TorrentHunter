package com.example.controller

import com.example.domain.Data
import com.example.domain.Param
import com.example.domain.Post
import com.example.model.KritMapModel
import com.example.model.PostDataMapModel
import com.example.repositories.DataRepository
import com.example.repositories.ParamRepository
import com.example.repositories.PostRepository
import com.xlson.groovycsv.CsvParser
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.multipart.MultipartFile

/**
 * Created by levchenko on 13.06.17.
 */
@Controller
class KritController {

    @Autowired
    ParamRepository paramRepository

    @Autowired
    PostRepository postRepository

    @RequestMapping("/krit")
    public String krit(
            Model model) {

        model.addAttribute('params', paramRepository.findAll().sort{-it.kritKoef})

        return "krit";
    }

    @RequestMapping("/krit/save")
    public String kritSave(
            @ModelAttribute() KritMapModel kritMapModel,
            Model model) {


        def resultMap=new HashMap()

        def propMap=kritMapModel.getProperties()
        propMap.remove('class')
        propMap.entrySet().each {prop->
            float sum=0
            (prop.value as Map).entrySet().each {
                def splitted=(it.value as String).split("/")
                sum+=splitted.length>1?splitted[0].toInteger()/splitted[1].toInteger():splitted[0].toInteger()
            }
            resultMap.put((prop.key as String).toUpperCase(),sum)
        }
        resultMap.each {
            resultMap.put(it.key,it.value/resultMap.size())
        }


        float sum=0;
        resultMap.entrySet().each {sum+=it.value}
        resultMap.entrySet().each {resultMap.put(it.key,it.value/sum)}
        paramRepository.findAll().each {
            it.kritKoef=resultMap.get(it.name)
            paramRepository.save(it)
        }

        return "redirect:/krit";
    }

}



