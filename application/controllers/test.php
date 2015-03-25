<?php
/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/3/25 0025
 * Time: 21:52
 */
class test extends CI_Controller{
    public function lala(){
        $this->load->database();
 
        $this->smarty->assign('title','测试Smarty');
        $this->smarty->assign('base_url',$this->config->item('base_url'));
        $this->smarty->view('test.tpl');
    }
}