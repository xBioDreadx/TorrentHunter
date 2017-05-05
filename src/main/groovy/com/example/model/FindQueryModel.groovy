package com.example.model

import javax.validation.constraints.Max
import javax.validation.constraints.Min
import javax.validation.constraints.Size


class FindQueryModel {
//SpringBootValidation google
    String language
    @Size(min = 3)
    String searchString
    @Min(1L)
    Integer page
    @Min(1L)
    @Max(4L)
    Integer sort
    @Min(1L)
    Integer pageLength

    ArrayList<String> types

    ArrayList<String> categories

    String Tags

    public String getSearchString() {
        return this.searchString;
    }
    /**
     *
     * @return page value -1 *100 posts for query
     */
    public Integer getCompletePage() {

        return (this.page - 1) * this.getPageLength();
    }

    public Integer getPage() {
        return this.page;
    }
    public Integer getPageLength()
    {

            return (pageLength==null||pageLength<1)? 20: pageLength;
    }

    public Integer getSort() {

        return (sort==null||sort<1)? 1: sort;
    }
    public ArrayList<String> getTypes()
    {
        return this.types;
    }

    public void formatInputs() {
        if (language != 'ru' || language != 'en')
            this.language = 'ru';

        if (!this.page)
            this.page = 1;
        if (this.searchString)
            this.searchString = this.searchString.trim();
        else
            this.searchString = '';
        if (this.sort==null||this.sort<1) {
            this.sort = 1;
        }
        if(pageLength==null||pageLength<1)
        {
            pageLength=20;
        }

    }


}
