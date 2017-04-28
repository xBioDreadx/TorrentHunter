package com.example.service

import com.example.model.FindQueryModel
import org.elasticsearch.action.ActionListener
import org.elasticsearch.action.ActionRequestBuilder
import org.elasticsearch.action.bulk.byscroll.BulkByScrollResponse
import org.elasticsearch.action.bulk.byscroll.DeleteByQueryRequest
import org.elasticsearch.action.search.SearchRequestBuilder
import org.elasticsearch.client.Response
import org.elasticsearch.client.transport.TransportClient
import org.elasticsearch.common.settings.Settings
import org.elasticsearch.common.transport.InetSocketTransportAddress
import org.elasticsearch.index.query.Operator
import org.elasticsearch.index.reindex.DeleteByQueryAction
import org.elasticsearch.search.sort.SortBuilders
import org.elasticsearch.search.sort.SortOrder
import org.elasticsearch.transport.client.PreBuiltTransportClient
import org.elasticsearch.index.query.*
import org.springframework.stereotype.Service
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.index.query.QueryBuilders
import org.elasticsearch.action.search.SearchResponse

import java.sql.Timestamp

@Service
class SearchingService {

    private TransportClient client;
    private FindQueryModel model;
    private SearchRequestBuilder Request;
    public SearchResponse Response;

    public void setModel(FindQueryModel model) {
        this.model = model;
        this.model.formatInputs();
    }


    public void Search() {
        this.OpenConnect();
        this.Request = this.client.prepareSearch("torrents").setSearchType(SearchType.DFS_QUERY_THEN_FETCH).setIndices()
                .setQuery(QueryBuilders.matchQuery('search', this.model.getSearchString()).operator(Operator.AND))
                .setFrom(this.model.getCompletePage()).setSize(100);
        if (this.model.Sort != null)
            switch (this.model.Sort) {
                case 2: this.Request.addSort(SortBuilders.fieldSort("fileSize").order(SortOrder.DESC)); break;
                case 3: this.Request.addSort(SortBuilders.fieldSort("seeders").order(SortOrder.DESC)); break;
                case 4: this.Request.addSort(SortBuilders.fieldSort("peers_updated").order(SortOrder.DESC)); break;
            }
        println("REQUEST IS ");
        println(this.Request);
        this.Response = this.Request.execute().actionGet();
        this.CloseConnect();
    }

    public void OpenConnect() {
        this.client = new PreBuiltTransportClient(Settings.EMPTY)
                .addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("104.198.110.70"), 9300));
    }

    public void CloseConnect() {
        this.client.close();
    }


    public void kill() {
        this.OpenConnect();

        Timestamp tm = new Timestamp(System.currentTimeMillis());
        long dt = tm.getTime();
        dt=(dt/1000)- 432000;
        println(dt);
        def request = DeleteByQueryAction.INSTANCE.newRequestBuilder(client).filter(QueryBuilders.rangeQuery("seeder_was").lt(1493305412)).source("torrents");
        println("REQUEST IS ");
        println(request);
        BulkByScrollResponse resp = request.get();
       println("delete "+resp.deleted) ;
        /*request.execute(new ActionListener<BulkByScrollResponse>() {
            @Override
            public void onResponse(BulkByScrollResponse response) {
                long deleted = response.getDeleted();
                println("deleted "+deleted)
            }

            @Override
            public void onFailure(Exception e) {
                // Handle the exception
            }
        });*/
        this.CloseConnect();

    }

}


//1493305408
//1492964033