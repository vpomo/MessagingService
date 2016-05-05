<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ui.jqgrid.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/theme.css">
    <!--
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap-theme.min.css">
    -->

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/i18n/grid.locale-ru.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.jqGrid.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>

<header>
    <a href="${pageContext.request.contextPath}"><img alt="Логотип" id="top-image"
                                                      src="${pageContext.request.contextPath}/resources/image/logo.jpg"/></a>
    <div id="user-panel">
        <p>Служба обмена электронными сообщениями</p>
    </div>
</header>

<div id="main">

    <aside class="leftAside">
        <h2>Просмотр сообщений</h2>
        <p>Для просмотра сообщения кликните по нему мышкой.
        </p>
        <a href="${pageContext.request.contextPath}/">Перейти на главную страницу</a>
        <br> </br>
    </aside>
    <article>
        <div class="h2">
            <h2>Список сообщений</h2>

        </div>

        <div class="text-article">
            <br>
            <table id="jqGridMain"></table>
            <div id="jqGridPagerMain"></div>
            <br>
        </div>
    </article>

    <c:if test="${notif ne null}">
        <div class="notif">
            <span>${notif}</span>
        </div>
    </c:if>

</div>


<section>
    <c:forEach var="user" items="${users}">

        <a href="common?idrep=${user.login}"> [${user.login}]</a>

    </c:forEach>

</section>

<script type="text/javascript">
    $(document).ready(function () {
        $("#jqGridMain").jqGrid({
            //url: '$users',
            // we set the changes to be made at client side using predefined word clientArray
            editurl: 'http://localhost:8080/common',
            datatype: "json",
            colModel: [
                {
                    label: 'От кого',
                    name: 'login',
                    width: 75,
                    key: true,
                    editable: true,
                    editrules: {required: true}
                },
                {
                    label: 'ФИО',
                    name: 'nameUser',
                    width: 140,
                    editable: true // must set editable to true if you want to make the field editable
                },
                {
                    label: 'Роль в системе',
                    name: 'groupUser',
                    width: 100,
                    editable: true,
                    edittype: "select",
                    editoptions: {
                        value: "user:user;admin:admin"
                    }
                },
                {
                    label: 'E-mail',
                    name: 'email',
                    width: 140,
                    editable: true
                },
                {
                    label: 'Пароль',
                    name: 'password',
                    width: 80,
                    editable: true
                }
            ],
            sortname: 'login',
            sortorder: 'asc',
            loadonce: true,
            viewrecords: true,
            width: 780,
            height: 200,
            rowNum: 10,
            pager: '#jqGridPagerMain'
        });
        $('#jqGridMain').jqGrid('navGrid', '#jqGridPagerMain',
                // the buttons to appear on the toolbar of the grid
                {
                    edit: true,
                    add: true,
                    del: true,
                    search: false,
                    refresh: true,
                    view: false,
                    position: "left",
                    cloneToTop: false
                },
                // options for the Edit Dialog
                {
                    editCaption: "The Edit Dialog",
                    recreateForm: true,
                    checkOnUpdate: true,
                    checkOnSubmit: true,
                    closeAfterEdit: true,
                    errorTextFormat: function (data) {
                        return 'Error: ' + data.responseText
                    }
                },
                // options for the Add Dialog
                {
                    closeAfterAdd: true,
                    recreateForm: true,
                    errorTextFormat: function (data) {
                        return 'Error: ' + data.responseText
                    }
                },
                // options for the Delete Dailog
                {
                    msg: "Delete selected record(s)?",
                    url: 'http://localhost:8080/common',
                    reloadAfterSubmit: false,
                    delData: {
                        login: function () {
                            var grid = $("#jqGridMain");
                            var rowKey = grid.jqGrid('getGridParam', "selrow");
                            return rowKey;
                        }
                    }
                },
                {
                    errorTextFormat: function (data) {
                        return 'Error: ' + data.responseText
                    }
                });

    });
</script>

</body>
</html>