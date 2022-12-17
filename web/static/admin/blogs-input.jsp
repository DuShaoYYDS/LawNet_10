<%--
  Created by IntelliJ IDEA.
  User: 杜展鹏
  Date: 2022/11/1
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>案件发布</title>
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
  <link rel="stylesheet" href="../../static/editormd/css/editormd.min.css">
  <link href="../css/my.css" rel="stylesheet" type="text/css">
</head>
<!--导航-->
<nav class="ui inverted attached segment m-padded-tb-mini m-shadow-small">
  <div class="ui container">
    <div class="ui inverted secondary stackable menu">
      <h2 class="ui teal header item">管理后台</h2>
      <a href="#" class="active m-item item m-mobile-hide"><i class="home icon"></i>文章</a>
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
            <a href="/logoutServlet" class="item" onclick="">注销</a>
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
      <a href="blogs-input.jsp" class="teal active item">发布</a>
      <a href="/adminGetAllBlogs" class="item">列表</a>
    </div>
  </div>
</div>

<!--中间内容-->
 <div class="m-container m-padded-tb-big">
  <div class="ui container">
    <form action="/releaseBlogServlet" method="post" class="ui form">

      <div class="required field">
        <div class="ui left labeled input">
          <div class="ui selection compact teal basic dropdown label">
            <input id="flag_id" type="hidden" value="原创" name="flag.id">
            <i class="dropdown icon"></i>
            <div class="default text">原创</div>
            <div class="menu">
              <div class="item" data-value="1">原创</div>
              <div class="item" data-value="2">转载</div>
              <div class="item" data-value="3">翻译</div>
            </div>
          </div>
          <c:if test="${not empty editBlog}">
            <input id="title" type="text" name="title" value="${editBlog.title}" />
          </c:if>
          <c:if test="${empty editBlog}">
            <input id="title" type="text" name="title" placeholder="请输入文章标题">
          </c:if>
        </div>
      </div>

      <div class="field">
        <div id="md-content" style="z-index: 1 !important;">
            <textarea id="content" placeholder="博客内容" name="content" style="display: none">
              <c:if test="${not empty editBlog}">
                ${editBlog.content}
              </c:if>
              <c:if test="${empty editBlog}">
                [TOC]
                #### Disabled options

                - TeX (Based on KaTeX);
                - Emoji;
                - Task lists;
                - HTML tags decode;
                - Flowchart and Sequence Diagram;
              </c:if>
            </textarea>
        </div>
      </div>

      <div class="two fields">
        <div class="field">
          <div class="ui left labeled action input">
            <label class="ui compact teal basic label">分类</label>
            <div class="ui fluid selection dropdown">
              <input id="type_id" type="hidden" name="type.id">
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

        </div>
        <div class="field">
          <div class="ui left labeled action input">
            <label class="ui compact teal basic label">标签</label>
            <div class="ui fluid selection multiple search  dropdown">
              <input type="hidden" name="tagIds">
              <i class="dropdown icon"></i>
              <div class="default text">标签</div>
              <div class="menu">
                <div class="item" data-value="1">工商赔偿</div>
                <div class="item" data-value="2">民间纠纷</div>
                <div class="item" data-value="3">婚姻财产</div>
                <div class="item" data-value="4">企业融资</div>
                <div class="item" data-value="5">法律讲堂</div>
                <div class="item" data-value="6">法典参考</div>
                <div class="item" data-value="7">个人趣事</div>
                <div class="item" data-value="8">JavaWeb</div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="field">
        <div class="ui left labeled input">
          <label class="ui teal basic label">首图</label>
          <c:if test="${not empty editBlog}">
            <input id="indexPicture" type="text" name="indexPicture" value="${editBlog.firstPicture}" />
          </c:if>
          <c:if test="${empty editBlog}">
            <input id="indexPicture" type="text" name="indexPicture" placeholder="首图引用地址" />
          </c:if>
        </div>
      </div>

      <div class="inline fields">
        <div class="field">
          <div class="ui checkbox" >
            <input type="checkbox" id="recommend" name="recommend" checked class="hidden">
            <label for="recommend">推荐</label>
          </div>
        </div>

        <div class="field">
          <div class="ui checkbox" >
            <input type="checkbox" id="shareInfo" name="shareInfo"  checked class="hidden">
            <label for="recommend">转载声明</label>
          </div>
        </div>
        <div class="field">
          <div class="ui checkbox" >
            <input type="checkbox" id="appreciation" name="appreciation"  checked class="hidden">
            <label for="recommend">赞赏</label>
          </div>
        </div>
        <div class="field">
          <div class="ui checkbox" >
            <input type="checkbox" id="comment" name="comment"  checked class="hidden">
            <label for="recommend">评论</label>
          </div>
        </div>
      </div>

      <div class="ui error message"></div>

      <div class="ui right aligned container">
        <button type="button" class="ui button" onclick="window.history.go(-1)">返回</button>

        <%--草稿保存，异步请求，留在本页面--%>
        <button type="button" class="ui secondary button" id="save-btn" onclick="save_blog()">保存</button>

        <%--   release   发布--%>
        <button type="submit" class="ui teal button" id="release-btn">发布</button>
      </div>

    </form>
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
<script src="../../static/editormd/editormd.min.js"></script>
<script type="text/javascript" language="JavaScript">
  //监测页面退出事件
  // 关闭窗口时弹出确认提示
  window.onbeforeunload = onbeforeunload_handler;
  function onbeforeunload_handler(){
    var warning="确认退出?";
    return warning;
  };


  //初始化MarkDown编辑器
  var contentEditor;

  $(function() {
    contentEditor = editormd("md-content", {
      width   : "100%",
      height  : 640,
      syncScrolling : "single",
      path    : "../../static/editormd/lib/"/*,
        saveHTMLToTextarea : true, // 保存 HTML 到 Textarea
        toolbarAutoFixed:true,//工具栏自动固定定位的开启与禁用
        imageUpload : true,
        imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
        imageUploadURL : "/file/uploadImage"*/
    });

  });

  $('.menu.toggle').click(function () {
    $('.m-item').toggleClass('m-mobile-hide');
  });

  $('.ui.dropdown').dropdown({
    on : 'hover'
  })

  $('.ui.form').form({
    fields : {
      titel : {
        identifier : 'title',
        rules : [{
          type : 'empty',
          prompt : '请输入博客标题'
        }]
      }
    }
  })

  <c:if test="${not empty message}">
    $(function () {
      alert("${message}");
      <%
        session.removeAttribute("message");
      %>
    })
  </c:if>


    <%
       if(session.getAttribute("editBlog") == null){
         session.removeAttribute("editBlog");
       }
    %>

  //草稿文章异步保存

  function save_blog() {
    $.ajax({
      url: "/saveBlogServlet",
      type: "POST",
      data: {
        "title" : $("#title").val(),
        "content" : $("#content").val(),
        "flag.id" : $("#flag_id").val(),
        "indexPicture" : $("#indexPicture").val(),
        "type.id" : $("#type_id").val(),
        "indexPicture" : $("#indexPicture").val()
      },
      success: function () {
        alert("文章保存成功！");
      }
    });
  };

</script>
</body>
</html>