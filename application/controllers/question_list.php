<?php
/**
 * 答疑列表控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/25 0025
 * Time: 14:08
 */

class question_list extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->assign_arr['controller_name'] = $this->router->class;
        //系统设置缓存
        $sys_setting = $this->cache_cls->get_sys_cache();
        $this->assign_arr['web_title'] = '答疑' . ' - ' . $sys_setting['web_name'];//站点名称
        //课件资料模型
        $this->load->model('question', 'question_cls');
        $this->assign_arr['nav_show'] = 'question';
        $this->assign_arr['user_info'] = $this->common_cls->show_user_info();//登录信息展示
    }

    public function index($page = 1)
    {
        $per_page = 10;//每页10条数据
        $page=intval($page);
        $this->load->library('page_cls');
        //获取提问列表
        $question_info_list = $this->question_cls->get_question_list($page, $per_page);
        foreach($question_info_list as $key=>$val){
            $question_info_list[$key]['user_logo_uri'] = $this->common_cls->get_identicon($val['user_name'],48);//提问用户头像
        }
        $this->assign_arr['question_info_list'] = $question_info_list;
        //分页
        $this->load->library('page_cls');
        $this->assign_arr['page_string'] = $this->page_cls->get_page_config($this, $this->question_cls->get_question_count(), false, $per_page);
        //页面展示
        $this->smarty->view('question_list.tpl', $this->assign_arr);
    }

}

/* End of file question_list.php */
/* Location: ./application/controllers/question_list.php */