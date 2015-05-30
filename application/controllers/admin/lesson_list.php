<?php

/**
 * 课程列表控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/30 0030
 * Time: 19:23
 */
class Lesson_List extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->common_cls->is_login_alert();
        $this->load->model('lesson', 'lesson_cls');
        $this->assign_arr['controller_name'] = $this->router->class;
        $this->assign_arr['web_title'] = '课程管理';
        $this->assign_arr['nav_show'] = 'work';
    }

    public function index($page = 1)
    {
        $per_page = 10;//每页10条数据
        //获取课程列表
        $lesson_list = $this->lesson_cls->get_lesson_list($page, $per_page);
        $this->assign_arr['lesson_list'] = $lesson_list;
        //分页
        $this->load->library('page_cls');
        $this->assign_arr['page_string'] = $this->page_cls->get_page_config($this, $this->lesson_cls->get_lesson_count(), true, $per_page);
        //页面展示
        $this->smarty->view('admin/lesson_list.tpl', $this->assign_arr);
    }

    public function del($lid)
    {
        $lid = intval($lid);
        $this->log->add_log('删除课程(课程id:' . $lid . ')', $this->assign_arr['web_title']);
        $this->lesson_cls->del_by_lid($lid);
        echo $this->common_cls->json_output('1', '课程删除成功!');
    }

}

/* End of file lesson_list.php */
/* Location: ./application/controllers/admin/lesson_list.php */