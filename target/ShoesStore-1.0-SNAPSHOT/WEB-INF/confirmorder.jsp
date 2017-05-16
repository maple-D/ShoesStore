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
            $(":radio :first").attr("checked", true)
            var total = 0;
            $(".subtotal").each(function () {
                total += Number($(this).text());
            })
            $("font :last").text(total)
            $("#totalCost").val(total)
        })
    </script>
</head>
<body>
<div id="templatemo_main">

    <form action="/createOrder.action" method="post">
        <h3>确认收货地址</h3>
        <c:forEach items="${addressList}" var="address">
            <div class="radio">
                <label>
                    <input type="radio" name="address.addressId" value="${address.addressId}">
                        ${address.province}${address.city}${address.area}
                        ${address.particularAddress}
                    (${address.consignee} 收)
                        ${address.addressPhone}<br/>
                </label>
            </div>
        </c:forEach>
        <br><br><br>
        <h3>确认订单信息</h3>


        <table width="850px" cellspacing="0" cellpadding="5">
            <tr bgcolor="black">
                <th width="220" align="left">商品信息</th>
                <th width="180" align="left"></th>
                <th width="100" align="right">尺码</th>
                <th width="100" align="left">数量</th>
                <th width="60" align="right">单价</th>
                <th width="60" align="right">小计</th>
                <th width="6" align="right"></th>
            </tr>
            <c:forEach items="${shoppingCartList}" var="shoppingcart" varStatus="status">
                <tr>
                    <td><img src="${shoppingcart.goods.goodsPicture}"/></td>
                    <td>${shoppingcart.goods.goodsName}</td>
                    <td align="left">${shoppingcart.goodsInventory.goodsSize} </td>
                    <td align="left">${shoppingcart.cartGoodsCount}</td>
                    <td align="left">${shoppingcart.goods.goodsSalePrice} </td>
                    <td align="left" class="subtotal">${shoppingcart.subtotal}</td>
                        <td>
                            <input type="hidden" name="orderItems[${status.index}].goods.goodsId" value="${shoppingcart.goods.goodsId}">
                            <input type="hidden" name="orderItems[${status.index}].goodsInventory.goodsSize" value="${shoppingcart.goodsInventory.goodsSize}">
                            <input type="hidden" name="orderItems[${status.index}].orderGoodsCount" value="${shoppingcart.cartGoodsCount}">
                            <input type="hidden" name="orderItems[${status.index}].orderPrice" value="${shoppingcart.subtotal}">
                            <input type="hidden" name="orderItems[${status.index}].user.userid" value="${sessionScope.user.userid}">
                        </td>
                </tr>
            </c:forEach>
            <tr>
                <td>
                    付款方式：<input type="radio" checked> 货到付款
                </td>
            </tr>
            <tr>
                <td colspan="4" align="right" height="30px">总价：
                    <font style=" font-weight: bold;" color="red" size="4">￥</font>
                    <font style=" font-weight: bold;" color="red" size="4">0</font>&nbsp;&nbsp;
                    <input type="hidden" id="totalCost" name="totalCost" >
                    <input type="hidden" name="user.userid" value="${sessionScope.user.userid}">
                    <input type="hidden" name="user.userid" value="${sessionScope.user.userid}">
                    <c:forEach items="${cartIds}" var="cartId">
                        <input type="hidden" name="cartId" value="${cartId}">
                    </c:forEach>
                </td>
                <td colspan="3">
                    <button type="submit" class=" btn btn-danger  btn-sm col-lg-offset-2 col-sm-9"
                            style=" font-size: 20px;float: left;">提交订单
                    </button>
                    </a>
                </td>

            </tr>
        </table>
    </form>
    <div style="float:right; width: 215px; margin-top: 20px;">
        <p><a href="javascript:history.back()">返回购物车</a></p>
    </div>
    <div class="cleaner h30"></div>

</div>
</body>
</html>
