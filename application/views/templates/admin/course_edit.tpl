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
        <li class="active">课件资料</li>
        <li class="active"><a href="<{$smarty.const._admin_domain}>course_list">课件管理</a></li>
        <li><{$web_title}></li>
    </ol>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                <{if $is_edit=='1'}><span class="glyphicon glyphicon-edit"></span><{else}><span
                    class="glyphicon glyphicon-plus"></span><{/if}>
                <{$web_title}>
            </h3>
        </div>
        <div class="panel-body">

        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <button type="button" class="btn btn-success" style="margin-top: 20px">
                <span class="glyphicon glyphicon-floppy-disk"></span>
                保存
            </button>
            <button type="button" class="btn btn-primary" style="margin-top: 20px" >
                取消
            </button>
        </div>
    </div>
</div>


<{include file="admin/footer.tpl"}>
<script type="text/javascript">

</script>
</body>
</html>