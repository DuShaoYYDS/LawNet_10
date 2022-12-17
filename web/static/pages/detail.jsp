<%--
  Created by IntelliJ IDEA.
  User: 杜展鹏
  Date: 2022/10/29
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>案件详情</title>
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
  <link rel="stylesheet" href="../css/typo.css">
  <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">--%>
  <link rel="stylesheet" href="../css/animate.min.css">
  <link rel="stylesheet" href="../../static/js/prism/prism.css">
  <%--<link rel="stylesheet" href="../../WEB-INF/lib/prism/prism.css">--%>
  <link rel="stylesheet" href="../../static/js/tocbot/tocbot.css">
  <link href="../css/my.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--导航-->
<nav class="ui inverted attached segment m-padded-tb-mini">
  <div class="ui container">
    <div class="ui inverted secondary stackable menu">
      <h2 class="ui teal header item">CASE</h2>
      <a href="blog.jsp" class="m-item item m-mobile-hide"><i class="home icon"></i>首页</a>
      <a href="types.html" class="m-item item m-mobile-hide"><i class="idea icon"></i>分类</a>
      <a href="tags.html" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
      <a href="archives.html" class="m-item item m-mobile-hide"><i class="clone icon"></i>归档</a>
      <a href="aboutMyself.jsp" class="m-item item m-mobile-hide"><i class="info icon"></i>关于我</a>
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
<div id="waypoint" class="m-container m-padded-tb-big animate__pulse">
  <div class="ui container">
    <div class="ui top attached segment">
      <div class="ui horizontal link list">
        <div class="item">
          <%--<img src="../img/Blog/1.png" alt="" class="ui avatar image">--%>
            <%--博客作者头像--%>
            <img src="${blog.user.avatar}" class="ui avatar image">
          <div class="content"><a class="m-black header m-margin-bottom-small ">${blog.publisherName}</a></div>
        </div>
        <div class="item">
          <i class="calendar icon"></i>${blog.createTime}
        </div>
        <div class="item">
          <i class="eye icon"></i>${blog.views}
        </div>
      </div>
    </div>
    <div class="ui attached segment">
      <!--图片区域-->
      <img src="${blog.firstPicture}" class="ui fluid rounded image">
    </div>
    <div class="ui attached padded segment">
      <!--内容-->
      <div class="ui right aligned basic segment">
        <div class="ui orange basic label">${blog.flag}</div>
      </div>


      <h2 id="section-title" class="ui center aligned header">${blog.title}</h2>
      <br>
      <div id="content" class="typo typo-selection js-toc-content m-padded-lr-reponsive m-padded-tb-large">
        ${blog.content}
      </div>
      <!--标签-->
      <div class="m-padded-tb-large m-padded-lr-reponsive">
        <div class="ui basic teal left pointing label">方法论</div>
      </div>

      <!--赞赏功能-->
      <div class="ui center aligned basic segment">
        <button id="payButton" class="ui orange basic circular button">赞赏</button>
      </div>
      <div class="ui payQR flowing popup transition hidden">
        <div class="ui orange basic label">
          <div class="ui images" style="font-size: inherit !important;">
            <div class="image">
              <img src="../img/wechat/my.jpg" alt="" class="ui rounded bordered image" style="width: 120px">
              <div>支付宝</div>
            </div>
            <div class="image">
              <img src="../img/wechat/my.jpg" alt="" class="ui rounded bordered image" style="width: 120px">
              <div>微信</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="ui attached positive message ">
      <!--案件人信息-->
      <div class="ui middle aligned grid">
        <div class="eleven wide column">
          <ui class="list">
            <li>作者：${blog.publisherName}（联系作者）</li>
            <li>发表时间：${blog.createTime}</li>
            <li>版权声明：自由转载-非商用-非衍生-保持署名（创意共享3.0许可证）</li>
            <li>公众号转载：请在文末调价作者公众号二维码</li>
          </ui>
        </div>
        <div class="five wide column">
          <img src="../img/wechat/my.jpg" alt="" class="ui right floated rounded bordered image" style="width: 110px">
        </div>
      </div>
    </div>


    <div id="comment-container" class="ui bottom attached segment">

      <!--留言区域-->
      <div class="ui teal segment">
        <div class="ui threaded comments">
          <h3 class="ui dividing header">评论</h3>
            <div id="father_cot">
              <c:forEach items="${comments}" var="comment" varStatus="s">
              <div class="comment">
                <a class="avatar">
                  <img src="${comment.avatar}" style="width: 40px; height: auto" />
                </a>
                <div class="content">
                  <a class="author">${comment.username}</a>
                  <div class="metadata">
                    <span class="date">${comment.createTime}</span>
                  </div>
                  <div class="text">
                    ${comment.content}
                  </div>
                  <div class="actions">
                    <div id="parent_id" style="display: none">${comment.id}</div>
                      <a class="reply" data-commentid = "${comment.id}"  data-commentName="@${comment.username}" onclick="reply(this)">回复</a>
                  </div>
                </div>
                <div  class="comments">
                    <div id="son_cot">
                      <c:forEach items="${comment.replyComments}" var="reply" varStatus="j">
                      <div class="comment">
                        <a class="avatar">
                          <img src="${reply.avatar}" style="width: 40px; height: auto" />
                        </a>
                        <div class="content">
                          <a class="author">
                            <span>${reply.username}</span><span class="m_teal"> @${reply.parentComment.username}</span>
                          </a>
                          <div class="metadata">
                            <span class="date">${reply.createTime}</span>
                          </div>
                          <div class="text">
                              ${reply.content}
                          </div>
                          <div class="actions">
                              <%--<div id="${comment.username}" style="display: none">@${comment.username}</div>--%>
                            <a id="1" class="reply" data-commentid = "${reply.id}"  data-commentName="@${reply.username}" onclick="reply(this)">回复</a>
                          </div>
                        </div>
                      </div>
                      </c:forEach>
                    </div>
                </div>
              </div>
              </c:forEach>
            </div>
        </div>
      </div>

      <%--回复模块--%>
      <form action="/saveCommentServlet?id=${blog.id}" method="post">
      <div class="ui form">
        <div class="field">
          <textarea id="com-cont" name="com-cont" class="content" placeholder="请输入你的评论..."></textarea>
        </div>
        <div class="fields">
          <div class="field m-mobile-wide m-margin-bottom-small">
            <div class="ui left icon input">
              <i class="user icon"></i>
              <input id="username" type="text" placeholder="姓名">
            </div>
          </div>
          <div class="field m-margin-bottom-small m-mobile-wide">
            <div class="ui left icon input">
              <i class="mail icon"></i>
              <input id="email" type="text" placeholder="邮箱">
            </div>
          </div>
          <div class="field m-mobile-wide m-margin-bottom-small">
            <div id="father_id" style="display: none">0</div>
            <button type="button" class="ui right teal button" id="comment-btn">
              <i class="edit icon"></i>发布</button>
          </div>
        </div>
      </div>
      </form>
    </div>
  </div>
</div>


<div id="toolbar" class="m-padded m-fixed m-right-bottom" style="display: none">
  <div class="ui vertical icon buttons ">
    <button type="button" class="ui toc teal button">目录</button>
    <a href="#comment-container" class="ui teal button">留言</a>
    <button type="button" class="ui wechat icon button"><i class="weixin icon"></i></button>
    <div id="toTop-button" href="#" class="ui teal button"><i class="chevron up icon"></i></div>
  </div>
</div>
<div class="ui toc-container flowing popup transition hidden" style="width: 250px !important;">
  生成的目录
  <ol class="js-toc"></ol>

</div>

<div id="qrcode" class="ui wechat-qr flowing popup transition hidden" style="width: 130px !important;">
  <!--<img src="../img/wechat/my.jpg" alt="" class="ui rounded image" style="width: 120px">-->
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
<script src="https://cdn.jsdelivr.net/npm/jquery.scrollto@2.1.3/jquery.scrollTo.min.js"></script>
<script src="../../static/js/prism/prism.js"></script>
<script src="../../static/js/tocbot/tocbot.min.js"></script>
<script src="../../static/js/qrcode/qrcode.min.js"></script>
<script src="../../static/js/waypoints/jquery.waypoints.min.js"></script>
<script type="text/javascript">


  $(function () {
    $("#comment-btn").click(function () {

      <c:if test="${empty user}">
        alert("请先登录！！！")
        return false;
      </c:if>
      const com_cont = $("#com-cont").val();
      if('' == com_cont){
        return false;
      }
      var cont = $("#com-cont").val();
      var father_id = $("#father_id").text();
      $.ajax({
        url: "/saveCommentServlet?id=${blog.id}",
        type: "POST",
        data: {
          "com-cont": cont,
          "parent_id": father_id,
        },
        success: function (data) {
          clearn();
        }
      });

    });
  });

  function clearn() {
    $("#com-cont").val('');
    $("#com-cont").attr('placeholder',"请输入你的评论...");
    $("#father_id").html(0);
  }

  function reply(obj) {
    const replace = obj.getAttribute('data-commentName');
    const id = obj.getAttribute('data-commentid')
    $("#com-cont").attr('placeholder',replace);

    //修改父评论id
    $("#father_id").html(id);
    /*alert($("#father_id").text())*/

    //直接替换文本内容！
    /*$("#com-cont").text(replace);*/
  }

  window.onload = function () {
    $.ajax({
      url:"/getBlogDetailsServlet?id=${blog.id}", //请求路径
      type:"POST"           //请求方式
    })
  }


  /*function fun() {*/
    $('.menu.toggle').click(function () {
      $('.m-item').toggleClass('m-mobile-hide');
    });

    /*赞赏功能js实现*/
    $('#payButton').popup({
      popup: $('.payQR.popup'),
      on: 'click',
      position: 'bottom center'
    });

    tocbot.init({
      // Where to render the table of contents.
      tocSelector: '.js-toc',
      // Where to grab the headings to build the table of contents.
      contentSelector: '.js-toc-content',
      // Which headings to grab inside of the contentSelector element.
      headingSelector: 'h1, h2, h3',
      // For headings inside relative or absolute positioned containers within content.
      hasInnerContainers: true,
    });

    $('.toc.button').popup({
      popup: $('.toc-container.popup'),
      on: 'click',
      position: 'left center'
    });

    $('.wechat').popup({
      popup: $('.wechat-qr'),
      position: 'left center'
    });

    var qrcode = new QRCode("qrcode", {
      text: "http://jindo.dev.naver.com/collie",
      width: 110,
      height: 110,
      colorDark: "#000000",
      colorLight: "#ffffff",
      correctLevel: QRCode.CorrectLevel.H
    });

    $('#toTop-button').click(function () {
      $(window).scrollTo(0, 500);
    })

    var waypoint = new Waypoint({
      element: document.getElementById('waypoint'),
      handler: function (direction) {
        if (direction == 'down') {
          $('#toolbar').show(500);
        } else {
          $('#toolbar').hide(500);
        }
      }
    });
  /*}*/

</script>
</body>
</html>
