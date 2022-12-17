<%--
  Created by IntelliJ IDEA.
  User: 杜展鹏
  Date: 2022/10/14
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>中国法网</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="static/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
    <!-- 导入官网css样式 -->
    <link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="static/css/theme.css" rel="stylesheet" type="text/css">
    <link type="text/css" href="static/css/demo.css" rel="stylesheet">
    <script type="text/javascript" src="static/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-transparent navbar-dark bg-dark py-4" >
    <div class="container">
        <a class="navbar-brand" href="../pages_html" style="font-size: 20px"><strong>法网恢恢</strong> LeageNet</a>
        <button class="navbar-toggler" type="button" data-action="offcanvas-open" data-target="#navbar_main" aria-controls
                ="navbar_main" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse offcanvas-collapse" id="navbar_main" style="width: 100%;">
            <ul class="navbar-nav ml-auto align-items-lg-center">
                <h6 class="dropdown-header font-weight-600 d-lg-none px-0">Menu</h6>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="font-size: 17px">关于我们</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbar_main_dropdown_1" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false" style="font-size: 17px">友情链接</a>
                    <div class="dropdown-menu" aria-labelledby="navbar_1_dropdown_1" style="font-size: 17px">
                        <a class="dropdown-item" style="font-size: 17px" href="https://www.66law.cn/">华律网</a>
                        <a class="dropdown-item" style="font-size: 17px" href="http://www.acla.org.cn/home/toPage/">中国律师网</a>
                        <a class="dropdown-item" style="font-size: 17px" href="https://www.lawyers.org.cn/">东方律师网</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../pages_html/index.html" style="font-size: 17px">法律文档</a>
                </li>
                <li class="nav-item">
                    <a href="#" target="_blank"
                       class="nav-link" style="font-size: 17px;">移动端</a>
                </li>
                <div class="dropdown-divider d-lg-none my-4"></div>
                <h6 class="dropdown-header font-weight-600 d-lg-none px-0" style="font-size: 17px">Social Media</h6>
                <li class="nav-item">
                    <a class="nav-link nav-link-icon" href="#" target="_blank"><i class="fab fa-instagram"></i><span
                            class="ml-2 d-lg-none">Instagram</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-icon" href="#" target="_blank"><i class="fab fa-facebook"></i><span
                            class="ml-2 d-lg-none">Facebook</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-icon" href="#" target="_blank"><i class="fab fa-dribbble"></i><span
                            class="ml-2 d-lg-none">Dribbble</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-icon" href="#" target="_blank"><i class="fab fa-github"></i><span
                            class="ml-2 d-lg-none">Github</span></a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<main class="main">
    <section class="spotlight parallax bg-cover bg-size--cover" data-spotlight="fullscreen" style="background-image:
    url('static/img/backgrounds/1.jpg')">
        <span class="mask bg-primary alpha-7"></span>
        <div class="spotlight-holder py-lg pt-lg-xl">
            <div class="container d-flex align-items-center no-padding">
                <div class="col">
                    <div class="row cols-xs-space align-items-center text-center text-md-left justify-content-center">
                        <div class="col-7">
                            <div class="text-center mt-5">
                                <img src="static/img/backgrounds/icon.png" style="width: 200px;padding-top: 270px;" class="img-fluid
                  animated" data-animation-in="jackInTheBox" data-animation-delay="1000">
                                <h2 class="heading display-4 font-weight-400 text-white mt-5 animated" data-animation-in="fadeInUp"
                                    data-animation-delay="2000">
                                    <a class="font-weight-400" href="static/pages/index.jsp" style="color:#ffffff;">全民参与</a>
                                </h2>
                                <!--内容不实-->
                                <p class="lead text-white mt-3 lh-180 c-white animated" data-animation-in="fadeInUp"
                                   data-animation-delay="2500" style="font-size: 20px">
                                    <%--中华人民共和国最高人民法院正式指定合作项目--%>
                                    The Supreme People's Court of the People's Republic of China officially designates cooperation projects
                                    <strong class="text-white"></strong>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
</body>
</html>
