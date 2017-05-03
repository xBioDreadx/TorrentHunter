<#include "header.ftl">
<#if hits?size!=0>
<div class="search_results_wrapper">
    <div class="container">
        <div class="row search_results_instruments_wrapper">
            <div class="col-md-2">
                <p class="res_count">Результаты поиска: ${query_total}</p>
                <p class="res_page">Страница  ${page} из  ${pages_total}</p>
            </div>
            <div class="col-md-2">
              <div class="page_container">
                  <button type="button" class="btn btn-default btn_page btn_prev"><a href="#" class="action-link" data-field="page"  <#if page<2 >disabled="disabled" </#if>data-value="${page-1}">Пред.</a></button>
                  <button type="button" class="btn btn-default btn_page btn_next"><a href="#" class="action-link" data-field="page" <#if (pages_total -page)<1 >disabled="disabled"</#if> data-value="${page+1}">След.</a></button>
              </div>
            </div>
            <div class="col-md-2">
                <div class="btn-group" role="group">
                    <label class="label goto-label" for="goto">На страницу</label>
                    <input class="input-sm input-goto" id="goto" type="number" min="1" max="${pages_total}"
                           name="page">
                    <button class="btn btn-default goto-button action-button" data-input="goto" id="button-goto">
                        Перейти
                    </button>
                </div>
            </div>
            <div class="col-md-2">
                <div class="btn-group" role="group">
                    <label class="label goto-label" for="goto">выводить по</label>
                    <input class="input-sm input-goto" id="goto" type="number" min="1" max="${pages_total}"
                           name="page">
                    <button class="btn btn-default goto-button action-button" data-input="goto" id="button-goto">
                        Перейти
                    </button>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">

                </div>
            </div>
            <div class="row search_head">
                <div class="col-md-7">Название<a href="#" class="link action-link" data-field="sort"
                                                 data-value="1"><span class="glyphicon glyphicon-arrow-down"
                                                                      aria-hidden="true"></span></a></div>
                <div class="col-md-1 padding-5">Размер<a href="#" class="link action-link" data-field="sort"
                                                         data-value="2"><span class="glyphicon glyphicon-arrow-down"
                                                                              aria-hidden="true"></span></a></div>
                <div class="col-md-1 ">Сиды<a href="#" class="link action-link" data-field="sort" data-value="3"><span
                        class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></a></div>
                <div class="col-md-3">Последнее обновление<a href="#" class="link action-link" data-field="sort"
                                                             data-value="4"><span class="glyphicon glyphicon-arrow-down"
                                                                                  aria-hidden="true"></span></a></div>
            </div>
            <#list hits as hit>
                <div class="row search-item">
                    <div class="col-md-7">
                        <p style="font-size: 12pt;">
                        ${hit.getProperty('search')}
                            <#list  hit.getProperty('type') as type>
                                <label class="file_type">${type}</label>
                            </#list>
                            <#list  hit.getProperty('categories') as cat>
                                <label class="file_category">${cat}</label>
                            </#list>
                        </p>
                        <div class="file_list_wrapper">
                            <label class="file_list_label" for="file_box_${hit?index}">Список файлов</label>
                            <input type="checkbox" class="file_list_check" id="file_box_${hit?index}">
                            <#assign files = hit.getProperty('files')>
                            <ul class="file_list_list">
                                <#if files?size!=0>
                                    <#list files as file>
                                        <li>
                                            <div class="row">
                                                <div class="col-md-9">
                                                    <p>${file.getProperty('name')}</p>
                                                </div>
                                                <div class="col-md-3">
                                                    <p>#{file.getProperty('fileSize');M2}${file.getProperty('sizeType')} </p>
                                                </div>
                                            </div>
                                        </li>
                                    </#list>
                                <#else >
                                    <li>
                                        <div class="row">
                                            <div class="col-md-9">
                                                <p>${hit.getProperty('originalName')}</p>
                                            </div>
                                            <div class="col-md-3">
                                                <p>#{hit.getProperty('fileSize'); M2}${hit.getProperty('sizeType')}</p>
                                            </div>
                                        </div>
                                    </li>
                                </#if>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-1">#{hit.getProperty('fileSize'); M2}${hit.getProperty('sizeType')}</div>
                    <div class="col-md-1 seeders_cell">${hit.getProperty('seeders')}</div>
                    <div class="col-md-2">${hit.getProperty('peers_updated')?datetime}</div>
                    <div class="col-md-1"><a class="download_link" href="${hit.getProperty('magnet')}" rel="nofollow">Скачать</a>
                    </div>
                </div>
            </#list>
        </div>
    </div>
</div>
</#if>

<#include "footer.ftl">