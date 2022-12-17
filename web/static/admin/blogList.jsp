<%--
  Created by IntelliJ IDEA.
  User: 杜展鹏
  Date: 2022/11/6
  Time: 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>博客管理</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
    <link href="../css/my.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--导航-->
<nav class="ui inverted attached segment m-padded-tb-mini m-shadow-small">
    <div class="ui container">
        <div class="ui inverted secondary stackable menu">
            <h2 class="ui teal header item">管理后台</h2>
            <a href="#" class="active m-item item m-mobile-hide"><i class="home icon"></i>博客</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="idea icon"></i>分类</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <div class="right m-item m-mobile-hide menu">
                <div class="ui dropdown item">
                    <div class="text">
                        <img class="ui avatar image" src="${user.avatar}">
                        ${user.username}
                    </div>
                    <i class="dropdown icon"></i>
                    <div class="menu">
                        <a href="/logoutServlet" class="item">注销</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a href="#" class="ui menu toggle black icon button m-right-top m-mobile-show">
        <i class="sidebar icon"></i>
    </a>
</nav>

<div class="ui attached pointing menu">
    <div class="ui container">
        <div class="right menu">
            <a href="blogs-input.jsp" class="item">发布</a>
            <a href="blogList.jsp" class="teal active item">列表</a>
        </div>
    </div>
</div>

<!--中间内容-->
<div class="m-container m-padded-tb-big">
    <div class="ui container">
        <form action="#" method="post" class="ui segment form">
            <div class="inline fields">
                <div class="field">
                    <input type="text" name="title" placeholder="标题">
                </div>
                <div class="field">
                    <div class="ui selection dropdown">
                        <input type="hidden" name="type">
                        <i class="dropdown icon"></i>
                        <div class="default text">分类</div>
                        <div class="menu">
                            <div class="item" data-value="1">刑事</div>
                            <div class="item" data-value="2">民事</div>
                            <div class="item" data-value="3">经济</div>
                            <div class="item" data-value="4">行政</div>
                        </div>
                    </div>
                </div>
                <div class="field">
                    <div class="ui checkbox">
                        <input type="checkbox" id="recommend" name="recommend">
                        <label for="recommend">推荐</label>
                    </div>
                </div>
                <div class="field">
                    <button class="ui mini teal basic button"><i class="search icon"></i>搜索</button>
                </div>
            </div>
        </form>
        <table class="ui celled table">
            <thead>
            <tr>
                <th></th>
                <th>标题</th>
                <th>类型</th>
                <th>推荐</th>
                <th>更新时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${AllBlogs}" var="blog" varStatus="s">
            <tr>
                <td>${blog.id}</td>
                <td>${blog.title}</td>
                <td>${blog.type.name}</td>
                <c:if test="${blog.recommend == true}">
                    <td>是</td>
                </c:if>
                <c:if test="${blog.recommend == false}">
                    <td>否</td>
                </c:if>
                <td>${blog.updateTime}</td>
                <td>
                    <a href="/editorBlogServlet?id=${blog.id}" class="ui mini teal basic button">编辑</a>
                    <button type="button" id="${blog.id}"  onclick="delBLog(this)" class="ui mini red basic button">删除</button>
                </td>
            </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr>
                <th colspan="6">
                    <div class="ui mini pagination menu">
                        <a class="item">上一页</a>
                        <a class="item">下一页</a>
                    </div>
                    <a class="ui mini right floated teal basic button">新增</a>
                </th>
            </tr>
            </tfoot>
        </table>
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
                    <a href="#" class="item">用户故事（User Story）</a>
                    <a href="#" class="item">用户故事（User Story）</a>
                    <a href="#" class="item">用户故事（User Story）</a>
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
    $('.menu.toggle').click(function () {
        $('.m-item').toggleClass('m-mobile-hide');
    });

    $('.ui.dropdown').dropdown({
        on : 'hover'
    })

    $(function () {
        $.ajax({
            url:"/adminGetAllBlogs", //请求路径
            type:"POST"           //请求方式
        })
    })

    //服务器异步请求删除文章
    function delBLog(data) {
        alert("点击删除按钮");
        const id = data.getAttribute('id')
        alert(id)
        $.ajax({
            url : "/deleteBlogServlet",
            type: "POST",
            data: {
                "id": id
            },
            success: function () {
                alert("文章删除成功!");
            },
            error: function () {
                alert("服务器出现错误，删除失败！");
            }
        });
    };
</script>
</body>
</html>