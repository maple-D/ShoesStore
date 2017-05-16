<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Insert title here</title>
    <link href="../../css/templatemo_style.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="../../css/bootstrap.css" rel="stylesheet" type="text/css" media="screen"/>
    <script type="text/javascript" src="../../js/jquery-1.8.0.min.js"></script>
</head>
<body>
<div id="templatemo_main">
    <h1>订单列表</h1>
    <table width="880px" cellspacing="0"  cellpadding="" >
        <tr bgcolor="black" >
            <th width="180" height="30" align="left">商品信息 </th>
            <th width="180" align="left"> </th>
            <th width="100" align="right">尺码 </th>
            <th width="100" align="left">数量 </th>
            <th width="60" align="right">单价 </th>
            <th width="60" align="right">总计 </th>
            <th width="60" align="right">交易状态 </th>
            <th width="60" align="right">交易操作 </th>
        </tr>
        <c:forEach items="${ordersList}" var="order" >
            <tr >
                <th width="220" colspan="8" align="left">&nbsp;</th>
            </tr>
             <tr bgcolor="#87ceeb">
                <th width="180" align="left"><fmt:formatDate value="${order.oderCreatTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </th>
                <th width="180"  align="left"><a href="/orderDetails.action?orderId=${order.orderId}">订单编号：${order.orderId} </a></th>
                <th colspan="6" align="left"></th>
            </tr>
            <c:forEach items="${order.orderItems}" var="orderitem" varStatus="item"  >
                <tr>
                    <td>${orderitem.goods.goodsId}</td>
                    <td>${orderitem.goods.goodsName}</td>
                    <td align="left">${orderitem.goodsInventory.goodsSize} </td>
                    <td align="left">${orderitem.orderGoodsCount}</td>
                    <td align="left" >${orderitem.goods.goodsSalePrice} </td>
                    <c:if test="${item.index == 0}">
                    <td align="left" >${order.totalCost}</td>
                        <c:if test="${order.orderStatusId == 1}">
                            <td align="left" >待发货</td>
                            <td align="left"><a>确认发货</a></td>
                        </c:if>
                        <c:if test="${order.orderStatusId == 2}">
                            <td align="left" >待发货</td>
                            <td align="left"></td>
                        </c:if>
                    </c:if>
                </tr>
            </c:forEach>
        </c:forEach>
    </table>
    <div class="cleaner h30"></div>

</div>
</body>
</html>
