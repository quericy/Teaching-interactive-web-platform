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
        //课件资料模型
        $this->load->model('data', 'data_cls');
        $this->assign_arr['nav_show'] = 'course_data';
    }

    public function index($course_page=1,$data_page=1)
    {
        $per_page = 5;//每页10条数据
        $course_page=intval($course_page);
        $data_page=intval($data_page);
        $this->load->library('page_cls');
        //获取课件列表
        $course_list = $this->data_cls->get_list(1, $course_page, $per_page);
        $this->assign_arr['course_info_list'] = $course_list;
        //课件列表分页
        $this->assign_arr['course_page_string'] = $this->page_cls->get_page_config($this, $this->data_cls->get_counts(array('type' => '1')), false, $per_page,3,'/'.$data_page );

        //获取资料列表
        $data_list = $this->data_cls->get_list(2, $data_page, $per_page);
        $this->assign_arr['data_info_list'] = $data_list;
        //指定分页链接
        $base_url=base_url() . '/' . $this->uri->segment(1) . '/' . ($this->uri->segment(2) ? $this->uri->segment(2) : 'index') . '/'.$course_page.'/';
        //资料列表分页
        $this->assign_arr['data_page_string'] = $this->page_cls->get_page_config($this, $this->data_cls->get_counts(array('type' => '2')), false, $per_page,4,'',$base_url);
        //页面展示
        $this->smarty->view('course_data_list.tpl', $this->assign_arr);
    }

}

/* End of file course_data_list.php */
/* Location: ./application/controllers/course_data_list.php */