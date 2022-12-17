<%@ page import="entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 杜展鹏
  Date: 2022/10/14
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>法网恢恢</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"><link
        href="../css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
    <!-- 导入官网bootstrap的css样式 -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../css/my.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
</head>
<body style="background-image: none">
<!-- 页面整体布局div -->
<div class="container">
    <div>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">中国法网</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">法考<span class="sr-only">(current)</span></a></li>

                        <li><a target="_blank" href="/getBlogsServlet" id="case">案件分析</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">法律咨询 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">工商咨询</a></li>
                                <li><a href="#">婚姻问题</a></li>
                                <li><a href="#">民事咨询</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">民法典参考</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">企业入驻/商务合作</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                        <%
                            String sessionText = (String)session.getAttribute("visitor");
                            if("false".equals(sessionText)){
                                User user = (User) session.getAttribute("user");
                                /*out.write("<li><a>" + user.getUsername()+ "</a></li>");*/
                                out.write("<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"\n" +
                                "     role=\"button\" aria-haspopup=\"true\"\n" +
                                "     aria-expanded=\"false\">" + user.getUsername() + "<span class=\"caret\"></span></a>" +
                                        "<ul class=\"dropdown-menu\">\n" +
                                        "<li><a href=\"#\">个人信息</a></li>\n" +
                                        "<li><a href=\"/logoutServlet\">退出登录</a></li>\n" +
                                        "<!--<li><a href=\"#\"></a></li>\n" +
                                        " <li><a href=\"#\">Something else here</a></li>-->\n" +
                                        "<li role=\"separator\" class=\"divider\"></li>\n" +
                                        "<li><a href=\"#\">律师资格认证</a></li>\n" +
                                        "</ul>");
                            }else{
                                out.write(" <li><a href=\"../pages/login.jsp\">登录</a></li>\n" +
                                        "   <li><a href=\"../pages/register.jsp\">注册</a></li>");
                            }
                        %>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>
    <%--轮播图--%>
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="../img/web_leager/main_bg_1.jpg" alt="...">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img src="../img/web_leager/main_bg_2.jpg" alt="...">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img src="../img/web_leager/main_bg_3.jpg" alt="...">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img src="../img/backgrounds/4.png" alt="...">
                <div class="carousel-caption">
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <!--律师简介-->
    <div class="row">
        <div class="row" style="padding-left: 25px">
            <%--<img src="../img/temp/title2.jpg" >--%>
            <%--建立gerencss样式进行共同控制--%>
            <h1 class="adv" style="font-weight: bold; color: #193bd9;padding-left: 2px">法律咨询<img src="../img/temp/title2.jpg" ></h1>
        </div>
        <div class="row" style="padding-left: 14px">
            <div class="col-md-2" style="height: 450px" >
                <img src="../img/web_leager/web_yida_2.jpg" width="110%" height="100%" style="border-radius: 25px">
            </div>
            <div class="col-md-10">
                <div class="row"><%----%>
                    <div class="col-md-6" style="height: 230px">
                        <img src="../img/web_leager/web_yida_3.jpg" width="96%" height="220" style="margin: 0;padding: 0; border-radius: 25px"/>
                        <p class="yida_1">益十</p>
                        <p class="yida_2">达年</p>
                        <p class="yida_3">辩起</p>
                        <p class="yida_4">护步</p>
                    </div>
                    <div class="col-md-3" style="height: 230px">
                        <img src="../img/web_leager/web_5.png" height="95%" width="200" style="border-radius: 25px">
                        <span  class="du_2" >王楠律师,专注婚姻</span>
                    </div>
                    <div class="col-md-3" style="height: 230px">
                        <img src="../img/web_leager/web_7.png" height="95%" width="200" style="border-radius: 25px">
                        <span class="du_1">柳传凤律师，企业融资</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3" style="height: 230px">
                        <img src="../img/web_leager/杜卯旦.jpg" height="95%" width="200" style="border-radius: 25px">
                        <span class="du_1">杜卯旦律师，工商赔偿</span>
                    </div>
                    <div class="col-md-3" style="height: 230px">
                        <img src="../img/web_leager/web_8.jpg" height="95%" width="200" style="border-radius: 25px">
                        <span class="du_2">罗翔律师,专注法考</span>
                    </div>
                    <div class="col-md-3" style="height: 230px">
                        <img src="../img/web_leager/web_10.jpg" height="95%" width="200" style="border-radius: 25px">
                        <span class="du_2">黑话律师,专注韩剧</span>
                    </div>
                    <div class="col-md-3" style="height: 230px">
                        <img src="../img/web_leager/web_11.jpg" height="95%" width="200" style="border-radius: 25px">
                        <span class="du_1">执业四十余年,法律顾问</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--广告Div-->
    <div>
        <img src="../img/web_leager/advertising.jpg" width="100%"/>
    </div>

    <!--热门商品-->
    <div class="row">
        <div class="row" style="padding-left: 25px">
            <h1 style="font-weight: bold; color: #193bd9;padding-left: 2px">在线<span style="font-size: 30px; padding-left: 20px">&nbsp;法律援助</span></h1>
            <span style="font-size: 16px;font-family: 微软雅黑;color: #b2c3f6">&nbsp;&nbsp;&nbsp;有法律疑惑，免费在线咨询，您的法律疑问我们来解决 </span>
        </div>
        <div class="row" style="padding-left: 14px">
            <div class="col-md-2" style="height: 450px">
                <img src="../img/web_leager/web_yida_5.jpg" width="110%" height="100%" style="border-radius: 25px">
            </div>
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-6" style="height: 230px">
                        <img src="../img/web_leager/web_yida_4.jpg" width="96%" height="220" style="margin: 0;padding: 0; border-radius: 25px"/>
                        <p class="yida_1" style="left: 50px">益十</p>
                        <p class="yida_2" style="left: 50px">达年</p>
                        <p class="yida_3" style="left: 50px">辩起</p>
                        <p class="yida_4" style="left: 50px">护步</p>
                    </div>
                    <div class="col-md-3" style="height: 230px">
                        <img src="../img/web_leager/web_12.jpg" height="95%" width="200" style="border-radius: 25px">
                        <span class="du_1">刘煜辉律师，专职司法</span>
                    </div>
                    <div class="col-md-3" style="height: 230px">
                        <img src="../img/web_leager/web_13.jpg" height="95%" width="200" style="border-radius: 25px">
                        <span class="du_2">济南律所,王进律师</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3" style="height: 230px">
                        <img src="../img/web_leager/web_14.jpg" height="95%" width="200" style="border-radius: 25px">
                        <span class="du_1">君言律所，广君颜律师</span>
                    </div>
                    <div class="col-md-3" style="height: 230px">
                        <img src="../img/web_leager/web_15.jpg" height="95%" width="200" style="border-radius: 25px">
                        <span class="du_1">张寒松律师，专注劳法</span>
                    </div>
                    <div class="col-md-3" style="height: 230px">
                        <img src="../img/web_leager/web_16.jpg" height="95%" width="200" style="border-radius: 25px">
                        <span class="du_2">专业律师,保驾护航</span>
                    </div>
                    <div class="col-md-3" style="height: 230px">
                        <img src="../img/web_leager/杜娜娜.jpg" height="95%" width="200" style="border-radius: 25px">
                        <span class="du_2">杜娜律师，财产纠纷</span>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div>
        <img src="../img/temp/footer.jpg" width="100%" />
    </div>

    <div style="color: #ffffff">
        <center>
            <br/>
            关于我们 联系我们 招贤纳士 法律声明 友情链接 支付方式  服务声明 广告声明
            <br/>
            Copyright © 2022-2023 中国法网 版权所有
        </center>
    </div>
</div>
</body>
</html>
