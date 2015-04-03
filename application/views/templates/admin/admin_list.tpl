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
    <div class="alert alert-info alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        调试中...
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">教师列表</h3>
        </div>
        <table id="admin_table" class="table table-striped table-hover">
            <tr>
                <th class="text-center"><input id="all_check" type="checkbox"></th>
                <th class="text-center">ID</th>
                <th class="text-left">用户名</th>
                <th class="text-center">用户类型</th>
                <th class="text-center">最近登录</th>
                <th class="text-center">操作</th>
            </tr>
            <{foreach  from=$admin_info_list item=val key=key}>
            <tr>
                <td class="text-center"><input class="item_check" type="checkbox"></td>
                <td class="text-center">1</td>
                <td class="text-left">啦啦啦</td>
                <td class="text-center">教师</td>
                <td class="text-center">暂无数据</td>
                <td class="text-center">
                    <div class="btn-group" role="group">
                        <a href="#" class="btn btn-default btn-sm">修改</a>
                        <button type="button" class="btn btn-default btn-sm"  data-toggle="modal" data-target="#del_dialog">删除</button>
                    </div>

                </td>
            </tr>
            <{/foreach}>
        </table>
    </div>
    <nav class="pull-right">
        <ul class="pagination">
            <li class="disabled">
                <a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li class="active"><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li>
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>


<!-- 删除确认弹窗 -->
<div id="del_dialog" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h5 class="modal-title" id="myModalLabel">确认删除</h5>
            </div>
            <div class="modal-body">确定要删除这位教师吗?删除后将无法恢复!</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<{include file="admin/footer.tpl"}>
<script src="<{$smarty.const._site_js}>icheck.min.js"></script>
<script type="text/javascript">
    $('#all_check').on('ifChecked', function (event) {
        $('.item_check').iCheck('check');
    });
    $('#all_check').on('ifUnchecked', function (event) {
        $('.item_check').iCheck('uncheck');
    });
    $(document).ready(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // 触摸扩展区域
        });
    });
</script>
</body>
</html>