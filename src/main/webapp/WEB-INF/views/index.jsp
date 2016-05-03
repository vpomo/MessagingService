<%@ include file="/WEB-INF/jspf/header.jsp" %>


<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div id="main">
    <aside class="leftAside">
        <h2>Работа с системой</h2>
        <p>Чтобы начать работу с системой необходимо пройти авторизацию
        </p>
        <br>
        <a href="${pageContext.request.contextPath}/registration">Регистрация нового пользователя</a>
        <br> </br>
        <a href="${pageContext.request.contextPath}/usermanagement">Управление пользователями</a>
        <br> </br>
        <sec:authorize access="! isAuthenticated()">
            <a href="${pageContext.request.contextPath}/login_user">Пройти авторизацию</a>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <a href="<c:url value="/logout_user"/>">Выйти из системы</a>
        </sec:authorize>
        <br> </br>
    </aside>

    <c:if test="${notif ne null}">
        <div class="notif">
            <span>${notif}</span>
        </div>
    </c:if>

    <section>
        <br>
        <article>
            <h1>Просмотр и отправка сообщений</h1>

            <div class="text-article">
                <sec:authorize access="isAuthenticated()">
                    <br>
                    <table id="jqGridMain"></table>
                    <div id="jqGridPagerMain"></div>
                    <br>
                </sec:authorize>
            </div>
        </article>
    </section>

</div>

<%@ include file="/WEB-INF/jspf/footer.jsp" %>

