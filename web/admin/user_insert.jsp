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

        - 编辑用户
    </title>
    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/back.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <style>
        .layui-form-item .layui-input-inline {
            width: 300px;
        }

        .layui-word-aux {
            color: #FF5722 !important;
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
                <span class="layui-breadcrumb" lay-separator="/"> <a href="/admin">首页</a> <a href="user.html">用户列表</a> <a><cite>编辑用户</cite></a> </span>
            </blockquote>
            <br>
            <br>
            <!--

             private int id;
    private String username;
    private String password;
    private String picLink;
    private String nickname;
    private String email;
    private String status;
            -->
            <form class="layui-form" action="/UserServlet?method=addUser" id="userForm" method="post">
                <div class="layui-form-item">
                    <input type="hidden" id="userId" value="0">
                    <label class="layui-form-label">头像</label>
                    <div class="layui-input-inline">
                        <div class="layui-upload">
                            <div class="layui-upload-list" style="">
                                <img class="layui-upload-img" src="" id="demo1" width="100" height="100">
                                <p id="demoText"></p>
                            </div>
                            <button type="button" class="layui-btn" id="test1">上传图片</button>
                        </div>
                    </div>
                    <input type="hidden" name="userAvatar" id="userAvatar" value="">
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名 <span style="color: #FF5722; ">*</span></label>
                    <div class="layui-input-inline">
                        <input type="text" name="username" id="userName" required lay-verify="userName" autocomplete="off" class="layui-input" onblur="checkUserName()">
                    </div>
                    <div class="layui-form-mid layui-word-aux" id="userNameTips"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码 <span style="color: #FF5722; ">*</span></label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" id="userPass" required lay-verify="userPass" autocomplete="off" class="layui-input" min="3" max="20">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">昵称 <span style="color: #FF5722; ">*</span></label>
                    <div class="layui-input-inline">
                        <input type="text" name="nickname" required placeholder="" autocomplete="off" min="2" max="10" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">Email <span style="color: #FF5722; ">*</span></label>
                    <div class="layui-input-inline">
                        <input type="email" name="email" id="userEmail" required lay-verify="userEmail" class="layui-input" onblur="checkUserEmail()">
                    </div>
                    <div class="layui-form-mid layui-word-aux" id="userEmailTips"></div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">URL </label>
                    <div class="layui-input-inline">
                        <input type="url" name="url" placeholder="" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="demo1" id="submit-btn">保存</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
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
    //上传图片
    layui.use('upload', function () {
        var $ = layui.jquery,
            upload = layui.upload;
        var uploadInst = upload.render({
            elem: '#test1',
            url: '/uploadFile',
            before: function (obj) {
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result);
                });
            },
            done: function (res) {
                $("#userAvatar").attr("value", res.data.src);
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
            },
            error: function () {
                var demoText = $('#demoText');
                demoText.html('' +
                    '<span style="color: #FF5722;">上传失败</span>' +
                    ' <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });

    });
</script>
<script>
    //给文本编辑器的iframe引入代码高亮的css
    $("iframe").contents().find("head").append("<Link rel=\"stylesheet\" href=\"/css/highlight.css\">\n");

</script>
</body>
</html>