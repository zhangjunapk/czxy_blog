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


    <style>
        /*覆盖 layui*/
        .layui-input-block {
            margin:0px 10px;
        }
        .layui-table {
            margin-top: 0;
        }
        .layui-col-md4 {
            padding:10px;
        }
        .layui-col-md8 {
            padding:10px;
        }
        .layui-btn {
            margin: 2px 0!important;
        }
    </style>

    <script type="text/javascript" src="/js/jquery.min.js"></script>

    <script>
        var url="/JsonController?method=getType"
        var data={
            typeId:${param.typeId}
        }
        $.ajax({
            url:url,
            data:data,
            dataType:"json",
            success:(function (data) {
                alert(data)
                $("#title").attr("value",data.title)
                $("#info").attr("value",data.info)
                $("#idd").attr("value",${param.typeId})
                $.ajax({
                    url:"/JsonController?method=getParentType",
                    dataType:"json",
                    success:(function (data) {
                        $(data).each(function () {
                            alert(data.title)
                        })
                    })
                })
                
            })
        })
    </script>

</head>
<body>
<div class="layui-col-md4">
    <form class="layui-form" method="post" id="myForm" action="/ArticleController?method=modifyType">
        <input type="hidden" id="idd" name="id" value=""/>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <strong>编辑分类</strong>
            </div>
            <div class="layui-input-block">
                名称
                <span style="color: #FF5722; ">*</span>
                <input type="text" id="title" name="title" placeholder="请输入分类名称" autocomplete="off" class="layui-input" required="">
            </div>
            <br>
            <div class="layui-input-block">
                父节点
                <span style="color: #FF5722; ">*</span>
                <select name="parentId" class="layui-input" required="">
                    <option value="-1">无</option>





                </select>
                <div class="layui-unselect layui-form-select">
                    <div class="layui-select-title">
                    <input type="text" placeholder="请选择" value="无" readonly="" class="layui-input layui-unselect">
                    <i class="layui-edge"></i>
                </div>

                    <dl class="layui-anim layui-anim-upbit">
                        <dd lay-value="-1" class="layui-this">无</dd>
                        <dd name="parentId" value="" class="">java</dd>

                    </dl>
                </div>

                <input type="text" name="info" id="info" placeholder="请输入分类描述" autocomplete="off" class="layui-input">
            </div>
            <br>
            <div class="layui-input-block">
                图标样式
                <input type="text" name="categoryIcon" placeholder="请输入图标样式,如 fa fa-coffee" autocomplete="off" class="layui-input">
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
            <li>如果该分类为一级分类，父节点选"无"</li>
            <li>如果该分类为二级分类，父节点选择其对应的一级目录</li>
            <li>图标样式可以参考<a href="http://fontawesome.io/icons/" target="_blank"> fontawesome </a>,建议给一级分类添加 </li>
        </ul>
    </blockquote>
</div>
</body>
</html>