<%-- 
    Document   : registration
    Created on : 27.04.2016, 0:20:14
    Author     : Помогалов
--%>
<%@ include file="/WEB-INF/jspf/header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div id="main">
    <aside class="leftAside">
        <h1>Страница администратора</h1>
        <p>Вы можете создвать и удалять пользователей системы и менять для них права доступа"
        </p>
        <a href="${pageContext.request.contextPath}/">Перейти на главную страницу</a>
        <br> </br>
    </aside>
    <section>
        <article>
            <h1>Управление пользователями</h1>

            <div class="text-article">
                <c:if test="${notif ne null}">
                    <div class="notif">
                        <span>${notif}</span>
                    </div>
                </c:if>

                <br>
                <table id="jqGrid"></table>
                <div id="jqGridPager"></div>
                <br>
            </div>
        </article>
    </section>
</div>

<%@ include file="/WEB-INF/jspf/footer.jsp" %>
