<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Insert title here</title>
    <link href="../css/templatemo_style.css" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="screen"/>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
</head>
<body>
<div id="templatemo_login">
    <br>
  <h4>&nbsp;&nbsp; <font color="black">Hi ${sessionScope.admin.adminName } ,欢迎登陆 Online Shoes Store 管理系统</font></h4>

</div>
</body>
</html>
