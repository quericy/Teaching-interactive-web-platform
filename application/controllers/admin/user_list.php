<?php
/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/4/23 0023
 * Time: 23:09
 */

class User_list extends CI_Controller
{

    public function index($page=1)
    {

        $assign_arr['web_title'] = '教师管理';
        $assign_arr['nav_show'] = 'system';
        $this->smarty->view('admin/user_list.tpl', $assign_arr);
    }

}