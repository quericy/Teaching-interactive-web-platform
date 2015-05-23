<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><{$web_title}></title>
    <!-- Bootstrap -->
    <link href="<{$smarty.const._site_css}>bootstrap.min.css" rel="stylesheet">
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
                        &nbsp;›&nbsp;&nbsp;注册
                    </h5>
                </div>
                <div class="panel-body" style="min-height: 600px;">
                    <div class="col-md-9 col-md-push-1">
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
                        <div class="form-group">
                            <label for="email">电子邮件:</label>

                            <div class="input-group">
                                <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-envelope"></span></span>
                                <input id="email" type="text" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="verify_code">验证码:</label>

                            <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-eye-open"></span>
                            </span>
                                <input id="verify_code" type="text" class="form-control" placeholder="点击图片换一张">
                            <span class="input-group-addon" style="padding: 0 10px;">
                                <img src="<{$smarty.const._site_domain}>user_reg/get_varify_code" alt="看不清？点击更换"
                                     onclick="this.src='<{$smarty.const._site_domain}>user_reg/get_varify_code?spam='+new Date().getTime()"/>
                            </span>
                            </div>
                        </div>
                        <p>&nbsp;</p>

                        <div class="row container-fluid">
                            <div id="user_login_btn" class="pull-right btn btn-success pull-right"
                                 style="margin-top: -6px;">
                                注&nbsp;册
                            </div>
                            <div id="login_tips" class="pull-right text-danger"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--左侧列表end-->
        <!--右侧列表begin-->
        <div class="col-md-4">
            <{include file="user_pannel.tpl"}>
        </div>
        <!--右侧列表end-->
    </div>
</div>
<!--列表end-->
<{include file="footer.tpl"}>
<script src="<{$smarty.const._site_js}>icheck.min.js"></script>
<script type="text/javascript">

    //登录按钮触发函数
    $(document).delegate('#user_login_btn', 'click', function () {
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
        $('#user_login_btn').html('登录中');
        $('#user_login_btn').attr('disabled', "disabled");
        $.ajax({
            type: 'post',
            url: '<{$smarty.const._site_domain}><{$controller_name}>/user_login_check/',
            data:{user_name:user_name,user_pwd:user_pass,auto_login:auto_login},
            success: function (res) {
                $('#user_login_btn').html('登&nbsp;录');
                $('#user_login_btn').removeAttr('disabled');
                var return_arr = eval('(' + res + ')');
                switch (return_arr.status) {
                    case '1':
                        var expire = null;
                        if (return_arr.data.auto_login == '1') {
                            expire = parseInt(return_arr.data.cookie_time);
                        }
                        setCookie('id', return_arr.data.id, expire);
                        setCookie('user_name', return_arr.data.user_name, expire);
                        setCookie('type', return_arr.data.type, expire);
                        setCookie('status', return_arr.data.status, expire);
                        setCookie('login_ip', return_arr.data.login_ip, expire);
                        setCookie('last_login_time', return_arr.data.last_login_time, expire);
                        setCookie('login_time', return_arr.data.login_time, expire);
                        setCookie('token', return_arr.data.token, expire);
                        location.href = '<{$smarty.const._site_domain}>';
                        break;
                    case '-1':
                        $('#login_tips').html('*' + return_arr.msg + '!&nbsp;&nbsp;');
                        break;
                    case '-2':
                        $('#login_tips').html('*' + return_arr.msg + '!&nbsp;&nbsp;');
                        break;
                    default :
                        $('#login_tips').html('*服务器繁忙&nbsp;&nbsp;');
                        break;
                }
            }
        });

    });

    // 绑定回车事件
    $(document).keypress(function (e) {
        if (e.which == 13) {
            $('#user_login_btn').click();
        }
    });
    //trim修复(IE)
    String.prototype.trim = function () {
        return this.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
    }
    function getCookie(c_name) {
        if (document.cookie.length > 0) {
            c_start = document.cookie.indexOf(c_name + "=")
            if (c_start != -1) {
                c_start = c_start + c_name.length + 1
                c_end = document.cookie.indexOf(";", c_start)
                if (c_end == -1) c_end = document.cookie.length
                return unescape(document.cookie.substring(c_start, c_end))
            }
        }
        return ""
    }
    function setCookie(c_name, value, expiredays) {
        var exdate = new Date()
        exdate.setDate(exdate.getDate() + expiredays)
        document.cookie = c_name + "=" + escape(value) +
        ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString()) + ";path=/";
    }
</script>
</body>
</html>