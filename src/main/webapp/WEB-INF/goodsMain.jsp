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
    <script type="text/javascript">
        $(function () {
            if (${page.pageNo == 1}){
                $("#previousPage").attr("disabled",true)
            }
            if (${page.pageNo == page.totalPageNumber}){
                $("#nextPage").attr("disabled",true)
            }

            $("#skipPage").click(function () {
                var skipPageNo = $("#skipPageNo").val();
                if ("" != skipPageNo && skipPageNo>= 1 && skipPageNo <= ${page.totalPageNumber}){
                    window.location.href="/queryGoodsList.action?pageNo="+skipPageNo;
                }
            })

            $(".btn-info").click(function () {
                var id = $(this).next().val();
                var size =$(this).prev().val();
                var url = "/addToCart.action";
                var sendData = {"goodsId":id,"goodsSize":size,"cartGoodsCount":1};
                $.post(url,sendData,function(data){
                    if (data == -2){
                       alert("请登录之后，再添加购物车")
                   } else if (data == -1){
                       alert("该尺码库存不足，添加失败")
                   }else {
                        alert("添加成功")
                    }
                })
            })

        })


    </script>
</head>
<body>
<div id="templatemo_main">
    <c:forEach items="${page.list}" var="goods">
        <div  class="product_box">
            <a href="/goodsDetail.action?goodsId=${goods.goodsId}"><img src="${goods.goodsPicture}" height="150" width="200" alt="Shoes 6"/></a>
            <p class="product_price">￥ ${goods.goodsSalePrice}</p>
            <p>${goods.goodsName}</p>
            <select  style="width: 60px;height: 25px;">
                <c:forEach items="${goods.goodsInventoryList}" var="goodsInventory">
                    <option value="${goodsInventory.goodsSize}">${goodsInventory.goodsSize}</option>
                </c:forEach>
            </select>
            <button id="cart" type="button" class="btn btn-info  btn-sm" style=" font-size: 10px;float: right;">添加购物车</button></a>
            <input type="hidden" value="${goods.goodsId}">
        </div>
    </c:forEach>
    <div class="cleaner"></div>
    <c:if test="${page.totalPageNumber != 1}" >
    <div align="center">
        <button id="previousPage" onclick="window.location.href='/queryGoodsList.action?pageNo=${page.pageNo-1}'">上一页</button>
        <button id="nextPage" onclick="window.location.href='/queryGoodsList.action?pageNo=${page.pageNo+1}'">下一页</button>
        第${page.pageNo}页
        共${page.totalPageNumber}页
        跳转至<input type="text" id="skipPageNo" style="width: 30px" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">页
        <button id="skipPage">确定</button>
    </a>
    </c:if>
</div>
</body>
</html>
