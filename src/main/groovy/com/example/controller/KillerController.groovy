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
import org.springframework.web.bind.annotation.RequestMapping


import com.example.model.FindQueryModel
import org.elasticsearch.action.search.SearchRequestBuilder
import org.elasticsearch.client.transport.TransportClient
import org.elasticsearch.common.settings.Settings
import org.elasticsearch.common.transport.InetSocketTransportAddress
import org.elasticsearch.index.query.Operator
import org.elasticsearch.search.sort.SortBuilders
import org.elasticsearch.search.sort.SortOrder
import org.elasticsearch.transport.client.PreBuiltTransportClient
import org.elasticsearch.index.query.*
import org.springframework.stereotype.Service
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.index.query.QueryBuilders
import org.elasticsearch.action.search.SearchResponse

import javax.validation.Valid

/**
 * Created by sealtech on 28.04.2017.
 */
@Controller
class KillerController {
    @Autowired
    SearchingService searchingService


    @RequestMapping("/kill")
    public String Home(
           /* @Valid FindQueryModel findQueryModel,*/
          /*  BindingResult bindingResult,*/
            Model model) {
            //TODO сделать красивую страницу с настраиваемыми параметрами
          searchingService.kill();

        return "killer";

    }



}
