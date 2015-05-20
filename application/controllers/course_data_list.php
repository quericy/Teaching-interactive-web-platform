<?php

/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/20 0020
 * Time: 15:04
 */
class Course_Data_List extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->assign_arr['controller_name'] = $this->router->class;
        //缓存
        $this->load->driver('cache', array('adapter' => 'apc', 'backup' => 'file'));
        if (!$foo = $this->cache->get('foo')) {

            $foo = 'foobarbaz!';


            $this->cache->save('foo', $foo, 3000);
        }
        $this->assign_arr['web_title'] = '教学互动平台';
    }

    public function index()
    {
        //页面展示
        $this->smarty->view('index.tpl', $this->assign_arr);
    }

}

/* End of file course_data_list.php */
/* Location: ./application/controllers/course_data_list.php */