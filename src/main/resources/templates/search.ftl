<#include "header.ftl">
<#if hits?size!=0>
<div class="search_results_wrapper">
    <div class="container">
        <div class="row search_results_instruments_wrapper">
            <div class="col-md-2">
                <p class="res_count">Результаты поиска: ${query_total}</p>
                <p class="res_page">Страница  ${page} из  ${pages_total}</p>
            </div>
            <div class="col-md-2 prev_next_wrap">
                <div class="page_container">
                    <button type="button" class="btn btn-default btn_page btn_prev"><a href="#" class="action-link"
                                                                                       data-field="page"
                                                                                       <#if page<2 >disabled="disabled" </#if>data-value="${page-1}">Пред.</a>
                    </button>
                    <button type="button" class="btn btn-default btn_page btn_next"><a href="#" class="action-link"
                                                                                       data-field="page"
                                                                                       <#if (pages_total -page)<1 >disabled="disabled"</#if>
                                                                                       data-value="${page+1}">След.</a>
                    </button>
                </div>
            </div>
            <div class="col-md-4">
                <div class=" page_container" role="group">
                    <label class="label goto-label" for="goto">На страницу</label>
                    <input class="input-sm input-goto" id="goto" type="number" min="1" value="1" max="${pages_total}"
                           name="page">
                    <button class="btn btn-default goto-button action-button" data-input="goto" id="button-goto">
                        Перейти
                    </button>
                </div>
            </div>
            <div class="col-md-4">
                <div class=" page_container" role="group">
                    <label class="label goto-label" for="pageLength">Выводить по</label>
                    <input class="input-sm input-goto" id="pageLength" type="text" name="pageLength"
                           list="pageLength_count" value="${pageLength}">
                    <datalist id="pageLength_count">
                        <option value="5">
                        <option value="10">
                        <option value="20">
                        <option value="50">
                        <option value="100">
                    </datalist>
                    <button class="btn btn-default goto-button action-button" data-input="pageLength"
                            id="button-pageLength">
                        Вывести
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="container search_list_wrapper">
        <div class="row search_head">
            <div class="col-md-7">Название раздачи<a href="#" class="link action-link sort_link" data-field="sort"
                                                     data-value="1"><!--<span class="glyphicon glyphicon-arrow-down"
                                                                  aria-hidden="true"></span>--></a></div>
            <div class="col-md-1 padding-5">Размер<a href="#" class="link action-link sort_link" data-field="sort"
                                                     data-value="2"><!--<span class="glyphicon glyphicon-arrow-down"
                                                                          aria-hidden="true"></span>--></a></div>
            <div class="col-md-1 padding-5">Сиды<a href="#" class="link action-link sort_link" data-field="sort" data-value="3">
                <!--<span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span>-->
                </a></div>
            <div class="col-md-3">Последнее обновление<a href="#" class="link action-link sort_link" data-field="sort"
                                                         data-value="4">
              <!--  <span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span> -->
            </a></div>
        </div>
        <#list hits as hit>
            <div class="row search-item">
                <div class="col-md-12">
                    <div class="row search_info_row">
                        <div class="col-md-7 search_col_padding">
                            <p style="font-size: 12pt;">
                            ${hit.getProperty('search')}
                                <#list  hit.getProperty('type') as type>
                                    <label class="file_type">${type}</label>
                                </#list>
                                <#list  hit.getProperty('categories') as cat>
                                    <label class="file_category">${cat}</label>
                                </#list>
                            </p>
                        </div>
                        <div class="col-md-1 search_col_padding">#{hit.getProperty('fileSize'); M2}${hit.getProperty('sizeType')}</div>
                        <div class="col-md-1 search_col_padding seeders_cell">${hit.getProperty('seeders')}</div>
                        <div class="col-md-2 search_col_padding">${hit.getProperty('peers_updated')?datetime}</div>
                        <div class="col-md-1 search_col_padding"><a class="download_link" href="${hit.getProperty('magnet')}"
                                                 rel="nofollow">Скачать</a></div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="file_list_wrapper">
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
                    </div>
                </div>
            </div>
        </#list>
    </div>
</div>

</#if>

<#include "footer.ftl">