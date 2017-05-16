<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Shoes Store</title>
    <link href="../../css/templatemo_style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/ddsmoothmenu.js">
    </script>
    <script type="text/javascript">
        ddsmoothmenu.init({
            mainmenuid: "top_nav", //menu DIV id
            orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
            classname: 'ddsmoothmenu', //class added to menu's outer DIV
            //customtheme: ["#1c5a80", "#18374a"],
            contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
        })
    </script>
</head>
<body>


<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">
        <jsp:include page="top.jsp"/>
        <c:if test="${mainPage == null || $mainPage==''}">
            <jsp:include page="main.jsp"/>
        </c:if>
        <c:if test="${mainPage != null && $mainPage!=''}">
            <jsp:include page="${mainPage}"/>
        </c:if>

        <jsp:include page="footer.jsp"/>

    </div>
</div>

</body>
</html>