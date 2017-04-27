<!DOCTYPE html>
<html>
<head>
    <title>Torrent Hunter -Лучший поисковик торрентов! <#if  searchString!=''>Вы ищите: ${searchString} </#if></title>
    <meta name="Keywords" content="Поиск и загрузка торрентов, игр, фильмов, музыки, книг, софта, программ">
    <meta name="Description" content="   <#if  searchString!=''>Ваш запрос: ${searchString} имеет ${query_total} результатов. </#if> На сайте вы сможете найти любой интресующий вас контент: игры, фильмы, музыку, книги и многое другое. Без регистраций и назойливой рекламы - только поиск информации и торренты">
    <meta name="robots" content="all"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body class="container">
<header class="site-header container">
    <div class="row">
        <div class="col-md-4">
            <a href="/?Language=${language}"><img src="/images/logo.png" alt="Логотип"></a>
        </div>
        <div class="col-md-8">
            <h1 class="header-h1">Torrent Hunter - Лучший поисковик торрентов!</h1>
            <h2 class="header-h2">Приходи, ищи, качай! Софт, игры, музыка, фильмы, книги - Torrent Hunter найдёт всё</h2>
        </div>
    </div>
</header>
<div class="container">
    <div class="search-row row">
        <div class="col-md-8 col-md-offset-2">

                <input type="hidden" name="Language" value="${language}">
                <div class="input-group search-group">
                    <input type="text" class="form-control search-bar" aria-describedby="search-btn" name="searchString" id="searchString"
                           placeholder="Твой запрос" <#if searchString!=''>value="${searchString}"</#if>>
                    <button class="btn submit-btn input-group-addon action-button" data-input="searchString" id="search-btn">Найти!</button>
                </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 types-group">
            <div>
                <p>Для уточнения поиска можешь выбрать категорию</p>
            </div>
           <#list types?keys as type>
               <div class="category-item-group">
                   <input type="checkbox" class="category-checkbox" <#if types[type]==true>checked="checked" </#if> name="${type}" id="${type}">
                   <label class="label label-info category-label"  for="${type}">${type}</label>
               </div>
           </#list>
        </div>
    </div>
</div>
