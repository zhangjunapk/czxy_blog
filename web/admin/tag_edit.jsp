<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="./css/layui.css">
    <link rel="stylesheet" href="./css/back.css">
    <link rel="stylesheet" href="./css/font-awesome.min.css">
    <script type="text/javascript" src="/layer/layer.js"></script>
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="/layer/theme/default/layer.css">
    <script>
        $(function () {
            var tagId=${param.tagId}
                alert(tagId)
            $.ajax({
                url:"/JsonController?method=getTag",
                data:{
                    tagId:tagId
                },
                dataType:"json",
                success:(function (data) {
                    alert(data)
                    $("#name").attr("value",data.title)
                    $("#desc").attr("value",data.info)
                    $("#idd").attr("value",tagId)
                })
            })
        })
    </script>
</head>



<body style="width: 500px;height: 300px;">
<div class="layui-col-md4">
    <form class="layui-form" method="post" id="myForm" action="/ArticleController?method=modifyTag">
        <input type="hidden" id="idd" name="id" value=""/>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <strong>编辑标签</strong>
            </div>
            <div class="layui-input-block">
                名称
                <span style="color: #FF5722; ">*</span>
                <input type="text" id="name" name="title" placeholder="请输入标签名称" autocomplete="off" class="layui-input" required="">
            </div>
            <br>
            <div class="layui-input-block">
                标签描述
                <input type="text" id="desc" name="info" placeholder="请输入标签描述" autocomplete="off" class="layui-input">
            </div>
            <br>
            <div class="layui-input-block">
                <button class="layui-btn" lay-filter="formDemo" type="submit">添加</button>
            </div>
        </div>
    </form>
    <blockquote class="layui-elem-quote layui-quote-nm">
        温馨提示：
        <ul>
            <li>1、标签名必选，建议不要太长</li>
            <li>2、标签名勿重复</li>
        </ul>
    </blockquote>
</div>
</body>
</html>