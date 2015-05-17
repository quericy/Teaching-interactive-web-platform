<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 自定义公共类
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/17 0017
 * Time: 15:07
 */

class Common_Cls
{
    /**
     * 统一输出json数据
     * @param $status 状态码
     * @param string $msg 消息
     * @param array $data 附加数据
     * @return string
     */
    public function json_output($status,$msg='',$data='')
    {
        $return_arr=array(
            'status'=>''.$status,
            'msg'=>''.$msg,
            'data'=>$data
        );
        return json_encode($return_arr);;
    }

}