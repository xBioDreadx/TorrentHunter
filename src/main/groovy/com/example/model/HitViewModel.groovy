package com.example.model

import org.elasticsearch.search.SearchHit

import java.lang.reflect.Array

class HitViewModel {
    public String search;
    public float fileSize;
    /**
     * @variablie sizeType необходимо для указания КБ,МБ,ГБ
     */
    public String sizeType;
    public Integer seeders;
    public Date peers_updated;
    public String magnet;
    public  ArrayList<FileHit> files;

    HitViewModel(Map<String,Object> hit) {

        this.files = new ArrayList<FileHit>();
        if (hit['files'] != null) {

            for(int i=0; i < (hit['files'] as List<Map<String,Object>>).size(); i++)
            {
                this.files.add(new FileHit((String) hit['files'][i]['path'], (long) hit['files'][i]['length']));
            }
        }
        this.search = hit['search'];
        if (hit['fileSize'] != null) {
            this.fileSize = (long)  hit['fileSize'];
        } else {
            for (int i = 0; i < this.files.size(); i++) {
                this.fileSize +=(long) this.files[i].size;
            }
        }
        if ((((long)this.fileSize / 1024) / 1024) / 1024 > 1) {
            this.fileSize = ((this.fileSize / 1024) / 1024) / 1024;
            this.sizeType = "Gb";
        } else {
            if (((long)this.fileSize / 1024) / 1024 > 1) {
                this.fileSize = (this.fileSize / 1024) / 1024;
                this.sizeType = "Mb";
            } else {
                this.fileSize = this.fileSize / 1024;
                this.sizeType = "Kb";
            }
        }
        if (hit['seeders'] != null) {
            this.seeders = (int) hit['seeders'];
        } else
            this.seeders = 0;
        if (hit['peers_updated'] != null) {
            this.peers_updated = new Date((long) hit['peers_updated']*1000);
        } else
            this.seeders = 0;
        this.magnet = hit['magnet'];
    }

}
