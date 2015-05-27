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
        $this->assign_arr['nav_show'] = 'work';
        $this->assign_arr['user_info'] = $this->common_cls->show_user_info();//登录信息展示
    }

    public function index($wid)
    {
        $wid = intval($wid);
        //获取作业列表
        $this->assign_arr['work_arr'] = $this->work_cls->get_one_work('*', array('wid' => $wid));
        //获取最新作业
        $this->assign_arr['recent_work_list'] = $this->work_cls->get_recent_list();
        //获取用户完成该作业情况
        if($this->assign_arr['user_info']['is_login']=='true'){
            $user_process_arr=$this->work_process_cls->get_one_user_process($wid,$this->assign_arr['user_info']['id']);
            if(!empty($user_process_arr)){//存在完成记录
                $this->assign_arr['user_process_arr']=$user_process_arr;
            }
        }
        //页面展示
        $this->smarty->view('work_show.tpl', $this->assign_arr);
    }
    public function upload_work()
    {
        //登录校验
        if(!$this->common_cls->is_login(false)){
            echo $this->common_cls->json_output('-99', '您未登录或已掉线!');
            return;
        }
        if($this->input->cookie('type', TRUE)=='1'||$this->input->cookie('type', TRUE)=='2'){
            echo $this->common_cls->json_output('-1', '教师无需提交作业!');
            return;
        }
        $wid = intval($this->input->post('wid', true));
        $id = intval($this->input->cookie('id', TRUE));
        //echo  'wid:'.$wid.'||id:'.$id;
        echo $this->common_cls->json_output('1', '作业上传成功');
    }
}

/* End of file work_show.php */
/* Location: ./application/controllers/work_show.php */