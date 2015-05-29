<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

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
        $this->common_cls->is_login_alert(false);
    }

    public function index()
    {
        $this->smarty->assign('count_cache', $this->cache_cls->get_count_statistics());//获取系统统计数据缓存
        $this->smarty->assign('web_title', '仪表板');
        $this->smarty->assign('nav_show', 'dashboard');
        $this->smarty->view('admin/index.tpl');
    }

}

/* End of file default_controller.php */
/* Location: ./application/controllers/admin/default_controller.php */
