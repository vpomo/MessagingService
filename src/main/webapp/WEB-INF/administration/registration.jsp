<%-- 
    Document   : registration
    Created on : 13.11.2014, 0:20:14
    Author     : Помогалов
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <div id="main">
            <aside class="leftAside">
                <h2>Что нужно для регистрации</h2>
                <p>Для добавления нового пользователя в систему заполните все поля и нажмите на
                кнопку "Создать нового пользователя"
                </p>
            </aside>
            <section>
                <article>
                    <h1>Регистрация нового пользователя</h1>
                    
                    <div class="text-article">
                        <c:if test="${notif ne null}">
                            <div class="notif">
                                <span>${notif}</span> 
                            </div>
                        </c:if>
                    <form method="POST" action="addUserServlet">
                                                  
                        <p>
                            <label for="login">Логин</label>
                            <input type="text" name="login" id="login"/>
                        </p>
                        <p>
                        <label for="password">Пароль</label>
                        <input type="password" name="password" id="password"/>
                        
                        <label for="password2">Повторите пароль</label>
                        <input type="password" name="password2" id="password2"/>
                        </p>
                        <p>
                        <label for="nameUser">Имя пользователя</label>
                        <input type="text" size ="60" name="nameUser" id="nameUser"/>
                        </p>
                        <p>
                            <label for="groupUser">Выберите группу пользователя:</label>
                            <select name="groupUser" size="1" id="groupUser">
                                <option>iogv</option>
                                <option>municipal</option>
                                <option>admin</option>
                            </select>  
                        </p>
                        <p>    
                            <button type="submit">Создать нового пользователя</button>
                        </p>
                        </form>
                    </div>
                </article>
            </section>
        </div>