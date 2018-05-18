<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhangJun
  Date: 2018/5/14
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="shortcut icon" href="/img/logo.png">
    <title>
        风吟博客后台

        - 评论列表
    </title>
    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/back.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <style>
        /*覆盖 layui*/
        .layui-table {
            margin-top: 0;
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
                        <a href="notice_insert.html">公告</a>
                    </dd>
                    <dd>
                        <a href="link_insert.jsp">链接</a>
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
            <blockquote class="layui-elem-quote">
                <span class="layui-breadcrumb" lay-separator="/"> <a href="/admin">首页</a> <a><cite>评论列表</cite></a> </span>
            </blockquote>
            <div class="layui-tab layui-tab-card">
                <ul class="layui-tab-title">
                    <li class="layui-this">全部评论(15)</li>
                    <li>待审评论(0)</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show" style="margin-bottom: -10px">
                        <table class="layui-table" lay-even lay-skin="nob">
                            <colgroup>
                                <col width="100">
                                <col width="300">
                                <col width="200&quot;">
                                <col width="150">
                                <col width="50">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>作者</th>
                                <th>评论内容</th>
                                <th>回复至</th>
                                <th>提交于</th>
                                <th>ID</th>
                            </tr>
                            </thead>
                            <tbody>


                            <c:forEach var="comment" items="${comment_list}">
                            <tr>
                                <td> <img src="../images/01459f970ce17cd9e1e783160ecc951c" alt="" width="64px"> <strong>${comment.nickname}</strong> <br> https://liuyanzhao.com<br> admin@liuyanzhao.com<br> 0:0:0:0:0:0:0:1</td>
                                <td class="dashboard-comment-wrap"> ${comment.content}
                                    <div class="row-actions">
                                        <span class=""> <a href="javascript:void(0)" style="color:#FF5722;!important;" onclick="hideComment(14)">屏蔽</a> </span> |
                                        <span class=""> <a href="comment.html/reply/14"> 回复 </a> </span>
                                        <span class=""> | <a href="comment.html/edit/14">编辑</a> </span>
                                        <span class=""> | <a href="/CommentServlet?method=deleteComment&id=${comment.id}" onclick="deleteComment(14)">删除</a> </span>
                                    </div> </td>

                                <td> <a href="/item?method=getItem&cz=type&typeTagId=${comment.blog.typeId}&BlogId=${comment.blog.id}" target="_blank">${comment.blog.title}</a> </td>

                                <td> ${comment.date}</td>

                                <td> ${comment.id}</td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div id="nav" style="">
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <table class="layui-table" lay-even lay-skin="nob">
                            <colgroup>
                                <col width="100">
                                <col width="300">
                                <col width="200&quot;">
                                <col width="150">
                                <col width="50">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>作者</th>
                                <th>评论内容</th>
                                <th>回复至</th>
                                <th>提交于</th>
                                <th>ID</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 --> © 风吟博客 - 后台
    </div>
</div>
<script src="./js/jquery.min.js"></script>
<script src="./js/layui.all.js"></script>
<script src="./js/back.js"></script>
<script>

</script>
<script>
    //给文本编辑器的iframe引入代码高亮的css
    $("iframe").contents().find("head").append("<Link rel=\"stylesheet\" href=\"/css/highlight.css\">\n");

</script>
</body>
</html>