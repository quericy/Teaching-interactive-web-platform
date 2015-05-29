<?php

/**
 * 关于页面控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/28 0028
 * Time: 12:01
 */
class About extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->assign_arr['controller_name'] = $this->router->class;
        //系统设置缓存
        $sys_setting = $this->cache_cls->get_sys_cache();
        $this->assign_arr['web_name'] = $sys_setting['web_name'];
        $this->assign_arr['web_title'] = '关于' . ' - ' . $sys_setting['web_name'];//站点名称
        $this->assign_arr['nav_show'] = 'about';
        $this->assign_arr['user_info'] = $this->common_cls->show_user_info();//登录信息展示
    }

    public function index()
    {
        //页面展示
        $this->smarty->view('about.tpl', $this->assign_arr);
    }
}

/* End of file about.php */
/* Location: ./application/controllers/about.php */