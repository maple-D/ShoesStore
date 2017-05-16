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
    <link href="../../../css/templatemo_style.css" rel="stylesheet" type="text/css"/>
    <link href="../../../css/bootstrap.css" rel="stylesheet" type="text/css" media="screen"/>
    <script type="text/javascript" src="../../../js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="../../../js/jquery.validate.js"></script>
    <script type="text/javascript">
        $(function () {

            $("#button_new").click(function () {
                $("#tableData").append(" <tr ><td><input name='goodsSize'  class='form-control' digits='true' type='text' required/></td> <td><input id='goodsCount' name='goodsCount'class='form-control'digits='true'  required  type='text'/></td> </tr>>");

            })
            $("#button_delete").click(function () {
                if ($("#tableData").children().size() > 1) {
                    $("#tableData tr:last-child").remove();
                }
            })




            $("#uploadGoods").validate({
                rules: {
                    goodsId: "required",
                    goodsName: "required",

                    goodsCostPrice: {
                        required: true,
                        number: true,
                        min: 0,
                    },
                    goodsSalePrice: {
                        required: true,
                        number: true,
                        min: 0,
                    },
                    picture: {
                        required: true,
                        checkPic: true,
                        checkPicSize: 5 * 1024 * 1024,
                    },
                    goodsSize:{
                        required:true,
                        digits:true,
                    } ,
                    goodsCount: {
                        required:true,
                        digits:true,
                    },

                },
                messages: {
                    goodsId: "请输入商品编号",
                    goodsName: "请输入商品名称",

                    goodsCostPrice: {
                        required: " 请输入进价",
                        number: " 请输入一个数字",
                        min: " 请输入大于0的数字"
                    },
                    goodsSalePrice: {
                        required: " 请输入售价",
                        number: " 请输入一个数字",
                        min: " 请输入大于0的数字"
                    },
                    picture: {
                        required: "请选择图片",
                    },
                    goodsSize:{
                        required: "请输入尺码",
                        digits: "请输入一个大于0整数",
                    } ,
                   goodsCount:{
                        required: "请输入库存",
                        digits: "请输入一个大于0整数",
                    } ,
                },
                errorElement: "em",
                errorPlacement: function (error, element) {
                    // Add the `help-block` class to the error element
                    error.addClass("help-block");

                    if (element.prop("type") === "checkbox") {
                        error.insertAfter(element.parent("label"));
                    } else {
                        error.insertAfter(element);
                    }
                },
                highlight: function (element, errorClass, validClass) {
                    $(element).parents(".col-sm-5").addClass("has-error").removeClass("has-success");
                },
                unhighlight: function (element, errorClass, validClass) {
                    $(element).parents(".col-sm-5").addClass("has-success").removeClass("has-error");
                },
                onfocusout: function(element) { $(element).valid(); }
            });
            jQuery.validator.addMethod("checkPic", function (value, element) {
                var filepath = value;
                //获得上传文件名
                var fileArr = filepath.split("\\");
                var fileTArr = fileArr[fileArr.length - 1].toLowerCase().split(".");
                var filetype = fileTArr[fileTArr.length - 1];
                //切割出后缀文件名
                if (filetype != "jpg" && filetype != "png") {
                    return false;
                } else {
                    return true;
                }
            }, "请上传png,jpg的图片格式");
            jQuery.validator.addMethod("checkPicSize", function (value, element, param) {
                var fileSize = element.files[0].size;
                var maxSize = param;
                if (fileSize > maxSize) {
                    return false;
                } else {
                    return true;
                }
            }, "请上传大小在5M以下的图片");
        })
    </script>
</head>
<body>
<div id="templatemo_main">
    <div class="container-fluid">
        <form id="uploadGoods" style="width: 50%;margin-left: 20% " class="form-horizontal"
              action="/admin/addGoods.action" role="form"
              method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label class="col-lg-4 control-label">商品编号:</label>
                <div class="col-lg-5">
                    <input type="text" name="goodsId" id="goodsId" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-4 control-label">商品名称:</label>
                <div class="col-lg-5">
                    <input type="text" name="goodsName" id="goodsName" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-4 control-label">商品种类:</label>
                <div class="radio ">
                    <label>
                        &nbsp;&nbsp;&nbsp; <input type="radio" name="goodsGender" id="man" value="1" checked>男生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </label>
                    <label>
                        <input type="radio" name="goodsGender" id="woman" value="2">女生
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-4 control-label">商品类型:</label>
                <div class=" col-lg-4">
                    <select class="form-control" id="goodsTypeId" name="goodsType.goodsTypeId">
                        <c:forEach items="${goodsTypes}" var="type">
                            <option value="${type.goodsTypeId}">${type.goodsTypeName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-4 control-label">进价:</label>
                <div class="col-lg-5">
                    <input type="text" name="goodsCostPrice" id="goodsCostPrice" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-4 control-label">售价:</label>
                <div class="col-lg-5">
                    <input type="text" name="goodsSalePrice" id="goodsSalePrice" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-4 control-label">商品图片:</label>
                <div class="col-lg-6">
                    <input type="file" style="height: 25px" name="picture" id="picture">
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-4 control-label">商品描述:</label>
                <div class="col-lg-8">
                    <textarea rows="4" name="goodsDescription" id="goodsDescription" class="form-control"></textarea>
                </div>
            </div>
            <div class="form-group ">
                <table class="table table-bordered">
                    <thead>
                    <tr align="center" valign="middle">
                        <td class="col-lg-2">&nbsp;&nbsp;尺码</td>
                        <td class="col-lg-2">&nbsp;&nbsp;库存</td>
                    </tr>
                    </thead>
                    <tbody id="tableData">
                    <tr>
                        <td><input name="goodsSize" class="form-control" type="text"/></td>
                        <td><input name="goodsCount" class="form-control" type="text"/></td>
                    </tr>
                    </tbody>
                </table>
                <table width="100%">
                    <tr>
                        <td align="center">
                            <input type="button" class="btn btn-info" id="button_new" value="增加栏位">
                        </td>
                        <td align="center">
                            <input type="button" class="btn btn-info" id="button_delete" value="删除栏位">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-group">
                <label class="col-lg-4 control-label">操作员</label>
                <div class="col-lg-5">
                    <input type="text" value="${sessionScope.admin.adminName}" class="form-control" disabled>
                </div>
            </div>

            <div>
                <div style="margin-left: 36%">
                    <input type="submit" class="btn col-lg-5 btn-success" value="上架" id="submit"></input>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
