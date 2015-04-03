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
        <li>教师管理</li>
    </ol>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">教师列表</h3>
        </div>


                <table class="table table-striped table-hover">
                    <tr><th><input id="all_check" type="checkbox"></th><th>ID</th><th>用户名</th><th>用户类型</th><th>最近登录</th><th>操作</th></tr>
                    <tr><td><input class="item_check" type="checkbox"></td><td>test</td><td>test</td><td>test</td><td>test</td><td>test</td></tr>
                    <tr><td><input class="item_check" type="checkbox"></td><td>test</td><td>test</td><td>test</td><td>test</td><td>test</td></tr>
                    <tr><td><input class="item_check" type="checkbox"></td><td>test</td><td>test</td><td>test</td><td>test</td><td>test</td></tr>
                    <tr><td><input class="item_check" type="checkbox"></td><td>test</td><td>test</td><td>test</td><td>test</td><td>test</td></tr>
                </table>
            </div>


</div>
<{include file="admin/footer.tpl"}>
<script src="<{$smarty.const._site_js}>icheck.min.js"></script>
<script type="text/javascript">
    $('#all_check').on('ifChecked', function(event){
        $('.item_check').iCheck('check');
    });
    $('#all_check').on('ifUnchecked', function(event){
        $('.item_check').iCheck('uncheck');
    });
    $(document).ready(function(){
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // 触摸扩展区域
        });
    });
</script>
</body>
</html>