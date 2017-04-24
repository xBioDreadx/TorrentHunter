<#include "header.ftl">
<div class="container">
<#if hits?size!=0>
    <div class="row">
        <div class="col-md-7 col-md-offset-2">
            <p class="res-count">Результатов поиска: ${query_total}. Страница  ${page} из  ${pages_total}</p>
        </div>
    </div>
<div class="container">
    <div class="row">
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
            <#if 1<page >
                <div class="btn-group" role="group" aria-label="First group">
                    <#if 2<page >
                        <button type="button" class="btn btn-default"><a href="#"  class="action-link" data-field="page" data-value="1">1</a></button>
                    </#if>
                    <#if 5<page >
                    <button type="button" class="btn btn-default"><a href="#"  class="action-link" data-field="page" data-value="3">3</a></button>
                    </#if>
                    <#if 3<page >
                        <button type="button" class="btn btn-default"><a href="#"  class="action-link" data-field="page" data-value="${page -2}">${page - 2}</a></button> </#if>
                        <button type="button" class="btn btn-default"><a href="#"  class="action-link" data-field="page" data-value="${page-1}">Предыдущая</a></button>
                </div>
            </#if>
            <button type="button" class="btn btn-default disabled" disabled="disabled">${page}</button>
            <#if 0 < (pages_total -page) >
                <div class="btn-group" role="group" aria-label="Second group">
                    <button type="button" class="btn btn-default"><a href="#" class="action-link" data-field="page" data-value="${page+1}">Следующая</a></button>
                    <#if 1 < (pages_total -page) >
                        <button type="button" class="btn btn-default"><a href="#" class="action-link" data-field="page" data-value="${page +2}">${page + 2}</a></button> </#if>
                    <#if 4 < (pages_total -page) >
                        <button type="button" class="btn btn-default"><a href="#" class="action-link" data-field="page" data-value="${page+5}">${page + 5}</a></button> </#if>
                    <#if 2 < (pages_total -page)&&(pages_total!=(page + 5)) >
                        <button type="button" class="btn btn-default"><a href="#" class="action-link" data-field="page" data-value="${pages_total}">${pages_total}</a></button> </#if>
                </div>
            </#if>
            <div class="btn-group" role="group">
                    <label class="label goto-label"  for="goto">На страницу</label>
                    <input class="input-sm input-goto" id="goto" type="number" min="1" max="${pages_total}" name="Page">
                    <button class="btn btn-default goto-button action-button" data-input="goto" >Перейти</button>
            </div>
        </div>
    </div>
    <div class="row search_head">
        <div class="col-md-7">Название<a href="#" class="link action-link" data-field="sort" data-value="1"><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></a></div>
        <div class="col-md-1 padding-5">Размер<a href="#" class="link action-link" data-field="sort" data-value="2"><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></a></div>
        <div class="col-md-1 ">Сиды<a href="#" class="link action-link" data-field="sort" data-value="3"><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></a></div>
        <div class="col-md-3">Последнее обновление<a href="#" class="link action-link" data-field="sort" data-value="4"><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></a></div>
    </div>
    <#list hits as hit>
        <div class="row search-item">
            <div class="col-md-7">${hit.getProperty('search')}</div>
            <div class="col-md-1">#{hit.getProperty('fileSize'); M2}${hit.getProperty('sizeType')}</div>
            <div class="col-md-1 seeders_cell">${hit.getProperty('seeders')}</div>
            <div class="col-md-2">${hit.getProperty('peers_updated')?datetime}</div>
            <div class="col-md-1"><a href="${hit.getProperty('magnet')}" rel="nofollow">Скачать</a>
            </div>
        </div>
    </#list>
</#if>
</div>
<#include "footer.ftl">