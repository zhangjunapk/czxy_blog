<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhangJun
  Date: 2018/5/14
  Time: 17:36
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

        - 用户列表
    </title>
    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/back.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">


    <script type="text/javascript" src="/layer/layer.js"></script>
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="/layer/theme/default/layer.css">

    <script>
        function modifyAlert(id) {
            layer.open({
                type: 1,
                area: ['600px', '360px'],
                shadeClose: false, //点击遮罩关闭
                width:500,
                height:300,
                anime:5,
                content: "<iframe src='/admin/user_edit.jsp?userId="+id+"'></iframe>"
            });
        }
    </script>

    <style>
        /*覆盖 layui*/

        .layui-table {
            margin-top: 0;
        }

        .layui-btn {
            margin: 2px 0!important;
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
                            <a href="/LinkController?method=getAll">全部公告</a>
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
                <span class="layui-breadcrumb" lay-separator="/"> <a href="/admin">首页</a> <a><cite>用户列表</cite></a> </span>
            </blockquote>
            <table class="layui-table" lay-even lay-skin="nob">
                <colgroup>
                    <col width="100">
                    <col width="100&quot;">
                    <col width="100">
                    <col width="50">
                    <col width="50">
                    <col width="100">
                    <col width="50">
                </colgroup>
                <thead>
                <tr>
                    <th>用户名</th>
                    <th>昵称</th>
                    <th>电子邮件</th>
                    <th>文章</th>
                    <th>状态</th>
                    <th>操作</th>
                    <th>ID</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td> <img src="../images/20171006225356181.jpg" width="48" height="48"> <strong><a href="user.html/profile/1">admin</a></strong> </td>
                    <td> 言曌</td>
                    <td> admin@liuyanzhao.com</td>
                    <td> 18</td>
                    <td> 正常 </td>
                    <td> <a href="javascript:void(0)" onclick="modifyAlert(${typeVo.parentType.id})" class="layui-btn layui-btn-mini">编辑</a> <a href="user.html/delete/1" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">删除</a> </td>
                    <td> 1</td>
                </tr>
                <c:forEach var="user" items="${user_list}">
                <tr>
                    <td> <img src="../images/20171006225356181.jpg" width="48" height="48"> <strong><a href="user.html/profile/1">${user.username}</a></strong> </td>
                    <td>${user.nickname}</td>
                    <td> ${user.email}</td>
                    <td> 18</td>
                    <td> 正常 </td>
                    <td> <a href="javascript:void(0)" onclick="modifyAlert(${user.id})" class="layui-btn layui-btn-mini">编辑</a>
                        <a href="/UserServlet?method=deleteUser&userId=${user.id}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">删除</a> </td>
                    <td>${user.id}</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
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
</body>
</html>