<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhangJun
  Date: 2018/5/12
  Time: 1:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="applicable-device" content="pc,mobile">
    <meta name="MobileOptimized" content="width">
    <meta name="HandheldFriendly" content="true">
    <link rel="shortcut icon" href="/img/logo.png">
    <meta name="description" content="Java基础">
    <meta name="keywords" content="Java基础">
    <title>Java基础</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <script src="/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var url = "/TypeTagServlet";
            var params ={
                "method":"findAllTag"
            };
            $.post(url,params,function (data) {
                $(data).each(function () {
                    $("#allTag").append("<a href=\"/TypeTagServlet?method=showTypeTag&cz=tag&id="+data.id+"\" class=\"tag-Link-129 tag-Link-position-1\" title=\"6个话题\" style=\"font-size: 14px;\"> data.title</a>")
                });
            },"json");
        });

    </script>
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
            <form method="get" id="searchform" action="/search">
                <span> <input type="text" value="" name="query" id="s" placeholder="输入搜索内容" required=""> <button type="submit" id="searchsubmit">搜索</button> </span>
            </form>
        </div>
        <div class="clear"></div>
    </div>
    <nav class="breadcrumb">
        <a class="crumbs" href="/"> <i class="fa fa-home"></i>首页</a>
        <i class="fa fa-angle-right"></i>
        <a href="1.html">Java</a>
        <i class="fa fa-angle-right"></i> 文章
    </nav>
    <div id="content" class="site-content" style="transform: none;">
        <div id="primary" class="content-area">
            <main id="main" class="site-main">

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
                <div class="nav-links">
                   <%-- <a class="page-numbers current">1</a>--%>

                    <c:forEach var="i" step="1" begin="1" end="${blog_list.pages}">
                        <a class="${i==blog_list.pageNum ?  'page-numbers current':'page-numbers'}" href="/TypeTagServlet?method=show&cz=type&typeTagId=1&pageNum=1">${i}</a>
                    </c:forEach>


                </div>
            </nav>
        </div>
        <div id="sidebar" class="widget-area all-sidebar" style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;">
            <aside class="widget widget_search">
                <div class="searchbar">
                    <form method="get" id="searchform1" action="/index">
                        <input type="text" hidden name="method" value="searchBlog"/>
                        <span> <input type="text" value="" name="name" id="s1" placeholder="输入搜索内容" required=""> <button type="submit" id="searchsubmit1">搜索</button> </span>
                    </form>
                </div>
                <div class="clear"></div>
            </aside>
            <aside class="widget hot_comment">
                <h3 class="widget-title"> <i class="fa fa-bars"></i>热评文章 </h3>
                <div id="hot_comment_widget">
                    <ul>
                        <li> <a href="article_16.html" rel="bookmark" title=" (3条评论)"> execute、executeUpdate、executeQuery三者的区别</a> </li>
                        <c:forEach var="blog" items="${hot_blog_list}">

                            <li> <a href="article_16.html" rel="bookmark" title=" (${blog.commentCount}条评论)"> ${blog.title}</a> </li>

                        </c:forEach>
                    </ul>
                </div>
                <div class="clear"></div>
            </aside>
            <aside class="widget">
                <h3 class="widget-title"> <i class="fa fa-bars"></i>所有标签 </h3>
                <div class="tagcloud" id="allTag">
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
                        <li> <a href="article_16.html" rel="bookmark"> Integer与int的种种比较你知道多少？</a> </li>
                        <li> <a href="article_16.html" rel="bookmark"> Java如何让程序一直运行，不停止</a> </li>
                        <li> <a href="article_16.html" rel="bookmark"> sql语句分为三类(DML,DDL,DCL)-介绍</a> </li>
                        <li> <a href="article_16.html" rel="bookmark"> Mybatis高级映射多对多查询</a> </li>
                        <li> <a href="article_16.html" rel="bookmark"> 使用rapid-framework继承jsp页面</a> </li>
                        <li> <a href="article_16.html" rel="bookmark"> Hibernate 基本类型</a> </li>
                        <li> <a href="article_16.html" rel="bookmark"> execute、executeUpdate、executeQuery三者的区别</a> </li>
                        <li> <a href="article_16.html" rel="bookmark"> Servlet 实现验证码</a> </li>
                    </ul>
                </div>
                <div class="clear"></div>
            </aside>
        </div>
    </div>
    <div class="clear"></div>
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

</body></html>
