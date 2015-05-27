<?php
/**
 * 答疑列表控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/27 0027
 * Time: 22:29
 */

class Answer_List extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->common_cls->is_login_alert();
        $this->load->model('answer', 'answer_cls');
        $this->assign_arr['controller_name'] = $this->router->class;
        $this->assign_arr['web_title'] = '答疑管理';
        $this->assign_arr['nav_show'] = 'answer';
    }

    /**
     * 提问列表
     * @param int $page 页数
     */
    public function index($page = 1)
    {
        $per_page = 10;//每页10条数据
        //获取提问列表
        $answer_info_list = $this->answer_cls->get_list(null,'id desc',$page, $per_page);
        if (!empty($answer_info_list)) {
            foreach ($answer_info_list as $key => $val) {
                if (!empty($val['t_name'])) {
                    $answer_info_list[$key]['user_name'] = $val['t_name'];
                    $answer_info_list[$key]['answer_type'] = '1';
                } elseif (!empty($val['u_name'])) {
                    $answer_info_list[$key]['user_name'] = $val['u_name'];
                    $answer_info_list[$key]['answer_type'] = '0';
                } else {
                    $answer_info_list[$key]['user_name'] = '--';
                    $answer_info_list[$key]['answer_type'] = '0';
                }
                $answer_info_list[$key]['user_logo_uri'] = $this->common_cls->get_identicon($answer_info_list[$key]['user_name'], 48);//提问用户头像
            }
        }
        $this->assign_arr['answer_info_list'] = $answer_info_list;
        //分页
        $this->load->library('page_cls');
        $this->assign_arr['page_string'] = $this->page_cls->get_page_config($this, $this->answer_cls->get_answer_count(), true, $per_page);
        //页面展示
        $this->smarty->view('admin/answer_list.tpl', $this->assign_arr);
    }
    /**
     * 删除提问
     * @param $id 提问qid
     */
    public function del($id)
    {
        /****权限判断(未完成)*****/
        $id = intval($id);
        $this->log->add_log('删除回答(回答id:' . $id . ')', $this->assign_arr['web_title']);
        $this->answer_cls->del_answer_by_id($id);
        echo $this->common_cls->json_output('1','删除回答记录成功!');
    }
}

/* End of file answer_list.php */
/* Location: ./application/controllers/admin/answer_list.php */