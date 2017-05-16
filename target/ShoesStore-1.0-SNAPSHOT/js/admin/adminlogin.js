$(function () {
    var flag = true;
    $("#adminName").blur(function () {
        var adminName =$.trim( $("#adminName").val());
        $errortext = $("#adminName").next();
        if (adminName == null || adminName==""){
            $errortext.text("请输入用户名")
            flag =  false;
        }
    })
    $("#adminName").focus(function () {
        $("#adminName").next().text("");
    })
    $("#adminPassword").blur(function () {
        var adminPassword =$.trim( $("#adminPassword").val());
        var length = adminPassword.length;
        $errortext = $("#adminPassword").next();
        if (adminPassword == null || adminPassword=="" || length < 6){
            $errortext.text("请输入6个或更多字符，前后空格将被忽略");
            flag =  false;
        }
    })
    $("#adminPassword").focus(function () {
        $("#adminPassword").next().text("");
    })
    
    $("#submit").click(function () {
        flag = true;
        $("#adminName").blur()
        $("#adminPassword").blur()
        if (flag == false ){
            return false;
        }
    })
})