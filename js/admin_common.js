/**
 * Created by 熠 on 2015/4/12 0012.
 */
$(document).ready(function () {
    //适配移动设备时,进行nav填充
    var uls = $('.sidebar-nav > ul > *').clone();
    uls.addClass('visible-xs');
    $('#main-menu').append(uls.clone());
    //添加复用模态框默认容器
    $('body').append('<div id="my_modal_dialog" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"></div>');
});
/**
 * 自定义模态框
 * @param title 标题
 * @param content 正文
 * @param btn_obj 按钮对象(btn_text:按钮文本,btn_class:按钮样式,call_back:回调函数,cancel_call_back:取消按钮回调函数,show_cancel:显示取消按钮)
 */
function my_dialog(title, content, btn_obj) {
    //重新绑定回调函数
    $(document).undelegate('#ok_btn', 'click');//绑定解除
    if ($.isFunction(btn_obj.call_back)) {
        $(document).delegate('#ok_btn', 'click', function () {
            btn_obj.call_back();
        });
    }
    //重新绑定取消按钮回调函数
    $(document).undelegate('#cancel_btn', 'click');//绑定解除
    $(document).undelegate('#close_x_btn', 'click');//绑定解除
    if ($.isFunction(btn_obj.cancel_call_back)) {
        $(document).delegate('#cancel_btn', 'click', function () {
            btn_obj.cancel_call_back();
        });
        $(document).delegate('#close_x_btn', 'click', function () {
            btn_obj.cancel_call_back();
        });
    }
    var html = '<div class="modal-dialog modal-sm"><div class="modal-content"><div class="modal-header"><button id="close_x_btn" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h5 class="modal-title" id="myModalLabel">' + title + '</h5></div><div class="modal-body">' + content + '</div><div class="modal-footer">';
    if (btn_obj != false) {
        if (btn_obj.btn_text == undefined)btn_obj.btn_text = '确定';
        if (btn_obj.show_cancel == undefined)btn_obj.show_cancel = false;
        var ok_class;
        switch (btn_obj.btn_class) {
            case 'primary':
                ok_class = 'btn-primary';
                break;
            case 'success':
                ok_class = 'btn-success';
                break;
            case 'info':
                ok_class = 'btn-info';
                break;
            case 'warning':
                ok_class = 'btn-warning';
                break;
            case 'danger':
                ok_class = 'btn-danger';
                break;
            default:
                ok_class = 'btn-primary';
                break;
        }
        html += '<button id="ok_btn" type="button" class="btn ' + ok_class + '">' + btn_obj.btn_text + '</button>';

        if (btn_obj.show_cancel == true) {
            html += '<button id="cancel_btn" type="button" class="btn btn-default" data-dismiss="modal">取消</button>';
        }
    } else {
        html += '<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>';
    }
    html += '</div></div></div>';
    $('#my_modal_dialog').html(html);
    $('#my_modal_dialog').modal({
        backdrop: 'static'
    });
}