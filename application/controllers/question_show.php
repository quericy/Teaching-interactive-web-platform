<?php

/**
 * 答疑展示页面
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/25 0025
 * Time: 15:23
 */
class Question_Show extends CI_Controller
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

    public function index($qid)
    {
        $qid = intval($qid);
        //提问内容
        $this->assign_arr['question_arr'] = $this->question_cls->get_one_data('question.*', array('qid' => $qid));
        //提问者头像
        $this->assign_arr['question_arr']['user_logo_uri'] = $this->common_cls->get_identicon($this->assign_arr['question_arr']['user_name'], 72);
        //获取最新提问
        $this->assign_arr['recent_question_list'] = $this->question_cls->get_recent_list(5);
        //回答列表
        $this->load->model('answer', 'answer_cls');
        $answer_list = $this->answer_cls->get_list(array('qid' => '' . $qid));
        if (!empty($answer_list)) {
            foreach ($answer_list as $key => $val) {
                if (!empty($val['t_name'])) {
                    $answer_list[$key]['user_name'] = $val['t_name'];
                    $answer_list[$key]['answer_type'] = '1';
                } elseif (!empty($val['u_name'])) {
                    $answer_list[$key]['user_name'] = $val['u_name'];
                    $answer_list[$key]['answer_type'] = '0';
                } else {
                    $answer_list[$key]['user_name'] = '--';
                    $answer_list[$key]['answer_type'] = '0';
                }
                $answer_list[$key]['user_logo_uri'] = $this->common_cls->get_identicon($answer_list[$key]['user_name'], 48);//提问用户头像
            }
        }

        $this->assign_arr['answer_list'] = $answer_list;
        $this->assign_arr['qid'] = $qid;
        //页面展示
        $this->smarty->view('question_show.tpl', $this->assign_arr);
    }

    /**
     * 提交回复
     */
    public function reply()
    {
        $this->common_cls->is_login_alert(true, false);//登录校验
        $qid = intval($this->input->post('qid', true));
        $content = $this->input->post('reply_text', true);
        //回复内容验证
        $qid = intval($qid);
        if (empty($qid) || empty($content)) {
            echo $this->common_cls->json_output('-1', '回复信息不完整');
            return;
        }
        $question_arr = $this->question_cls->get_one_data('question.*', array('qid' => $qid));
        if ($question_arr['status'] != '1') {
            echo $this->common_cls->json_output('-1', '该问题已经关闭,无法回复!');
            return;
        }
        $now_time = time();
        $this->load->model('answer', 'answer_cls');
        $this->answer_cls->add_reply($qid, $content, $now_time);
        //构造回复区块
        $user_name = $this->input->cookie('user_name', TRUE);
        $user_type = $this->input->cookie('type', TRUE);
        if ($user_type == '1' || $user_type == '2') {
            $answer_type = '1';
        } else {
            $answer_type = '0';
        }
        $user_logo_uri = $this->common_cls->get_identicon($user_name, 48);
        $return_data = array(
            'user_name' => $user_name,
            'answer_type' => $answer_type,//是否是教师回复
            'sub_date_time' => date("Y-m-d H:i:s", $now_time),
            'user_logo_uri' => $user_logo_uri
        );
        echo $this->common_cls->json_output('1', '回复成功', $return_data);
    }

}

/* End of file question_show.php */
/* Location: ./application/controllers/question_show.php */