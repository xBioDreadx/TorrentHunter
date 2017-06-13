<!DOCTYPE html>
<html>
<head>
    <meta name="robots" content="all"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <link href="/css/index.css" rel="stylesheet">
</head>
<div class="container">
    <div class="row">
        <div class="col-md-3">
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
    <#if !user >
        <div class="col-md-3">
            <div class="row">
                <div class="col-md-12">
                </div>
                <div class="col-md-12">
                    <a class="btn btn-primary" href="/gdk">ГДК Показників</a>
                </div>

                <div class="col-md-12">
                    <a class="btn btn-primary" href="/data">Дані спостережень</a>
                </div>
                <div class="col-md-12">
                    <a class="btn btn-primary" href="/krit">Критичність показників</a>
                </div>
                <div class="col-md-12">
                    <a class="btn btn-primary" href="/neclogic">Нечіткі ознаки</a>
                </div>
                <div class="col-md-12">
                    <a class="btn btn-primary" href="/combine">Комбінований вплив</a>
                </div>
                <div class="col-md-12">
                    <a class="btn btn-primary" href="#">Правила розпізнавання</a>
                </div>
                <div class="col-md-12">
                    <a class="btn btn-primary" href="#">Історія показників</a>
                </div>

            </div>
        </div>
    <#else>
        <div class="col-md-3">
            <div class="row">
                <div class="col-md-12">
                </div>
                <div class="col-md-12">
                    <a class="btn btn-primary" href="/gdk">ГДК Показників</a>
                </div>

                <div class="col-md-12">
                    <a class="btn btn-primary" href="/data">Дані спостережень</a>
                </div>
                <div class="col-md-12">
                    <a class="btn btn-primary" href="/krit">Критичність показників</a>
                </div>
                <div class="col-md-12">
                    <a class="btn btn-primary" href="/neclogic">Нечіткі ознаки</a>
                </div>
                <div class="col-md-12">
                    <a class="btn btn-primary" href="/combine">Комбінований вплив</a>
                </div>
                <div class="col-md-12">
                    <a class="btn btn-primary" href="#">Правила розпізнавання</a>
                </div>
                <div class="col-md-12">
                    <a class="btn btn-primary" href="#">Історія показників</a>
                </div>

            </div>
        </div>
    </#if>

        <div class="col-md-9">
            <div class="row" style="text-align: right; margin-bottom: 35px">
                <div class="col-md-12">
                    <h4 class="h4" style="display: inline-block">Доброго дня,
                    <#if user >
                        Користувач
                    <#else>
                        Спеціаліст
                    </#if>


                    </h4><a class="btn btn-danger" href="<#if user>/login<#else>/unauthorize</#if>" style="margin-left: 25px"> <#if user>Увійти<#else>Вийти</#if> </a>
                </div>
            </div>
            <div class="row">
                <h4 class="h4 bg-danger status">СТАН РЕГIОНУ: КРИТИЧНИЙ</h4>
                <h5 class="h5 bg-warning status">Ступінь небезпечності: Слабко небезпечний</h5>
            </div>
            <div class="row">
                <iframe src="https://www.google.com.ua/maps/d/u/1/embed?mid=1TXJIwCxr39vZ20uUwi2pEnUjJY4" width=100% height=600></iframe>
            </div>
            <div class="row">
                <h4 class="h4 status black">Рекомендації щодо поточної ситуації</h4>
                <ul class="list-group" style="margin-bottom: 40px ">
                    <li class="list-group-item"><img src="img/arr.jpg"
                                                     style="width: 50px; margin-right: 30px; display: inline-block">
                        <p style="display: inline-block; width: 85%">Екологічна ситуація небезпечна для здоров’я
                            населення.
                            Небхідно негайно оповістити державні установи, що здійснюють санітарний контроль, вимагати
                            від
                            власників підприємств негайного зменшення рівня викидів забруднюючих речовин.</p></li>
                    <li class="list-group-item"><img src="img/arr.jpg"
                                                     style="width: 50px; margin-right: 30px; display: inline-block">
                        <p style="display: inline-block; width: 85%">Якщо є можливість – уникати перебування на
                            забруднених
                            територіях у час, коли концентрація шкідливих речовин є найбільшою.</p></li>
                    <li class="list-group-item"><img src="img/arr.jpg"
                                                     style="width: 50px; margin-right: 30px; display: inline-block">
                        <p style="display: inline-block; width: 85%">Звернути особливу увагу на здоров’я дітей, що більш
                            чутливі
                            до шкідливого впливу забруднюючих речовин.</p></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>

<script src="/js/jquery-3.2.0.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/main.js"></script>

</html>