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
    private $CI;

    function __construct()
    {
        $this->CI =& get_instance();
    }

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
     * 生成随机头像identicon
     * @param $str 字符串
     * @param int $size 大小
     * @return string uri
     */
    function get_identicon($str, $size = 64)
    {
        require_once(APPPATH . 'third_party/identicon/autoload.php');
        $identicon = new \Identicon\Identicon();
        $imageDataUri = $identicon->getImageDataUri($str, $size);
        return $imageDataUri;
    }

    /**
     * 后台数字签名生成函数
     * @param $user_info 教师必要信息(id,用户名,类型,状态,登录ip)
     * @return string 加密后的token
     */
    function get_admin_token($check_info)
    {
        $str = $this->get_admin_token_str($check_info);
        $this->CI->load->library('encrypt');
        return urlencode($this->CI->encrypt->encode($str));//token进行Unicode转码
    }

    /**
     * 后台数字签名信息构造
     * @param $check_info 验证信息
     * @return string 构造token
     */
    protected function get_admin_token_str($check_info)
    {
        return $str = md5($check_info['id'] . $check_info['user_name'] . $check_info['type'] . $check_info['status'] . $check_info['login_ip']);
    }


    /**前台数字签名生成函数
     * @param $check_info 用户必要信息(id,用户名,类型,状态,登录ip)
     * @return string 加密后的token
     */
    function get_user_token($check_info)
    {
        $str = $this->get_user_token_str($check_info);
        $this->CI->load->library('encrypt');
        return urlencode($this->CI->encrypt->encode($str));//token进行Unicode转码
    }

    /**
     * 前台数字签名信息构造
     * @param $check_info 验证信息
     * @return string 构造token
     */
    protected function get_user_token_str($check_info)
    {
        return $str = md5($check_info['id'] . $check_info['user_name'] . $check_info['type'] . $check_info['status'] . $check_info['login_ip']);
    }

    /**
     * 登录检测
     * @param bool $is_admin 是否是后台登录校验
     * @return bool 是否登录
     */
    public function is_login($is_admin = true)
    {
        $token = urldecode($this->CI->input->cookie('token', false));//unicode解码
        $this->CI->load->library('encrypt');
        $token = $this->CI->encrypt->decode($token);
        if (empty($token)) {
            return false;
        }
        $check_info['id'] = $this->CI->input->cookie('id', TRUE);
        $check_info['user_name'] = $this->CI->input->cookie('user_name', TRUE);
        $check_info['type'] = $this->CI->input->cookie('type', TRUE);
        if ($is_admin == true) {
            if ($check_info['type'] != '1' && $check_info['type'] != '2') return false;
        }
        $check_info['status'] = $this->CI->input->cookie('status', TRUE);
        $check_info['login_ip'] = $this->CI->input->cookie('login_ip', TRUE);
        if ($check_info['type'] == '1' || $check_info['type'] == '2') {//教师
            return $this->get_admin_token_str($check_info) === $token;
        } else {//学生
            return $this->get_user_token_str($check_info) === $token;
        }
    }

    /**
     * 登录检测并提示或跳转
     * @param bool $show_tips 是否显示未登录提示
     * @param bool $is_admin 是否是后台页面
     * @param bool $need_navigate 是否需要跳转
     */
    public function is_login_alert($show_tips = true, $is_admin = true, $need_navigate = true)
    {
        if (!$this->is_login($is_admin)) {
            $this->login_out();
            // ajax 请求的处理方式
            if (isset($_SERVER["HTTP_X_REQUESTED_WITH"]) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == "xmlhttprequest") {
                echo $this->json_output('-99', '您未登录或已掉线!');
            } else {// 正常请求的处理方式
                if ($need_navigate == true) {//需要跳转
                    $jump_url = $is_admin == true ? _admin_domain . 'login' : _site_domain . 'user_login';
                    if ($show_tips == true) {//显示提示再跳转
                        echo '<script>alert("您未登录或已掉线!");location.href=\'' . $jump_url . '\'</script>';
                    } else {
                        header('location:' . $jump_url);
                    }
                }
            };
            exit;
        }
    }


    /**
     * 已登录用户展示
     * @return mixed 待注册的登录信息数组
     */
    public function show_user_info()
    {
        $is_login = $this->is_login(false);
        $assign_arr=array();
        $assign_arr['is_login'] = $is_login;
        if ($is_login == true) {
            $assign_arr['user_name'] = $this->CI->input->cookie('user_name', TRUE);
            $assign_arr['user_type'] = $this->CI->input->cookie('type', TRUE);
            $assign_arr['user_logo_uri'] = $this->get_identicon($assign_arr['user_name'],48);//随机头像
        }
        return $assign_arr;
    }

    /**
     * 登出函数
     * @param string $auto_navigate 自动跳转页面
     */
    public function login_out($auto_navigate = '')
    {
        $expire_time = time() - 3600;
        setcookie('id', '', $expire_time, '/');
        setcookie('user_name', '', $expire_time, '/');
        setcookie('type', '', $expire_time, '/');
        setcookie('status', '', $expire_time, '/');
        setcookie('login_ip', '', $expire_time, '/');
        setcookie('token', '', $expire_time, '/');
        setcookie('login_time', '', $expire_time, '/');
        setcookie('last_login_time', '', $expire_time, '/');
        if (!empty($auto_navigate)) {
            header('location:' . $auto_navigate);
            exit;
        }
    }
}