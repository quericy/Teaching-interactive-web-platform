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
        $this->assign_arr['question_arr'] = $this->question_cls->get_one_data('*', array('qid' => $qid));
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
        //页面展示
        $this->smarty->view('question_show.tpl', $this->assign_arr);
    }

}

/* End of file question_show.php */
/* Location: ./application/controllers/question_show.php */