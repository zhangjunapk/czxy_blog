<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
 <head> 
  <meta charset="utf-8"> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"> 
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ --> 
  <meta name="applicable-device" content="pc,mobile"> 
  <meta name="MobileOptimized" content="width"> 
  <meta name="HandheldFriendly" content="true"> 
  <link rel="shortcut icon" href="/img/logo.png"> 
  <meta name="description" content="风吟博客,一个简洁的Java博客,言曌程序学习的一个新起点。"> 
  <meta name="keywords" content="风吟,风吟博客,Java博客,SSM博客,言曌,言曌博客"> 
  <title>
                风吟博客-莫问收获，但问耕耘。</title> 
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/font-awesome.min.css">
 </head> 
 <body> 
  <div id="page" class="site" style="transform: none;"> 
   <header id="masthead" class="site-header"> 
    <nav id="top-header"> 
     <div class="top-nav"> 
      <div class="user-login"> 
       <a href="/admin">登录</a> 
      </div> 
      <div class="menu-topmenu-container"> 
       <ul id="menu-topmenu" class="top-menu">

        <li class="menu-item"> <a href="/applyLink"> <i class="fa fa-link"></i> <span class="font-text">申请友链&nbsp;</span>&nbsp; </a> </li> 
        <li class="menu-item"> </li> 

        <li class="menu-item"> <a href="/articleFile"> <i class="fa-list-alt fa"></i> <span class="font-text">文章归档&nbsp;</span>&nbsp; </a> </li>
        <li class="menu-item"> </li>

        <li class="menu-item"> <a href="/aboutSite"> <i class="fa fa-info"></i> <span class="font-text">关于本站&nbsp;</span>&nbsp; </a> </li>

        <c:forEach var="link" items="${link_list}">

         <li class="menu-item"> <a href="${link.url}"> <i class="fa fa-info"></i> <span class="font-text">${link.name}&nbsp;</span>&nbsp; </a> </li>

        </c:forEach>


       </ul> 
      </div> 
     </div> 
    </nav>
    <!-- #top-header --> 
    <div id="menu-box"> 
     <div id="top-menu"> 
      <span class="nav-search"> <i class="fa fa-search"></i> </span> 
      <div class="logo-site">
       <h1 class="site-title"> <a href="/" title="风吟博客">风吟博客</a> </h1> 
       <p class="site-description">莫问收获，但问耕耘。</p> 
      </div>
      <!-- .logo-site --> 
      <div id="site-nav-wrap"> 
       <div id="sidr-close"> 
        <a href="#sidr-close" class="toggle-sidr-close">×</a> 
       </div> 
       <nav id="site-nav" class="main-nav"> 
        <a href="#sidr-main" id="navigation-toggle" class="bars"> <i class="fa fa-bars"></i> </a> 

        <div class="menu-pcmenu-container">
         <ul id="menu-pcmenu" class="down-menu nav-menu sf-js-enabled sf-arrows"> 
          <li> <a href="/"> <i class="fa-home fa"></i> <span class="font-text">首页</span> </a> </li>


          <c:forEach var="typeVo" items="${type_list}">
          <li> <a href="/TypeTagServlet?method=show&cz=type&typeTagId=${typeVo.parentType.id}&pageNum=1"> <i class="fa fa-coffee"></i> <span class="font-text">${typeVo.parentType.title}</span> </a>
           <ul class="sub-menu">
            <c:forEach var="type" items="${typeVo.childType}">
             <li> <a href="/TypeTagServlet?method=show&cz=type&typeTagId=${type.id}&pageNum=1" target="_blank">${type.title}</a> </li>
            </c:forEach>
           </ul>
           </c:forEach>



          <li> <a href="message.html"> <i class="fa fa-comment"></i> <span class="font-text">留言板&nbsp;</span> </a> </li>
         </ul> 
        </div> 
       </nav> 
      </div> 
      <div class="clear"></div> 
     </div>
     <!-- #top-menu --> 
    </div>
    <!-- #menu-box --> 
   </header>
   <!-- #masthead --> 
   <div id="search-main"> 
    <div class="searchbar"> 
     <form method="get" id="searchform" action="/index">
      <input type="text" hidden name="method" value="searchBlog"/>
      <span> <input type="text" value="" name="name" id="s" placeholder="输入搜索内容" required=""> <button type="submit" id="searchsubmit">搜索</button> </span>
     </form> 
    </div> 
    <div class="clear"></div> 
   </div> 
   <nav class="breadcrumb"> 
    <div class="bull">
     <i class="fa fa-volume-up"></i>
    </div> 
    <div id="scrolldiv"> 
     <div class="scrolltext"> 
      <ul style="margin-top: 0px;">
       <li class="scrolltext-title">
        <a href="/notice/3" rel="bookmark">今天测试下</a>
       </li>
          <c:forEach var="notice" items="${notice_list}">
              <li class="scrolltext-title"> <a href="#" rel="bookmark">${notice.title}</a> </li>
          </c:forEach>
      </ul> 
     </div> 
    </div> 
   </nav> 
   <div id="content" class="site-content" style="transform: none;">

    <div id="primary" class="content-area"> 
     <main id="main" class="site-main" role="main">

<c:forEach var="blogVo" items="${blog_list.list}">
 <article class="post type-post">
  <figure class="thumbnail">
   <a href="article_16.html"> <img width="280" height="210" src="../images/img_19.jpg" class="attachment-content size-content wp-post-image" alt="${blogVo.blog.title}"> </a>
   <span class="cat"> <a href="2.html">${blogVo.blog.title}</a> </span>
  </figure>
  <header class="entry-header">
   <h2 class="entry-title"> <a href="article_16.html" rel="bookmark"> ${blogVo.blog.title}</a> </h2>
  </header>
  <div class="entry-content">
   <div class="archive-content">
     ${blogVo.blog.content}
   </div>
   <span class="title-l"></span>
   <span class="new-icon"> </span>
   <span class="entry-meta"> <span class="date">${blogVo.blog.date} &nbsp;&nbsp; </span> <span class="views"> <i class="fa fa-eye"></i> ${blogVo.viewCount} </span> <span class="comment">&nbsp;&nbsp; <a href="article_16.html#comments" rel="external nofollow"> <i class="fa fa-comment-o"></i> ${blogVo.commentCount} </a> </span> </span>
   <div class="clear"></div>
  </div>
  <!-- .entry-content -->
  <span class="entry-more"> <a href="/item?method=getItem&cz=type&typeTagId=${blogVo.blog.typeId}&BlogId=${blogVo.blog.id}" rel="bookmark"> 阅读全文 </a> </span>
 </article>
</c:forEach>



     </main> 
     <nav class="navigation pagination" role="navigation"> 
      <div class="nav-links"> <%--
       <a class="page-numbers current">1</a> 
       <a class="page-numbers" href="/p/2">2</a> 
       <a class="page-numbers" href="/p/2">--%>
        <c:forEach var="i" step="1" begin="1" end="${blog_list.pages}">
         <a class="${i==blog_list.pageNum ?  'page-numbers current':'page-numbers'}" href="/index?method=index&pageNum=${i}">${i}</a>
         </c:forEach>

        <span class="fa fa-angle-right"></span>

       </a>
      </div> 
     </nav> 
    </div> 
    <div id="sidebar" class="widget-area all-sidebar" style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;"> 
     <aside class="widget about"> 
      <h3 class="widget-title"> <i class="fa fa-bars"></i>关于本站 </h3> 
      <div id="feed_widget"> 
       <div class="feed-about"> 
        <div class="about-main"> 
         <div class="about-img"> 
          <img src="./images/2017100622490186.png" alt="QR Code"> 
         </div> 
         <div class="about-name">
          博客初心
         </div> 
         <div class="about-the">
           言曌程序学习的新起点，大学最后两年的成长记录。珍惜时间，保持努力的惯性。
         </div> 
        </div> 
        <div class="clear"></div> 
        <ul> 
         <li class="weixin"> <a title="微信" id="weixin_btn" rel="external nofollow"> <i class="fa fa-weixin"> </i> 
           <div id="weixin_code" class="hide"> 
            <img src="./images/20171006224906122.jpg" alt=""> 
           </div> </a> </li> 
         <li class="tqq"> <a target="blank" rel="external nofollow" href="http://wpa.qq.com/msgrd?V=3&amp;uin=847064370&amp;Site=QQ&amp;Menu=yes" title="QQ在线"> <i class="fa fa-qq"></i> </a> </li> 
         <li class="tsina"> <a title="" href="http://weibo.com/5936412667" target="_blank" rel="external nofollow"> <i class="fa fa-weibo"></i> </a> </li> 
         <li class="feed"> <a title="" href="https://github.com/saysky" target="_blank" rel="external nofollow"> <i class="fa fa-github"></i> </a> </li> 
        </ul> 
        <div class="about-inf"> 
         <span class="about-pn">文章 18</span> 
         <span class="about-cn">留言 15</span> 
        </div> 
       </div> 
      </div> 
      <div class="clear"></div> 
     </aside> 
     <aside id="php_text-22" class="widget php_text"> 
      <h3 class="widget-title"> <i class="fa fa-bars"></i>网站概况 </h3> 
      <div class="textwidget widget-text"> 
       <ul class="site-profile"> 
        <li><i class="fa fa-file-o"></i> 文章总数：${blog_count} 篇</li>
        <li><i class="fa fa-commenting-o"></i> 留言数量：a 条</li>
        <li><i class="fa fa-folder-o"></i> 分类数量：${type_count} 个</li>
        <li><i class="fa fa-tags"></i> 标签总数：${tag_count} 个</li>
        <li><i class="fa fa-link"></i> 链接数量：2 个</li> 
        <li><i class="fa fa-eye"></i> 浏览总量：${read_count} 次</li>
        <li><i class="fa fa-pencil-square-o"></i> 最后更新： <span style="color:#2F889A"> ${time}</span> </li>
       </ul> 
      </div> 
      <div class="clear"></div> 
     </aside> 
     <aside class="widget hot_comment"> 
      <h3 class="widget-title"> <i class="fa fa-bars"></i>热评文章 </h3> 
      <div id="hot_comment_widget"> 
       <ul>
        <li> <a href="article_16.html" rel="bookmark" title=" (3条评论)"> execute、executeUpdate、executeQuery三者的区别</a> </li>
        <li> <a href="article_16.html" rel="bookmark" title=" (3条评论)"> sql语句分为三类(DML,DDL,DCL)-介绍</a> </li>
        <li> <a href="article_16.html" rel="bookmark" title=" (2条评论)"> java中ImageIcon路径问题</a> </li>
        <c:forEach var="blog" items="${hot_blog_list}">
         <li> <a href="/item?method=getItem&cz=type&typeTagId=${blog.typeId}&BlogId=${blog.id}" rel="bookmark" title=" (${blog.commentCount}条评论)"> ${blog.title}</a> </li>
        </c:forEach>
       </ul> 
      </div> 
      <div class="clear"></div> 
     </aside> 
     <aside class="widget"> 
      <h3 class="widget-title"> <i class="fa fa-bars"></i>所有标签 </h3> 
      <div class="tagcloud">

       <c:forEach var="tag" items="${tag_list}">
        <a href="/TypeTagServlet?method=show&cz=tag&typeTagId=${tag.id}" class="tag-link-129 tag-link-position-1" title="${tag.title}" style="font-size: 14px;"> ${tag.title}</a>
       </c:forEach>

       <div class="clear"></div> 
      </div> 
      <div class="clear"></div> 
     </aside> 
     <aside id="random_post-7" class="widget random_post wow fadeInUp" data-wow-delay="0.3s"> 
      <h3 class="widget-title"> <i class="fa fa-bars"></i>随机文章 </h3> 
      <div id="random_post_widget"> 
       <ul> 
        <li> <a href="article_16.html" rel="bookmark"> Java中静态代码块、构造代码块的区别</a> </li>
        <li> <a href="article_16.html" rel="bookmark"> Java如何让程序一直运行，不停止</a> </li>
        <li> <a href="article_16.html" rel="bookmark"> Mybatis高级映射多对多查询</a> </li>
        <li> <a href="article_16.html" rel="bookmark"> 使用rapid-framework继承jsp页面</a> </li>
        <li> <a href="article_16.html" rel="bookmark"> JDBC常用API和使用</a> </li>
        <li> <a href="article_16.html" rel="bookmark"> Integer与int的种种比较你知道多少？</a> </li>
        <li> <a href="article_16.html" rel="bookmark"> Hibernate 基本类型</a> </li>
        <li> <a href="article_16.html" rel="bookmark"> [转载]SpringMVC中使用Interceptor拦截器</a> </li>
       </ul> 
      </div> 
      <div class="clear"></div> 
     </aside> 
     <aside id="recent_comments-2" class="widget recent_comments wow fadeInUp" data-wow-delay="0.3s">
      <h3 class="widget-title"><i class="fa fa-bars"></i>近期评论</h3> 
      <div id="message" class="message-widget"> 
       <ul> 
         <li style="border: none;"> <a href="article_16.html/#anchor-comment-4" title="Mybatis高级映射多对多查询" rel="external nofollow"> <img alt="" src="./images/6c9a70c6547f70083aef1a8b874a87ce" class="avatar avatar-64 photo" height="64" width="64"> <span class="comment_author"> <strong>Tom</strong> </span> Tom来测试</a> </li>
        <li style="border: none;"> <a href="article_16.html/#anchor-comment-3" title="Mybatis高级映射多对多查询" rel="external nofollow"> <img alt="" src="./images/487f87505f619bf9ea08f26bb34f8118" class="avatar avatar-64 photo" height="64" width="64"> <span class="comment_author"> <strong>张三</strong> </span> 评论测试</a> </li>


        <c:forEach var="comment" items="${comment_list}">
         <li style="border: none;"> <a href="/item?method=getItem&cz=type&typeTagId=${comment.typeId}&BlogId=${comment.blogId}" title="Mybatis高级映射多对多查询" rel="external nofollow"> <img alt="" src="./images/487f87505f619bf9ea08f26bb34f8118" class="avatar avatar-64 photo" height="64" width="64"> <span class="comment_author"> <strong>张三</strong> </span> ${comment.content}</a> </li>

        </c:forEach>


       </ul>
      </div> 
      <div class="clear"></div> 
     </aside> 
    </div> 
   </div> 
   <div class="clear"></div> 
   <div class="links-box"> 
    <div id="links"> 
     <ul class="lx7"> 
      <li class="link-f link-name"> <a href="http://liuyanzhao.com" target="_blank"> 言曌博客</a> </li> 
     </ul> 
     <ul class="lx7"> 
      <li class="link-f link-name"> <a href="http://liuyanzhao.com" target="_blank"> 测试</a> </li> 
     </ul> 
     <div class="clear"></div> 
    </div> 
   </div> 
   <footer id="colophon" class="site-footer" role="contentinfo"> 
    <div class="site-info"> 
     <p style="text-align: center;">Copyright © 2017 <a href="/" target="_blank" rel="noopener noreferrer">风吟博客</a> All rights reserved. <a target="_blank" href="/map"> <span class="font-text">站点地图</span> </a> </p> 
    </div> 
    <!-- .site-info --> 
   </footer>
   <!-- .site-footer --> 
  </div> 
  <script src="./js/jquery.min.js"></script> 
  <script src="./js/superfish.js"></script> 
  <script src="./js/script.js"></script> 
  <script src="./js/layui.all.js"></script>
 pageNum:${blog_list.pageNum}<br>
 pageSize:${blog_list.pages}
 </body>
</html>