<%-- 
    Document   : registration
    Created on : 27.04.2016, 0:20:14
    Author     : Помогалов
--%>
<%@ include file="/WEB-INF/jspf/header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <div id="main">
            <aside class="leftAside">
                <h2>Что нужно для регистрации</h2>
                <p>Для успешной регистрации, пожалуйста заполните все поля и нажмите на
                кнопку "Создать учетную запись"
                </p>
                <a href="${pageContext.request.contextPath}/">Перейти на главную страницу</a>
                <br> </br>
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
                    <form action="${pageContext.request.contextPath}/registration" method="post">
                                                  
                        <p>
                            <label for="loginUser">Логин</label>
                            <input type="text" name="loginUser" id="loginUser"/>
                        </p>
                        <p>
                        <label for="password">Пароль</label>
                        <input type="password" name="password" id="password"/>
                        
                        <label for="password2">Повторите пароль</label>
                        <input type="password" name="password2" id="password2"/>
                        </p>
                        <p>
                        <label for="nameUser">ФИО пользователя</label>
                        <input type="text" size ="60" name="nameUser" id="nameUser"/>
                        </p>
                        <p>
                            <label for="nameUser">E-mail пользователя</label>
                            <input type="email" size ="60" name="emailUser" id="emailUser"/>
                        </p>
                        <p>    
                            <button type="submit">Создать учетную запись</button>
                        </p>
                        </form>
                    </div>
                </article>
            </section>
        </div>

<%@ include file="/WEB-INF/jspf/footer.jsp" %>
