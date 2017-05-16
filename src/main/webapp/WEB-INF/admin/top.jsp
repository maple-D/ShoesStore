<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                <p>
                    Hi, ${sessionScope.admin.adminName } |  <a href="/admin/adminExit.action">退出</a>
                </p>
            </div>
            <div class="cleaner"></div>
        </div> <!-- END of templatemo_header -->

        <div id="admin_menubar">
            <div id="top_nav" class="ddsmoothmenu">
                <ul>
                    <li><a class="selected">首页</a></li>
                    <li><a>商品管理</a>
                        <ul>
                            <li><a href="/admin/goodsUploads.action" >商品上架</a> </li>
                            <li><a href="#" >商品管理</a> </li>
                        </ul>
                    </li>
                    <li><a>客户管理</a>
                        <ul>
                            <li><a href="#" >查看客户</a> </li>
                        </ul>
                    </li>
                    <li><a>资金管理</a>
                        <ul>
                            <li><a href="#" >查看资金</a> </li>
                        </ul>
                    </li>
                    <li><a>订单管理</a>
                        <ul>
                            <li><a href="/admin/queryAllOrders.action"> 全部订单</a> </li>
                            <li><a href="#" >未处理订单</a> </li>
                        </ul>
                    </li>
                </ul>
                <br style="clear: left"/>
            </div>
        </div>
        </div>
    </div>
</body>
</html>
