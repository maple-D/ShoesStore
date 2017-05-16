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
    <title>用户注册</title>
    <link href="css/login.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#userRegister").validate({
                rules: {
                    username: {
                        required:{
                            depends:function(){
                                $(this).val($.trim($(this).val()));
                                return true;
                            }
                        },
                        checkUsername:true,
                    },
                    password: {
                        required: {
                            depends:function(){
                                $(this).val($.trim($(this).val()));
                                return true;
                            }
                        },
                        minlength: 6,
                    },
                    repassword: {
                        required:true,
                        equalTo:"#password",

                    },
                },
                messages: {
                    username: {
                        required: "请输入用户名",
                    },
                    password: {
                        required:"请输入密码",
                        minlength:"请输入6个或更多字符，前后空格将被忽略"
                    },
                    repassword: {
                        required:"请输入确认密码",
                        equalTo:"请确认密码一致"
                    },
                },

            });
            var flag = true;
            jQuery.validator.addMethod("checkUsername", function(value,element) {
                $.ajaxSetup({async:false});
                var  name = value;
                var url = "/user/checkUsername.action";
                var sendData = {"username":name};
                $.post(url,sendData,function(data){
                    if(data >0){
                        flag =  false;
                    }else {
                        flag =  true;
                    }
                })
                if (flag == true){
                    return true;
                }else {
                    return false;
                }
            },"该用户名已存在");
        });
    </script>
</head>
<body>

<div class="login">
    <a href="index.jsp"><div class="message">Online Shoes Store</div></a>
    <div id="darkbannerwrap"></div>

    <form id="userRegister" action="/user/userRegister.action"  method="post">
        <input name="username" id="username" placeholder="用户名"  type="text">
        <p></p>
        <hr class="hr15">
        <input name="password" id="password" placeholder="密码" type="password">
        <hr class="hr15">
        <input name="repassword" id="repassword" placeholder="确认密码" type="password">
        <hr class="hr15">
        <input value="注册" style="width:100%;" type="submit">
        <hr class="hr20">
    </form>
</div>
<div class="copyright"> Copyright &copy; 2017  All Rights Reserved</div>
</body>
</html>