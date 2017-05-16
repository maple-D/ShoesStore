<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Shoes Store, free template</title>
    <meta name="keywords" content="shoes store, free template, ecommerce, online shop, website templates, CSS, HTML"/>
    <meta name="description" content="Shoes Store is a free ecommerce template provided "/>
    <link href="../../css/templatemo_style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="../../css/nivo-slider.css" type="text/css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="../../css/ddsmoothmenu.css"/>
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/ddsmoothmenu.js"></script>
</head>
<body>
<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">
        <div id="templatemo_header">
            <div id="site_title"><h1><a href="">Online Shoes Store</a></h1></div>
            <div id="header_right">
                    <c:if test="${sessionScope.user.username == null || sessionScope.user.username == ''}">
                    <a href="../userlogin.jsp">登录 / 注册</a>
                    </c:if>
                    <c:if test="${sessionScope.user.username != null && sessionScope.user.username != ''}">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        Hi, &nbsp;&nbsp;${sessionScope.user.username} | <a href="/toCart.action">购物车</a> |  <a href="/user/userExit.action">退出</a>
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br><br>
                        <a href="/toUpdatePassword.action">修改密码</a> | <a href="/toOrder.action">订单中心</a> | <a href="/toAddress.action">地址管理</a>
                    </c:if>
            </div>
            <div class="cleaner"></div>
        </div>

        <div id="templatemo_menubar">
            <div id="top_nav" class="ddsmoothmenu">
                <ul>
                    <li><a href="/index.jsp" >主页</a></li>
                    <li><a href="/queryGoodsList.action">全部商品</a></li>
                    <li><a href="">女子</a>
                        <ul>
                            <li><a href="">跑步</a></li>
                            <li><a href="#">篮球</a></li>
                            <li><a href="#">户外</a></li>
                        </ul>
                    </li>
                </ul>
                <br style="clear: left"/>
            </div> <!-- end of ddsmoothmenu -->
            <div id="templatemo_search">
                <form action="/queryGoodsList.action" method="post">
                    <input type="text" value=" " name="keyword" id="keyword" title="keyword" class="txt_field"/>
                    <input type="submit" name="Search" value=" " alt="Search" id="searchbutton" title="Search"
                           class="sub_btn"/>
                </form>
            </div>
        </div> <!-- END of templatemo_menubar -->
        </div>
    </div>
</body>
</html>
