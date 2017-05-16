<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Insert title here</title>
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="screen"/>
    <script type="text/javascript" src="../js/jquery-1.8.0.min.js"></script>
</head>
<body>
<div id="templatemo_main">
<h1>订单详情</h1>
<table class="table">
    <tr>
        <td> 收货地址：</td>
        <td>${order.address.province}${order.address.city}${order.address.area}${order.address.particularAddress}(${order.address.consignee}
            收)
        </td>
    </tr>
    <tr>
        <td> 手 &nbsp;&nbsp;机：</td>
        <td>${order.address.addressPhone}</td>
    </tr>
    <tr>
        <td>订单编号：</td>
        <td>${order.orderId}</td>
    </tr>
    <tr>
        <td>创建时间：</td>
        <td><fmt:formatDate value="${order.oderCreatTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    </tr>
    <c:if test="${order.orderEmpressId != ''&& order.orderEmpressId != null}">
        <tr>
            <td>快递单号：</td>
            <td>${order.orderEmpressId}</td>
        </tr>
    </c:if>
        </table>
    <div class="cleaner h30"></div>
    <br><br>
    <table width="880px" cellspacing="0" cellpadding="" >
    <tr bgcolor="black" >
    <th width="180" height="30" align="left">商品信息 </th>
    <th width="180" align="left"> </th>
    <th width="100" align="right">尺码 </th>
    <th width="100" align="left">数量 </th>
    <th width="60" align="right">单价 </th>
    <th width="60" align="right">实付款 </th>
    <th width="60" align="right">交易状态 </th>
    </tr>
    <c:forEach items="${order.orderItems}" var="orderitem" varStatus="item">
        <tr>
            <td><a href="/goodsDetail.action?goodsId=${orderitem.goods.goodsId}"><img
                    src="${orderitem.goods.goodsPicture}"/></a></td>
            <td>${orderitem.goods.goodsName}</td>
            <td align="left">${orderitem.goodsInventory.goodsSize} </td>
            <td align="left">${orderitem.orderGoodsCount}</td>
            <td align="left">${orderitem.goods.goodsSalePrice} </td>
            <c:if test="${item.index == 0}">
                <td align="left">${order.totalCost}</td>
                <c:if test="${order.orderStatusId == 1}">
                    <td align="left">待发货</td>
                </c:if>
                <c:if test="${order.orderStatusId == 2}">
                    <td align="left">待发货</td>
                </c:if>
            </c:if>
        </tr>
    </c:forEach>
</table>
    <div class="cleaner h50"></div>
    </div>
    </body>
    </html>
