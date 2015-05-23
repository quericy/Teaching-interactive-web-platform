<?php
/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/23 0023
 * Time: 21:39
 */

class User_Reg extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->assign_arr['controller_name'] = $this->router->class;
        //系统设置缓存
        $sys_setting = $this->cache_cls->get_sys_cache();
        $this->assign_arr['web_name'] = $sys_setting['web_name'];
        $this->assign_arr['cookie_time'] = $sys_setting['cookie_time'];
        $this->assign_arr['web_title'] = '学生注册' . ' - ' . $sys_setting['web_name'];//站点名称
        $this->assign_arr['nav_show'] = '';
        $this->assign_arr['user_info'] = $this->common_cls->show_user_info();//登录信息展示
    }

    public function index()
    {
        //页面展示
        $this->smarty->view('user_reg.tpl', $this->assign_arr);
    }

    /**
     * 验证码展示方法
     */
    public function get_varify_code()
    {
//        session_start();
//        var_dump($_SESSION['captcha']);
        $this->load->library('varify_code');
        $this->varify_code->get_image();
    }
}

/* End of file user_reg.php */
/* Location: ./application/controllers/user_reg.php */