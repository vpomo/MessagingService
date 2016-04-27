<%@ include file="/WEB-INF/jspf/header.jsp" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <div id="main">
            <aside class="leftAside">
                <h2>Работа с системой</h2>
                <p>Чтобы начать работу с системой пройдите авторизацию и выберите интересующую организацию
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
                <div id="iogv">
                    <h2>Государственные органы</h2>
                    <table class="table" border=1 cellpadding=0 cellspacing=0 width=290 style='border-collapse: collapse;table-layout:fixed;width:290pt'>
                        <col style='width:18pt'>
                        <col style='width:212pt'>
                        <col style='width:60pt'>
                    <tr>
                        <td>№</td>
                        <td>Наименование исполнительного органа государственной власти</td>
                        <td>Дата отчета</td>
                    </tr>
                
                <c:forEach var="user" items="${usersIOGV}">
                    <tr>
                        <td><div class="count2"></div></td>
                        <td><a href="${pageContext.request.contextPath}/common_phorm?login=${user.login}">${user.nameUser}</a></td>
                        <td>${user.dateLastReport}</td>
                    </tr>
  		</c:forEach>
                </table> 
                </div>    

            <div id="omsu">    
                <h2>Муниципальные органы</h2>
                <table class="table" border=1 cellpadding=0 cellspacing=0 width=487 style='border-collapse: collapse;table-layout:fixed;width:290pt'>
                        <col style='width:18pt'>
                        <col style='width:212pt'>
                        <col style='width:60pt'>
                    <tr>
                        <td>№</td>
                        <td>Наименование органа местного самоуправления</td>
                        <td>Дата отчета</td>
                    </tr>
                   
                <c:forEach var="user" items="${usersMunicipal}">
                    <tr>
                        <td><div class="count1"></div></td>
                        <td><a href="${pageContext.request.contextPath}/common_phorm?login=${user.login}">${user.nameUser}</a></td>
                        <td>${user.dateLastReport}</td>
                    </tr>
  		</c:forEach>
                </table>                     
                    
            </div>
        </section>
            
</div>

<%@ include file="/WEB-INF/jspf/footer.jsp" %>

