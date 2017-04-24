<#include "header.ftl">
<div class="container">
    <div class="search-row row">
        <div class="col-md-8">
            <form method="get" action="/?Language=${language}">
                <div class="input-group search-group">
                    <input type="text" class="form-control search-bar" aria-describedby="search-btn"
                           placeholder="Твой запрос" <#if searchString!=''>value="${searchString}"</#if>>
                    <button class="btn submit-btn input-group-addon" id="search-btn">Найти!</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12 category-group">
            <div>
                <p>Что хотите найти?</p>
            </div>
            <div class="category-item-group">
                <input type="checkbox" class="category-checkbox" name="Movie" id="movie">
                <label class="label label-info category-label" for="movie">Movie</label>
            </div>
            <div class="category-item-group">
                <input type="checkbox" class="category-checkbox" name="Book" id="book">
                <label class="label label-info category-label" for="book">Book</label>
            </div>
            <div class="category-item-group">
                <input type="checkbox" class="category-checkbox" name="Emulated" id="emulated">
                <label class="label label-info category-label" for="emulated">Emulated Formats</label>
            </div>
            <div class="category-item-group">
                <input type="checkbox" class="category-checkbox" name="Audio" id="audio">
                <label class="label label-info category-label" for="audio">Audio</label>
            </div>
            <div class="category-item-group">
                <input type="checkbox" class="category-checkbox" name="Shows" id="shows">
                <label class="label label-info category-label" for="shows">Shows</label>
            </div>
            <div class="category-item-group">
                <input type="checkbox" class="category-checkbox" name="ххх" id="ххх">
                <label class="label label-info category-label" for="ххх">XXX</label>
            </div>
        </div>
    </div>
<#if hits?size!=0>
    <div class="row">
        <div class="col-md-7">
            <p class="res-count">Результатов поиска: ${hits?size}. Страница  ${page} из  ${pages_total}</p>
        </div>
    </div>
<div class="panel">
    <div class="row">
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
            <#if 1<page >
                <div class="btn-group" role="group" aria-label="First group">
                    <#if 2<page >
                        <button type="button" class="btn btn-default">1</button>
                        <button type="button" class="btn btn-default">3</button></#if>
                    <#if 5<page >
                        <button type="button" class="btn btn-default"> ${page - 1}</button> </#if>
                    <button type="button" class="btn btn-default">Назад</button>
                </div>
            </#if>
            <#if 0 < (pages_total -page) >
                <div class="btn-group" role="group" aria-label="Second group">
                    <button type="button" class="btn btn-default">Вперёд</button>
                    <#if 1 < (pages_total -page) >
                        <button type="button" class="btn btn-default">${page + 2} ?></button> </#if>
                    <#if 4 < (pages_total -page) >
                        <button type="button" class="btn btn-default">${page + 5}</button> </#if>
                    <#if 2 < (pages_total -page)&&(pages_total!=(page + 5)) >
                        <button type="button" class="btn btn-default">${pages_total}</button> </#if>
                </div>
            </#if>
        </div>
    </div>
    <div class="row">
        <div class="col-md-7">Название</div>
        <div class="col-md-1">Размер</div>
        <div class="col-md-1">Сиды</div>
        <div class="col-md-1">Последнее обновление</div>
    </div>
    <#list hits as hit>
        <div class="row search-item">
            <div class="col-md-7">${hit.getProperty('search')}</div>
            <div class="col-md-1">${hit.getProperty('fileSize')}${hit.getProperty('sizeType')}</div>
            <div class="col-md-1">${hit.getProperty('seeders')}</div>
            <div class="col-md-2">${hit.getProperty('peers_updated')?datetime}</div>
            <div class="col-md-1"><a href="${hit.getProperty('magnet')}" rel="nofollow">Скачать</a>
            </div>
        </div>
    </#list>
</#if>
</div>
<#include "footer.ftl">