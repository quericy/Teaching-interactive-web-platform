<?php
/**
 * 作业列表控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/26 0026
 * Time: 14:51
 */

class Work_List extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->common_cls->is_login_alert();
        $this->load->model('work', 'work_cls');
        $this->assign_arr['controller_name'] = $this->router->class;
        $this->assign_arr['web_title'] = '作业管理';
        $this->assign_arr['nav_show'] = 'work';
    }

    public function index($page = 1)
    {
        $per_page = 10;//每页10条数据
        //获取课件列表
        $work_list = $this->work_cls->get_work_list( $page, $per_page);
        $this->assign_arr['work_info_list'] = $work_list;
        //分页
        $this->load->library('page_cls');
        $this->assign_arr['page_string'] = $this->page_cls->get_page_config($this, $this->work_cls->get_work_count(), true, $per_page);
        //页面展示
        $this->smarty->view('admin/work_list.tpl', $this->assign_arr);
    }

    public function del($wid)
    {
        $wid = intval($wid);
        $this->log->add_log('删除作业(作业id:' . $wid . ')', $this->assign_arr['web_title']);
        $this->work_cls->del_by_wid($wid);
        echo $this->common_cls->json_output('1','作业删除成功!');
    }

}

/* End of file work_list.php */
/* Location: ./application/controllers/admin/work_list.php */