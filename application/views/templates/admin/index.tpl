<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理后台-<{$web_title}></title>
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._site_css}>bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._admin_css}>index.css"/>
    <!--IE8 css query-->
    <script src="<{$smarty.const._site_js}>respond.min.js"></script>
</head>
<body>
<{include file="admin/nav.tpl"}>
<div class="content">
    <ol class="breadcrumb">
        <li class="active">管理后台</li>
        <li class="active">仪表板</li>
        <li>后台概览</li>
    </ol>

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">系统状态</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-3 col-sm-6">1

                </div>
                <div class="col-md-3 col-sm-6">2

                </div>
                <div class="col-md-3 col-sm-6">3

                </div>
                <div class="col-md-3 col-sm-6">4

                </div>
            </div>
        </div>
    </div>
</div>
<{include file="admin/footer.tpl"}>
</body>
</html>