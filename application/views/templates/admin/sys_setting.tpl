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
    <div class="alert alert-info alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
        <strong>提示：</strong>系统参数只有管理员有权查看与修改
    </div>

    <div>
        <div class="form-group">
            <label for="Web_Name">站点名称:</label>
            <span class="glyphicon glyphicon-question-sign" style="color:#A7A7A7;"
                  data-toggle="tooltip" data-placement="right" title="前台显示的站点用户名称"></span>
            <input id="Web_Name" type="text" class="form-control" placeholder="请输入站点名称">
        </div>
        <div class="form-group">
            <label for="cookie_time">用户记住密码有效期:</label>
            <span class="glyphicon glyphicon-question-sign" style="color:#A7A7A7;"
                  data-toggle="tooltip" data-placement="right" title="单位为天,过大会导致浏览器无法记录"></span>

            <div class="input-group">
                <input id="cookie_time" type="number" min="0" max="365" class="form-control" placeholder="请输入天数">
                <span class="input-group-addon">天</span>
            </div>
        </div>
        <div class="form-group">
            <label for="reset_pwd">重置默认密码:</label>
            <span class="glyphicon glyphicon-question-sign" style="color:#A7A7A7;"
                  data-toggle="tooltip" data-placement="right" title="管理员重置用户密码时,赋予用户的初始密码"></span>
            <input id="reset_pwd" type="text" class="form-control" placeholder="请输入默认密码">
        </div>
        <div class="form-group">
            <label>教师权限设置:</label>
            <span class="glyphicon glyphicon-question-sign" style="color:#A7A7A7;"
                  data-toggle="tooltip" data-placement="right" title="设置赋予普通教师的权限"></span>

            <p>&emsp;&emsp;<input id="power_reset_pwd" type="checkbox">&emsp;重置学生密码</p>

            <p>&emsp;&emsp;<input id="power_data_view" type="checkbox">&emsp;查看汇总数据</p>

            <p>&emsp;&emsp;<input id="power_log_view" type="checkbox">&emsp;查看日志</p>
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
</script>
</body>
</html>