<?php

/**
 * 课件列表控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/11 0011
 * Time: 10:37
 */
class Course_list extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->load->model('data', 'data_cls');
        $this->assign_arr['controller_name'] = $this->router->class;
        $this->assign_arr['web_title'] = '课件管理';
        $this->assign_arr['nav_show'] = 'data';
    }

    public function index($page = 1)
    {
        $per_page = 10;//每页10条数据
        //获取课件列表
        $course_list = $this->data_cls->get_list(1, $page, $per_page);
        $this->assign_arr['course_info_list'] = $course_list;
        //分页
        $this->load->library('page_cls');
        $this->assign_arr['page_string'] = $this->page_cls->get_page_config($this, $this->data_cls->get_counts(array('type' => '1')), true, $per_page);
        //页面展示
        $this->smarty->view('admin/course_list.tpl', $this->assign_arr);
    }

    public function del($did)
    {
        $did = intval($did);
        $this->log->add_log('删除课件(课件id:' . $did . ')', $this->assign_arr['web_title']);
        $this->data_cls->del_by_did($did);
        echo 1;
    }

}

/* End of file course_list.php */
/* Location: ./application/controllers/admin/course_list.php */