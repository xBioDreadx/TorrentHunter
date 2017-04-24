package com.example.model

import org.hibernate.validator.constraints.Email
import org.springframework.web.bind.annotation.RequestParam

import javax.validation.constraints.AssertTrue
import javax.validation.constraints.Max
import javax.validation.constraints.Min
import javax.validation.constraints.NotNull
import javax.validation.constraints.Size


class FindQueryModel {
//SpringBootValidation google
    @NotNull
    String Language
    @Size(min = 3)
    String SearchString
    @Min(1L)
    Integer Page
    @Min(1L)
    @Max(4L)
    Integer Sort

    String Categories

    String Tags

    public void setLanguage(String language) {
        if (language != 'ru' || language != 'en')
            this.Language = 'ru';
        else
            this.Language = language;
    }

    public String getSearchString() {
        return this.SearchString;
    }
    /**
     *
     * @return page value -1 *100 posts for query
     */
    public Integer getCompletePage() {

        return (this.Page - 1) * 100;
    }

    public Integer getPage() {
        return this.Page;
    }

    public Integer getSort() {
        return this.Sort;
    }

    public void formatInputs() {
        if (!this.Page)
            this.Page = 1;
        this.SearchString = this.SearchString.trim();
        if(!this.Sort)
        {
            this.Sort =1;
        }

    }


}
