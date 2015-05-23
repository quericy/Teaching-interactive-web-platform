<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 前台默认控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/3/26 0026
 * Time: 22:33
 */
class Default_controller extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->assign_arr['controller_name'] = $this->router->class;
        //系统设置缓存
        $sys_setting = $this->cache_cls->get_sys_cache();
        $this->assign_arr['web_title'] = $sys_setting['web_name'];//站点名称
        $this->assign_arr['nav_show'] = 'index';
        $this->show_user_center();
    }

    public function index()
    {

        //页面展示
        $this->smarty->view('index.tpl', $this->assign_arr);
    }

    /**
     * 已登录用户展示
     */
    public function show_user_center()
    {
        $is_login = $this->common_cls->is_login(false);
        $this->assign_arr['is_login'] = $is_login;
        if ($is_login == true) {
            $this->assign_arr['user_name'] = $this->input->cookie('user_name', TRUE);
            $this->assign_arr['user_type'] = $this->input->cookie('type', TRUE);
        }
    }

}

/* End of file default_controller.php */
/* Location: ./application/controllers/default_controller.php */