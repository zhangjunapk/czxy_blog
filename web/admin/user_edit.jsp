<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/back.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">


    <script type="text/javascript" src="/layer/layer.js"></script>
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="/layer/theme/default/layer.css">
    <script>
        var url="/JsonController?method=getUser"
        var data={
            userId:${param.userId}
        }
        $.ajax({
            url:url,
            data:data,
            dataType:"json",
            success:(function (data) {


                $("#userName").attr("value",data.username)
                $("#userPass").attr("value",data.password)
                $("#userEmail").attr("value",data.email)
                $("#nickname").attr("value",data.nickname)
                $("#userURL").attr("value",data.url)

                $("#idd").attr("value",${param.userId})
            })
        })
    </script>

</head>
<body>
<form class="layui-form" action="/ArticleController" id="userForm" method="post">
    <input type="hidden" name="method" value="modifyUser"/>
    <input type="hidden" id="idd" name="id" value=""/>

    <div class="layui-form-item">
        <input type="hidden" id="userId" value="0">
        <label class="layui-form-label">头像</label>
        <div class="layui-input-inline">
            <div class="layui-upload">
                <div class="layui-upload-list" style="">
                    <img class="layui-upload-img" src="" id="demo1" width="100" height="100">
                    <p id="demoText"></p>
                </div>
                <button type="button" class="layui-btn" id="test1">上传图片</button><input class="layui-upload-file" type="file" name="file">
            </div>
        </div>
        <input type="hidden" name="userAvatar" id="userAvatar" value="">
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名 <span style="color: #FF5722; ">*</span></label>
        <div class="layui-input-inline">
            <input type="text" name="username" id="userName" required="" lay-verify="userName" autocomplete="off" class="layui-input" onblur="checkUserName()">
        </div>
        <div class="layui-form-mid layui-word-aux" id="userNameTips"></div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码 <span style="color: #FF5722; ">*</span></label>
        <div class="layui-input-inline">
            <input type="password" name="password" id="userPass" required="" lay-verify="userPass" autocomplete="off" class="layui-input" min="3" max="20">
        </div>
        <div class="layui-form-mid layui-word-aux"></div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">昵称 <span style="color: #FF5722; ">*</span></label>
        <div class="layui-input-inline">
            <input type="text" id="nickname" name="nickname" required="" placeholder="" autocomplete="off" min="2" max="10" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux"></div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">Email <span style="color: #FF5722; ">*</span></label>
        <div class="layui-input-inline">
            <input type="email" name="email" id="userEmail" required="" lay-verify="userEmail" class="layui-input" onblur="checkUserEmail()">
        </div>
        <div class="layui-form-mid layui-word-aux" id="userEmailTips"></div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">URL </label>
        <div class="layui-input-inline">
            <input type="url" id="userURL" name="url" placeholder="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1" id="submit-btn">保存</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</body>
</html>