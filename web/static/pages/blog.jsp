<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 杜展鹏
  Date: 2022/10/28
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>案件分析与讨论</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
    <link href="../css/my.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--导航-->
<nav class="ui inverted attached segment m-padded-tb-mini">
    <div class="ui container">
        <div class="ui inverted secondary stackable menu">
            <h2 class="ui teal header item">CASE</h2>
            <a href="blog.jsp" class="active m-item item m-mobile-hide"><i class="home icon"></i>首页</a>
            <a href="types.html" class="m-item item m-mobile-hide"><i class="idea icon"></i>分类</a>
            <a href="tags.html" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <a href="archives.html" class="m-item item m-mobile-hide"><i class="clone icon"></i>归档</a>
            <a href="aboutMyself.jsp" class="m-item item m-mobile-hide" ><i class="info icon"></i>关于我</a>
            <div class="right item m-mobile-hide">
                <div class="ui icon inverted transparent input">
                    <input type="text" placeholder="Search....">
                    <i class="search link icon"></i>
                </div>
            </div>
        </div>
    </div>
    <a href="#" class="ui menu toggle black icon button m-right-top m-mobile-show">
        <i class="sidebar icon"></i>
    </a>
</nav>
<!--中间内容-->
<div class="m-container m-padded-tb-big">
    <div class="ui container">
        <div class="ui stackable grid">
            <!--左边博客列表-->
            <div id="blog-contains" class="eleven wide column">
                <!--header-->
                <div class="ui top attached segment">
                    <div class="ui middle aligned two column grid">
                        <div class="column">
                            <h3 class="ui teal header">案件</h3>
                        </div>
                        <div class="right aligned column">

                            共<h2 class="ui orange header m-inline-block m-text-thin">${fn:length(blogs)}</h2>篇
                        </div>
                    </div>
                </div>

                <!--content-->
                <div id="data" class="ui attached segment">
                    <c:forEach items="${blogs}" var="blog" varStatus="s" begin="${start}" end="${start + 3}">
                        <div class="ui padded vertical segment m-padded-tb-large">
                            <div  class="ui mobile reversed stackable grid">
                                <div class="eleven wide column">
                                   <h3 class="ui header"> <a href="/getBlogDetailsServlet?id=${blog.id}" class="m-black" target="_blank">${blog.title}</a></h3>
                                    <c:set var="content" value="${fn:substring(blog.content,0,100)}"/>
                                    <p class="m-text">${content}......</p>
                                    <div class="ui grid">
                                        <div class="eleven wide column">
                                            <div class="ui mini horizontal link list">
                                                <div class="item">
                                                    <img src="${blog.user.avatar}" alt="" class="ui avatar image">
                                                    <div class="content"><a class="header">${blog.publisherName}</a></div>
                                                </div>
                                                <div class="item">
                                                    <i class="calendar icon"></i>${blog.createTime}
                                                </div>
                                                <div class="item">
                                                    <i class="eye icon"></i>${blog.views}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right aligned five wide column">
                                            <a href="#" target="_blank" class="ui teal basic label m-padded-tiny  m-text-thin">公开审理案件</a>
                                        </div>
                                    </div>

                                </div>
                                <div class="five wide column">
                                    <a href="#" target="_blank">
                                        <img src="${blog.firstPicture}" class="ui rounded image">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!--footer-->
                <div class="ui bottom attached segment">
                    <div class="ui middle aligned two column grid">
                        <div class="column">
                            <a href="/getPriBlogsServlet" class="ui teal mini basic button">上一页</a>
                        </div>
                        <div class="right aligned column">
                            <%--<a href="" class="ui teal mini basic button">下一页</a>--%>
                            <a  href="/getNextBlogsServlet" class="ui teal mini basic button">下一页</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--右边的top-->
            <div class="five wide column">

                <!--分类-->
                <div class="ui segments">
                    <div class="ui secondary segment">
                        <div class="ui two column grid">
                            <div class="column">
                                <i class="idea icon"></i>分类
                            </div>
                            <div class="right aligned column">
                                <a href="#" target="_blank">more<i class="angle double right icon"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="ui teal segment">
                        <div class="ui fluid vertical menu">
                            <c:forEach items="${types}" var="type">
                            <a href="#" class="item">
                                ${type.name}
                                <div class="ui teal basic left pointing label">${type.count}</div>
                            </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <!--标签-->
                <div class="ui segments m-margin-top-large">
                    <div class="ui secondary segment">
                        <div class="ui two column grid">
                            <div class="column">
                                <i class="tags icon"></i>标签
                            </div>
                            <div class="right aligned column">
                                <a href="#" target="_blank">more<i class="angle double right icon"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="ui teal segment">

                        <c:forEach items="${tags}" var="tag">
                            <a href="#" target="_blank" class="ui teal basic left pointing label m-margin-tb-big">
                                    ${tag.name}<div class="detail">${tag.count}</div>
                            </a>
                        </c:forEach>
                    </div>
                </div>

                <!--最新推荐-->
                <div class="ui segments m-margin-top-large">
                    <div class="ui secondary segment">
                        <i class="bookmark icon"></i>最新推荐
                    </div>
                    <c:forEach items="${blogs}" var="blog" varStatus="s" begin="0" end="4" step="1">
                        <div class="ui segment">
                            <c:set var="content" value="${fn:substring(blog.title,0,10)}"/>
                            <a href="#" target="_blank" class="m-black m-text-thin">${content}...（User Story）</a>
                        </div>
                    </c:forEach>

                </div>
                <!--二维码-->
                <h4 class="ui horizontal divider header m-margin-top-large">扫码关注</h4>
                <div class="ui centered card" style="width: 11em">
                    <img src="../img/wechat/my.jpg" alt="" class="ui rounded image" >
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<br>
<!--底部footer-->
<footer class="ui inverted vertical segment m-padded-tb-massive">
    <div class="ui center aligned container">
        <div class="ui intverted divided stackable grid">
            <div class="three wide column">
                <div class="ui inverted link list">
                    <div class="item">
                        <img src="../img/wechat/my.jpg" crossorigin="ui rounded image" alt="" style="width: 110px">
                    </div>
                </div>
            </div>
            <div class="three wide column">
                <h4 class="ui inverted header m-text-thin m-text-spaced">最新案件</h4>
                <div class="ui inverted link list">
                    <c:forEach items="${blogs}" var="blog" varStatus="s" begin="0" end="4" step="1">
                        <c:set var="content" value="${fn:substring(blog.title,0,6)}"/>
                        <a href="#" class="item">${content}...(User Story)</a>
                    </c:forEach>
                </div>
            </div>
            <div class="three wide column">
                <h4 class="ui inverted header m-text-thin m-text-spaced">联系我</h4>
                <div class="ui inverted link list">
                    <a href="#" class="item">Email：FaWang@163.com</a>
                    <a href="#" class="item">QQ：3025138186</a>
                </div>
            </div>
            <div class="seven wide column">
                <h4 class="ui inverted header m-text-thin m-text-spaced">CASE</h4>
                <p class="m-text-thin m-text-spaced m-opacity-mini">这是我的个人真实经历，本人保证所讲内容均真实可靠,并自愿承担相应的法律责任，希望可以为所有人带来帮助...</p>
            </div>
        </div>
        <div class="ui inverted section divider"></div>
        <p class="m-text-thin m-text-spaced m-opacity-tiny">Copyright © 2022-2023 中国法网 版权所有 盗版必究</p>
    </div>
</footer>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>

<script>
    function aboutMe() {
        if(session.getAttribute("user") == null){
            return false;
        }
        return true;
    }
    $('.menu.toggle').click(function () {
        $('.m-item').toggleClass('m-mobile-hide');
    });
    //页面加载完成之后进行服务器异步请求，完成对博客列表的获取
    /*window.onload = function () {
        $.ajax({
            url:"/getBlogsServlet", //请求路径
            type:"POST"             //请求方式
        });
    };*/

</script>
</body>
</html>