<?php

/**
 * 课件资料统计汇总控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/15 0015
 * Time: 10:36
 */
class Data_Statistics extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->common_cls->is_login_alert();
        $this->load->model('data', 'data_cls');
        $this->assign_arr['controller_name'] = $this->router->class;
        $this->assign_arr['web_title'] = '课件资料统计汇总';
        $this->assign_arr['nav_show'] = 'data';
    }

    public function index()
    {
        $this->assign_arr['all_counts'] = $this->data_cls->get_counts(array());
        $this->assign_arr['course_count'] = $this->data_cls->get_counts(array('type' => '1'));
        $this->assign_arr['data_count'] = $this->data_cls->get_counts(array('type' => '2'));
        $this->assign_arr['course_tid_count'] = $this->data_cls->get_tid_count(array('type' => '1'));
        $this->assign_arr['data_tid_count'] = $this->data_cls->get_tid_count(array('type' => '2'));
        $this->load->model('admin', 'admin_cls');
        $this->assign_arr['all_teachers'] = $this->admin_cls->get_admin_count();
        //页面展示
        $this->smarty->view('admin/data_statistics.tpl', $this->assign_arr);
    }


}

/* End of file data_statistics.php */
/* Location: ./application/controllers/admin/data_statistics.php */