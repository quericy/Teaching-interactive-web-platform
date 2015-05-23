<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 验证码生成类
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/23 0023
 * Time: 22:18
 */
class Varify_Code
{
    private $CI;
    private $width;
    private $height;
    private $code_num;

    public function __construct($width = 80, $height = 28, $code_num = 4)
    {
        $this->CI =& get_instance();
        $this->width = $width;
        $this->height = $height;
        $this->code_num = $code_num;
    }

    public function get_image($session_key = 'captcha')
    {
       // header("Content-type:image/png");
        session_start();
        /*
        * 初始化
        */
        $border = 0; //是否要边框 1要:0不要
        $how = $this->code_num ; //验证码位数
        $w = $this->width; //图片宽度
        $h =  $this->height; //图片高度
        $fontsize = 20; //字体大小
        $alpha = "ABCDEFGHJKLMNPQRSTUVWXYZ"; //验证码内容1:字母
        $number = "23456789"; //验证码内容2:数字
        $randcode = ""; //验证码字符串初始化
        $font_url = 'fonts/simhei.ttf';
        srand((double)microtime() * 1000000); //初始化随机数种子

        $im = ImageCreate($w, $h); //创建验证图片
        /*
        * 绘制基本框架
        */
        $bgcolor = ImageColorAllocate($im, 255, 255, 255); //设置背景颜色

        ImageFill($im, 0, 0, $bgcolor); //填充背景色

        if ($border) {
            $black = ImageColorAllocate($im, 0, 0, 0); //设置边框颜色
            ImageRectangle($im, 0, 0, $w - 1, $h - 1, $black);//绘制边框
        }
        /*
        * 逐位产生随机字符
        */
        for ($i = 0; $i < $how; $i++) {
            $alpha_or_number = mt_rand(0, 1); //字母还是数字
            $str = $alpha_or_number ? $alpha : $number;
            $which = mt_rand(0, strlen($str) - 1); //取哪个字符
            $code = substr($str, $which, 1); //取字符
            $j = !$i ? 15 : $j + 12; //绘字符位置
            $color3 = ImageColorAllocate($im, mt_rand(0, 100), mt_rand(0, 100), mt_rand(0, 100)); //字符随即颜色
            #ImageChar($im, $fontsize, $j, 6, $code, $color3); //绘字符
            //旋转角度随机数
            $angel_rand_1=mt_rand(-15,-10);
            $angel_rand_2=mt_rand(10,15);
            $angel_rand_change=mt_rand(0,1);
            $angel_rand=$angel_rand_change==1?$angel_rand_1:$angel_rand_2;

            ImageTTFText($im, $fontsize,$angel_rand, $j, 25, $color3, $font_url, $code);
            $randcode .= $code; //逐位加入验证码字符串
        }
        /*
        * 添加干扰
        */
        for ($i = 0; $i < 5; $i++)//绘背景干扰线
        {
            $color1 = ImageColorAllocate($im, mt_rand(0, 255), mt_rand(0, 255), mt_rand(0, 255)); //干扰线颜色
            ImageArc($im, mt_rand(-5, $w), mt_rand(-5, $h), mt_rand(20, 300), mt_rand(20, 200), 55, 44, $color1); //干扰线
        }
        for ($i = 0; $i < $how * 40; $i++)//绘背景干扰点
        {
            $color2 = ImageColorAllocate($im, mt_rand(0, 255), mt_rand(0, 255), mt_rand(0, 255)); //干扰点颜色
            ImageSetPixel($im, mt_rand(0, $w), mt_rand(0, $h), $color2); //干扰点
        }

//把验证码字符串写入session
        $_SESSION[$session_key] = $randcode ;
        /*绘图结束*/
        Imagegif($im);
        ImageDestroy($im);
        /*绘图结束*/

    }

}