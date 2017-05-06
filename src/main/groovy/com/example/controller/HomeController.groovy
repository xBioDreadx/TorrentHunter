package com.example.controller

import com.example.model.FindQueryModel
import com.example.model.HitViewModel
import com.example.service.SearchingService
import org.elasticsearch.search.SearchHits
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseBody

import javax.validation.Valid


//@RequestMapping(method=GET) - для специализации запроса
@Controller
class HomeController {

    @Autowired
    SearchingService searchingService
    static ArrayList<String> types = ["Video", "Audio", "Emulated Formats", "Archive", "Text Formats", "Executable", "APK"]

    @RequestMapping(
            value= "/{language}/{searchString}/{page}/{sort}",method = RequestMethod.GET)
    String Search(@PathVariable("language") String language,
                  @PathVariable("searchString") String searchString,
                  @PathVariable("page") Integer page,
                  @PathVariable("sort") Integer sort,
                  @Valid FindQueryModel findQueryModel,
                  BindingResult bindingResult,
                  Model model) {
        if (!bindingResult.hasErrors()) {
            try {
                findQueryModel.formatInputs()

                model.addAttribute("types", prepareTypes(findQueryModel.getTypes()))
                model.addAttribute("language", findQueryModel.getLanguage())
                model.addAttribute("searchString", findQueryModel.getSearchString().replace(" ","_"));
                model.addAttribute("pageLength",findQueryModel.getPageLength())
                //add file types
                if (findQueryModel.getSearchString() != '') {

                    SearchHits searchHit = searchingService.Search(findQueryModel).getHits();

                    model.addAttribute("page", findQueryModel.getPage())
                    model.addAttribute("sort", findQueryModel.getSort())
                    model.addAttribute("query_total", searchHit.totalHits)
                    model.addAttribute("pages_total", Math.ceil(searchHit.totalHits /findQueryModel.getPageLength()))

                    ArrayList<HitViewModel> hitsModel = new ArrayList<HitViewModel>()
                    for (int i = 0; i < searchHit.hits.length; i++) {
                        hitsModel.add(new HitViewModel(searchHit.hits[i]['source'] as Map<String, Object>))
                    }
                    model.addAttribute("hits", hitsModel)

                    return "search"
                } else {
                    model.addAttribute("page", findQueryModel.getPage())
                    model.addAttribute("sort", findQueryModel.getSort())
                    return "index"
                }
            }
            catch (Exception e) {
                println(e)
                //TODO 404 page
                return "header"
            }
        } else {
            bindingResult.allErrors.each {
            println(it);}
            //TODO 404 page
            println("ERROR")
            return "header"
        }

    }

    @RequestMapping("/")
    String Home(
            Model model) {
        model.addAttribute("types", prepareTypes(null))
        model.addAttribute("language",'ru')
        model.addAttribute("searchString",'')
        model.addAttribute("pageLength",20)
        model.addAttribute("sort", 1)
        model.addAttribute("page", 1)
        return "index";
    }

    @RequestMapping("/{language}")
    String HomeLang(@PathVariable String language,
                    Model model) {
        model.addAttribute("types", prepareTypes(null))
        model.addAttribute("language",language)
        model.addAttribute("searchString",'')
        model.addAttribute("pageLength",20)
        model.addAttribute("sort", 1)
        model.addAttribute("page", 1)
        return "index";
    }




    public static Map<String, Boolean> prepareTypes(ArrayList<String> selectedTypes) {
        Map<String, Boolean> checkedTypes = new HashMap<String, Boolean>()
        if (selectedTypes != null) {
            types.each {
                for (int i = 0; i < selectedTypes.size(); i++) {
                    if (it == selectedTypes[i]) {
                        checkedTypes.put(it, true)
                    }
                }
                if (checkedTypes.get(it) == null) {
                    checkedTypes.put(it, false)
                }
            }
        } else {
            types.each {
                checkedTypes.put(it, false)
            }
        }
       return checkedTypes;
    }


}