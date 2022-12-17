<%--
  Created by IntelliJ IDEA.
  User: 杜展鹏
  Date: 2022/10/14
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>用户登录</title>
    <link href="../css/Other/login.css" rel="stylesheet">
    <link href="../css/Other/reset.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#username").blur(function () {
                const content = $("#username").val();
                var isRight = /[\w\u4e00-\u9fa5]{3,8}/;
                if(isRight.test(content) == true){
                    $("#usernameImg").attr("src","../img/js_test/right3.jpg");
                }else{
                    $("#usernameImg").attr("src","../img/js_test/error3.jpg")
                }
            });
            $("#pwd").blur(function () {
                const content = $("#pwd").val();
                /*3-8位数字/字母/汉字*/
                var isRight = /^(?=.*[a-z])(?=.*\d)[^]{6,16}$/;
                if (isRight.test(content) == true) {
                    $("#pwdImg").attr("src", "../img/js_test/right3.jpg");
                } else {
                    $("#pwdImg").attr("src", "../img/js_test/error3.jpg");
                }
            });
            $("#submit-button").click(function (){
                const contentUsername = $("#username").val();
                /*3-8位数字/字母/汉字*/
                var isRightUsername = /[\w\u4e00-\u9fa5]{3,8}/;
                if (isRightUsername.test(contentUsername) != true) {
                    alert("账号或用户名有误");
                    return false;
                }
                const contentPassword = $("#pwd").val();
                var isRightPassword = /^(?=.*[a-z])(?=.*\d)[^]{6,16}$/;
                if(isRightPassword.test(contentPassword) != true){
                    alert("账号或用户名有误");
                    return false;
                }
                return true;
            })
        })
    </script>
</head>
<body style="background-image: url('../img/backgrounds/1.jpg')!important;" >
<form action="/loginServlet" method="post">
    <div class="login">
        <h3>登录</h3>
        <ul class="log-form">
            <li>
                <i class="name"></i>
                <input id="username" name = "username" type="text" placeholder="请输入用户名">
                <label for="username">用户名</label>
                <img id="usernameImg" src="">
            </li>
            <li>
                <i class="password"></i>
                <input id="pwd" name = "password" type="password" placeholder="请输入密码" >
                <label for="pwd">密码</label>
                <img id="pwdImg" src="">
            </li>
        </ul>
        <%--<div class="login-button" name = "Login_Btn">登录</div>--%>
        <div  class="login-button" name="Login_Btn" onclick="$(document.getElementById('submit-button').click())">登录</div>
        <button id="submit-button" style="display: none"></button>
        <a href="#" class="forget">忘记密码?</a>
        <a href="../pages/register.jsp" class="NowRegister">立即注册</a>
    </div>
</form>
</body>
</html>
