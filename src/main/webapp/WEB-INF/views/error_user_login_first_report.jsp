<%@ include file="/WEB-INF/jspf/header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    if (request.getRemoteUser() == null) {
    request.getSession().setAttribute("notif", "Пожалуйста, пройдите авторизацию!");
    request.getSession().setAttribute("sessionUser", request.getRemoteUser());
    } else {
    request.getSession().setAttribute("notif", "Вы авторизованы в системе как пользователь: "+request.getRemoteUser() + " !");    
    }
%>

<div id="main">

<aside class="leftAside">
    <h2>Неудачная попытка создания отчета</h2>
    <p>Вы не можете отчитываться за другую организацию! Пожалуйста, выберите свою организацию.
    </p>
     <a href="${pageContext.request.contextPath}/">Перейти на главную страницу</a> 
      <br> </br>
</aside>

<article>
    <div class="h1">
    <h1>Пожалуйста, выберите из списка свою организацию!</h1>
    </div>
    <div class="h2">
    <h2>Во время создания отчета Вы выбрали другую организацию</h2>    
    </div>
</article>

    <c:if test="${notif ne null}">
            <div class="notif">
                <span>${notif}</span> 
            </div>
        </c:if>

</div>


<%@ include file="/WEB-INF/jspf/footer.jsp" %>
