<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Spring Security Tutorial</title>
    <link rel="stylesheet" type="text/css" href="css/login.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>


<div class="container col-md-offset-5 col-md-3" >

    <form action="/authorize" method="GET" class="form-signin">
        <h3 class="form-signin-heading">Авторизация</h3>
        <br/>
        <#--<h6 class="form-signin-heading">Логин</h6>-->
        <input type="text" id="email" name="login"  placeholder="Username"
               class="form-control" /> <br/>
        <#--<h6 class="form-signin-heading">Пароль</h6>-->
        <input type="password"  placeholder="Password"
               id="password" name="password" class="form-control" /> <br />
        <button class="btn btn-lg btn-primary btn-block" name="Submit" value="Login" type="Submit" >Логін</button>
    </form>
</div>
</body>
</html>