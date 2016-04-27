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
    <h2>Что нужно для записи отчета</h2>
    <p>Заполните поля числами и нажмите на
    кнопку "Опубликовать отчет". Вы можете сохранить предварительный вариант отчета, нажав на кнопку
    "Сохранить черновик".
    </p>
    <a href="${pageContext.request.contextPath}/">Перейти на главную страницу</a> 
      <br> </br>
</aside>
<article>
    <div class="h1">
    <h1>Ввод данных для нового отчета</h1>
    </div>
    <div class="h2">
    <h2>по пользователю:     ${nameUserReports}</h2>    
    </div>
</article>

    <c:if test="${notif ne null}">
            <div class="notif">
                <span>${notif}</span> 
            </div>
        </c:if>

</div>
    <br> </br> 
<%
//report.dateReport=null;    
%>   
<section>
<form method="POST" action="addReportServlet">

<p style='font-style:bold; color:#191970; text-align:center'>Пожалуйста, выберите отчетную дату:  <input required size="6" type="text" name="dateReport" id="popupDatepicker"> </p>
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
 

 <tr style='height:19.5pt'>
  <td rowspan=4 class=xl7311051 style='height:76.5pt;width:20pt'>№ п/п</td>
  <td rowspan=4 class=xl7411051 style='border-top:none'>Категория транспортных средств</td>
  <td colspan=12 class=xl7511051 style='border-left:none'>Вид собственности</td>  
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
 </tr>

 <tr style='height:27.0pt'>
  <td class=xl7911051 style='height:27.0pt;border-top:none;border-left:none'>к РНИС</td>
  <td class=xl8011051 style='border-top:none;border-left:none;width:49pt'>другой оператор</td>
  <td class=xl7911051 style='border-top:none;border-left:none'>к РНИС</td>
  <td class=xl8011051 style='border-top:none;border-left:none;width:49pt'>другой оператор</td>
  <td class=xl7911051 style='border-top:none;border-left:none'>к РНИС</td>
  <td class=xl8011051 style='border-top:none;border-left:none;width:51pt'>другой оператор</td>
 </tr>

<!-- Категория М1 -->
 <tr style='height:15.0pt'>
  <td class=xl6711051 style='height:15.0pt;border-top:none'>1</td>
  <td class=xl6611051 style='border-top:none;border-left:none;width:158pt'>категория М1</td>

  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM1StateAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM1StateEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM1StateRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM1StateOther"/></td>
  
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM1MunicAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM1MunicEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM1MunicRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM1MunicOther"/></td>
  
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM1CommercAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM1CommercEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM1CommercRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM1CommercOther"/></td>  
 </tr>


<!-- Категория М2 и М3 -->
 <tr style='height:15.0pt'>
  <td class=xl6711051 style='height:15.0pt;border-top:none'>2</td>
  <td class=xl6611051 style='border-top:none;border-left:none;width:158pt'>категория М2 и М3</td>

  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM2M3StateAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM2M3StateEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM2M3StateRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM2M3StateOther"/></td>
  
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM2M3MunicAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM2M3MunicEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM2M3MunicRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM2M3MunicOther"/></td>
  
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM2M3CommercAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM2M3CommercEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM2M3CommercRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catM2M3CommercOther"/></td>
 </tr>


<!-- крупногабаритные и тяжеловесные грузы -->
 <tr style='height:30.0pt'>
  <td class=xl6711051 style='height:30.0pt;border-top:none'>3</td>
  <td class=xl6611051 style='border-top:none;border-left:none;width:158pt'>перевозящие крупногабаритные и тяжеловесные грузы</td>

  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catLargeStateAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catLargeStateEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catLargeStateRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catLargeStateOther"/></td>
  
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catLargeMunicAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catLargeMunicEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catLargeMunicRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catLargeMunicOther"/></td>
  
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catLargeCommercAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catLargeCommercEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catLargeCommercRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catLargeCommercOther"/></td>
 </tr>


<!-- специальные и опасные грузы -->
 <tr style='height:30.0pt'>
  <td class=xl6711051 style='height:30.0pt;border-top:none'>4</td>
  <td class=xl6611051 style='border-top:none;border-left:none;width:158pt'>перевозящие специальные и опасные грузы</td>

  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDangerStateAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDangerStateEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDangerStateRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDangerStateOther"/></td>
  
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDangerMunicAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDangerMunicEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDangerMunicRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDangerMunicOther"/></td>
  
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDangerCommercAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDangerCommercEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDangerCommercRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDangerCommercOther"/></td>
 </tr>


<!-- школьные автобусы -->
 <tr style='height:15.0pt'>
  <td class=xl6711051 style='height:15.0pt;border-top:none'>5</td>
  <td class=xl6611051 style='border-top:none;border-left:none;width:158pt'>школьные автобусы</td>

  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catSchoolStateAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catSchoolStateEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catSchoolStateRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catSchoolStateOther"/></td>
  
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catSchoolMunicAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catSchoolMunicEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catSchoolMunicRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catSchoolMunicOther"/></td>
  
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catSchoolCommercAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catSchoolCommercEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catSchoolCommercRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catSchoolCommercOther"/></td>
 </tr>


<!-- транспорт ЖКХ -->
 <tr style='height:15.0pt'>
  <td class=xl6711051 style='height:15.0pt;border-top:none'>6</td>
  <td class=xl6611051 style='border-top:none;border-left:none;width:158pt'>транспорт ЖКХ</td>

  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catGKHStateAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catGKHStateEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catGKHStateRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catGKHStateOther"/></td>
  
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catGKHMunicAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catGKHMunicEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catGKHMunicRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catGKHMunicOther"/></td>
  
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catGKHCommercAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catGKHCommercEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catGKHCommercRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catGKHCommercOther"/></td>
 </tr>


<!-- ведомственный транспорт -->
 <tr style='mso-height-source:userset;height:60.75pt'>
  <td class=xl6711051 style='height:60.75pt;border-top:none'>7</td>
  <td class=xl6611051 style='border-top:none;border-left:none;width:158pt'>ведомственный транспорт, закрепленный за головной и
  подведомственными организациями</td>

  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDepartStateAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDepartStateEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDepartStateRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDepartStateOther"/></td>
  
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDepartMunicAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDepartMunicEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDepartMunicRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDepartMunicOther"/></td>
  
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDepartCommercAll"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDepartCommercEquip"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDepartCommercRNIS"/></td>
  <td class=xl6511051 align=right><input type="text" size="1" maxlength="4" placeholder="0" pattern="[0-9]{1,4}" name="catDepartCommercOther"/></td>
 </tr>

</table>

    <p>    
	<input type="button" value="Вернуться назад ..." onClick="history.go(-1)">
        <button type="submit" name="saveDraft">Сохранить черновик</button>
        <button type="submit" name="publicReport">Опубликовать отчет</button>
    </p>    
</form>
  
      
</section>    

