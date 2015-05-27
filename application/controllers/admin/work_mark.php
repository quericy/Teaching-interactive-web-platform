<?php
/**
 * 作业批改控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/27 0027
 * Time: 17:04
 */

class Work_Mark extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->common_cls->is_login_alert();
        $this->load->model('work_process', 'work_process_cls');
        $this->assign_arr['controller_name'] = $this->router->class;
        $this->assign_arr['web_title'] = '批改作业';
        $this->assign_arr['nav_show'] = 'work';
    }

    public function index($page = 1,$wid=0)
    {
        $wid=intval($wid);
        $per_page = 10;//每页10条数据
        //获取单条作业题目信息:
        $this->load->model('work', 'work_cls');
        $work_article_arr=$this->work_cls->get_one_work('*',array('wid'=>$wid));
        if(empty($work_article_arr)){
            echo '<script>alert("该作业不存在或已被删除!");location.href=\'' .  _admin_domain . 'work_list\'</script>';
            return;
        }
        $this->assign_arr['work_title'] =$work_article_arr['title'];
        //获取该作业对应的所有完成记录列表
        $work_list = $this->work_process_cls->get_work_process_list($wid, $page, $per_page);
        $this->assign_arr['work_info_list'] = $work_list;
        //分页
        $this->load->library('page_cls');
        $this->assign_arr['page_string'] = $this->page_cls->get_page_config($this, $this->work_process_cls->get_work_process_counts(array('wid'=>$wid)), true, $per_page,'','/'.$wid,'',base_url() . '/admin/' . $this->uri->segment(2) . '/index/1/'.$wid);
        //页面展示
        $this->smarty->view('admin/work_mark.tpl', $this->assign_arr);
    }

    public function mark($id)
    {
        $id=intval($id);
        $score= $this->input->post('score', true);
        if (!preg_match('/^[0-9]+([.]{1}[0-9]{1,2})?$/', $score)) {
            echo $this->common_cls->json_output('-1', '分数必须是整数或者小数');
            return;
        }
        $update_arr=array(
            'score'=>$score,
            'status'=>'2',
            'score_time'=>time()
        );
        $this->work_process_cls->update_one($id,$update_arr);
        echo $this->common_cls->json_output('1', '作业批阅成功');
    }


}

/* End of file work_mark.php */
/* Location: ./application/controllers/admin/work_mark.php */