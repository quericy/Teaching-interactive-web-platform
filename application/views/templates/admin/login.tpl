<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理后台-<{$web_title}></title>
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._site_css}>bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._site_css}>iCheck_square_blue.css"/>
    <link rel="stylesheet" type="text/css" href="<{$smarty.const._admin_css}><{$controller_name}>.css">
</head>
<body class=" theme-blue">
<div class="dialog">
    <div class="panel-body">
        <div class="header-title">教师登录</div>
        <div class="form-group">
            <label for="user_name">用户名:</label>

            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                <input id="user_name" type="text" class="form-control" class="form-control span12">
            </div>
        </div>
        <div class="form-group">
            <label for="user_pwd">密码:</label>

            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                <input id="user_pwd" type="password" class="form-control span12 form-control">
            </div>
        </div>
        <a id="login_btn" href="#" class="btn btn-primary pull-right">登&nbsp;录</a>

        <div class="remember-me">
            <div style="float: left;">
                <input id="remember_check_box" type="checkbox">
            </div>
            <div style="float: left;">&nbsp;&nbsp;记住密码</div>
        </div>

        <div id="login_tips">&nbsp;&nbsp;</div>
    </div>

</div>
<div class="copy-right">教学互动平台 © 2015 Powered By chenyi.</div>
<script src="<{$smarty.const._site_js}>jquery.min.js"></script>
<script src="<{$smarty.const._site_js}>bootstrap.min.js"></script>
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
    //登录按钮触发函数
    $(document).delegate('#login_btn', 'click', function () {
        $('#login_tips').html('&nbsp;&nbsp;');
        var user_name = $('#user_name').val().trim();
        var user_pass = $('#user_pwd').val().trim();
        if (user_name == '') {
            $('#login_tips').html('*用户名不能为空!&nbsp;&nbsp;');
            return;
        }
        if (user_pass == '') {
            $('#login_tips').html('*密码不能为空!&nbsp;&nbsp;');
            return;
        }
        //自动登录
        var auto_login = document.getElementById('remember_check_box').checked == true ? '1' : '0';
        $('#login_btn').html('登录中');
        $('#login_btn').attr('disabled', "disabled");
        $.ajax({
            type: 'post',
            url: '<{$smarty.const._admin_domain}><{$controller_name}>/login_check/',
            data:{check_name:user_name,check_pwd:user_pass,auto_login:auto_login},
            success: function (res) {
                $('#login_btn').html('登&nbsp;录');
                $('#login_btn').removeAttr('disabled');
                switch (res) {
                    case '1':
                        alert('ok');
                        break;
                    case '-1':
                        $('#login_tips').html('*账号或密码错误!&nbsp;&nbsp;');
                        break;
                    case '-2':
                        $('#login_tips').html('*输入信息不完整!&nbsp;&nbsp;');
                        break;
                    default :
                        $('#login_tips').html('*服务器繁忙&nbsp;&nbsp;');
                        break;
                }
            }
        });

    });
    //trim修复(IE)
    String.prototype.trim = function () {
        return this.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
    }
</script>
</body>
</html>
