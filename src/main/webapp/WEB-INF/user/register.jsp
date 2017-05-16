<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Insert title here</title>
    <link href="../css/templatemo_style.css" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="screen"/>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/ddsmoothmenu.js"></script>
    <script class="resources library" src="../js/area.js" type="text/javascript"></script>
</head>
<body>
<div id="templatemo_main">
    <div class="container-fluid">
        <form class="form-horizontal" role="form" method="post">
            <div style="margin-bottom: 30px; overflow: hidden">
                <label class="col-lg-offset-2 col-lg-2 control-label">用户名</label>
                <div class="col-lg-4">
                    <input type="text" class="form-control">
                </div>
            </div>
            <div style="margin-bottom: 30px; overflow: hidden">
                <label class="col-lg-offset-2 col-lg-2 control-label">密 &nbsp;&nbsp;码</label>
                <div class="col-lg-4">
                    <input type="password" class="form-control">
                </div>
            </div>
            <div style="margin-bottom: 30px; overflow: hidden">
                <label class="col-lg-offset-2 col-lg-2 control-label">确认密码</label>
                <div class="col-lg-4">
                    <input type="password" class="form-control">
                </div>
            </div>
            <div style="margin-bottom: 30px; overflow: hidden">
                <label class="col-lg-offset-2 col-lg-2 control-label">真实姓名</label>
                <div class="col-lg-4">
                    <input type="text" class="form-control">
                </div>
            </div>
            <div style="margin-bottom: 30px; overflow: hidden">
                <label class="col-lg-offset-2 col-lg-2 control-label">性别</label>
                <div class="radio">
                    <label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp<input type="radio" name="gender" id="man" value="男" checked>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </label>
                    <label>
                        <input type="radio" name="gender" id="woman" value="女">女
                    </label>
                </div>
            </div>
            <div style="margin-bottom: 30px; overflow: hidden">
                <label class="col-lg-offset-2 col-lg-2 control-label">手机</label>
                <div class="col-lg-4">
                    <input type="text" class="form-control">
                </div>
            </div>
            <div style="margin-bottom: 30px; overflow: hidden">
                <label class="col-lg-offset-2 col-lg-2 control-label">收货地址</label>
                <div class="col-lg-4">
                    <select style="height: 30px" id="s_province" name="s_province"></select>  
                    <select style="height: 30px" id="s_city" name="s_city" ></select>  
                    <select style="height: 30px" id="s_county" name="s_county"></select>
                    <script type="text/javascript">_init_area();</script>
                </div>
            </div>
            <div style="margin-bottom: 30px; overflow: hidden">
                <label class="col-lg-offset-2 col-lg-2 control-label">详细地址</label>
                <div class="col-lg-4">
                    <input type="text" class="form-control">
                </div>
            </div>
            <div style="margin-bottom: 30px; overflow: hidden">
                <div class=" col-lg-offset-4 ">
                    <button type="button" class="btn col-lg-5 btn-success">注册</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
