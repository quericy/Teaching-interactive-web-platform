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
        $sys_setting = $this->cache_cls->get_sys_cache();
        $this->assign_arr['web_title'] = '课件资料' . ' - ' . $sys_setting['web_name'];//站点名称
        //课件资料模型
        $this->load->model('data', 'data_cls');
        $this->assign_arr['nav_show'] = 'course_data';
        $this->show_user_center();
    }

    public function index($course_page = 1, $data_page = 1)
    {
        $per_page = 5;//每页10条数据
        preg_match('/(\d+)/', $course_page, $course_page_arr);//正则匹配课件页码数字
        preg_match('/(\d+)/', $data_page, $data_page_arr);//正则匹配资料页码数字
        if (!empty($course_page_arr)) {
            $course_page = $course_page_arr[0];
        } else {
            $course_page = 1;
        }
        if (!empty($data_page_arr)) {
            $data_page = $data_page_arr[0];
        } else {
            $data_page = 1;
        }
        $this->load->library('page_cls');
        //获取课件列表
        $course_list = $this->data_cls->get_list(1, $course_page, $per_page);
        $this->assign_arr['course_info_list'] = $course_list;
        //指定分页链接
        $base_url = base_url() . '/' . $this->uri->segment(1) . '/' . ($this->uri->segment(2) ? $this->uri->segment(2) : 'index') . '/' . $course_page . '/';
        $first_link_url_suffix = base_url() . '/' . $this->uri->segment(1) . '/' . ($this->uri->segment(2) ? $this->uri->segment(2) : 'index') . '/';
        //课件列表分页
        $this->assign_arr['course_page_string'] = $this->page_cls->get_page_config($this, $this->data_cls->get_counts(array('type' => '1')), false, $per_page, 3, '/' . $data_page, '', $first_link_url_suffix . '1' . '/' . $data_page);

        //获取资料列表
        $data_list = $this->data_cls->get_list(2, $data_page, $per_page);
        $this->assign_arr['data_info_list'] = $data_list;

        //资料列表分页
        $this->assign_arr['data_page_string'] = $this->page_cls->get_page_config($this, $this->data_cls->get_counts(array('type' => '2')), false, $per_page, 4, '', $base_url, $first_link_url_suffix . $course_page . '/1');

        //获取最新课件资料
        $this->assign_arr['recent_data_list'] = $this->data_cls->get_recent_list(5);

        //页面展示
        $this->smarty->view('course_data_list.tpl', $this->assign_arr);
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

/* End of file course_data_list.php */
/* Location: ./application/controllers/course_data_list.php */