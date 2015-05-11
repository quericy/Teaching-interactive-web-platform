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
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._admin_css}><{$controller_name}>.css"/>
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
            <form action=""  method="POST" enctype="multipart/form-data">
                <table id="edit_table" class="table table-striped table-hover table-condensed">
                    <tr>
                        <td class="text-center" style="width:100px;"><label>课件ID:</label></td>
                        <td class="text-left">1</td>
                    </tr>
                    <tr>
                        <td class="text-center"><label for="title">课件名称:</label></td>
                        <td class="text-left">
                            <input id="title" type="text" class="form-control" placeholder="请输入课件名称"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center"><label>类型:</label></td>
                        <td class="text-left">
                            &nbsp;
                            <span><input type="radio" name="type" value="1" checked>&nbsp;课件</span>
                            &nbsp;&nbsp;&nbsp;
                            <span><input type="radio" name="type" value="2">&nbsp;资料</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center"><label for="data_file">附件:</label></td>
                        <td class="text-left">
                            <input id="data_file" type="file" class="form-control"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center"><label for="content_area">正文内容:</label></td>
                        <td class="text-left">
                            <textarea id="content_area" class="form-control"></textarea>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <button type="button" class="btn btn-success">
                <span class="glyphicon glyphicon-floppy-disk"></span>
                保存
            </button>
            <button type="button" class="btn btn-primary">
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