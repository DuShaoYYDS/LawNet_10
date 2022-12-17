<%--
  Created by IntelliJ IDEA.
  User: 杜展鹏
  Date: 2022/11/5
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>关于我</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
    <link href="../css/my.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">


        function delBlog(data) {
            const id = data.getAttribute('id')
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
            })
        }
    </script>
</head>
<body>
<!--导航-->
<nav class="ui inverted attached segment m-padded-tb-mini m-shadow-small">
    <div class="ui container">
        <div class="ui inverted secondary stackable menu">
            <h2 class="ui teal header item">CASE</h2>
            <a href="blog.jsp" class="m-item item m-mobile-hide"><i class="home icon"></i>首页</a>
            <a href="types.html" class="m-item item m-mobile-hide"><i class="idea icon"></i>分类</a>
            <a href="tags.html" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <a href="archives.html" class="m-item item m-mobile-hide"><i class="clone icon"></i>归档</a>
            <a href="about.jsp" class="active m-item item m-mobile-hide"><i class="info icon"></i>关于我</a>
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
<div id="blog-container" class="m-container m-padded-tb-big">
    <div class="ui container">
        <div class="ui stackable grid">
            <div class="eleven wide column">
                <!--header-->
                <div class="ui top attached segment">
                    <div class="ui middle aligned two column grid">
                        <div class="column">
                            <h3 class="ui teal header">我的文案</h3>
                        </div>
                        <div class="right aligned column">
                            共<h2 class="ui orange header m-inline-block m-text-thin">${fn:length(myBlogs)}</h2>篇
                        </div>
                    </div>
                </div>

                <!--content-->
                <div  id="content" class="ui attached segment">
                    <c:forEach items="${myBlogs}" var="blog" varStatus="s">
                        <div class="ui padded vertical segment m-padded-tb-large">
                            <div class="ui mobile reversed stackable grid">
                                <div class="eleven wide column">
                                    <h3 class="ui header"> <a href="/getBlogDetailsServlet?id=${blog.id}" class="m-black" target="_blank">${blog.title}</a></h3>
                                    <c:set var="content" value="${fn:substring(blog.content,0,100)}"/>
                                    <p class="m-text">${content}......</p>
                                    <div class="ui grid">
                                        <div class="eleven wide column">
                                            <div class="ui mini horizontal link list">
                                                <div class="item">
                                                    <img src="${user.avatar}" alt="" class="ui avatar image">
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
                                            <c:if test="${blog.published}">
                                                <a href="#" target="_blank" class="ui teal basic label m-padded-tiny  m-text-thin">公开文案</a>
                                            </c:if>
                                            <c:if test="${!blog.published}">
                                                <a href="#" target="_blank" class="ui teal basic label m-padded-tiny  m-text-thin">文案草稿</a>
                                            </c:if>
                                        </div>
                                    </div>


                                </div>
                                <div class="five wide column">
                                    <a href="#" target="_blank">
                                        <img src="${blog.firstPicture}" class="ui rounded image">
                                    </a>
                                    <div class="ui grid " style="margin-left: 0px;margin-top: 35px">
                                        <div><a href="/editorBlogServlet?id=${blog.id}" id="edit-btn" target="_blank"
                                                class="ui red basic label m-padded-tiny m-text">
                                            &nbsp编辑&nbsp<i class="edit outline icon"></i></a></div>
                                        <div><button type="button" id="${blog.id}" onclick="delBlog(this)"
                                                class="ui red basic label m-padded-tiny m-text">
                                            &nbsp删除&nbsp<i class="trash alternate outline icon"></i></button></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!--footer-->
                <div class="ui bottom attached segment">
                    <div class="ui middle aligned two column grid">
                        <div class="column">
                            <a class="ui teal mini basic button">上一页</a>
                        </div>
                        <div class="right aligned column">
                            <a href="#" class="ui teal mini basic button">下一页</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="five wide column">
                <div class="ui top attached segment">
                    <div class="ui header">关于我</div>
                </div>
                <div class="ui attached segment">
                    <p class="m-text-thin">罗翔于1995年—1999年本科就读于中国青年政治学院，毕业获得法学学士学位；
                        1999年—2002年硕士就读于中国政法大学研究生院，毕业获得刑法学硕士学位；2002年—2005年博士就读于北京大学法学院，
                        毕业获得刑法学博士学位；2005年进入中国政法大学执教 [20]  ；2009年—2010年在美国加利福尼亚大学伯克利分校做访问学者；
                        2013年—2014年在美国杜克大学做访问学者</p>
                    <%--<p class="m-text-thin"></p>--%>
                </div>
                <div class="ui attached segment">
                    <div class="ui orange basic left pointing label">编程</div>
                    <div class="ui orange basic left pointing label">写作</div>
                    <div class="ui orange basic left pointing label">思考</div>
                    <div class="ui orange basic left pointing label">运动</div>
                </div>
                <div class="ui attached segment">
                    <div class="ui teal basic left pointing label m-margin-tb-tiny">Java</div>
                    <div class="ui teal basic left pointing label m-margin-tb-tiny">JavaScript</div>
                    <div class="ui teal basic left pointing label m-margin-tb-tiny">Node</div>
                    <div class="ui teal basic left pointing label m-margin-tb-tiny">React</div>
                    <div class="ui teal basic left pointing label m-margin-tb-tiny">C++</div>
                    <div class="ui teal basic left pointing label m-margin-tb-tiny">MYSQL</div>
                    <div class="ui teal basic left pointing label m-margin-tb-tiny">...</div>
                </div>
                <div class="ui attached segment">
                    <span class="ui top orange basic left label m-margin-tb-tiny">我有我的想法-----></span>
                    <a class="ui teal basic left label m-margin-tb-tiny" href="../admin/blogs-input.jsp"
                                         style="margin-top: 20px;margin-left: 20px; font-size: 16px">WRITE <i class="pencil alternate icon"></i></a>
                </div>
                <div class="ui attached segment">
                    <div style="padding-left: 70px">
                        <a href="#" class="ui circular icon button"><i class="github icon"></i></a>
                        <a href="#" class="ui wechat circular icon button"><i class="weixin icon"></i></a>
                        <a href="#" class="ui qq circular icon button" data-content="3025138186" data-position="bottom center"><i class="qq icon"></i></a>
                    </div>
                </div>

                <div class="ui wechat-qr flowing popup transition hidden">
                    <img src="../img/wechat/my.jpg" alt="" class="ui rounded image" style="width: 120px">
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


    $(function () {

        <c:if test="${empty user}">
            alert("请先登录");
            window.history.go(-1)
        </c:if>

        <c:if test="${not empty user}">
        $.ajax({
            url:"/getMyselfBlogs", //请求路径
            type:"POST",           //请求方式
            dataType: "json",
            success: function (data) {

            }
        })
        </c:if>
    });



    $('.menu.toggle').click(function () {
        $('.m-item').toggleClass('m-mobile-hide');
    });

    $('.wechat').popup( {
        popup :$('.wechat-qr'),
        position : 'bottom center'
    });

    $('.qq').popup();



</script>
</body>
</html>
