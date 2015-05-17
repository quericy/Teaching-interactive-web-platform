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
    public function json_output($status, $msg = '', $data = '')
    {
        $return_arr = array(
            'status' => '' . $status,
            'msg' => '' . $msg,
            'data' => $data
        );
        return json_encode($return_arr);;
    }

    /**
     * 后台数字签名生成函数
     * @param $user_info 用户必要信息(id,用户名,类型,状态,登录ip)
     * @return string 加密后的token
     */
    function get_admin_token($check_info)
    {
        $CI =& get_instance();
        $str = $this->get_admin_token_str($check_info);
        $CI->load->library('encrypt');
        return urlencode($CI->encrypt->encode($str));//token进行Unicode转码
    }

    /**
     * 后台数字签名信息构造
     * @param $check_info
     * @return string
     */
    protected function get_admin_token_str($check_info)
    {
        return $str = md5($check_info['id'] . $check_info['user_name'] . $check_info['type'] . $check_info['status'] . $check_info['login_ip']);
    }

    /**
     * 登录检测
     * @return bool 是否登录
     */
    public function is_login()
    {
        $CI =& get_instance();
        $token = urldecode($CI->input->cookie('token', false));//unicode解码
        $CI->load->library('encrypt');
        $token = $CI->encrypt->decode($token);
        if(empty($token)){
            return false;
        }
        $check_info['id'] = $CI->input->cookie('id', TRUE);
        $check_info['user_name'] = $CI->input->cookie('user_name', TRUE);
        $check_info['type'] = $CI->input->cookie('type', TRUE);
        $check_info['status'] = $CI->input->cookie('status', TRUE);
        $check_info['login_ip'] = $CI->input->cookie('login_ip', TRUE);
        if($check_info['type']=='1'||$check_info['type']=='2' ){//教师
            return $this->get_admin_token_str($check_info) === $token;
        }else{//学生
            return false;
        }
    }

    /**
     * 登录检测函数,未通过弹窗提示且跳转
     * @param bool $show_json_tips 是否只显示json的未登录提示(适用于ajax)
     */
    public function is_login_alert($show_json_tips=false)
    {
        if(!$this->is_login()){
            $this->login_out();
            if($show_json_tips==true){
                $this->json_output('-99','您未登录或已掉线!');
            }else{
                echo '<script>alert("您未登录或已掉线!");location.href=\''._admin_domain.'login\'</script>';
            }
            exit;
        }
    }

    /**
     * 登出函数
     * @param string $auto_navigate 自动跳转页面
     */
    public function login_out($auto_navigate='')
    {
        $expire_time=time()- 3600;
        setcookie('id', '', $expire_time, '/');
        setcookie('user_name', '', $expire_time, '/');
        setcookie('type', '', $expire_time, '/');
        setcookie('status', '', $expire_time, '/');
        setcookie('login_ip', '', $expire_time, '/');
        setcookie('token', '', $expire_time, '/');
        setcookie('login_time', '', $expire_time, '/');
        setcookie('last_login_time', '', $expire_time, '/');
        if(!empty($auto_navigate)){
            header('location:' . $auto_navigate);
            exit;
        }
    }
}