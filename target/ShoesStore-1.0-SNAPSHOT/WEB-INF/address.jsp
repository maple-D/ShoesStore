<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <link href="../css/templatemo_style.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="screen"/>
    <script type="text/javascript" src="../js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.js"></script>
    <script class="resources library" src="../js/jsAddress.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
           var province = $("#h_province").val().trim();
            var city = $("#h_city").val().trim();
            var area = $("#h_area").val().trim();
            if(province == null ||  province == ''){
                addressInit('province', 'city', 'area', '北京', '市辖区', '东城区');
            }else{
                addressInit('province', 'city', 'area', province, city, area);
             }
            $("#address").validate({
                rules: {
                    consignee: {
                        required:true
                    },
                    addressPhone: {
                        required: true,
                        digits:true,
                        rangelength:[11,11]
                    },
                    postcode: {
                        required:true,
                    },
                    particularAddress: {
                        required:true,
                    },
                },
                messages: {
                    consignee: {
                        required: "请输入收件人姓名",
                    },
                    addressPhone: {
                        required:"请输入手机号码",
                        digits:"请输入正确格式的手机号码",
                        rangelength:"请输入正确格式的手机号码"
                    },
                    postcode: {
                        required:"请输入邮编",
                    },
                    particularAddress: {
                        required:"请输入详细地址",
                    },
                },

            });




        })

    </script>

</head>
<body>
<div id="templatemo_main">

    <h1>收货地址</h1>
    <div class="container-fluid">
        <form id="address" action="/saveAddress.action" class="form-horizontal" role="form" method="post">
            <div style="margin-bottom: 30px; overflow: hidden">
                <label class="col-lg-offset-2 col-lg-2 control-label">收货人姓名</label>
                <div class="col-lg-4">
                    <input type="text" id="consignee" name="consignee" value="${address.consignee}" class="form-control">
                </div>
            </div>
            <div style="margin-bottom: 30px; overflow: hidden">
                <label class="col-lg-offset-2 col-lg-2 control-label">手机号码</label>
                <div class="col-lg-4">
                    <input type="text" id="addressPhone" name="addressPhone"value="${address.addressPhone}" class="form-control">
                </div>
            </div>
            <div style="margin-bottom: 30px; overflow: hidden">
                <label class="col-lg-offset-2 col-lg-2 control-label">邮编</label>
                <div class="col-lg-4">
                    <input type="text" id="postcode" name="postcode"value=" ${address.postcode}" class="form-control">
                </div>
            </div>
            <div style="margin-bottom: 30px; overflow: hidden">
                <label class="col-lg-offset-2 col-lg-2 control-label">收货地址</label>
                <div class="col-lg-8">
                    <select style="height: 30px" id="province" name="province"></select>  
                    <select style="height: 30px" id="city" name="city" ></select>  
                    <select style="height: 30px" id="area" name="area"></select>
                    <input type="hidden" value="${address.province}" id="h_province"/>
                    <input type="hidden" value="${address.city}" id="h_city"/>
                    <input type="hidden" value="${address.area}" id="h_area"/>
                </div>
            </div>
            <div style="margin-bottom: 30px; overflow: hidden">
                <label class="col-lg-offset-2 col-lg-2 control-label">详细地址</label>
                <div class="col-lg-4">
                    <textarea rows="3" cols="45" id="particularAddress" name="particularAddress" class="form-control">${address.particularAddress} </textarea>
                </div>
            </div>
            <div style="margin-bottom: 30px; overflow: hidden">
                <div class=" col-lg-offset-4 ">
                    <input type="hidden" value="${address.addressId}" name="addressId" id="addressId"/>
                    <button type="submit" class="btn col-lg-5 btn-success">保存</button>
                </div>
            </div>
        </form>
    </div>
    <table width="880px" cellspacing="0" cellpadding="5">
        <tr bgcolor="#483d8b">
            <th width="40" align="left">收货人 </th>
            <th width="180" align="left"> 所在地区</th>
            <th width="180" align="right">详细地区 </th>
            <th width="100" align="left">邮编 </th>
            <th width="60" align="right">手机 </th>
            <th width="60" align="right">操作 </th>
        </tr>
        <c:forEach items="${addressList}" var="addr">
            <tr>
                <td>${addr.consignee}</td>
                <td>${addr.province}${addr.city}${addr.area}</td>
                <td>${addr.particularAddress} </td>
                <td>${addr.postcode} </td>
                <td>${addr.addressPhone} </td>
                <td>
                    <a href="/toUpdateAddress.action?addressId=${addr.addressId}">修改</a>
                    /<a href="/deleteAddress.action?addressId=${addr.addressId}" >删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div style="float:right; width: 215px; margin-top: 20px;">

        <p><a href="javascript:history.back()">Continue shopping</a></p>

    </div>
    <div class="cleaner h30"></div>

</div>
</body>
</html>
