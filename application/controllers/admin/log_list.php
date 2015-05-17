<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 日志列表控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/7 0007
 * Time: 11:23
 */
class Log_list extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->common_cls->is_login_alert();
        $this->load->model('log', 'log_cls');
        $this->assign_arr['controller_name'] = $this->router->class;
        $this->assign_arr['web_title'] = '日志管理';
        $this->assign_arr['nav_show'] = 'system';
    }

    /**
     * 日志列表
     * @param int $page 页数
     */
    public function index($page = 1)
    {
        $per_page = 10;
        //获取日志列表
        $log_info_list = $this->log_cls->get_log_list($page, $per_page);
        $this->assign_arr['log_info_list'] = $log_info_list;
        //分页
        $this->load->library('page_cls');
        $this->assign_arr['page_string'] = $this->page_cls->get_page_config($this, $this->log_cls->get_log_count(), true, $per_page);
        //页面展示
        $this->smarty->view('admin/log_list.tpl', $this->assign_arr);
    }
}

/* End of file log_list.php */
/* Location: ./application/controllers/admin/log_list.php */