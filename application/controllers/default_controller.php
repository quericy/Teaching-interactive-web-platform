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
        $this->assign_arr['user_info'] = $this->common_cls->show_user_info();//登录信息展示
        $this->load->model('data', 'data_cls');
        $this->smarty->assign('count_cache', $this->cache_cls->get_count_statistics());//获取系统统计数据缓存

    }

    public function index()
    {
        //获取最新课件
        $this->assign_arr['recent_course_list'] = $this->data_cls->get_recent_list(7, array('type' => '1'));
        //获取最新资料
        $this->assign_arr['recent_data_list'] = $this->data_cls->get_recent_list(7, array('type' => '2'));
        //页面展示
        $this->smarty->view('index.tpl', $this->assign_arr);
    }
}

/* End of file default_controller.php */
/* Location: ./application/controllers/default_controller.php */