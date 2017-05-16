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
    <title>Insert title here</title>
    <link href="../css/templatemo_style.css" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="screen"/>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
</head>
<body>
<div id="templatemo_login">
    <div class="container-fluid">
        <form class="form-horizontal" action="login.action" role="form" method="post">
            <div style="margin-bottom: 30px; overflow: hidden">
                <label class="col-lg-offset-2 col-lg-2 control-label">用户名</label>
                <div class="col-lg-4">
                    <input type="text" name="username" class="form-control">
                </div>
            </div>
            <div style="margin-bottom: 30px; overflow: hidden">
                <label class="col-lg-offset-2 col-lg-2 control-label">密 &nbsp;&nbsp;码</label>
                <div class="col-lg-4">
                    <input type="password" name="password" class="form-control">
                </div>
            </div>
            <div style="margin-bottom: 30px; overflow: hidden">
                <div class=" col-lg-offset-4 ">
                    <input type="submit" class="btn col-lg-5 btn-success" value="登录">
                </div>
            </div>
        </form>
            <div style="margin-bottom: 30px; overflow: hidden">
                <div class=" col-lg-offset-4 ">
                  <a href="/toRegister.action">  <button type="button" class="btn col-lg-5 btn-default">创建新账号</button></a>
                </div>
            </div>

    </div>
</div>
</body>
</html>
