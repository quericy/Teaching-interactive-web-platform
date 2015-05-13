<?php

/**
 * 编辑课件控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/11 0011
 * Time: 16:33
 */
class Course_edit extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->load->model('data', 'data_cls');
        $this->assign_arr['controller_name'] = $this->router->class;
        $this->assign_arr['web_title'] = '编辑课件';
        $this->assign_arr['nav_show'] = 'data';
    }

    public function index($did = 0)
    {
        $did = intval($did);
        if (empty($did)) {
            //添加新课件
            $this->assign_arr['web_title'] = '添加课件';
            $this->assign_arr['is_edit'] = '0';

        } else {
            //修改课件
            $this->assign_arr['is_edit'] = '1';
            $data_info = $this->data_cls->get_one_data('*', array('did' => '' . $did));
            if (empty($data_info)) {//没有此did的记录,作为添加新课件处理
                $this->assign_arr['web_title'] = '添加课件';
                $this->assign_arr['is_edit'] = '0';
            } else {
                $this->assign_arr['data_info'] = $data_info;
            }
        }
        //页面展示
        $this->smarty->view('admin/course_edit.tpl', $this->assign_arr);
    }

    public function save_course()
    {
        $did = intval($this->input->post('did', true));
        $title = $this->input->post('title', true);
        if(empty($title)){
            echo -2;
            return;
        }
        $data_type = $this->input->post('data_type', true);
        $content_area = $this->input->post('content_area', false);//不使用CI框架自带过滤器
        //白名单过滤富文本内容
        $this->load->library('xsshtml', array('html' => $content_area));
        $content_area = $this->xsshtml->getHtml();
        $save_arr = array(
            'title' => $title,
            'type' => $data_type == '1' ? '1' : '2',
            'content' => $content_area
        );
        if (empty($did)) {//新增记录
            $this->log->add_log('新增课件(课件标题:' . $title . ')', $this->assign_arr['web_title']);
            $this->data_cls->add_one_data($save_arr);
        } else {//更新记录
            $this->log->add_log('修改课件(课件id:' . $did . ')', $this->assign_arr['web_title']);
            $this->data_cls->update_one_data($did, $save_arr);
        }
        echo 1;
    }
}

/* End of file course_edit.php */
/* Location: ./application/controllers/admin/course_edit.php */