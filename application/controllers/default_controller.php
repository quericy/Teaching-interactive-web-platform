<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
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
        $sys_setting= $this->cache_cls->get_sys_cache();
        $this->assign_arr['web_title'] = $sys_setting['web_name'];//站点名称
        $this->assign_arr['nav_show'] = 'index';
    }

    public function index()
    {
        //页面展示
        $this->smarty->view('index.tpl', $this->assign_arr);
    }

}

/* End of file default_controller.php */
/* Location: ./application/controllers/default_controller.php */