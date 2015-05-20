<?php

/**
 * 后台系统参数控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/4/29 0029
 * Time: 11:00
 */
class sys_setting extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->common_cls->is_login_alert();
        $this->load->model('setting', 'setting_cls');
        $this->assign_arr['controller_name'] = $this->router->class;
        $this->assign_arr['web_title'] = '系统参数';
        $this->assign_arr['nav_show'] = 'system';

        $this->load->helper('file');
    }

    public function index()
    {

        $this->assign_arr['web_name'] = $this->setting_cls->get_setting('web_name');
        $this->assign_arr['cookie_time'] = intval($this->setting_cls->get_setting('cookie_time'));
        $this->assign_arr['reset_pwd'] = $this->setting_cls->get_setting('reset_pwd');
        if (empty($this->assign_arr['reset_pwd'])) {
            $this->assign_arr['reset_pwd'] = '123456';
        }
        $this->assign_arr['power_reset_pwd'] = $this->setting_cls->get_setting('power_reset_pwd');
        if (!$this->assign_arr['power_reset_pwd'] == '1') {
            $this->assign_arr['power_reset_pwd'] = '0';
        }
        $this->assign_arr['power_data_view'] = $this->setting_cls->get_setting('power_data_view');
        if (!$this->assign_arr['power_data_view'] == '1') {
            $this->assign_arr['power_data_view'] = '0';
        }
        $this->assign_arr['power_log_view'] = $this->setting_cls->get_setting('power_log_view');
        if (!$this->assign_arr['power_log_view'] == '1') {
            $this->assign_arr['power_log_view'] = '0';
        }
        //页面展示
        $this->smarty->view('admin/sys_setting.tpl', $this->assign_arr);
    }

    /**
     * 保存配置
     */
    public function save_setting()
    {
        $web_name = $this->input->post('web_name', true);
        $cookie_time = $this->input->post('cookie_time', true);
        $reset_pwd = $this->input->post('reset_pwd', true);
        $power_reset_pwd = $this->input->post('power_reset_pwd', true);
        $power_data_view = $this->input->post('power_data_view', true);
        $power_log_view = $this->input->post('power_log_view', true);
        if (!is_numeric($cookie_time) || $cookie_time < 0) {
            echo $this->common_cls->json_output('-2','记住密码时间必须是大于等于0的数字!');
            return;
        }
        if (empty($reset_pwd)) {
            echo $this->common_cls->json_output('-3','默认密码不能为空!');
            return;
        }
        $power_reset_pwd = $power_reset_pwd == '1' ? '1' : '0';
        $power_data_view = $power_data_view == '1' ? '1' : '0';
        $power_log_view = $power_log_view == '1' ? '1' : '0';

        $teacher_power_tips = ($power_reset_pwd == '1' ? '允许' : '不允许') . '重置学生密码,' . ($power_data_view == '1' ? '允许' : '不允许') . '查看汇总数据,' . ($power_log_view == '1' ? '允许' : '不允许') . '查看日志';
        $this->log->add_log('修改系统设置(站点名称:' . $web_name . ',记住密码时间:' . $cookie_time . '天,默认重置密码:' . $reset_pwd . ',教师权限:' . $teacher_power_tips . ')', $this->assign_arr['web_title']);

        $this->setting_cls->update_setting('web_name', $web_name);
        $this->setting_cls->update_setting('cookie_time', $cookie_time);
        $this->setting_cls->update_setting('reset_pwd', $reset_pwd);
        $this->setting_cls->update_setting('power_reset_pwd', $power_reset_pwd);
        $this->setting_cls->update_setting('power_data_view', $power_data_view);
        $this->setting_cls->update_setting('power_log_view', $power_log_view);
        $this->cache_cls->del('sys_setting');//清除缓存
        echo $this->common_cls->json_output('1','系统参数保存成功!');
    }


}

/* End of file sys_setting.php */
/* Location: ./application/controllers/admin/sys_setting.php */