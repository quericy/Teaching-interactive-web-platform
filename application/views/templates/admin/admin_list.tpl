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
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._admin_css}>admin_list.css"/>
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
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
        调试中...
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">教师列表</h3>
        </div>
        <table id="admin_table" class="table table-striped table-hover table-condensed">
            <tr>
                <th class="text-center"><input id="all_check" type="checkbox"></th>
                <th class="text-left">ID</th>
                <th class="text-left">用户名</th>
                <th class="text-center">用户类型</th>
                <th class="text-center">最近登录</th>
                <th class="text-center">状态</th>
                <th class="text-center">操作</th>
            </tr>
            <{foreach  from=$admin_info_list item=val key=key}>
            <tr>
                <td class="text-center"><input class="item_check" type="checkbox" data-tid="<{$val.tid}>"></td>
                <td class="text-left"><{$val.tid}></td>
                <td class="text-left"><{$val.user_name}></td>
                <td class="text-center"><{if $val.type==2}>管理员<{else}>教师<{/if}></td>
                <td class="text-center">
                    <{if !empty($val.login_time)}>
                        <{$val.login_time|date_format:'%Y-%m-%d %H:%M:%S'}><br><{$val.login_ip}>
                    <{else}>
                        暂无记录
                    <{/if}>
                </td>
                <td class="text-center"><{if $val.status==1}><span class="alert-success">已启用</span><{else}><span
                        class="alert-danger">已禁用</span><{/if}>
                </td>
                <td class="text-center">
                    <div class="btn-group" role="group">
                        <a href="#" class="btn btn-default btn-sm">修改</a>
                        <button type="button" class="btn btn-default btn-sm" data-toggle="modal"
                          data-tid="<{$val.tid}>" data-name="<{$val.user_name}>"  data-target="#del_dialog">删除
                        </button>
                    </div>
                </td>
            </tr>
            <{/foreach}>
        </table>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="pull-left">
                <button type="button" class="btn btn-success" style="margin-top: 20px">
                    <span class="glyphicon glyphicon-plus"></span>
                    添加新教师
                </button>
                <div class="btn-group dropup" style="margin-top: 20px">
                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
                            aria-expanded="false">
                        批量操作&nbsp;<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a id="status_on" href="#">启用用户</a></li>
                        <li class="divider"></li>
                        <li><a id="status_off"  href="#">禁用用户</a></li>
                    </ul>
                </div>
                &nbsp;&nbsp;
            </div>
            <nav class="pull-right">
                <{$page_string}>
            </nav>

        </div>
    </div>

</div>


<!-- 删除确认弹窗 -->
<div id="del_dialog" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                <h5 class="modal-title" id="myModalLabel">确认删除</h5>
            </div>
            <div class="modal-body">确定要删除<span id="del_teacher_name" class="text-danger"></span>吗?删除后将无法恢复!</div>
            <div class="modal-footer">
                <button id="del_button" type="button" class="btn btn-danger">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<{include file="admin/footer.tpl"}>
<script src="<{$smarty.const._site_js}>icheck.min.js"></script>
<script src="<{$smarty.const._site_js}>admin_common.js"></script>
<script type="text/javascript">
    $('#del_dialog').on('show.bs.modal',function(e){
        var obj=$(e.relatedTarget);
        $('#del_teacher_name').html(obj.data('name'));
       // alert(obj.data('name'));
        $('#del_button').attr('data-tid',obj.data('tid'));
    });
    $(document).delegate('#del_button','click',function(){
        var tid=$(this).attr('data-tid');
        $.ajax({
            type:'post',
            url:'<{$smarty.const._admin_domain}>admin_list/del/'+tid,
            success:function(res){
                switch (res){
                    case '1':
                        my_dialog('提示','删除成功!',{
                            btn_class:'info',
                            call_back: function () {
                                location.reload();
                            }
                        });
                        break;
                    default :
                        my_dialog('提示','操作失败',false);
                        break;
                }
            }
        });
    });
    $(document).delegate('#status_on','click',function(){
        var check_arr=new Array();
        $(".item_check:checkbox").each(function(){
            if(this.checked == true){
                check_arr.push($(this).data('tid'));
            }
        });
        var tid_str=check_arr.join(',');
        if(tid_str==''){
            my_dialog('提示','请至少勾选一个用户',false);
            return;
        }
        $.ajax({
            type:'post',
            url:'<{$smarty.const._admin_domain}>admin_list/status_change/on',
            data:{tid_str:tid_str},
            success:function(res){
                my_dialog('提示',res,false);
            }
        });
    });
    //多选框
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