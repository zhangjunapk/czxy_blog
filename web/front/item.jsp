<%--
  Created by IntelliJ IDEA.
  User: ZhangJun
  Date: 2018/5/12
  Time: 1:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="applicable-device" content="pc,mobile">
    <meta name="MobileOptimized" content="width">
    <meta name="HandheldFriendly" content="true">
    <link rel="shortcut icon" href="/img/logo.png">
    <meta name="description" content="风吟博客,一个简洁的Java博客,言曌程序学习的一个新起点。">
    <meta name="keywords" content="风吟,风吟博客,Java博客,SSM博客,言曌,言曌博客">
    <title>Java中File类的使用</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/highlight.css">
    <style>
        .entry-title {
            background: #f8f8f8;
        }
    </style>
    <script src="http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=423904"></script>
    <link id="layuicss-laydate" rel="stylesheet"
          href="file:///E:/czxy_project/03_%E7%A4%BE%E5%8C%BA%E9%9D%99%E6%80%81%E9%A1%B5%E9%9D%A2/js/css/modules/laydate/default/laydate.css?v=5.0.5"
          media="all">
    <link id="layuicss-layer" rel="stylesheet"
          href="file:///E:/czxy_project/03_%E7%A4%BE%E5%8C%BA%E9%9D%99%E6%80%81%E9%A1%B5%E9%9D%A2/js/css/modules/layer/default/layer.css?v=3.0.3"
          media="all">
    <link id="layuicss-skincodecss" rel="stylesheet"
          href="file:///E:/czxy_project/03_%E7%A4%BE%E5%8C%BA%E9%9D%99%E6%80%81%E9%A1%B5%E9%9D%A2/js/css/modules/code.css"
          media="all">
    <link rel="stylesheet" href="http://bdimg.share.baidu.com/static/api/css/share_style0_16.css?v=8105b07e.css">
</head>
<script type="text/javascript" src="/js/jquery-1.12.4.js"></script>
<script type="text/javascript">
</script>
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
                        <li class="menu-item"><a href="/applyLink"> <i class="fa fa-link"></i> <span class="font-text">申请友链&nbsp;</span>&nbsp;
                        </a></li>
                        <li class="menu-item"></li>
                        <li class="menu-item"><a href="/articleFile"> <i class="fa-list-alt fa"></i> <span
                                class="font-text">文章归档&nbsp;</span>&nbsp; </a></li>
                        <li class="menu-item"></li>
                        <li class="menu-item"><a href="/aboutSite"> <i class="fa fa-info"></i> <span class="font-text">关于本站&nbsp;</span>&nbsp;
                        </a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- #top-header -->
        <div id="menu-box">
            <div id="top-menu">
                <span class="nav-search"> <i class="fa fa-search"></i> </span>
                <div class="logo-site">
                    <h1 class="site-title"><a href="/" title="风吟博客">风吟博客</a></h1>
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


                                <c:forEach var="typeVo" items="${typeVos}">
                                <li> <a href="/TypeTagServlet?method=show&cz=type&typeTagId=${typeVo.parentType.id}&pageNum=1"> <i class="fa fa-coffee"></i> <span class="font-text">${typeVo.parentType.title}</span> </a>
                                    <ul class="sub-menu">
                                        <c:forEach var="type" items="${typeVo.childType}">
                                            <li> <a href="/TypeTagServlet?method=show&cz=type&typeTagId=${type.id}$pageNum=1" target="_blank">${type.title}</a> </li>
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
            <form method="get" id="searchform" action="index">
                <input type="text" name="method" hidden value="searchBlog"/>
                <span> <input type="text" value="" name="name" id="s" placeholder="输入搜索内容" required=""> <button
                        type="submit" id="searchsubmit">搜索</button> </span>
            </form>
        </div>
        <div class="clear"></div>
    </div>
    <nav class="breadcrumb">
        <a class="crumbs" href="/"> <i class="fa fa-home"></i>首页 </a>
        <i class="fa fa-angle-right"></i>
        <a href="1.html"> Java</a>
        <i class="fa fa-angle-right"></i>
        <a href="2.html"> Java基础</a>
        <i class="fa fa-angle-right"></i> 正文
    </nav>
    <div id="content" class="site-content" style="transform: none;">
        <div id="primary" class="content-area">
            <main id="main" class="site-main" role="main">
                <article class="post">
                    <header class="entry-header">
                        <h1 class="entry-title"> ${blog.title} </h1>
                    </header>
                    <!-- .entry-header -->
                    <div class="entry-content">
                        <div class="single-content">
                            <h2>${blog.title}</h2>
                            <div class="dp-highlighter">
                                <div class="bar"></div>
                                <%--<ol class="dp-j" start="1">--%>
                                <%--<li class="alt"><span class="keyword">package</span>&nbsp;com.liuyanzhao;</li>--%>
                                <%--</ol>--%>
                                <ol class="dp-j" start="1">
                                    <li class="alt"><span class="keyword">${blog.content}</span</li>
                                </ol>
                            </div>
                            <p>&nbsp;</p>
                            <h2>二、遍历目录</h2>
                            <div class="dp-highlighter">
                                <div class="bar"></div>
                                <%--<ol class="dp-j" start="1">--%>
                                <%--<li class="alt"><span class="keyword">package</span>&nbsp;com.liuyanzhao;</li>--%>
                                <%--</ol>--%>
                            </div>
                        </div>


                        <div class="s-weixin">
                            <ul class="weimg1">
                                <li><strong>微信</strong></li>
                                <li>赶快加我聊天吧</li>
                                <li><img src="../images/weixin.jpg"></li>
                            </ul>
                            <ul class="weimg2">
                                <li><strong>博客交流群</strong></li>
                                <li>海纳百川，大家来水</li>
                                <li><img src="../images/qqGroup.jpg" alt="weinxin"></li>
                            </ul>
                            <div class="clear"></div>
                        </div>
                        <div class="clear"></div>
                        <div id="social">
                            <div class="social-main">
                                <span class="like"> <a href="javascript:;" data-action="ding" data-id="1" title="点赞"
                                                       class="favorite" onclick="increaseLikeCount()"> <i
                                        class="fa fa-thumbs-up"></i>赞 <i class="count" id="count-16">0</i> </a> </span>
                                <div class="shang-p">
                                    <div class="shang-empty">
                                        <span></span>
                                    </div>
                                    <span class="shang-s"> <a onclick="PaymentUtils.show();"
                                                              style="cursor:pointer">赏</a> </span>
                                </div>
                                <div class="share-sd">
                                    <span class="share-s" style="margin-top: 25px!important;"> <a
                                            href="javascript:void(0)" id="share-s" title="分享"> <i
                                            class="fa fa-share-alt"></i>分享 </a> </span>
                                    <div id="share">
                                        <ul class="bdsharebuttonbox bdshare-button-style0-16"
                                            data-bd-bind="1526060014578">
                                            <li><a title="更多" class="bds_more fa fa-plus-square" data-cmd="more"
                                                   onclick="return false;" href="#"></a></li>
                                            <li><a title="分享到QQ空间" class="fa fa-qq" data-cmd="qzone"
                                                   onclick="return false;" href="#"></a></li>
                                            <li><a title="分享到新浪微博" class="fa fa-weibo" data-cmd="tsina"
                                                   onclick="return false;" href="#"></a></li>
                                            <li><a title="分享到腾讯微博" class="fa fa-pinterest-square" data-cmd="tqq"
                                                   onclick="return false;" href="#"></a></li>
                                            <li><a title="分享到人人网" class="fa fa-renren" data-cmd="renren"
                                                   onclick="return false;" href="#"></a></li>
                                            <li><a title="分享到微信" class="fa fa-weixin" data-cmd="weixin"
                                                   onclick="return false;" href="#"></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <footer class="single-footer">
                            <ul class="single-meta">
                                <li class="comment"><a href="article_16.html#comments" rel="external nofollow"> <i
                                        class="fa fa-comment-o"></i> <i class="comment-count">0</i> </a></li>
                                <li class="views"><i class="fa fa-eye"></i> <span class="articleViewCount">5</span>
                                    views
                                </li>
                                <li class="r-hide"><a href="javascript:pr()" title="侧边栏"> <i
                                        class="fa fa-caret-left"></i> <i class="fa fa-caret-right"></i> </a></li>
                            </ul>
                            <ul id="fontsize">
                                <li>A+</li>
                            </ul>
                            <div class="single-cat-tag">
                                <div class="single-cat">
                                    所属分类：
                                    <a href="1.html"> Java</a>
                                    <a href="2.html"> Java基础</a>
                                </div>
                            </div>
                        </footer>
                        <!-- .entry-footer -->
                        <div class="clear"></div>
                    </div>
                    <!-- .entry-content -->
                </article>
                <!-- #post -->
                <div class="single-tag">
                    <ul class="" data-wow-delay="0.3s">
                        <li><a href="/tag/1" rel="tag" style="background:#666666"> Java</a></li>
                        <li><a href="/tag/17" rel="tag" style="background:#666666"> IO</a></li>
                    </ul>
                </div>
                <div class="authorbio wow fadeInUp">
                    <img alt="言曌" src="../images/20171006225356181.jpg" class="avatar avatar-64 photo" height="64"
                         width="64">
                    <ul class="postinfo">
                        <li></li>
                        <li><strong>版权声明：</strong>本站原创文章，于2017-10-07，由 <strong> 言曌</strong> 发表。</li>
                        <li class="reprinted"><strong>转载请注明：</strong> <a href="article_16.html" rel="bookmark"
                                                                         title="本文固定链接 article_16.html"> Java中File类的使用 |
                            风吟博客</a></li>
                    </ul>
                    <div class="clear"></div>
                </div>
                <div id="single-widget">
                    <div class="wow fadeInUp" data-wow-delay="0.3s">
                        <aside id="related_post-2" class="widget">
                            <h3 class="widget-title"><span class="s-icon"></span>相关文章 </h3>
                            <div id="related_post_widget">
                                <ul>
                                    <li><a href="article_16.html">测试顶戴克格勃</a></li>
                                    <c:forEach var="blog" items="${new_blog}">

                                        <li><a href="/item?method=getItem&cz=${cz}&typeTagId=${typeTagId}&BlogId=${blog.id}">${blog.title}</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="clear"></div>
                        </aside>
                        <aside id="hot_post-8" class="widget hot_post">
                            <h3 class="widget-title"><span class="s-icon"></span>猜你喜欢</h3>
                            <div id="hot_post_widget">
                                <ul>
                                    <li><a href="article_16.html"> java中ImageIcon路径问题</a></li>
                                    <c:forEach var="blog" items="${hot_blog_list_center}">

                                        <li><a href="/item?method=getItem&cz=type&typeTagId=${blog.typeId}&BlogId=${blog.id}"> ${blog.title}</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="clear"></div>
                        </aside>
                    </div>
                    <div class="clear"></div>
                </div>
                <nav class="nav-single">
                    <a href="/item?method=getItem&cz=${cz}&typeTagId=${typeTagId}&BlogId=${last_blog.id}" rel="next"> <span class="meta-nav"> <span class="post-nav">上一篇 <i
                            class="fa fa-angle-left"></i> </span> <br>${last_blog.title}</span> </a>
                    <a href="/item?method=getItem&cz=${cz}&typeTagId=${typeTagId}&BlogId=${next_blog.id}" rel="next"> <span class="meta-nav"> <span class="post-nav">下一篇 <i
                        class="fa fa-angle-left"></i> </span> <br>${next_blog.title}</span> </a>
                    <div class="clear"></div>
                </nav>
                <div class="scroll-comments"></div>
                <div id="comments" class="comments-area">
                    <div id="respond" class="comment-respond">
                        <h3 id="reply-title" class="comment-reply-title"><span id="reply-title-word">发表评论</span> <a
                                rel="nofollow" id="cancel-comment-reply-link" href="article_16.html#respond" style="">取消回复</a>
                        </h3>

                        <form id="comment_form" method="post" action="/CommentServlet">
                            <input type="text" name="method" hidden value="addComment"/>
                            <input type="text" name="blogId" hidden value="${blog.id}"/>
                            <p class="comment-form-comment"><textarea id="comment" name="content" rows="4"
                                                                      tabindex="1" required=""></textarea></p>
                            <div id="comment-author-info">
                                <input type="hidden" name="commentPid" value="0">
                                <input type="hidden" name="commentPname" value="">
                                <input type="hidden" name="commentRole" value="0">
                                <p class="comment-form-author"><label for="author_name"> 昵称<span
                                        class="required">*</span> </label> <input type="text" name="nickname"
                                                                                  id="author_name" class="" value=""
                                                                                  tabindex="2" required=""></p>
                                <p class="comment-form-email"><label for="author_email"> 邮箱<span
                                        class="required">*</span> </label> <input type="email" name="text"
                                                                                  id="author_email" class="" value=""
                                                                                  tabindex="3" required=""></p>
                                <p class="comment-form-url"><label for="author_url">网址</label> <input type="text"
                                                                                                      name="url"
                                                                                                      id="author_url"
                                                                                                      class="" value=""
                                                                                                      tabindex="4"></p>
                            </div>
                            <div class="clear"></div>
                            <p class="form-submit"><input id="submit" name="submit" type="submit" tabindex="5"
                                                          value="提交评论"> <input type="hidden" name="commentArticleId"
                                                                               value="16" id="article_id"> <input
                                    type="hidden" name="commentPid" id="comment_pid" value="0"></p>
                        </form>
                    </div>
                    <ol class="comment-list">
                    </ol>
                </div>
            </main>
            <!-- .site-main -->
        </div>
        <div id="sidebar" class="widget-area all-sidebar"
             style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;">
            <aside class="widget widget_search">
                <div class="searchbar">
                    <form method="get" id="searchform1" action="/index">
                        <input type="text" hidden name="method" value="searchBlog"/>
                        <span> <input type="text" value="" name="name" id="s1" placeholder="输入搜索内容" required=""> <button
                                type="submit" id="searchsubmit1">搜索</button> </span>
                    </form>
                </div>
                <div class="clear"></div>
            </aside>
            <aside class="widget hot_comment">
                <h3 class="widget-title"><i class="fa fa-bars"></i>热评文章 </h3>
                <div id="hot_comment_widget">
                    <ul>
                        <li><a href="article_16.html" rel="bookmark" title=" (3条评论)">
                            execute、executeUpdate、executeQuery三者的区别</a></li>
                        <li><a href="article_16.html" rel="bookmark" title=" (3条评论)"> sql语句分为三类(DML,DDL,DCL)-介绍</a></li>
                        <li><a href="article_16.html" rel="bookmark" title=" (2条评论)"> java中ImageIcon路径问题</a></li>

                        <c:forEach var="blog" items="${hot_blog_list}">
                            <li> <a href="/item?method=getItem&cz=${cz}&typeTagId=${blog.typeId}&BlogId=${blog.id}" rel="bookmark" title=" (${blog.commentCount}条评论)"> ${blog.title}</a> </li>
                        </c:forEach>

                    </ul>
                </div>
                <div class="clear"></div>
            </aside>
            <aside class="widget">
                <h3 class="widget-title"><i class="fa fa-bars"></i>所有标签 </h3>
                <div class="tagcloud">

                    <!-- 获得所有tag数据 遍历-->

                    <c:forEach var="tag" items="${tags}">
                        <a href="/TypeTagServlet?method=show&cz=tag&typeTagId=${tag.id}" class="tag-link-129 tag-link-position-1" title="${tag.title}" style="font-size: 14px;"> ${tag.title}</a>
                    </c:forEach>



                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
            </aside>
            <aside id="random_post-7" class="widget random_post wow fadeInUp" data-wow-delay="0.3s">
                <h3 class="widget-title"><i class="fa fa-bars"></i>随机文章 </h3>
                <div id="random_post_widget">
                    <ul>
                        <li><a href="article_16.html" rel="bookmark"> 测试顶戴克格勃</a></li>
                        <li><a href="article_16.html" rel="bookmark"> java中ImageIcon路径问题</a></li>
                        <li><a href="article_16.html" rel="bookmark"> Java中File类的使用</a></li>
                        <li><a href="article_16.html" rel="bookmark"> Hibernate 基本类型</a></li>
                        <li><a href="article_16.html" rel="bookmark"> springmvc 表单中文乱码解决方案</a></li>
                        <li><a href="article_16.html" rel="bookmark"> sql语句分为三类(DML,DDL,DCL)-介绍</a></li>
                        <li><a href="article_16.html" rel="bookmark"> Mybatis高级映射多对多查询</a></li>
                        <li><a href="article_16.html" rel="bookmark"> Java中静态代码块、构造代码块的区别</a></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </aside>
        </div>
    </div>
    <div class="clear"></div>
    <footer id="colophon" class="site-footer" role="contentinfo">
        <div class="site-info">
            <p style="text-align: center;">Copyright © 2017 <a href="/" target="_blank"
                                                               rel="noopener noreferrer">风吟博客</a> All rights reserved.
                <a target="_blank" href="/map"> <span class="font-text">站点地图</span> </a></p>
        </div>
        <!-- .site-info -->
    </footer>
    <!-- .site-footer -->
</div>
<script src="../js/jquery.min.js"></script>
<script src="../js/superfish.js"></script>
<script src="../js/script.js"></script>
<style id="STYLE_1526060011847">@CHARSET "UTF-8";
* {
    -webkit-tap-highlight-color: rgba(255, 0, 0, 0)
}

.box-size {
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box
}

.ds-hide {
    display: none
}

.ds-reward-stl {
    font-family: "microsoft yahei";
    text-align: center;
    background: #f1f1f1;
    padding: 10px 0;
    color: #666;
    margin: 20px auto;
    width: 90%
}

#dsRewardBtn {
    padding: 0;
    margin: 0;
    position: absolute;
    background: #7ab951;
    left: 110px;
    top: -7px;
    width: 50px;
    height: 50px;
    font-size: 16px;
    font-weight: 600;
    line-height: 43px;
    display: block;
    border: 4px solid #fff;
    border-radius: 40px;
    color: #FFF;
}

#dsRewardBtn span {
    display: inline-block;
    width: 50px;
    height: 50px;
    border-radius: 100%;
    line-height: 58px;
    color: #fff;
    font: 400 25px/50px 'microsoft yahei';
    background: #FEC22C
}

#dsRewardBtn:hover {
    cursor: pointer
}

.ds-dialog {
    z-index: 9999;
    width: 100%;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    border: 1px solid #d9d9d9
}

.ds-dialog .ds-close-dialog {
    position: absolute;
    top: 15px;
    right: 20px;
    font: 400 24px/24px Arial;
    width: 20px;
    height: 20px;
    text-align: center;
    padding: 0;
    cursor: pointer;
    background: transparent;
    border: 0;
    -webkit-appearance: none;
    font-weight: 700;
    line-height: 20px;
    opacity: .6;
    filter: alpha(opacity=20)
}

.ds-dialog .ds-close-dialog:hover {
    color: #000;
    text-decoration: none;
    cursor: pointer;
    opacity: .6;
    filter: alpha(opacity=40)
}

.ds-dialog-bg {
    position: absolute;
    opacity: .6;
    filter: alpha(opacity=30);
    background: #000;
    z-index: 9999;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%
}

.ds-dialog-content {
    font-family: 'microsoft yahei';
    font-size: 14px;
    background-color: #FFF;
    position: fixed;
    padding: 0 20px;
    z-index: 10000;
    overflow: hidden;
    border-radius: 6px;
    -webkit-box-shadow: 0 3px 7px rgba(0, 0, 0, .3);
    -moz-box-shadow: 0 3px 7px rgba(0, 0, 0, .3);
    box-shadow: 0 3px 7px rgba(0, 0, 0, .3);
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box
}

.ds-dialog-pc {
    width: 390px;
    height: 380px;
    top: 50%;
    left: 50%;
    margin: -190px 0 0 -195px
}

.ds-dialog-wx {
    width: 90%;
    height: 280px;
    top: 50%;
    margin-top: -140px;
    margin-left: 5%
}

.ds-dialog-content h5 {
    text-align: left;
    font-size: 15px;
    font-weight: 700;
    margin: 15px 0;
    color: #555
}

.ds-payment-way {
    text-align: left
}

.ds-payment-way label {
    cursor: pointer;
    font-weight: 400;
    display: inline-block;
    font-size: 14px;
    margin: 0 15px 0 0;
    padding: 0
}

.ds-payment-way input[type=radio] {
    vertical-align: middle;
    margin: -2px 5px 0 0
}

.ds-payment-img {
    margin: 15px 0;
    text-align: center
}

p.ds-pay-info {
    font-size: 15px;
    margin: 0 0 10px
}

.ds-pay-money {
    font-size: 14px;
    margin-top: 10px
}

.ds-pay-money p {
    margin: 0
}

.ds-pay-money .ds-pay-money-sum {
    margin-bottom: 4px
}

.ds-payment-img img {
    margin: 0 auto;
    width: 185px;
}

.ds-payment-img #qrCode_1 {
    display: none
}

.ds-payment-img .qrcode-border {
    margin: 0 auto
}

.ds-payment-img .qrcode-tip {
    width: 48.13px;
    position: relative;
    margin: 0 auto;
    font-size: 12px;
    font-weight: 700;
    background: #fff;
    height: 15px;
    line-height: 15px;
    margin-top: -12px
}

#qrCode_0 .qrcode-tip {
    color: #3caf36
}

#qrCode_3 .qrcode-tip {
    color: #e10602
}

.ds-payment-img #qrCode_3 {
    display: none
}

.ds-payment-img #qrCode_2 {
    display: none
}

#qrCode_2 .qrcode-tip {
    color: #eb5f01
}

#qrCode_1 .qrcode-tip {
    color: #6699cc
}

.wx_qrcode_container {
    text-align: center
}

.wx_qrcode_container h2 {
    font-size: 17px
}

.wx_qrcode_container p {
    font-size: 14px
}

.ds-reward-stl {
    text-align: left;
    background: #fff;
    padding: 0;
    color: #666;
    margin: 0;
    width: 0
}

#dsRewardBtn span {
    position: absolute;
    left: 115px;
    top: -7px;
    background: #7ab951;
    width: 50px;
    height: 50px;
    font-size: 16px;
    font-weight: 600;
    line-height: 43px;
    border: 4px solid #fff;
    border-radius: 40px
}

.share-s a {
    margin-top: -25px
}

.ds-payment-img .qrcode-border {
    border-radius: 29.97px;
    width: 236.89px;
    height: 236.89px;
    padding: 18.05px;
    margin-top: 25.53px;
} </style>

<script src="../js/layui.all.js"></script>
<script src="../js/jquery.cookie.js"></script>
<script type="text/javascript">
    increaseViewCount();
    layui.code({
        elem: 'pre',//默认值为.layui-code
        // skin: 'notepad', //如果要默认风格，不用设定该key。
        about: false
    });
</script>

<div id="sidr-main" class="sidr left">
    <div class="sidr-inner">
        <a href="#sidr-close" class="sidr-class-toggle-sidr-close">×</a>
    </div>
    <div class="sidr-inner">
        <a href="#sidr-main" id="sidr-id-navigation-toggle" class="sidr-class-bars"> <i
                class="sidr-class-fa sidr-class-fa-bars"></i> </a>
        <div class="sidr-class-menu-pcmenu-container">
            <ul id="sidr-id-menu-pcmenu" class="sidr-class-down-menu sidr-class-nav-menu">
                <li><a href="/"> <i class="sidr-class-fa-home sidr-class-fa"></i> <span
                        class="sidr-class-font-text">首页</span> </a></li>
                <li><a href="1.html" class="sidr-class-sf-with-ul"> <i class="sidr-class-fa sidr-class-fa-coffee"></i>
                    <span class="sidr-class-font-text">Java&nbsp;</span> </a>
                    <ul class="sidr-class-sub-menu">
                        <li><a href="2.html" target="_blank">Java基础</a></li>
                        <li><a href="3.html" target="_blank">Core Java</a></li>
                        <li><a href="4.html" target="_blank">多线程并发编程</a></li>
                        <li><a href="5.html" target="_blank">Sockets和IO</a></li>
                        <li><a href="6.html" target="_blank">设计模式和反射</a></li>
                        <li><a href="7.html" target="_blank">JVM</a></li>
                        <li><a href="8.html" target="_blank">JavaWeb</a></li>
                        <li><a href="9.html" target="_blank">Java框架</a></li>
                    </ul>
                </li>
                <li><a href="10.html" class="sidr-class-sf-with-ul"> <i class="sidr-class-fa sidr-class-fa-cubes"></i>
                    <span class="sidr-class-font-text">计算机科学&nbsp;</span> </a>
                    <ul class="sidr-class-sub-menu">
                        <li><a href="11.html" target="_blank">数据结构和算法</a></li>
                        <li><a href="12.html" target="_blank">操作系统</a></li>
                        <li><a href="13.html" target="_blank">数据库</a></li>
                        <li><a href="14.html" target="_blank">计算机网络</a></li>
                    </ul>
                </li>
                <li><a href="15.html" class="sidr-class-sf-with-ul"> <i
                        class="sidr-class-fa-snowflake-o sidr-class-fa"></i> <span class="sidr-class-font-text">其他技术&nbsp;</span>
                </a>
                    <ul class="sidr-class-sub-menu">
                        <li><a href="16.html" target="_blank">消息服务</a></li>
                        <li><a href="17.html" target="_blank">缓存服务</a></li>
                        <li><a href="18.html" target="_blank">负载均衡</a></li>
                    </ul>
                </li>
                <li><a href="https://leetcode.com/problemset/all"> <i class=""></i> <span class="sidr-class-font-text">LeetCode&nbsp;</span>
                </a></li>
                <li><a href="message.html"> <i class="sidr-class-fa sidr-class-fa-comment"></i> <span
                        class="sidr-class-font-text">留言板&nbsp;</span> </a></li>
            </ul>
        </div>
    </div>
</div>
<div class="ds-dialog" id="PAY_1526060011847" style="display: none;">
    <div class="ds-dialog-bg" onclick="PaymentUtils.hide();"></div>
    <div class="ds-dialog-content ds-dialog-pc "><i class="ds-close-dialog">×</i>    <h5>选择打赏方式：</h5>
        <div class="ds-payment-way"><label for="wechat"><input type="radio" id="wechat" class="reward-radio" value="0"
                                                               checked="checked" name="reward-way">微信红包</label> <label
                for="qqqb"><input type="radio" id="qqqb" class="reward-radio" value="1" name="reward-way">QQ钱包</label>
            <label for="alipay"><input type="radio" id="alipay" class="reward-radio" value="2"
                                       name="reward-way">支付宝</label></div>
        <div class="ds-payment-img">
            <div class="qrcode-img qrCode_0" id="qrCode_0">
                <div class="qrcode-border box-size" style="border: 9.02px solid rgb(60, 175, 54"><img
                        class="qrcode-img qrCode_0" id="qrCode_0" src="/img/shang/weixinpay.jpg"></div>
                <p class="qrcode-tip">打赏</p></div>
            <div class="qrcode-img qrCode_1" id="qrCode_1">
                <div class="qrcode-border box-size" style="border: 9.02px solid rgb(102, 153, 204"><img
                        class="qrcode-img qrCode_1" id="qrCode_1" src="/img/shang/qqpay.jpg"></div>
                <p class="qrcode-tip">打赏</p></div>
            <div class="qrcode-img qrCode_2" id="qrCode_2">
                <div class="qrcode-border box-size" style="border: 9.02px solid rgb(235, 95, 1"><img
                        class="qrcode-img qrCode_2" id="qrCode_2" src="/img/shang/alipay.jpg"></div>
                <p class="qrcode-tip">打赏</p></div>
        </div>
    </div>
</div>
</body>
</html>
