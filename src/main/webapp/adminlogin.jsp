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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>后台登录</title>
    <link href="css/login.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/admin/adminlogin.js"></script>
</head>
<body>

<div class="login">
    <div class="message">Online Shoes Store - 管理登录</div>
    <div id="darkbannerwrap"></div>
    <form action="/admin/adminLogin.action" method="post">
        <input id="adminName" name="adminName" placeholder="用户名" value="${adminName}"  type="text">
        <p style="color: red">${errormessage}</p>
        <hr class="hr15">
        <input id="adminPassword" name="adminPassword" placeholder="密码"  type="password">
        <p style="color: red"> </p>
        <hr class="hr15">
        <input value="登录" style="width:100%;" id="submit" type="submit">
        <hr class="hr20">
    </form>
</div>
<div class="copyright"> Copyright &copy; 2017  All Rights Reserved</div>
</body>
</html>