<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 前台默认控制器
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
        echo 'HomePage';
    }

}

/* End of file default_controller.php */
/* Location: ./application/controllers/default_controller.php */