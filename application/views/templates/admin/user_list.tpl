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
        <li><{$web_title}></li>
    </ol>
    <div class="alert alert-info alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
        学生模块调试中...
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">学生列表</h3>
        </div>
        <table id="admin_table" class="table table-striped table-hover table-condensed">
            <tr>
                <th class="text-center"><input id="all_check" type="checkbox"></th>
                <th class="text-left">ID</th>
                <th class="text-left">用户名</th>
                <th class="text-center">邮箱</th>
                <th class="text-center">最近登录</th>
                <th class="text-center">状态</th>
                <th class="text-center">操作</th>
            </tr>
            <{foreach  from=$user_info_list item=val key=key}>
            <tr>
                <td class="text-center"><input class="item_check" type="checkbox" data-tid="<{$val.uid}>"></td>
                <td class="text-left"><{$val.uid}></td>
                <td class="text-left"><{$val.user_name}></td>
                <td class="text-center"><{$val.email}></td>
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
                        <a href="#" class="btn btn-primary btn-sm" data-toggle="modal"
                           data-tid="<{$val.uid}>" data-user-name="<{$val.user_name}>">
                            重置
                        </a>
                        <a href="#" class="del_btn btn btn-default btn-sm"
                           data-tid="<{$val.uid}>" data-name="<{$val.user_name}>">
                            删除
                        </a>
                    </div>
                </td>
            </tr>
            <{/foreach}>
        </table>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="pull-left">
                <div class="btn-group dropup" style="margin-top: 20px">
                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
                            aria-expanded="false">
                        批量操作&nbsp;<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a id="status_on" href="#">启用用户</a></li>
                        <li class="divider"></li>
                        <li><a id="status_off" href="#">禁用用户</a></li>
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

<{include file="admin/footer.tpl"}>
<script src="<{$smarty.const._site_js}>icheck.min.js"></script>
<script src="<{$smarty.const._site_js}>admin_common.js"></script>
<script type="text/javascript">
    //添加用户模态框展示触发
    $('#add_dialog').on('show.bs.modal', function (e) {
        var obj = $(e.relatedTarget);
        if (obj.data('type') == 'edit') {
            $('#myModalLabel').html('修改教师信息');
            //按钮设置
            $('#add_button').html('<span class="glyphicon glyphicon-pencil"></span>&nbsp;修改');
            $('#add_button').attr('data-tid', obj.data('tid'));
            //用户名赋值
            $('#user_name_input').attr('value', obj.data('user-name'));
            //密码赋值
            $('#password_input').val('');
            //用户类型选中
            $("input[name='user_type']").each(function () {
                if (obj.data('user-type') == this.value) {
                    $(this).iCheck('check');
                }
            });
            //用户状态选中
            $("input[name='user_status']").each(function () {
                if (obj.data('status') == this.value) {
                    $(this).iCheck('check');
                }
            });
            $('#password-tips').html('');
        } else {
            $('#myModalLabel').html('添加教师信息');
            //按钮设置
            $('#add_button').html('<span class="glyphicon glyphicon-plus"></span>&nbsp;添加');
            $('#add_button').attr('data-tid', 0);
            //用户名赋值
            $('#user_name_input').attr('value', '');
            //密码赋值
            $('#password_input').val('');
            //用户类型选中
            $("input[name='user_type']:first").iCheck('check');
            //用户状态选中
            $("input[name='user_status']:first").iCheck('check');
            $('#password-tips').html('*');
        }
    });

    //添加/修改用户ajax请求
    $(document).delegate('#add_button', 'click', function () {
        var tid = $(this).attr('data-tid');
        var user_name_input = $('#user_name_input').val();
        var password_input = $('#password_input').val();
        var user_type = 1;
        $("input[name='user_type']").each(function () {
            if (this.checked == true) {
                user_type = $(this).val();
            }
        });
        var user_status = $("input[name='user_status'][check]").val();
        $("input[name='user_status']").each(function () {
            if (this.checked == true) {
                user_status = $(this).val();
            }
        });

        if (tid > 0) {
            var ajax_url = 'edit/' + tid;
            var add_edit_text = "编辑";
        } else {
            var ajax_url = 'add/';
            var add_edit_text = "添加";
        }
        $.ajax({
            type: 'post',
            url: '<{$smarty.const._admin_domain}>admin_list/' + ajax_url,
            data:{user_name:user_name_input,password_input:password_input,user_type:user_type,user_status:user_status},
            success: function (res) {
                switch (res) {
                    case '1':
                        my_dialog('消息', '教师' + add_edit_text + '成功!', {
                            btn_class: 'info',
                            call_back: function () {
                                location.reload();
                            },
                            cancel_call_back: function () {
                                location.reload();
                            }
                        });
                        break;
                    case '-1':
                        my_dialog('提示', '系统繁忙,请重试!', false);
                        break;
                    case '-2':
                        my_dialog('提示', '输入信息不完整!', false);
                        break;
                    case '-3':
                        my_dialog('提示', '该教师不存在!', false);
                        break;
                    case '-4':
                        my_dialog('提示', '该用户名已存在!', false);
                        break;
                    default :
                        my_dialog('提示', '操作失败', false);
                        break;
                }
            }
        });
    });

    //删除用户
    $(document).delegate('.del_btn', 'click', function () {
        var tid = $(this).data('tid');
        var t_name = $(this).data('name');
        my_dialog('确认删除', '确定要删除<span id="del_teacher_name" class="text-danger">' + t_name + '</span>吗?删除后将无法恢复!', {
            btn_text: '删除',
            btn_class: 'danger',
            show_cancel: true,
            call_back: function () {
                $.ajax({
                    type: 'post',
                    url: '<{$smarty.const._admin_domain}>admin_list/del/' + tid,
                    success: function (res) {
                        switch (res) {
                            case '1':
                                my_dialog('提示', '删除成功!', {
                                    btn_class: 'info',
                                    call_back: function () {
                                        location.reload();
                                    },
                                    cancel_call_back: function () {
                                        location.reload();
                                    }
                                });
                                break;
                            default :
                                my_dialog('提示', '操作失败', false);
                                break;
                        }
                    }
                });
            }
        });
    });
    //批量启用
    $(document).delegate('#status_on', 'click', function () {
        change_status(1);
    });
    //批量禁用
    $(document).delegate('#status_off', 'click', function () {
        change_status(0);
    });
    //更改用户状态
    function change_status(status) {
        var status_text = status == '1' ? '启用' : '禁用';
        var check_arr = new Array();
        $(".item_check:checkbox").each(function () {
            if (this.checked == true) {
                check_arr.push($(this).data('tid'));
            }
        });
        var tid_str = check_arr.join(',');
        if (tid_str == '') {
            my_dialog('提示', '请至少勾选一个用户', false);
            return;
        }
        $.ajax({
            type: 'post',
            url: '<{$smarty.const._admin_domain}>admin_list/status_change/' + status,
            data:{tid_str:tid_str},
            success: function (res) {
                switch (res) {
                    case '1':
                        my_dialog('提示', status_text + '用户成功!', {
                            call_back: function () {
                                location.reload();
                            },
                            cancel_call_back: function () {
                                location.reload();
                            }
                        });
                        break;
                    case '-1':
                        my_dialog('提示', '请至少勾选一个用户', false);
                        break;
                    default :
                        my_dialog('提示', '操作失败', false);
                        break;
                }
            }
        });
    }
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