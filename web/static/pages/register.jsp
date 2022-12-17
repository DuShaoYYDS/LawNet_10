<%--
  Created by IntelliJ IDEA.
  User: 杜展鹏
  Date: 2022/10/14
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>中国法网用户注册</title>
    <link href="../css/register.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        function TestNamePwd() {
            const contentUsername = $("#username").val();
            /*3-8位数字/字母/汉字*/
            var isRightUsername = /[\w\u4e00-\u9fa5]{3,8}/;
            if (isRightUsername.test(contentUsername) != true) {
                alert("用户名或密码有误");
                return false;
            }
            const contentPassword = $("#pwd").val();
            var isRightPassword = /^(?=.*[a-z])(?=.*\d)[^]{6,16}$/;
            if(isRightPassword.test(contentPassword) != true) {
                alert("用户名或密码有误");
                return false;
            }
            const content = $("#mail").val();
            var isRight = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
            if(isRight.test(content) != true){
                alert("邮箱账号有误");
                return false;
            }
        }
        $(function () {
            /*$("#register").click(function () {
                alert("向服务器提供注册信息")
            });*/
            $("#username").blur(function () {
                const content = $("#username").val();
                var isRight = /[\w\u4e00-\u9fa5]{3,8}/;
                if(content != null && isRight.test(content) == true){
                    $("#usernameImg").attr("src","../img/js_test/right3.jpg");
                }else{
                    $("#usernameImg").attr("src","../img/js_test/error3.jpg");
                }
            })
            $("#mail").blur(function () {
                const content = $("#mail").val();
                var isRight = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
                if(isRight.test(content) == true){
                    $("#mailImg").attr("src","../img/js_test/right3.jpg");
                }else{
                    $("#mailImg").attr("src","../img/js_test/error3.jpg");
                }
            })
            $("#pwd").blur(function () {
                const content = $("#pwd").val();
                /*
                *   密码必须包含6到16位的数字和字母
                * */
                var isRight = /^(?=.*[a-z])(?=.*\d)[^]{6,16}$/;
                if(isRight.test(content) == true){
                    $("#pwdImg").attr("src","../img/js_test/right3.jpg");
                }else{
                    $("#pwdImg").attr("src","../img/js_test/error3.jpg");
                }
            })
            /*$("#register").click(function (){
                const contentUsername = $("#username").val();
                /!*3-8位数字/字母/汉字*!/
                var isRightUsername = /[\w\u4e00-\u9fa5]{3,8}/;
                if (isRightUsername.test(contentUsername) != true) {
                    alert("用户名或密码有误");
                    return false;
                }
                const contentPassword = $("#pwd").val();
                var isRightPassword = /^(?=.*[a-z])(?=.*\d)[^]{6,16}$/;
                if(isRightPassword.test(contentPassword) != true) {
                    alert("用户名或密码有误");
                    return false;
                }
                const content = $("#mail").val();
                var isRight = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
                if(isRight.test(content) != true){
                    alert("邮箱账号有误");
                    return false;
                }
                return true;
            })*/
        });
    </script>
</head>
<body style="background-image: url(../img/backgrounds/4.png)">
<div class="left">
    <div class="logo">
        <img src="../img/logo/logo.jpg">
    </div>
    <div class="sologan">
        <h1>益达辩护，十年起步</h1>
        <p>全民参与，维护法律公平共正，构建和谐社会</p>
    </div>
    <div class="footer">
        <p>帮助中心 | 2022@FAWANG</p>
    </div>
</div>
<div class="right">
    <form action="/registerServlet" method="post">
        <table>
            <caption>欢迎注册</caption>
            <tr>
                <td>已有账号？<a href="../pages/login.jsp">登录</a></td>
            </tr>
            <tr>
                <td>
                    <label for="">用户名</label>
                    <input class="input-content" id="username" name="username" type="text" placeholder="请设置用户名">
                    <img id="usernameImg" class=""/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="">邮箱号</label>
                    <input id="mail" type="text" name="mail" placeholder="可用于登录和找回密码">
                    <img id="mailImg" class=""/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="">密&nbsp;&nbsp;&nbsp;码</label>
                    <input id="pwd" type="password" name="password" placeholder="请设置登录密码">
                    <img id="pwdImg" src=""/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="">验证码</label><input type="text" name="userCaptcha" placeholder="请输入验证码" class="input-min" id="vercode">
                    <button type="button" class="get" id="get_captcha" onclick="fun()">获取验证码</button>
                </td>
            </tr>
            <tr>
                <td>
                    <button type="button" class="regit" id="register" onclick="RegisterFun()">注册</button>
                </td>
            </tr>
            <tr>
                <td>
                    <input class="check" type="checkbox" name="" id="" checked>阅读并接受《用户协议》、《用户隐私协议》
                </td>
            </tr>
        </table>
        <a href="index.jsp" id="index" style="display: none"></a>
    </form>
</div>
    <script type="text/javascript">

        //异步提交表单，验证用户注册
        function RegisterFun() {
            if(TestNamePwd() == false){
                return false;
            }
            const username = $("#username").val();
            const vercode = $("#vercode").val();
            const password = $("#pwd").val();
            const mail = $("#mail").val();

            $.ajax({
                url: "/registerServlet",
                type: "POST",
                data: {"username":username,"vercode":vercode,"password":password,"mail":mail},
                success: function (data) {
                    if(data == "error"){
                        alert("验证码有误");
                    }else{
                        document.querySelector('#index').click();
                    }
                }
            });
        };


        //服务器异步提交表单获取邮箱验证码
        function fun() {
            const username = $("#username").val();
            const mail = $("#mail").val();
            $.ajax({
                url: "/sendMailServlet",
                type: "POST",
                data: {"username":username,"mail":mail},
                success: function () {

                    //验证码倒计时发送
                    RemainTime();

                },
                error: function () {
                    alert("出错了，请稍后再次尝试");
                }
            });
        }

        //验证码倒计时
        var iTime = 59;
        var Account;
        function RemainTime() {
            $("#get_captcha").attr('disabled',true);

            var sTime = "";
            if (iTime >= 0) {

                sTime = iTime + "秒后获取";

                if (iTime == 0) {
                    clearTimeout(Account);
                    sTime ="重新获取";
                    iTime = 59;
                    $("#get_captcha").attr('disabled',false);
                } else {
                    Account = setTimeout("RemainTime()", 1000);
                    iTime = iTime - 1;
                }
            } else {
                sTime = "重新获取";
            }

            $("#get_captcha").text(sTime);
        }
    </script>
</body>

</html>
