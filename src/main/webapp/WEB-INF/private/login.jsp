<%@ page pageEncoding="UTF-8" %>
<div id="main">

<aside class="leftAside">
    <h2>Авторизация</h2>
    <p>Процесс регистрации в системе.
    </p>
     <a href="${pageContext.request.contextPath}/">Перейти на главную страницу</a> 
      <br> </br>
</aside>

<article>
    <div class="h1">
    <h1>Пожалуйста, введите учетные данные</h1>
    </div>
    <div class="h2">
    <h2>логин и пароль в английской раскладке</h2>  
   
    </div>
    
<form action="j_security_check" method="POST">
    <div class="text-article">
        <p><strong>Ваш логин:</strong>
            <input placeholder="Введите логин" type="text" size="20" name="j_username"></p>
        <p><strong>Пароль:</strong>
            <input placeholder="Введите пароль" type="password" size="20" name="j_password"></p>
        <p><input type="submit" value="Авторизоваться"></p>
    </div>
</form>

</article>

</div>
