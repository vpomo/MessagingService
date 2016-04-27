<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.datepick.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.plugin.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.datepick.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.datepick-ru.js"></script>
<script>
$(function() {
	$('#popupDatepicker').datepick();
});

function showDate(date) {
	alert('The date chosen is ' + date);
}
</script>
<script>
	$(function() {
	$(".btn-slide").click(function() {
	$("#panel").slideToggle("slow");
	$(this).toggleClass("active"); return false;
	});
});
</script>
                
        
    </head>
    <body>
        <header>
            <a href="${pageContext.request.contextPath}"><img alt="Логотип" id="top-image" src="${pageContext.request.contextPath}/resources/image/glonass.png"/></a>
            <div id="user-panel">
                <p>Электронная система сбора отчетности ГЛОНАСС</p>
            </div>
        </header>
        