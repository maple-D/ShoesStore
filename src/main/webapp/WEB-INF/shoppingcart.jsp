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

            var total = 0;
            $("input:checked").each(function () {
                return total += Number( $(this).parent().parent().children(".subtotal").text());
            })
            $("font").text("￥"+total);
            if (total == 0){
                $("#pay").attr("disabled",true)
            }else {
                $("#pay").attr("disabled",false)
            }


            $("#all").click(function () {
                if (this.checked) {
                    $("input:checkbox").attr("checked", true);
                } else {   //反之 取消全选
                    $("input:checkbox").attr("checked", false);
                }
            })

            $("input:checkbox").click(function () {
                var total = 0;
                $("input:checked").each(function () {
                    return total += Number( $(this).parent().parent().children(".subtotal").text());
                })
                $("font").text("￥"+total);
                if (total == 0){
                    $("#pay").attr("disabled",true)
                }else {
                    $("#pay").attr("disabled",false)
                }
            })

            $(".count").change(function () {
                var reg = new RegExp("^[0-9]*$");
                var count =Number( $(this).val());
                var goodsCount =Number( $(this).next().val());
                if(!reg.test(count) || "" == count || count>goodsCount ){
                    var id =  $(this).parent().parent().find("input:checkbox").val();
                    var url = "/queryCartCount.action";
                    var sendData = {"cartId":id};
                    $.post(url,sendData,function(data){
                        $("input:checkbox").each(function () {
                            var cartid =$(this).val();
                            if(id == cartid){
                             $(this).parent().parent().children().children(".count").val(data);
                                alert("商品数量超限")
                            }
                        })

                    })
                }else {
                    var id =  $(this).parent().parent().find("input:checkbox").val();
                    var url = "/updateCartGoodsCount.action";
                    var sendData = {"cartId":id,"cartGoodsCount":count};
                    $.post(url,sendData,function(data){
                        $("input:checkbox ").each(function () {
                            var cartid =$(this).val();
                            if(id == cartid){
                                $(this).parent().parent().children(".subtotal").text(data);
                            }
                        })
                        var total = 0;
                        $("input:checked").each(function () {
                            return total += Number( $(this).parent().parent().children(".subtotal").text());
                        })
                        $("font").text("￥"+total);

                    })
                }
            })

            $(".remove").click(function () {
                 var id =  $(this).parent().parent().find("input:checkbox").val();
                var con = confirm("确认删除此商品");
                if(con == true){
                    var url = "/deleteCartItem.action";
                    var sendData = {"cartId":id};
                    $.post(url,sendData,function(data){
                        if (data == -2){
                            alert("请登录之后，再添加购物车")
                        } else if (data > 0){
                           $("input:checkbox").each(function () {
                             var cartid =$(this).val();
                               if(id == cartid){
                                   $(this).parents("tr").remove();
                               }
                           })
                            var total = 0;
                            $("input:checked").each(function () {
                                return total += Number( $(this).parent().parent().children(".subtotal").text());
                            })
                            $("font").text("￥"+total);
                        }else {
                            alert("删除失败")
                        }
                    })

                 }else {
                     return false
                 }
            })

        })
    </script>
</head>
<body>
<div id="templatemo_main">
    <h1>购物车</h1>
    <form id="cart" action="/confirmOrder.action" method="post">
    <table width="880px" cellspacing="0" cellpadding="5">
        <tr bgcolor="black">
            <th width="80" height="30px;" align="left" ><input id="all" type="checkbox"> &nbsp;全选 </th>
            <th width="220" align="left">商品信息 </th>
            <th width="180" align="left"> </th>
            <th width="100" align="right">尺码 </th>
            <th width="100" align="left">数量 </th>
            <th width="60" align="right">单价 </th>
            <th width="60" align="right">小计 </th>
            <th width="90"> </th>
        </tr>
        <c:forEach items="${shoppingCartList}" var="shoppingcart" >
            <tr>
                <th width="80" align="left"><input type="checkbox" name="cartId" value="${shoppingcart.cartId}"> </th>
                <td><img src=${shoppingcart.goods.goodsPicture} /></td>
                <td>${shoppingcart.goods.goodsName}</td>
                <td align="left">${shoppingcart.goodsInventory.goodsSize} </td>
                <td align="left">
                    <input type="text"  value="${shoppingcart.cartGoodsCount}" class="count"  style="width: 40px; text-align: right"  onkeyup="this.value=this.value.replace(/\D/g,'') "/>
                    <input type="hidden" value="${shoppingcart.goodsInventory.goodsCount}">
                </td>
                <td align="left" >${shoppingcart.goods.goodsSalePrice} </td>
                <td align="left" class="subtotal">${shoppingcart.subtotal}</td>
                <td align="center"> <a class="remove"><img src="images/remove_x.gif" alt="remove" /><br />Remove</a> </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="5" align="right"  height="30px">总价：<font name="totalCost" id="totalCost" style=" font-weight: bold;" color="red" size="4">￥0</font>&nbsp;&nbsp;</td>
            <td colspan="3">
                <button type="submit" id="pay" class=" btn btn-danger  btn-sm col-lg-offset-3 col-sm-9" style=" font-size: 20px;float: left;">结算</button></a>
            </td>

        </tr>
    </table>
    </form>
    <div class="cleaner h30"></div>

</div>
</body>
</html>
