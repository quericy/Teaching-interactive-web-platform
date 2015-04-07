<?php
/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/3/25 0025
 * Time: 21:52
 */
class test extends CI_Controller{
    public function lala(){
        var_dump($_SERVER['SERVER_NAME']);
        var_dump($_SERVER['SERVER_NAME']!='teachtest.oschina.mopaas.com');
//        $this->load->database();
//        global $RUNTIME_DOMAIN;
//        echo ' global:' . $RUNTIME_DOMAIN;
//        if (isset($_SERVER['RUNTIME_DOMAIN']) && !empty($_SERVER['RUNTIME_DOMAIN'])) {
//            echo ' $server:' . $_SERVER['RUNTIME_DOMAIN'];
//        }
//
//        $this->smarty->assign('title', '测试Smarty');
//        $this->smarty->assign('base_url',$this->config->item('base_url'));
//        $this->smarty->view('test.tpl');
    }
}