<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 后台默认控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/3/26 0026
 * Time: 22:33
 */
class Default_controller extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $this->smarty->assign('base_url',$this->config->item('base_url'));
        $this->smarty->view('admin/index.tpl');
    }

}

/* End of file default_controller.php */
/* Location: ./application/controllers/admin/default_controller.php */
