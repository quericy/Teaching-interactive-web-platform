<?php
/**
 * 前台课程资料列表
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/22 0022
 * Time: 9:12
 */

class Course_Data extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->assign_arr['controller_name'] = $this->router->class;
        //系统设置缓存
        $sys_setting = $this->cache_cls->get_sys_cache();
        $this->assign_arr['web_title'] = '课件资料' . ' - ' . $sys_setting['web_name'];//站点名称
        //课件资料模型
        $this->load->model('data', 'data_cls');
        $this->assign_arr['nav_show'] = 'course_data';
    }

    public function index($did)
    {
        $did=intval($did);
        //获取最新课件资料
        $this->assign_arr['course_data_arr']=$this->data_cls->get_one_data('*',array('did'=>$did));
        //获取最新课件资料
        $this->assign_arr['recent_data_list']=$this->data_cls->get_recent_list(5);
        //页面展示
        $this->smarty->view('course_data.tpl', $this->assign_arr);
    }
}

/* End of file course_data.php */
/* Location: ./application/controllers/course_data.php */