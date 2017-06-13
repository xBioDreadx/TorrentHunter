<#setting locale="en_US">
<!DOCTYPE html>
<html>
<head>
    <meta name="robots" content="all"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <#--<link href="/css/gdk.css" rel="stylesheet">-->
</head>
<div class="container">
    <div class="row">
        <div class="col-md-3">
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-8">
            <h4 class="h4" style="text-align: center;width: 100%">ГДК Показників</h4>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8">
            <form class="" method="get" action="/gdk/save">
                <table class="table">
                    <thead>
                    <tr>
                        <th rowspan="2" style="vertical-align: inherit">Назва элементу</th>
                        <th style="text-align: center" colspan="3">ГДК</th>

                    </tr>
                    <tr>
                        <th>максимальна разова</th>
                        <th>середньодобова</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list params as param>
                    <tr>
                        <th scope="row"><input type="text" value="${param.name}" name="nameval[${param?counter}]"></th>
                        <td><input type="text" value="${param.maxValue}" name="maxval[${param?counter}]"></td>
                        <td><input type="text" value="${param.averValue}" name="averval[${param?counter}]"></td>
                        <td><a class="btn btn-danger" href="/gdk/delete?name=${param.name}">X</a></td>
                    </tr>
                    </#list>
                    <tr>
                        <td colspan="4">
                            <a class="btn btn-success" href="/gdk/add" style="width: 100%">Додати ГДК показник</a></td>
                    </tr>
                    <tr>
                        <td><input type="submit" class="btn btn-success" value="Зберегти"></td>
                        <td></td>
                        <td></td>
                        <td style="text-align: right"><a href="/" class="btn btn-danger">Назад</a></td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>

<script src="/js/jquery-3.2.0.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/main.js"></script>

</html>