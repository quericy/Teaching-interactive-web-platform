<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><{$web_title}></title>
    <!-- Bootstrap -->
    <link href="<{$smarty.const._site_css}>bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._site_css}>iCheck_square_blue.css"/>
    <link href="<{$smarty.const._site_css}>default.css" rel="stylesheet">
    <!--IE8 css query-->
    <script src="<{$smarty.const._site_js}>respond.min.js"></script>
</head>
<body>
<{include file="header.tpl"}>
<!--列表begin-->
<div id="list" class="container">
    <div class="row">
        <!--左侧列表begin-->
        <div class="col-md-8">
            <div class=" panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-title">
                        <a href="<{$smarty.const._site_domain}>" style="color:#999;"><{$web_name}></a>
                        &nbsp;›&nbsp;
                        <span class="glyphicon glyphicon-lock" style="color:#000;"></span>&nbsp;学生登录
                    </h5>
                </div>
                <div class="panel-body" style="min-height: 600px;">
                    <div class="form-group">
                        <label for="user_name">用户名:</label>

                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                            <input id="user_name" type="text" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="user_pwd">密码:</label>

                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                            <input id="user_pwd" type="password" class="form-control">
                        </div>
                    </div>
                    <div class="row container-fluid">
                        <{if $cookie_time>0}>
                        <div style="float: left;">
                            <input id="remember_check_box" type="checkbox">
                        </div>
                        <div style="float: left;">
                            &nbsp;&nbsp;<{$cookie_time}>天内自动登录
                        </div>
                        <{/if}>
                        <a id="login_btn" href="#" class="btn btn-primary pull-right">登&nbsp;录</a>
                    </div>
                </div>
            </div>
        </div>
        <!--左侧列表end-->
        <!--右侧列表begin-->
        <div class="col-md-4">
            <div class=" panel panel-default">
                <div class="panel-body">
                    <label>教学互动平台</label>
                    <hr/>
                    <div class="center">
                        <a href="<{$smarty.const._site_domain}>user_reg" class="btn btn-default">现在注册</a>
                    </div>
                    <p></p>

                    <div class="center">
                        <p>已注册同学请<a href="<{$smarty.const._site_domain}>user_login">登录</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!--右侧列表end-->
    </div>
</div>
<!--列表end-->
<{include file="footer.tpl"}>
<script src="<{$smarty.const._site_js}>icheck.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //icheck初始化
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // 触摸扩展区域
        });
    });
</script>
</body>
</html>