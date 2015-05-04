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

        $this->assign_arr['controller_name'] = $this->router->class;
        $this->assign_arr['web_title'] = '系统参数';
        $this->assign_arr['nav_show'] = 'system';

        $this->load->helper('file');
    }

    public function index()
    {
        //页面展示
        $this->smarty->view('admin/sys_setting.tpl', $this->assign_arr);
    }

    /**
     * 保存配置
     */
    public function save_setting()
    {
        $web_name=$this->input->post('web_name',true);
        $cookie_time=$this->input->post('cookie_time',true);
        $reset_pwd=$this->input->post('reset_pwd',true);
        $user_status=$this->input->post('user_status',true);
        $power_reset_pwd=$this->input->post('power_reset_pwd',true);
        $power_data_view=$this->input->post('power_data_view',true);
        $power_log_view=$this->input->post('power_log_view',true);
        if(!is_numeric($cookie_time)){
            echo -2;
        }
        $power_reset_pwd=$power_reset_pwd=='1'?1:0;
        $power_data_view=$power_data_view=='1'?1:0;
        $power_log_view=$power_log_view=='1'?1:0;



        echo 1;
    }


}

/* End of file sys_setting.php */
/* Location: ./application/controllers/admin/sys_setting.php */