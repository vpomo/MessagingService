<%@ include file="/WEB-INF/jspf/header.jsp" %>


<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div id="main">
    <aside class="leftAside">
        <h2>Работа с системой</h2>
        <p>Чтобы начать работу с системой необходимо пройти авторизацию
        </p>
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
        <div id="iogv">
            <a href="${pageContext.request.contextPath}/registration">Регистрация нового пользователя</a>
        </div>
        <br>
        <div id="omsu">
            <a href="${pageContext.request.contextPath}/usermanagement">Управление пользователями</a>
        </div>
    </section>

</div>

<%@ include file="/WEB-INF/jspf/footer.jsp" %>

