<%@ include file="/WEB-INF/jspf/header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <h1>Попытка превышения полномочий !</h1>
    </div>
    <div class="h2">
    <h2>во время создания отчета для  ${nameUserReports}</h2>    
    </div>
</article>

    <c:if test="${notif ne null}">
            <div class="notif">
                <span>${notif}</span> 
            </div>
        </c:if>

</div>


<%@ include file="/WEB-INF/jspf/footer.jsp" %>
