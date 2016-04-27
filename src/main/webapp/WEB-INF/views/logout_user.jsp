<%@ include file="/WEB-INF/jspf/header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="main">

<aside class="leftAside">
    <h2>Выход из системы</h2>
    <p>Вы осуществили выход из системы.
    </p>
     <a href="${pageContext.request.contextPath}/">Перейти на главную страницу</a> 
      <br> </br>
</aside>

<article>
    <div class="h2">
    <h2>Спасибо за использование системы!</h2>  
    </div>
</article>

</div>


    <% request.getSession().invalidate(); 
    request.getSession().setAttribute("notif", "Пожалуйста, пройдите авторизацию!");
    request.getSession().setAttribute("sessionUser", request.getRemoteUser());
    %>
    
<%@ include file="/WEB-INF/jspf/footer.jsp" %>