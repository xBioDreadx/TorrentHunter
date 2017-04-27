package com.example.controller

import com.example.model.FindQueryModel
import com.example.model.HitViewModel
import com.example.service.SearchingService
import org.elasticsearch.action.search.SearchResponse
import org.elasticsearch.search.SearchHits
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam

import javax.validation.Valid


//@RequestMapping(method=GET) - для специализации запроса
@Controller
public class HomeController {

    @Autowired
    SearchingService searchingService


    @RequestMapping("/")
    public String Home(
            @Valid FindQueryModel findQueryModel,
            BindingResult bindingResult,
            Model model) {


        if (!bindingResult.hasErrors()) {
            searchingService.setModel(findQueryModel);
            try {
                model.addAttribute("language", findQueryModel.getLanguage());
                model.addAttribute("searchString", findQueryModel.getSearchString());
                //add file types
                ArrayList<String> types = new ArrayList<String>();
                types.push("Video");
                types.push("Audio");
                types.push("Emulated Formats");
                types.push("Archive");
                types.push("Text Formats");
                Map<String,Boolean> checkedTypes = new HashMap<String,Boolean>();
                ArrayList<String> selectedTypes = findQueryModel.getTypes();
                println(selectedTypes);
                types.each {
                    for(int i=0;i<selectedTypes.size();i++)
                    {
                        if(it==selectedTypes[i])
                        {
                            checkedTypes.put(it,true);
                        }
                    }
                    if(checkedTypes.get(it)==null)
                    {
                        checkedTypes.put(it,false);
                    }
                }
                println(checkedTypes);
                model.addAttribute("types",checkedTypes);

                if (findQueryModel.getSearchString() != '') {
                    searchingService.Search();
                    model.addAttribute("page", findQueryModel.getPage());
                    model.addAttribute("sort", findQueryModel.getSort());


                    //TODO add  categories and tags
                    /*
                    String Categories

                    String Tags
                    */
                    SearchHits searchHit = searchingService.Response.getHits();

                    model.addAttribute("query_total", searchHit.totalHits);
                    model.addAttribute("pages_total", Math.ceil(searchHit.totalHits / 100));

                    ArrayList<HitViewModel> hitsModel = new ArrayList<HitViewModel>();
                    for (int i = 0; i < searchHit.hits.length; i++) {
                        hitsModel.add(new HitViewModel(searchHit.hits[i]['source'] as Map<String, Object>));
                    }
                    model.addAttribute("hits", hitsModel);

                    return "search";
                } else
                {
                    model.addAttribute("page", findQueryModel.getPage());
                    model.addAttribute("sort", findQueryModel.getSort());
                    return "index"
                }
            }
            catch (Exception e) {
                println(e);
                //TODO 404 Page
                return "header";
            }

        } else {
            //TODO 404 Page
            println("ERROR");
            return "header";
        }

        //model.addAttribute("Language", FindQueryModel.Language);

    }


}