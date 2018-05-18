<%--
  Created by IntelliJ IDEA.
  User: ZhangJun
  Date: 2018/5/14
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<head>
    <meta charset="utf-8">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="shortcut icon" href="/img/logo.png">
    <title>
        风吟博客后台
    </title>
    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/back.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <style>
        .layui-input-block {
            margin-left: 0!important;;
        }

        .layui-col-md6 {
            padding: 10px;
        }

        .postbox {
            min-width: 255px;
            border: 1px solid #e5e5e5;
            /* -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.04); */
            box-shadow: 0 1px 1px rgba(0,0,0,.04);
            background: #fff;
        }


        .postbox, .stuffbox {
            margin-bottom: 20px;
            padding: 0;
            line-height: 1;
        }

        .js .postbox .handlediv {
            display: block;
        }
        .wp-core-ui .button-link {
            margin: 0;
            padding: 0;
            /* -webkit-box-shadow: none; */
            box-shadow: none;
            border: 0;
            /* -webkit-border-radius: 0; */
            border-radius: 0;
            background: 0 0;
            outline: 0;
            cursor: pointer;
        }

        .postbox .handlediv {
            display: none;
            float: right;
            width: 36px;
            height: 36px;
            padding: 0;
        }

        .screen-reader-text span {
            position: absolute;
            margin: -1px;
            padding: 0;
            height: 1px;
            width: 1px;
            overflow: hidden;
            clip: rect(0 0 0 0);
            border: 0;
            word-wrap: normal!important;
        }
        .screen-reader-text span {
            position: absolute;
            margin: -1px;
            padding: 0;
            height: 1px;
            width: 1px;
            overflow: hidden;
            clip: rect(0 0 0 0);
            border: 0;
            word-wrap: normal!important;
        }

        .metabox-holder .postbox>h3, .metabox-holder .stuffbox>h3, .metabox-holder h2.hndle, .metabox-holder h3.hndle {
            font-size: 14px;
            padding: 8px 12px;
            margin: 0;
            line-height: 1.4;
        }
        #dashboard_quick_press form {
            margin: 12px;
        }
        form {
            display: block;
            margin-top: 0em;
        }
        .postbox .inside, .stuffbox .inside {
            padding: 0 12px 12px;
            line-height: 1.4em;
            font-size: 13px;
        }
        .postbox, .stuffbox {
            margin-bottom: 20px;
            padding: 0;
            line-height: 1;
        }
        Inherited from div#wpwrap

        a, div {
            outline: 0;
        }
        user agent stylesheet
        div {
            display: block;
        }
        Inherited from div.inside
        .postbox .inside, .stuffbox .inside {
            padding: 0 12px 12px;
            line-height: 1.4em;
            font-size: 13px;
        }

        #dashboard_quick_press .drafts li time {
            color: #72777c;
        }
        #description-wrap label, #title-wrap label {
            cursor: text;
        }


        #dashboard-widgets form .input-text-wrap input, #dashboard-widgets form .textarea-wrap textarea {
            width: 100%;
        }

        #dashboard_quick_press input, #dashboard_quick_press textarea {
            /* -webkit-box-sizing: border-box; */
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            margin: 0;
        }

        a, div {
            outline: 0;
        }

        #description-wrap label, #title-wrap label {
            cursor: text;
        }

        #dashboard-widgets form .input-text-wrap input, #dashboard-widgets form .textarea-wrap textarea {
            width: 100%;
        }


        .meta-box-sortables select {
            max-width: 100%;
        }
        .js #dashboard_quick_press .drafts {
            border-top: 1px solid #eee;
        }
        #dashboard_quick_press .drafts {
            padding: 10px 0 0;
        }
        #dashboard_quick_press .drafts .view-all {
            float: right;
            margin: 0 12px 0 0;
        }
        #dashboard_quick_press .drafts p {
            margin: 0;
            word-wrap: break-word;
        }
        #dashboard_quick_press .drafts h2 {
            line-height: inherit;
        }

        #dashboard-widgets h3, #dashboard-widgets h4, #dashboard_quick_press .drafts h2 {
            margin: 0 12px 8px;
            padding: 0;
            font-size: 14px;
            font-weight: 400;
            color: #23282d;
        }
        #dashboard_quick_press .drafts ul {
            margin: 0 12px;
        }
        ul {
            list-style: none;
        }
        ol, ul {
            padding: 0;
        }
        #dashboard_quick_press .drafts li {
            margin-bottom: 1em;
        }
        dd, li {
            /* margin-bottom: 6px; */
        }

        user agent stylesheet
        li {
            display: list-item;
            text-align: -webkit-match-parent;
        }
        #dashboard_quick_press .draft-title,.dashboard-comment-wrap {
            word-wrap: break-word;
        }
        a, div {
            outline: 0;
        }
        user agent stylesheet
        div {
            display: block;
        }
        #dashboard_quick_press .drafts p {
            /* margin: 0; */
            word-wrap: break-word;
        }
        p {
            font-size: 13px;
            line-height: 1.5;
        }
        h2, h3, p {
            margin: 1em 0;
        }
    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">
            <a href="/admin" style="color:#009688;"> 风吟博客后台 </a>
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="/" target="_blank">前台</a></li>
            <li class="layui-nav-item"> <a href="javascript:;">新建</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="article_insert.html">文章</a>
                    </dd>
                    <dd>
                        <a href="page_insert.html">页面</a>
                    </dd>
                    <dd>
                        <a href="category_insert.html">分类</a>
                    </dd>
                    <dd>
                        <a href="tag_insert.html">标签</a>
                    </dd>
                    <dd>
                        <a href="/NoticeController?method=getAll">公告</a>
                    </dd>
                    <dd>
                        <a href="/LinkController?method=getAll">链接</a>
                    </dd>
                </dl> </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"> <a href="javascript:;"> <img src="../images/20171006225356181.jpg" class="layui-nav-img"> admin</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="user.html/profile/1">基本资料</a>
                    </dd>
                </dl> </li>
            <li class="layui-nav-item"> <a href="/admin/logout">退了</a> </li>
        </ul>
    </div>





    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed"> <a class="" href="javascript:;">文章</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="/ArticleController?method=showAllArticle">全部文章</a>
                        </dd>
                        <dd>
                            <a href="/ArticleController?method=writeArticlePage">写文章</a>
                        </dd>
                        <dd>
                            <a href="/ArticleController?method=getType">全部分类</a>
                        </dd>
                        <dd>
                            <a href="/ArticleController?method=getAllTag">全部标签</a>
                        </dd>
                    </dl> </li>
                <li class="layui-nav-item"> <a href="javascript:;">页面</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="page.html">全部页面</a>
                        </dd>
                        <dd>
                            <a href="page_insert.html">添加页面</a>
                        </dd>
                    </dl> </li>
                <li class="layui-nav-item"> <a class="" href="javascript:;"> 链接 </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="/LinkController?method=getAll">全部链接</a>
                        </dd>
                        <dd>
                            <a href="/LinkController?method=addLinkPage">添加链接</a>
                        </dd>
                    </dl> </li>
                <li class="layui-nav-item"> <a href="javascript:;">公告</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="/NoticeController?method=getAll">全部公告</a>
                        </dd>
                        <dd>
                            <a href="/admin/notice_insert.html">添加公告</a>
                        </dd>
                    </dl> </li>
                <li class="layui-nav-item"> <a href="/CommentServlet?method=getComment"> 评论 </a> </li>
                <li class="layui-nav-item"> <a class="" href="javascript:;"> 用户 </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="/UserServlet?method=showAllUser">全部用户</a>
                        </dd>
                        <dd>
                            <a href="/admin/user_insert.jsp">添加用户</a>
                        </dd>
                    </dl> </li>
                <li class="layui-nav-item"> <a href="javascript:;">设置</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="menu.html">菜单</a>
                        </dd>
                        <dd>
                            <a href="options.html">主要选项</a>
                        </dd>
                    </dl> </li>
            </ul>
        </div>
    </div>





    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="layui-container">
                <div class="layui-row">
                    <div class="layui-col-md6">
                        <div id="dashboard_activity" class="postbox ">
                            <div class="inside">
                                <div id="activity-widget">
                                    <div id="published-posts" class="activity-block">
                                        <h3>最近发布</h3>
                                        <br>
                                        <ul>
                                            <li><span>16:06 02月25日</span> <a href="/article/19" target="_blank">测试顶戴克格勃</a> </li>
                                            <li><span>16:05 10月07日</span> <a href="/article/17" target="_blank">java中ImageIcon路径问题</a> </li>
                                            <li><span>16:04 10月07日</span> <a href="/article/16" target="_blank">Java中File类的使用</a> </li>
                                            <li><span>16:03 10月07日</span> <a href="/article/15" target="_blank">JSP 中 forward 转发 和 sendRedirect 重定向的区别</a> </li>
                                            <li><span>16:02 10月07日</span> <a href="/article/14" target="_blank">execute、executeUpdate、executeQuery三者的区别</a> </li>
                                        </ul>
                                    </div>
                                    <br>
                                    <div id="latest-comments" class="activity-block">
                                        <h3>近期评论</h3>
                                        <ul id="the-comment-list" data-wp-lists="list:comment">
                                            <li class="comment   thread-even comment-item approved"> <img alt="" src="../images/01459f970ce17cd9e1e783160ecc951c" class="avatar avatar-50 photo" height="50" width="50">
                                                <div class="dashboard-comment-wrap has-row-actions">
                                                    <p class="comment-meta"> 由<cite class="comment-author"> <a target="_blank" href="https://liuyanzhao.com" rel="external nofollow" class="url">言曌</a> </cite>发表在《<a href="/article/17">java中ImageIcon路径问题</a>》 </p>
                                                    <blockquote>
                                                        <p>评论测试</p>
                                                    </blockquote>
                                                    <p class="row-actions"> <span class=""> <a href="javascript:void(0)" style="color: #FF5722;" onclick="hideComment(1)">屏蔽</a> </span> | <span class=""> <a data-comment-id="1268" href="comment.html/reply/1"> 回复 </a> </span> <span class=""> | <a href="comment.html/edit/1">编辑</a> </span> <span class=""> | <a href="javascript:void(0)" onclick="deleteComment(1)">删除</a> </span> </p>
                                                </div> </li>
                                            <li class="comment   thread-even comment-item approved"> <img alt="" src="../images/01459f970ce17cd9e1e783160ecc951c" class="avatar avatar-50 photo" height="50" width="50">
                                                <div class="dashboard-comment-wrap has-row-actions">
                                                    <p class="comment-meta"> 由<cite class="comment-author"> <a target="_blank" href="https://liuyanzhao.com" rel="external nofollow" class="url">言曌</a> </cite>发表在《<a href="/article/17">java中ImageIcon路径问题</a>》 </p>
                                                    <blockquote>
                                                        <p>再次测试</p>
                                                    </blockquote>
                                                    <p class="row-actions"> <span class=""> <a href="javascript:void(0)" style="color: #FF5722;" onclick="hideComment(2)">屏蔽</a> </span> | <span class=""> <a data-comment-id="1268" href="comment.html/reply/2"> 回复 </a> </span> <span class=""> | <a href="comment.html/edit/2">编辑</a> </span> <span class=""> | <a href="javascript:void(0)" onclick="deleteComment(2)">删除</a> </span> </p>
                                                </div> </li>
                                            <li class="comment   thread-even comment-item approved"> <img alt="" src="../images/487f87505f619bf9ea08f26bb34f8118" class="avatar avatar-50 photo" height="50" width="50">
                                                <div class="dashboard-comment-wrap has-row-actions">
                                                    <p class="comment-meta"> 由<cite class="comment-author"> <a target="_blank" href="" rel="external nofollow" class="url">张三</a> </cite>发表在《<a href="/article/8">Mybatis高级映射多对多查询</a>》 </p>
                                                    <blockquote>
                                                        <p>评论测试</p>
                                                    </blockquote>
                                                    <p class="row-actions"> <span class=""> <a href="javascript:void(0)" style="color: #FF5722;" onclick="hideComment(3)">屏蔽</a> </span> | <span class=""> <a data-comment-id="1268" href="comment.html/reply/3"> 回复 </a> </span> <span class=""> | <a href="comment.html/edit/3">编辑</a> </span> <span class=""> | <a href="javascript:void(0)" onclick="deleteComment(3)">删除</a> </span> </p>
                                                </div> </li>
                                            <li class="comment   thread-even comment-item approved"> <img alt="" src="../images/6c9a70c6547f70083aef1a8b874a87ce" class="avatar avatar-50 photo" height="50" width="50">
                                                <div class="dashboard-comment-wrap has-row-actions">
                                                    <p class="comment-meta"> 由<cite class="comment-author"> <a target="_blank" href="" rel="external nofollow" class="url">Tom</a> </cite>发表在《<a href="/article/8">Mybatis高级映射多对多查询</a>》 </p>
                                                    <blockquote>
                                                        <p>Tom来测试</p>
                                                    </blockquote>
                                                    <p class="row-actions"> <span class=""> <a href="javascript:void(0)" style="color: #FF5722;" onclick="hideComment(4)">屏蔽</a> </span> | <span class=""> <a data-comment-id="1268" href="comment.html/reply/4"> 回复 </a> </span> <span class=""> | <a href="comment.html/edit/4">编辑</a> </span> <span class=""> | <a href="javascript:void(0)" onclick="deleteComment(4)">删除</a> </span> </p>
                                                </div> </li>
                                            <li class="comment   thread-even comment-item approved"> <img alt="" src="../images/cdf2628d43f941c34796949e0857e3a5" class="avatar avatar-50 photo" height="50" width="50">
                                                <div class="dashboard-comment-wrap has-row-actions">
                                                    <p class="comment-meta"> 由<cite class="comment-author"> <a target="_blank" href="" rel="external nofollow" class="url">Jack</a> </cite>发表在《<a href="/article/14">execute、executeUpdate、executeQuery三者的区别</a>》 </p>
                                                    <blockquote>
                                                        <p>Jack来此一游</p>
                                                    </blockquote>
                                                    <p class="row-actions"> <span class=""> <a href="javascript:void(0)" style="color: #FF5722;" onclick="hideComment(5)">屏蔽</a> </span> | <span class=""> <a data-comment-id="1268" href="comment.html/reply/5"> 回复 </a> </span> <span class=""> | <a href="comment.html/edit/5">编辑</a> </span> <span class=""> | <a href="javascript:void(0)" onclick="deleteComment(5)">删除</a> </span> </p>
                                                </div> </li>
                                        </ul>
                                        <ul class="subsubsub">
                                            <li class="all"><a href="">全部<span class="count">（<span class="all-count">15</span>）</span></a> | </li>
                                            <li class="moderated"><a href="">待审<span class="count">（<span class="pending-count">0</span>）</span></a> | </li>
                                            <li class="approved"><a href="">已批准<span class="count">（<span class="approved-count">15</span>）</span></a> | </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <div id="dashboard_quick_press" class="postbox ">
                            <div class="inside">
                                <form name="post" method="post" id="insertDraftForm" class="initial-form hide-if-no-js" action="article_insert.htmlDraftSubmit">
                                    <div class="layui-form-item">
                                        <div class="layui-input-block">
                                            <input type="text" name="articleTitle" id="articleTitle" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item layui-form-text">
                                        <div class="layui-input-block">
                                            <textarea name="articleContent" placeholder="请输入内容" id="articleContent" class="layui-textarea" required></textarea>
                                        </div>
                                    </div>
                                    <input type="hidden" name="articleStatus" value="0">
                                    <div class="layui-form-item">
                                        <div class="layui-input-block">
                                            <button class="layui-btn layui-btn-small" lay-submit lay-filter="formDemo" onclick="insertDraft()">保存草稿</button>
                                            <button type="reset" class="layui-btn layui-btn-small layui-btn-primary">重置</button>
                                        </div>
                                    </div>
                                </form>
                                <div class="drafts">
                                    <p class="view-all"><a href="article.html" aria-label="查看所有草稿">查看所有</a></p>
                                    <h2 class="hide-if-no-js">草稿</h2>
                                    <ul>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-footer">
            <!-- 底部固定区域 --> © 风吟博客 - 后台
        </div>
    </div>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/layui.all.js"></script>
    <script src="../js/back.js"></script>
    <script>

    </script>
    <script>
        //给文本编辑器的iframe引入代码高亮的css
        $("iframe").contents().find("head").append("<Link rel=\"stylesheet\" href=\"/css/highlight.css\">\n");

    </script>
</div>
</body>
</html>