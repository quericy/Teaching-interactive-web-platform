<?php

/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/4/23 0023
 * Time: 23:09
 */
class User_list extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user', 'user_cls');
        $this->assign_arr['web_title'] = '学生管理';
        $this->assign_arr['nav_show'] = 'system';
    }

    /**
     * 用户列表
     * @param int $page 页码
     */
    public function index($page = 1)
    {
        $per_page = 10;//每页10条数据
        //获取用户列表
        $user_info_list = $this->user_cls->get_user_list($page, $per_page);
        $this->assign_arr['user_info_list'] = $user_info_list;
        //分页
        $this->load->library('page_cls');
        $this->assign_arr['page_string'] = $this->page_cls->get_page_config($this, $this->user_cls->get_user_count(), true, $per_page);
        //页面展示
        $this->smarty->view('admin/user_list.tpl', $this->assign_arr);
    }

}

/* End of file user_list.php */
/* Location: ./application/controllers/admin/user_list.php */