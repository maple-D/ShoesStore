<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Insert title here</title>
    <link href="../css/templatemo_style.css" rel="stylesheet" type="text/css"/>
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="screen"/>
    <script type="text/javascript" src="../js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#updatePassword").validate({
                rules: {
                    password: {
                        required: {
                            depends:function(){
                                $(this).val($.trim($(this).val()));
                                return true;
                            }
                        },
                        checkPassword:true,
                    },
                    newPassword: {
                        required: {
                            depends:function(){
                                $(this).val($.trim($(this).val()));
                                return true;
                            }
                        },
                        minlength: 6,
                    },
                    confirmPassword: {
                        required:true,
                        equalTo:"#newPassword",
                    },
                },
                messages: {
                    password: {
                        required: "请输入原密码",
                    },
                    newPassword: {
                        required:"请输入新密码",
                        minlength:"请输入6个或更多字符，前后空格将被忽略"
                    },
                    confirmPassword: {
                        required:"请输入确认密码",
                        equalTo:"请确认密码一致"
                    },
                },

            });
            var flag = true;
            jQuery.validator.addMethod("checkPassword", function(value,element) {
                $.ajaxSetup({async:false});
                var username = $("#username").val();
                var  password = value;
                var url = "/user/checkPassword.action";
                var sendData = {"password":password,"username":username};
                $.post(url,sendData,function(data){
                    if(data >0){
                        flag =  true;
                    }else {
                        flag =  false;
                    }
                })
                if (flag == true){
                    return true;
                }else {
                    return false;
                }
            },"请输正确的密码");


        })
    </script>
</head>
<body>
<div id="templatemo_login">
    <h1>修改密码</h1>
    <div class="container-fluid">
        <form id="updatePassword" style="width: 50%;margin-left: 20% " class="form-horizontal"
              action="/updatePassword.action" method="post" >
            <div class="form-group">
                <label class="col-lg-4 control-label">原密码:</label>
                <div class="col-lg-5">
                    <input type="text" name="password" id="password" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-4 control-label">新密码:</label>
                <div class="col-lg-5">
                    <input type="password" name="newPassword" id="newPassword" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-4 control-label">确认新密码:</label>
                <div class="col-lg-5">
                    <input type="password" name="confirmPassword" id="confirmPassword" class="form-control">
                </div>
            </div>
            <input type="hidden" id="username" name="username" value="${sessionScope.user.username}" >
            <input type="hidden" id="userid" name="userid" value="${sessionScope.user.userid}" >

            <div>
                <div style="margin-left: 36%">
                    <input type="submit" class="btn col-lg-5 btn-success" value="修改密码" id="submit"></input>
                </div>
            </div>
        </form>
        <br><br><br><br>
    </div>
</div>
</body>
</html>
