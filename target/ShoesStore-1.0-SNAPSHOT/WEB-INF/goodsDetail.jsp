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
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="screen"/>
    <script type="text/javascript" src="../js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript">
        function compareWithInventory(count) {
            var inventory = $("font").text().trim();
            if (count > inventory) {
                return false;
            } else {
                return true;
            }
        }
        $(function () {
            $("#count").blur(function () {
                var count =Number( $(this).val().trim());
                if (!compareWithInventory(count)) {
                    $("td p").text("您所填的数量大于库存!");
                }
            })
            $("#count").focus(function () {
                $("td p").text("");
            })

            $("#cart").click(function () {
                var count =Number( $("#count").val().trim());
                if ("" == count || null == count){
                    $("td p").text("请填写数量!");
                    return false;
                }
                if (!compareWithInventory(count)) {
                    $("td p").text("您所填的数量大于库存!");
                    return false;
                }
                var id = $(this).next().val();
                var size = $("td select").val();
                var url = "/addToCart.action";
                var sendData = {"goodsId": id, "goodsSize": size, "cartGoodsCount": count};
                $.post(url, sendData, function (data) {
                    if (data == -2) {
                        alert("请登录之后，再添加购物车")
                    } else if (data == -1) {
                        alert("该尺码库存不足，添加失败")
                    } else {
                        alert("添加成功")
                    }
                })
            })

                $("#goodsSize").change(function () {
                    var url = "/changeInventory.action";
                    var sendData = {
                        "goodsSize": $(this).val(),
                        "goodsId": '${goods.goodsId}'
                    };
                    $.post(url, sendData, function (data) {
                        $("font").text(data)
                    })
                })
            })
    </script>
</head>
<body>
<div id="templatemo_main">
    <h1>商品详情</h1>
    <div class="content_half float_l" style="margin-left: 100px;">
        <a rel="lightbox[portfolio]" href="images/product/01.jpg"><img src="${goods.goodsPicture}" height="200"
                                                                       width="300" alt="image"/></a>
    </div>
    <div class="content_half float_r" style="margin-right: 130px;">
        <table class="table">
            <tr>
                <td width="160">商品名称:</td>
                <td>${goods.goodsName}</td>
            </tr>
            <tr>
                <td width="160">价格:</td>
                <td>￥${goods.goodsSalePrice}</td>
            </tr>
            <tr>
                <td>种类:</td>
                <td>${goods.goodsType.goodsTypeName}</td>
            </tr>
            <tr>
                <td>尺码:</td>
                <td>
                    <select id="goodsSize" name="goodsSize">
                        <c:forEach items="${goods.goodsInventoryList}" var="goodsInventory">
                            <option>${goodsInventory.goodsSize}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>已售:</td>
                <td>${goods.goodsSold}</td>
            </tr>
            <tr>
                <td>数量:</td>
                <td><input type="text" id="count" name="count" style="width: 30px" value="1"
                           onkeyup="this.value=this.value.replace(/\D/g,'')"
                           onafterpaste="this.value=this.value.replace(/\D/g,'')"/>(库存<font>${goods.goodsInventoryList[0].goodsCount}</font>件)
                </td>
            </tr>
            <tr>
                <td><p style="color: red"></p></td>
            </tr>
        </table>
        <div class="cleaner h20"></div>

        <button id="cart" type="button" class="btn btn-info  btn-sm" style=" font-size: 10px;float: left;">添加购物车
        </button>
        <input type="hidden" value="${goods.goodsId}">

    </div>
    <div class="cleaner h30"></div>

    <h5>商品介绍</h5>
    <p>${goods.goodsDescription}</p>
    <div class="cleaner h50"></div>
</div>
</body>
</html>
