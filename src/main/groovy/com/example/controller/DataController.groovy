package com.example.controller

import com.example.domain.Data
import com.example.domain.Param
import com.example.domain.Post
import com.example.model.GdkMapModel
import com.example.model.PostDataMapModel
import com.example.repositories.DataRepository
import com.example.repositories.ParamRepository
import com.example.repositories.PostRepository
import com.xlson.groovycsv.CsvParser
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.multipart.MultipartFile

/**
 * Created by levchenko on 13.06.17.
 */
@Controller
class DataController {

    @Autowired
    PostRepository postRepository

    @RequestMapping("/data")
    public String data(
            Model model) {

        model.addAttribute('posts', postRepository.findAll())
        return "data";
    }

    @RequestMapping("/data/add")
    public String addPost(
            Model model) {

        postRepository.save(new Post(name: ''))
        return "redirect:/data";
    }

    @RequestMapping("/data/delete")
    public String deletePost(
            @RequestParam(name = "name") String name,
            Model model) {

        postRepository.delete(postRepository.findFirstByName(name).id)
        return "redirect:/data";
    }


    @RequestMapping(path = "/data/save", method = RequestMethod.POST)
    public String saveData(
            @ModelAttribute() PostDataMapModel postsFiles,
            Model model) {

        if (postsFiles.name != null) {
            for (int i = 1; i <= postsFiles.name.size(); i++) {
                def temp = postRepository.findFirstByName(postsFiles.name[i])

                if (temp == null)
                    postRepository.save(new Post(name: postsFiles.name[i]))

                else {
                    temp.name = postsFiles.name[i]
                    postRepository.save(temp)

                }

            }
            def temp = postRepository.findFirstByName('')
            if (temp != null) postRepository.delete(temp.id)

        }

        return "redirect:/data";
    }

    @Autowired
    DataRepository dataRepository
    @Autowired
    ParamRepository paramRepository
    @RequestMapping(path = "/data/upload", method = RequestMethod.POST)
    public String saveDataFile(
            @RequestParam(name = "file", required = true) MultipartFile file,
            Model model) {

        File convFile = new File(file.getOriginalFilename());
        convFile.createNewFile();
        FileOutputStream fos = new FileOutputStream(convFile);
        fos.write(file.getBytes());
        fos.close();


        BufferedReader br = null
        br = new BufferedReader(new FileReader(convFile))
        def csvData = CsvParser.parseCsv(br)
        List<Param> params=paramRepository.findAll()

        csvData.each {col->
            if (col.SO2!=null)
                    {
                        println 'asdfsdfsdf'
                    }

            csvData.columns
            dataRepository.save(new Data())
        }
        println "State\tZipCode\tCombinedRate"

        csvData.each{
            println it.State+"\t"+it.ZipCode+"\t"+it.CombinedRate
        }


        return "redirect:/data";
    }

}



