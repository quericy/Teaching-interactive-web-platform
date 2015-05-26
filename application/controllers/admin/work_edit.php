<?php

/**
 * 后台作业编辑控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/26 0026
 * Time: 15:51
 */
class Work_Edit extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->common_cls->is_login_alert();
        $this->load->model('work', 'work_cls');
        $this->assign_arr['controller_name'] = $this->router->class;
        $this->assign_arr['web_title'] = '编辑作业';
        $this->assign_arr['nav_show'] = 'work';
    }

    public function index($wid = 0)
    {
        $wid = intval($wid);
        if (empty($wid)) {
            //添加新作业
            $this->assign_arr['web_title'] = '布置作业';
            $this->assign_arr['is_edit'] = '0';

        } else {
            //修改作业
            $this->assign_arr['is_edit'] = '1';
            $work_info = $this->work_cls->get_one_work('*', array('wid' => '' . $wid));
            if (empty($work_info)) {//没有此wid的记录,作为添加新作业处理
                $this->assign_arr['web_title'] = '添加作业';
                $this->assign_arr['is_edit'] = '0';
            } else {
                $this->assign_arr['work_info'] = $work_info;
            }
            $start_time=$this->assign_arr['work_info']['start_time'];
            if(empty($start_time))$start_time=time();
            $this->assign_arr['work_info']['start_time']=date('Y-m-d H:i',$start_time);
        }


        //页面展示
        $this->smarty->view('admin/work_edit.tpl', $this->assign_arr);
    }

    public function save_work()
    {
        $wid = intval($this->input->post('wid', true));
        $title = $this->input->post('title', true);
        if (empty($title)) {
            echo $this->common_cls->json_output('-1', '请输入作业名称!');
            return;
        }
        $start_time = $this->input->post('start_time', true);
        $end_time = $this->input->post('end_time', true);
        if (!is_numeric($start_time) || !is_numeric($end_time)) {
            echo $this->common_cls->json_output('-1', '请选择作业的起止时间!');
            return;
        }
        if ($start_time>$end_time) {
            echo $this->common_cls->json_output('-1', '开始时间不能晚于结束时间!');
            return;
        }
        $content_area = $this->input->post('content_area', false);//不使用CI框架自带过滤器
        //白名单过滤富文本内容
        $this->load->library('xsshtml', array('html' => $content_area));
        $content_area = $this->xsshtml->getHtml();
        $save_arr = array(
            'title' => $title,
            'content' => $content_area,
            'start_time' => $start_time,
            'end_time' => $end_time
        );
        if (empty($wid)) {//新增记录
            $this->log->add_log('新增作业(作业标题:' . $title . ')', $this->assign_arr['web_title']);
            $this->work_cls->add_one_work($save_arr);
            echo $this->common_cls->json_output('1', '添加新作业<label>' . $title . '</label>成功!');
        } else {//更新记录
            $this->log->add_log('修改作业(作业id:' . $wid . ')', $this->assign_arr['web_title']);
            $this->work_cls->update_one_work($wid, $save_arr);
            echo $this->common_cls->json_output('1', '作业<label>' . $title . '</label>内容修改成功!');
        }
    }
}

/* End of file work_edit.php */
/* Location: ./application/controllers/admin/work_edit.php */