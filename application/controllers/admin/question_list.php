<?php
/**
 * 提问列表控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/18 0018
 * Time: 14:26
 */

class Question_List extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->common_cls->is_login_alert();
        $this->load->model('question', 'question_cls');
        $this->assign_arr['controller_name'] = $this->router->class;
        $this->assign_arr['web_title'] = '提问管理';
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
        $question_info_list = $this->question_cls->get_question_list($page, $per_page);
        $this->assign_arr['question_info_list'] = $question_info_list;
        //分页
        $this->load->library('page_cls');
        $this->assign_arr['page_string'] = $this->page_cls->get_page_config($this, $this->question_cls->get_question_count(), true, $per_page);
        //页面展示
        $this->smarty->view('admin/question_list.tpl', $this->assign_arr);
    }
    /**
     * 删除提问
     * @param $qid 提问qid
     */
    public function del($qid)
    {
        /****权限判断(未完成)*****/
        $qid = intval($qid);
        $this->log->add_log('删除问题(问题id:' . $qid . ')', $this->assign_arr['web_title']);
        $this->question_cls->del_question_by_qid($qid);
        echo $this->common_cls->json_output('1','删除提问记录成功!');
    }

    /**
     * 开启/关闭问题
     * @param $status 状态(1开启,0关闭)
     */
    public function status_change($status)
    {
        /****权限判断(未完成)*****/
        $qid_str = $this->input->post('qid_str', true);
        $qid_arr = explode(',', $qid_str);
        if (empty($qid_str) || count($qid_arr) == 0) {
            echo $this->common_cls->json_output('-1','请至少勾选一个问题!');
            return;
        }
        foreach ($qid_arr as $k => $v) {
            $qid_arr[$k] = intval($v);
        }
        $status = $status == '1' ? 1 : 0;
        $status_tips = $status == '1' ? '开启' : '关闭';
        $this->log->add_log('修改问题(问题id:' . implode(',', $qid_arr) . ')状态为:' . $status_tips, $this->assign_arr['web_title']);
        $this->question_cls->change_question_status($qid_arr, $status);
        echo $this->common_cls->json_output('1',$status_tips.'问题成功!');
    }
}

/* End of file question_list.php */
/* Location: ./application/controllers/admin/question_list.php */