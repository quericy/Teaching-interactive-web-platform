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
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._admin_css}>default.css"/>

    <!--IE8 css query-->
    <script src="<{$smarty.const._site_js}>respond.min.js"></script>
</head>
<body>
<{include file="admin/nav.tpl"}>
<div class="content">
    <ol class="breadcrumb">
        <li class="active"><a href="<{$smarty.const._admin_domain}>">管理后台</a></li>
        <li class="active">系统设置</li>
        <li><{$web_title}></li>
    </ol>
    <div id="header_tips"  >
    </div>
    <div  class="alert alert-info alert-dismissible fade in" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
        <strong>提示：</strong>系统参数只有管理员有权查看与修改
    </div>
    <div>
        <div class="form-group">
            <label for="web_name">站点名称:</label>
            <span class="glyphicon glyphicon-question-sign" style="color:#A7A7A7;"
                  data-toggle="tooltip" data-placement="right" title="前台显示的站点用户名称"></span>
            <input id="web_name" type="text" class="form-control" placeholder="请输入站点名称" value="<{$web_name}>">
        </div>
        <div class="form-group">
            <label for="cookie_time">用户记住密码有效期:</label>
            <span class="glyphicon glyphicon-question-sign" style="color:#A7A7A7;"
                  data-toggle="tooltip" data-placement="right" title="单位为天,过大会导致浏览器无法记录"></span>

            <div class="input-group">
                <input id="cookie_time" type="number" min="0" max="365" class="form-control" placeholder="请输入天数" value="<{$cookie_time}>">
                <span class="input-group-addon">天</span>
            </div>
        </div>
        <div class="form-group">
            <label for="reset_pwd">重置默认密码:</label>
            <span class="glyphicon glyphicon-question-sign" style="color:#A7A7A7;"
                  data-toggle="tooltip" data-placement="right" title="管理员重置用户密码时,赋予用户的初始密码"></span>
            <input id="reset_pwd" type="text" class="form-control" placeholder="请输入默认密码" value="<{$reset_pwd}>">
        </div>
        <div class="form-group">
            <label>教师权限设置:</label>
            <span class="glyphicon glyphicon-question-sign" style="color:#A7A7A7;"
                  data-toggle="tooltip" data-placement="right" title="设置赋予普通教师的权限"></span>

            <p>&emsp;&emsp;<input id="power_reset_pwd" type="checkbox" <{if $power_reset_pwd==1}>checked<{/if}>>
                &emsp;重置学生密码</p>

            <p>&emsp;&emsp;<input id="power_data_view" type="checkbox" <{if $power_data_view==1}>checked<{/if}>>
                &emsp;查看汇总数据</p>

            <p>&emsp;&emsp;<input id="power_log_view" type="checkbox" <{if $power_log_view==1}>checked<{/if}>>
                &emsp;查看日志</p>
        </div>
        <hr/>
        <div class="form-group">
            <button id="save_sys_setting" class="btn btn-success" type="button" title="保存">保存</button>
        </div>

    </div>

</div>


<{include file="admin/footer.tpl"}>
<script type="text/javascript">
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
    $(document).delegate('#save_sys_setting', 'click', function () {
        var web_name = $('#web_name').val();
        var cookie_time = $('#cookie_time').val();
        var reset_pwd = $('#reset_pwd').val();
        var power_reset_pwd = $("#power_reset_pwd")[0].checked;//jquery选择器转DOM对象取check的值
        var power_data_view = $("#power_data_view")[0].checked;
        var power_log_view = $("#power_log_view")[0].checked;

        if(cookie_time==''){
            my_dialog('提示','记住密码有效期必须为数字!',false);
            return;
        }
        power_reset_pwd=power_reset_pwd==true?1:0;
        power_data_view=power_data_view==true?1:0;
        power_log_view=power_log_view==true?1:0;

        $('#save_sys_setting').html('正在保存');
        $('#save_sys_setting').attr('disabled',"disabled");
        $.ajax({
            type: 'post',
            url: '<{$smarty.const._admin_domain}><{$controller_name}>/save_setting/',
            data:{web_name:web_name,cookie_time:cookie_time,reset_pwd:reset_pwd,power_reset_pwd:power_reset_pwd,power_data_view:power_data_view,power_log_view:power_log_view},
            success: function (res) {
                $('#save_sys_setting').html('保存');
                $('#save_sys_setting').removeAttr('disabled');
                switch (res) {
                    case '1':
                        $('#header_tips').html('<div id="tips_msg" class="alert alert-success fade in" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>消息：</strong>系统参数保存成功!</div>');
                        $('#tips_msg').fadeOut(3000);
                        break;
                    case '-2':
                        $('#header_tips').html('<div id="tips_msg" class="alert alert-danger fade in" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>提示：</strong>记住密码时间必须是大于等于0的数字!</div>');
                        $('#tips_msg').fadeOut(3000);
                        break;
                    case '-3':
                        $('#header_tips').html('<div id="tips_msg" class="alert alert-danger fade in" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>提示：</strong>默认密码不能为空!</div>');
                        $('#tips_msg').fadeOut(3000);
                        break;
                    default :
                        my_dialog('提示', '操作失败', false);
                        break;
                }
            }
        });

    });
</script>
</body>
</html>