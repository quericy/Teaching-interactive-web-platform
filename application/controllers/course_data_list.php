<?php

/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/20 0020
 * Time: 15:04
 */
class Course_Data_List extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->assign_arr['controller_name'] = $this->router->class;
        //系统设置缓存
        $sys_setting= $this->cache_cls->get_sys_cache();
        $this->assign_arr['web_title'] = '课件资料'.' - '.$sys_setting['web_name'];//站点名称
    }

    public function index()
    {
        //页面展示
        $this->smarty->view('index.tpl', $this->assign_arr);
    }

}

/* End of file course_data_list.php */
/* Location: ./application/controllers/course_data_list.php */