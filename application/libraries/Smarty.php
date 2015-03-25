<?php
/**
 * Smarty整合CI
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/3/25 0025
 * Time: 22:30
 */
require_once(APPPATH . 'third_party/smarty/libs/Smarty.class.php');

class CI_Smarty extends Smarty
{
    function CI_Smarty()
    {
        parent::Smarty();
        $this->compile_dir = APPPATH . "cache/templates_c";
        $this->template_dir = APPPATH . "views/templates";
        $this->assign('APPPATH', APPPATH);
        $this->assign('BASEPATH', BASEPATH);

    }

    function __construct()
    {
        parent::__construct();
        $this->compile_dir = APPPATH . "cache/templates_c";
        $this->template_dir = APPPATH . "views/templates";
        $this->assign('APPPATH', APPPATH);
        $this->assign('BASEPATH', BASEPATH);
        // Assign CodeIgniter object by reference to CI
        if (method_exists($this, 'assignByRef')) {
            $ci =& get_instance();
            $this->assignByRef("ci", $ci);
        }
    }

    function view($template, $data = array(), $return = FALSE)
    {
        foreach ($data as $key => $val) {
            $this->assign($key, $val);
        }
        if ($return == FALSE) {
            $CI =& get_instance();
            if (method_exists($CI->output, 'set_output')) {
                $CI->output->set_output($this->fetch($template));
            } else {
                $CI->output->final_output = $this->fetch($template);
            }
            return;
        } else {
            return $this->fetch($template);
        }
    }
}