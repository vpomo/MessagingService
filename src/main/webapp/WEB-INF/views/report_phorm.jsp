<%-- 
    Document   : commonphorm
    Created on : 27.11.2014, 23:43:46
    Author     : Помогалов
--%>
<%@ include file="/WEB-INF/jspf/header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    if (request.getRemoteUser() == null) {
    request.getSession().setAttribute("notif", "Пожалуйста, пройдите авторизацию!");
    request.getSession().setAttribute("sessionUser", null);
    } else {
    request.getSession().setAttribute("notif", "Вы авторизованы в системе как пользователь: "+request.getRemoteUser() + " !");    
    }
%>
<div id="main">

<aside class="leftAside">
    <h2>Просмотр введенных ранее данных</h2>
    <p>Для выхода из режима просмотра, введенных ранее данных нажмите на
    ссылку ниже
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
    </div>
<div class="text-article">    
    <form><input type="button" value="Вернуться назад ..." onClick="history.go(-1)"></form>
</div>    
</article>

    <c:if test="${notif ne null}">
            <div class="notif">
                <span>${notif}</span> 
            </div>
    </c:if>
 
</div>


<section>
<p style='text-decoration:underline; font-style:italic;color:#191970;text-align:center'>Отчетные данные по состоянию на: [${report.dateReport}]</p>    


<table border=1 cellpadding=0 cellspacing=0 width=1165 style='border-collapse: collapse;table-layout:fixed;width:875pt'>
 <col style='width:20pt'>
 <col style='width:158pt'>
 <col style='width:32pt'>
 <col style='width:54pt'>
 <col style='width:35pt'>
 <col style='width:49pt'>
 <col style='width:33pt'>
 <col style='width:56pt'>
 <col style='width:36pt'>
 <col style='width:49pt'>
 <col style='width:32pt'>
 <col style='width:56pt'>
 <col style='width:38pt'>
 <col style='width:51pt'>
 <col style='width:32pt'>
 <col style='width:54pt'>
 <col style='width:37pt'>
 <col style='width:53pt'>


 <tr style='height:19.5pt'>
  <td rowspan=4 class=xl7311051 style='height:76.5pt;width:20pt'>№ п/п</td>
  <td rowspan=4 class=xl7411051 style='border-top:none'>Категория транспортных средств</td>
  <td colspan=12 class=xl7511051 style='border-left:none'>Вид собственности</td>
  <td colspan=4 rowspan=2 class=xl7611051 style='width:176pt'>Итого</td>
 </tr>

 <tr style='height:15.0pt'>
  <td colspan=4 class=xl7711051 style='height:15.0pt;border-left:1;width:170pt'>Государственная</td>
  <td colspan=4 class=xl7711051 style='border-left:none;width:174pt'>Муниципальная</td>
  <td colspan=4 class=xl7711051 style='border-left:none;width:177pt'>Коммерческая</td>
 </tr>

 <tr style='height:15.0pt'>
  <td rowspan=2 class=xl7811051 style='height:42.0pt;border-top:1;width:32pt'>всего, шт.</td>
  <td rowspan=2 class=xl7811051 style='border-top:none;width:54pt'>оснащено, шт.</td>
  <td colspan=2 class=xl7811051 style='border-left:none;width:84pt'>подключено, шт.</td>
  <td rowspan=2 class=xl7811051 style='border-top:none;width:33pt'>всего, шт.</td>
  <td rowspan=2 class=xl7811051 style='border-top:none;width:56pt'>оснащено, шт.</td>
  <td colspan=2 class=xl7811051 style='border-left:none;width:85pt'>подключено, шт.</td>
  <td rowspan=2 class=xl7811051 style='border-top:none;width:32pt'>всего, шт.</td>
  <td rowspan=2 class=xl7811051 style='border-top:none;width:56pt'>оснащено, шт.</td>
  <td colspan=2 class=xl7811051 style='border-left:none;width:89pt'>подключено, шт.</td>
  <td rowspan=2 class=xl7811051 style='border-top:none;width:32pt'>всего, шт.</td>
  <td rowspan=2 class=xl7811051 style='border-top:none;width:54pt'>оснащено, шт.</td>
  <td colspan=2 class=xl7811051 style='border-left:none;width:90pt'>подключено, шт.</td>
 </tr>

 <tr style='height:27.0pt'>
  <td class=xl7911051 style='height:27.0pt;border-top:none;border-left:none'>к РНИС</td>
  <td class=xl8011051 style='border-top:none;border-left:none;width:49pt'>другой оператор</td>
  <td class=xl7911051 style='border-top:none;border-left:none'>к РНИС</td>
  <td class=xl8011051 style='border-top:none;border-left:none;width:49pt'>другой оператор</td>
  <td class=xl7911051 style='border-top:none;border-left:none'>к РНИС</td>
  <td class=xl8011051 style='border-top:none;border-left:none;width:51pt'>другой оператор</td>
  <td class=xl7911051 style='border-top:none;border-left:none'>к РНИС</td>
  <td class=xl8011051 style='border-top:none;border-left:none;width:53pt'>другой оператор</td>
 </tr>

<!-- Категория М1 -->
 <tr style='height:15.0pt'>
  <td class=xl6711051 style='height:15.0pt;border-top:none'>1</td>
  <td class=xl6611051 style='border-top:none;border-left:none;width:158pt'>категория<span style='mso-spacerun:yes'>  </span>М1</td>

  <td class=xl6511051 align=right>${report.catM1StateAll}</td>
  <td class=xl6511051 align=right>${report.catM1StateEquip}</td>
  <td class=xl6511051 align=right>${report.catM1StateRNIS}</td>
  <td class=xl6511051 align=right>${report.catM1StateOther}</td>
  
  <td class=xl6511051 align=right>${report.catM1MunicAll}</td>
  <td class=xl6511051 align=right>${report.catM1MunicEquip}</td>
  <td class=xl6511051 align=right>${report.catM1MunicRNIS}</td>
  <td class=xl6511051 align=right>${report.catM1MunicOther}</td>
  
  <td class=xl6511051 align=right>${report.catM1CommercAll}</td>
  <td class=xl6511051 align=right>${report.catM1CommercEquip}</td>
  <td class=xl6511051 align=right>${report.catM1CommercRNIS}</td>
  <td class=xl6511051 align=right>${report.catM1CommercOther}</td>
  
  <td class=xl6511051 align=right>${report.catM1ItogAll}</td>
  <td class=xl6511051 align=right>${report.catM1ItogEquip}</td>
  <td class=xl6511051 align=right>${report.catM1ItogRNIS}</td>
  <td class=xl6511051 align=right>${report.catM1ItogOther}</td>
 </tr>


<!-- Категория М2 и М3 -->
 <tr style='height:15.0pt'>
  <td class=xl6711051 style='height:15.0pt;border-top:none'>2</td>
  <td class=xl6611051 style='border-top:none;border-left:none;width:158pt'>категория М2 и М3</td>

  <td class=xl6511051 align=right>${report.catM2M3StateAll}</td>
  <td class=xl6511051 align=right>${report.catM2M3StateEquip}</td>
  <td class=xl6511051 align=right>${report.catM2M3StateRNIS}</td>
  <td class=xl6511051 align=right>${report.catM2M3StateOther}</td>
  
  <td class=xl6511051 align=right>${report.catM2M3MunicAll}</td>
  <td class=xl6511051 align=right>${report.catM2M3MunicEquip}</td>
  <td class=xl6511051 align=right>${report.catM2M3MunicRNIS}</td>
  <td class=xl6511051 align=right>${report.catM2M3MunicOther}</td>
  
  <td class=xl6511051 align=right>${report.catM2M3CommercAll}</td>
  <td class=xl6511051 align=right>${report.catM2M3CommercEquip}</td>
  <td class=xl6511051 align=right>${report.catM2M3CommercRNIS}</td>
  <td class=xl6511051 align=right>${report.catM2M3CommercOther}</td>
  
  <td class=xl6511051 align=right>${report.catM2M3ItogAll}</td>
  <td class=xl6511051 align=right>${report.catM2M3ItogEquip}</td>
  <td class=xl6511051 align=right>${report.catM2M3ItogRNIS}</td>
  <td class=xl6511051 align=right>${report.catM2M3ItogOther}</td>
 </tr>


<!-- крупногабаритные и тяжеловесные грузы -->
 <tr style='height:30.0pt'>
  <td class=xl6711051 style='height:30.0pt;border-top:none'>3</td>
  <td class=xl6611051 style='border-top:none;border-left:none;width:158pt'>перевозящие крупногабаритные и тяжеловесные грузы</td>

  <td class=xl6511051 align=right>${report.catLargeStateAll}</td>
  <td class=xl6511051 align=right>${report.catLargeStateEquip}</td>
  <td class=xl6511051 align=right>${report.catLargeStateRNIS}</td>
  <td class=xl6511051 align=right>${report.catLargeStateOther}</td>
  
  <td class=xl6511051 align=right>${report.catLargeMunicAll}</td>
  <td class=xl6511051 align=right>${report.catLargeMunicEquip}</td>
  <td class=xl6511051 align=right>${report.catLargeMunicRNIS}</td>
  <td class=xl6511051 align=right>${report.catLargeMunicOther}</td>
  
  <td class=xl6511051 align=right>${report.catLargeCommercAll}</td>
  <td class=xl6511051 align=right>${report.catLargeCommercEquip}</td>
  <td class=xl6511051 align=right>${report.catLargeCommercRNIS}</td>
  <td class=xl6511051 align=right>${report.catLargeCommercOther}</td>
  
  <td class=xl6511051 align=right>${report.catLargeItogAll}</td>
  <td class=xl6511051 align=right>${report.catLargeItogEquip}</td>
  <td class=xl6511051 align=right>${report.catLargeItogRNIS}</td>
  <td class=xl6511051 align=right>${report.catLargeItogOther}</td>
 </tr>


<!-- специальные и опасные грузы -->
 <tr style='height:30.0pt'>
  <td class=xl6711051 style='height:30.0pt;border-top:none'>4</td>
  <td class=xl6611051 style='border-top:none;border-left:none;width:158pt'>перевозящие специальные и опасные грузы</td>

  <td class=xl6511051 align=right>${report.catDangerStateAll}</td>
  <td class=xl6511051 align=right>${report.catDangerStateEquip}</td>
  <td class=xl6511051 align=right>${report.catDangerStateRNIS}</td>
  <td class=xl6511051 align=right>${report.catDangerStateOther}</td>
  
  <td class=xl6511051 align=right>${report.catDangerMunicAll}</td>
  <td class=xl6511051 align=right>${report.catDangerMunicEquip}</td>
  <td class=xl6511051 align=right>${report.catDangerMunicRNIS}</td>
  <td class=xl6511051 align=right>${report.catDangerMunicOther}</td>
  
  <td class=xl6511051 align=right>${report.catDangerCommercAll}</td>
  <td class=xl6511051 align=right>${report.catDangerCommercEquip}</td>
  <td class=xl6511051 align=right>${report.catDangerCommercRNIS}</td>
  <td class=xl6511051 align=right>${report.catDangerCommercOther}</td>
  
  <td class=xl6511051 align=right>${report.catDangerItogAll}</td>
  <td class=xl6511051 align=right>${report.catDangerItogEquip}</td>
  <td class=xl6511051 align=right>${report.catDangerItogRNIS}</td>
  <td class=xl6511051 align=right>${report.catDangerItogOther}</td> 
 </tr>


<!-- школьные автобусы -->
 <tr style='height:15.0pt'>
  <td class=xl6711051 style='height:15.0pt;border-top:none'>5</td>
  <td class=xl6611051 style='border-top:none;border-left:none;width:158pt'>школьные автобусы</td>

  <td class=xl6511051 align=right>${report.catSchoolStateAll}</td>
  <td class=xl6511051 align=right>${report.catSchoolStateEquip}</td>
  <td class=xl6511051 align=right>${report.catSchoolStateRNIS}</td>
  <td class=xl6511051 align=right>${report.catSchoolStateOther}</td>
  
  <td class=xl6511051 align=right>${report.catSchoolMunicAll}</td>
  <td class=xl6511051 align=right>${report.catSchoolMunicEquip}</td>
  <td class=xl6511051 align=right>${report.catSchoolMunicRNIS}</td>
  <td class=xl6511051 align=right>${report.catSchoolMunicOther}</td>
  
  <td class=xl6511051 align=right>${report.catSchoolCommercAll}</td>
  <td class=xl6511051 align=right>${report.catSchoolCommercEquip}</td>
  <td class=xl6511051 align=right>${report.catSchoolCommercRNIS}</td>
  <td class=xl6511051 align=right>${report.catSchoolCommercOther}</td>
  
  <td class=xl6511051 align=right>${report.catSchoolItogAll}</td>
  <td class=xl6511051 align=right>${report.catSchoolItogEquip}</td>
  <td class=xl6511051 align=right>${report.catSchoolItogRNIS}</td>
  <td class=xl6511051 align=right>${report.catSchoolItogOther}</td>
 </tr>


<!-- транспорт ЖКХ -->
 <tr style='height:15.0pt'>
  <td class=xl6711051 style='height:15.0pt;border-top:none'>6</td>
  <td class=xl6611051 style='border-top:none;border-left:none;width:158pt'>транспорт ЖКХ</td>

  <td class=xl6511051 align=right>${report.catGKHStateAll}</td>
  <td class=xl6511051 align=right>${report.catGKHStateEquip}</td>
  <td class=xl6511051 align=right>${report.catGKHStateRNIS}</td>
  <td class=xl6511051 align=right>${report.catGKHStateOther}</td>
  
  <td class=xl6511051 align=right>${report.catGKHMunicAll}</td>
  <td class=xl6511051 align=right>${report.catGKHMunicEquip}</td>
  <td class=xl6511051 align=right>${report.catGKHMunicRNIS}</td>
  <td class=xl6511051 align=right>${report.catGKHMunicOther}</td>
  
  <td class=xl6511051 align=right>${report.catGKHCommercAll}</td>
  <td class=xl6511051 align=right>${report.catGKHCommercEquip}</td>
  <td class=xl6511051 align=right>${report.catGKHCommercRNIS}</td>
  <td class=xl6511051 align=right>${report.catGKHCommercOther}</td>
  
  <td class=xl6511051 align=right>${report.catGKHItogAll}</td>
  <td class=xl6511051 align=right>${report.catGKHItogEquip}</td>
  <td class=xl6511051 align=right>${report.catGKHItogRNIS}</td>
  <td class=xl6511051 align=right>${report.catGKHItogOther}</td>
 </tr>


<!-- ведомственный транспорт -->
 <tr style='mso-height-source:userset;height:60.75pt'>
  <td class=xl6711051 style='height:60.75pt;border-top:none'>7</td>
  <td class=xl6611051 style='border-top:none;border-left:none;width:158pt'>ведомственный транспорт, закрепленный за головной и
  подведомственными организациями</td>

  <td class=xl6511051 align=right>${report.catDepartStateAll}</td>
  <td class=xl6511051 align=right>${report.catDepartStateEquip}</td>
  <td class=xl6511051 align=right>${report.catDepartStateRNIS}</td>
  <td class=xl6511051 align=right>${report.catDepartStateOther}</td>
  
  <td class=xl6511051 align=right>${report.catDepartMunicAll}</td>
  <td class=xl6511051 align=right>${report.catDepartMunicEquip}</td>
  <td class=xl6511051 align=right>${report.catDepartMunicRNIS}</td>
  <td class=xl6511051 align=right>${report.catDepartMunicOther}</td>
  
  <td class=xl6511051 align=right>${report.catDepartCommercAll}</td>
  <td class=xl6511051 align=right>${report.catDepartCommercEquip}</td>
  <td class=xl6511051 align=right>${report.catDepartCommercRNIS}</td>
  <td class=xl6511051 align=right>${report.catDepartCommercOther}</td>
  
  <td class=xl6511051 align=right>${report.catDepartItogAll}</td>
  <td class=xl6511051 align=right>${report.catDepartItogEquip}</td>
  <td class=xl6511051 align=right>${report.catDepartItogRNIS}</td>
  <td class=xl6511051 align=right>${report.catDepartItogOther}</td>
 </tr>


</table>
    
    <br> </br>
  

    
  
      
</section>    

 <%@ include file="/WEB-INF/jspf/footer.jsp" %>
