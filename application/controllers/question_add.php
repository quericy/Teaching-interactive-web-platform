<?php

/**
 * 提交问题页面控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/25 0025
 * Time: 22:45
 */
class Question_Add extends CI_Controller
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
        $this->common_cls->is_login_alert(true, false);//登录校验,本页需要登录才能显示
    }

    public function index()
    {
        //获取最热提问
        $this->assign_arr['recent_question_list'] = $this->question_cls->get_host_list();
        //页面展示
        $this->smarty->view('question_add.tpl', $this->assign_arr);
    }

    public function submit_question()
    {
        $question_title = $this->input->post('question_title', true);
        $question_content = $this->input->post('question_content', true);
        if(empty($question_title)||empty($question_content)){
            echo $this->common_cls->json_output('-1', '提交问题的信息不完整');
            return;
        }
        $user_type=$this->input->cookie('type', TRUE);
        if($user_type=='1'||$user_type=='2'){
            echo $this->common_cls->json_output('-1', '只有学生可以提交答疑问题');
            return;
        }
        $qid=$this->question_cls->add_question($question_title,$question_content);
        echo $this->common_cls->json_output('1', '提交问题成功!<a href="'._site_domain.'question_show/index/'.$qid.'">点击此处查看</a>');

    }

}

/* End of file question_add.php */
/* Location: ./application/controllers/question_add.php */