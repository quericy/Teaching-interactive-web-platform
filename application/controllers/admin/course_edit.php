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
        $did=intval($did);
        if(empty($did)){
            //添加新课件
            $this->assign_arr['web_title'] = '添加课件';
            $this->assign_arr['is_edit'] = '0';


        }else{
            //修改课件
            $this->assign_arr['is_edit'] = '1';

        }

        //页面展示
        $this->smarty->view('admin/course_edit.tpl', $this->assign_arr);
    }
}

/* End of file course_edit.php */
/* Location: ./application/controllers/admin/course_edit.php */