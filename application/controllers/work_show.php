<?php

/**
 * 前台作业展示控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/26 0026
 * Time: 23:48
 */
class work_show extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->assign_arr['controller_name'] = $this->router->class;
        //系统设置缓存
        $sys_setting = $this->cache_cls->get_sys_cache();
        $this->assign_arr['web_title'] = '作业' . ' - ' . $sys_setting['web_name'];//站点名称
        //作业模型
        $this->load->model('work', 'work_cls');
        $this->load->model('work_process', 'work_process_cls');
        $this->load->model('file', 'file_cls');
        $this->assign_arr['nav_show'] = 'work';
        $this->assign_arr['user_info'] = $this->common_cls->show_user_info();//登录信息展示
    }

    public function index($wid = 1)
    {
        $wid = intval($wid);
        $this->assign_arr['wid'] = $wid;
        //获取作业列表
        $this->assign_arr['work_arr'] = $this->work_cls->get_one_work('*', array('wid' => $wid));
        if (empty($this->assign_arr['work_arr'])) {
            header('location:' . _site_domain . 'work_list');
            return;
        }
        //获取最新作业
        $this->assign_arr['recent_work_list'] = $this->work_cls->get_recent_list();
        //获取用户完成该作业情况
        if ($this->assign_arr['user_info']['is_login'] == 'true') {
            $user_process_arr = $this->work_process_cls->get_one_user_process($wid, $this->assign_arr['user_info']['id']);
            if (!empty($user_process_arr)) {//存在完成记录
                $this->assign_arr['user_process_arr'] = $user_process_arr;
            }
            //获得该用户的所有附件信息
            $this->assign_arr['user_file_arr'] = $this->file_cls->get_work_file_list($wid, $this->assign_arr['user_info']['id']);
        }

        $this->smarty->view('work_show.tpl', $this->assign_arr);
    }

    public function upload_work()
    {
        //登录校验
        if (!$this->common_cls->is_login(false)) {
            echo $this->common_cls->json_output('-99', '您未登录或已掉线!');
            return;
        }
        if ($this->input->cookie('type', TRUE) == '1' || $this->input->cookie('type', TRUE) == '2') {
            echo $this->common_cls->json_output('-1', '教师无需提交作业!');
            return;
        }
        $wid = intval($this->input->post('wid', true));
        $id = intval($this->input->cookie('id', TRUE));
        if (empty($wid) || empty($id)) {
            echo $this->common_cls->json_output('-1', '用户信息出错,无法上传!');
            return;
        }
        //获取作业列表
        $work_arr = $this->work_cls->get_one_work('*', array('wid' => $wid));
        if (empty($work_arr) || ((int)$work_arr['end_time']) < time()) {
            echo $this->common_cls->json_output('-1', '作业已到截止日期,无法再提交!');
            return;
        }

        $dir_name = './upload_files/work_file/' . $wid . '/' . $id;
        //创建目录
        if (!file_exists($dir_name) && !mkdir($dir_name, 0777, true)) {
            echo $this->common_cls->json_output('-1', '权限不足,无法上传!');
            return;
        } else if (!is_writeable($dir_name)) {
            echo $this->common_cls->json_output('-1', '权限不足,无法上传!');
            return;
        }
        $config['upload_path'] = $dir_name;
        $config['allowed_types'] = 'gif|jpg|jpeg|bmp|png|doc|docx|ppt|pptx|xls|txt';
        $config['max_size'] = 1024 * 8;
        $config['encrypt_name'] = FALSE;
        $config['overwrite'] = TRUE;
        $this->load->library('upload', $config);
        if (!isset($_FILES['file']['name'])) {//解决文件名中文乱码问题
            echo $this->common_cls->json_output('-1', '请选择要上传的文件!');
            return;
        }
        //解决文件名中文乱码问题
        $file_name = $this->security->xss_clean($_FILES['file']['name']);//获得安全的文件名
        $encode = mb_detect_encoding($_FILES['file']['name'], "UTF-8,GBK,GB2312,ASCII,CP936");
        $_FILES['file']['name'] = @iconv($encode, _site_file_charset . "//IGNORE", $_FILES['file']['name']);//转码


        if (!$this->upload->do_upload('file')) {
            $test=$this->upload->data();

            echo $this->common_cls->json_output('-1',implode('~',$test));
            return;
        } else {
            $data = $this->upload->data();
            //更新作业进程信息
            $this->work_process_cls->change_one_user_process($wid);
            //添加附件记录
            $this->file_cls->add_one($wid, $id, $file_name, $data['file_size']);

        }
        echo $this->common_cls->json_output('1', '作业上传成功');
    }
}

/* End of file work_show.php */
/* Location: ./application/controllers/work_show.php */