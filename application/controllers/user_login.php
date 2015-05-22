<?php
/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/22 0022
 * Time: 20:31
 */

class User_Login extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->assign_arr['controller_name'] = $this->router->class;
        //系统设置缓存
        $sys_setting= $this->cache_cls->get_sys_cache();
        $this->assign_arr['web_name'] = $sys_setting['web_name'];
        $this->assign_arr['cookie_time'] = $sys_setting['cookie_time'];
        $this->assign_arr['web_title'] = '课件资料'.' - '.$sys_setting['web_name'];//站点名称
        $this->assign_arr['nav_show'] = '';
    }
    public function index()
    {
        //页面展示
        $this->smarty->view('user_login.tpl',$this->assign_arr);
    }
}

/* End of file user_login.php */
/* Location: ./application/controllers/user_login.php */