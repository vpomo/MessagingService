
<%-- 
    Document   : commonphorm
    Created on : 27.11.2014, 23:43:46
    Author     : Помогалов
--%>
<%@ include file="/WEB-INF/jspf/header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="main">

<aside class="leftAside">
    <h2>Просмотр введенных ранее данных</h2>
    <p>Для ввода новых данных нажмите на
    кнопку "Создать новый отчет или открыть черновик"
    </p>
     <a href="${pageContext.request.contextPath}/">Перейти на главную страницу</a> 
      <br> </br>
</aside>
<article>
    <div class="h3">
    <h3>Уровень оснащенности транспортных средств аппаратурой спутниковой навигации ГЛОНАСС или ГЛОНАСС/GPS и статус подключения к Региональной навигационно-информационной системе Амурской области (РНИС)</h3>    
    </div>
    <div class="h2">
    <h2>по пользователю:     ${nameUserReports}</h2>
    <p>Число представленных отчетов: ${countReports}</p>
    </div>
  
<div class="text-article">    
<form method="POST" action="${pageContext.request.contextPath}/common_phorm">
	<input type="button" value="Вернуться назад ..." onClick="history.go(-1)">
        <button type="submit">Создать новый отчет или открыть черновик</button>
	<a href="" class="btn-slide">Совет по работе!</a>
	<div id="panel">
		Система сбора отчетности позволяет сохранять
		предварительно набранные отчетные данные в черновике.
		Чтобы каждый раз не набирать данные снова,
		можно один раз сохранить черновик и затем для публикации
		отчета загружать уже предврительно сформированные данные
		из черновика!
	</div>
</form>
</div>
</article>

    <c:if test="${notif ne null}">
            <div class="notif">
                <span>${notif}</span> 
            </div>
        </c:if> 
 
</div>



<section>
<p style='text-decoration:underline; font-style:italic;color:#191970;text-align:center'>Представлены отчеты за: </p>    
     
<c:forEach var="report" items="${reportToForm}">

<%--
<p style='font-style:italic;color:#191970;text-align:center'><a href="report_phorm?idrep=${report.idReport}"> [${report.dateReport}]</a></p>    
--%>

<a href="report_phorm?idrep=${report.idReport}"> [${report.dateReport}]</a>     
  
</c:forEach>
    
</section>    

<%@ include file="/WEB-INF/jspf/footer.jsp" %>
    