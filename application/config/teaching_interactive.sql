-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 06 月 28 日 14:00
-- 服务器版本: 5.5.40
-- PHP 版本: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `teaching_interactive`
--

-- --------------------------------------------------------

--
-- 表的结构 `table_admin`
--

CREATE TABLE IF NOT EXISTS `table_admin` (
  `tid` int(12) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `user_pwd` varchar(50) NOT NULL COMMENT '密码',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `login_time` int(12) DEFAULT NULL COMMENT '最后登录时间',
  `login_ip` varchar(15) DEFAULT NULL COMMENT '最后登录ip',
  PRIMARY KEY (`tid`),
  KEY `type` (`type`,`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='教师管理员表' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `table_admin`
--

INSERT INTO `table_admin` (`tid`, `user_name`, `user_pwd`, `email`, `type`, `status`, `login_time`, `login_ip`) VALUES
(1, 'admin', '90380d4a6bc478aa41dbec8b7597b335', NULL, 2, 1, 1434462342, '127.0.0.1'),
(2, 'test', 'd005409d62f56daf35d332d05087f247', NULL, 1, 1, 1433481348, '127.0.0.1'),
(3, '教师2', 'bbb', NULL, 1, 1, NULL, NULL),
(4, '教师3', 'bbb', NULL, 1, 0, NULL, NULL),
(5, '教师4', 'bbb', NULL, 1, 0, NULL, NULL),
(6, '教师5', 'bbb', NULL, 1, 0, NULL, NULL),
(7, '教师6', 'bbb', NULL, 1, 1, NULL, NULL),
(8, '教师7', 'bbb', NULL, 1, 0, NULL, NULL),
(9, '教师8', 'bbb', NULL, 2, 0, NULL, NULL),
(10, '教师9', 'bbb', NULL, 1, 0, NULL, NULL),
(11, '教师10', 'bbb', NULL, 1, 0, NULL, NULL),
(12, '教师X', 'bbb', NULL, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `table_answer`
--

CREATE TABLE IF NOT EXISTS `table_answer` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `qid` int(12) unsigned NOT NULL COMMENT '问题id',
  `tid` int(12) DEFAULT NULL COMMENT '教师id',
  `uid` int(12) DEFAULT NULL COMMENT '学生id',
  `content` mediumtext NOT NULL COMMENT '回答内容',
  `sub_time` int(12) NOT NULL COMMENT '回答时间',
  `UA` varchar(100) NOT NULL COMMENT '代理字符串',
  PRIMARY KEY (`id`),
  KEY `qid` (`qid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='答疑表' AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `table_answer`
--

INSERT INTO `table_answer` (`id`, `qid`, `tid`, `uid`, `content`, `sub_time`, `UA`) VALUES
(1, 1, 1, NULL, '测试回复1', 1432542422, ''),
(2, 1, NULL, 2, '火钳刘明', 1432542423, ''),
(3, 1, NULL, 3, '沙发~沙发~沙发~沙发~沙发~沙发~沙发~沙发~沙发~沙发~沙发~沙发~沙发~沙发~沙发~沙发~沙发~沙发~沙发~沙发~沙发~', 1432542423, ''),
(13, 2, NULL, 3, '啦啦啦~啦啦啦~', 1432564209, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safar'),
(14, 2, NULL, 3, '不错不错~~', 1432564307, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safar'),
(15, 1, NULL, 1, '看来是可以回复了~~~23333', 1432566323, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safar'),
(16, 1, NULL, 1, 'fasdfasdfasdf', 1432568755, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safar'),
(17, 2, NULL, 1, 'IE8测试正常~`', 1432618868, 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko'),
(18, 1, NULL, 2, '不错的东西,学习了~~~~', 1432738903, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safar'),
(19, 2, NULL, 2, '每个未来的片段都只是一种可能。它可能会出现，也可能不会出现。当我去观察未来时，有可能看到成千上万个可能的未来。至于哪一种会出现，那是命运的安排，而命运，是超出我能力之上的力量', 1432739023, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safar'),
(20, 2, NULL, 2, '三三连，非三断，求扣盆，斗坐碗，平中缺，米中满，半上虚，未下残', 1432739778, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safar'),
(21, 2, NULL, 1, '撒旦发射的', 1432795404, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safar'),
(22, 11, 1, NULL, '头像是用identicon生成的用户名唯一头像,上传文件限制是80M,限制了文件的MIME类型', 1433172893, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safar'),
(23, 9, NULL, 2, '这都不知道~~~~ ¬_¬', 1433433301, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safar'),
(24, 9, NULL, 5, 'nihao', 1433481674, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safar'),
(25, 9, NULL, 2, '好的', 1433485145, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safar'),
(26, 10, 1, NULL, '这道题的答案是3512', 1433485161, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safar'),
(27, 10, NULL, 2, '为什么我得出的答案好像不一样。。。', 1433662721, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safar');

-- --------------------------------------------------------

--
-- 表的结构 `table_data`
--

CREATE TABLE IF NOT EXISTS `table_data` (
  `did` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(12) unsigned NOT NULL COMMENT '发布教师id',
  `title` varchar(200) NOT NULL COMMENT '课件资料名称',
  `content` mediumtext NOT NULL COMMENT '课件资料内容',
  `type` tinyint(2) NOT NULL COMMENT '类型(1:课件,2:资料)',
  `edit_time` int(12) NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`did`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='课件资料表' AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `table_data`
--

INSERT INTO `table_data` (`did`, `tid`, `title`, `content`, `type`, `edit_time`) VALUES
(1, 1, '测试课件1测试课件1测试课件1测试课件1测试课件1测试课件1测试课件1测试课件1测试课件1', '\n<h3 style="text-align: center;">  <span style="font-family: 微软雅黑, ''Microsoft YaHei'';"> <strong>XX学科第X章</strong></span></h3><p><br></p><pre class="brush:php;toolbar:false"><br></pre><pre class="brush:php;toolbar:false">&lt;?php\necho ''lalallalalallalalallalalallalalallalallaallalal'';</pre><p style="line-height: 16px;"> </p><table><tr class="firstRow"><td width="144" style="word-break: break-all;">编号</td><td width="144" style="word-break: break-all;">姓名</td><td width="144" style="word-break: break-all;">内容</td><td width="144" style="word-break: break-all;">。。。</td><td width="144" style="word-break: break-all;"><br></td><td width="144"><br></td></tr><tr><td width="144" style="word-break: break-all;">Nchu-01</td><td width="144" style="word-break: break-all;">张三</td><td width="144"><br></td><td width="144"><br></td><td width="144"><br></td><td width="144"><br></td></tr><tr><td width="144" style="word-break: break-all;">Nchu-02</td><td width="144" style="word-break: break-all;">李四</td><td width="144"><br></td><td width="144"><br></td><td width="144"><br></td><td width="144"><br></td></tr></table><p style="line-height: 16px;"><strong>加粗字体</strong></p><p style="line-height: 16px;"><em>斜体</em></p><p style="line-height: 16px;"><span style="text-decoration: underline; color: rgb(255, 0, 0);"><em>颜色+下划线</em></span></p><p style="line-height: 16px; text-align: right;">附件下载：</p><p style="line-height: 16px;"><img style="vertical-align: middle; margin-right: 2px;" src="http://ci.me/third_party/ueditor/dialogs/attachment/fileTypeImages/icon_doc.gif"><a style="font-size:12px; color:#0066cc;" href="/upload_files/ueditor/php/upload/file/20150604/1433432884102501.doc" title="1433432884102501.doc" target="_blank">1433432884102501.doc</a></p><p style="line-height: 16px; text-align: right;"><img style="vertical-align: middle; margin-right: 2px;" src="http://ci.me/third_party/ueditor/dialogs/attachment/fileTypeImages/icon_xls.gif"><a style="font-size:12px; color:#0066cc;" href="/upload_files/ueditor/php/upload/file/20150512/1431397445970108.xls" title="1431397445970108.xls" target="_blank">1431397445970108.xls</a></p><p style="line-height: 16px;"><br></p>\n', 1, 1433485012),
(2, 2, '测试资料a', '&lt;script&gt;alert(1)&lt;/script&gt;', 2, 1431329399),
(3, 1, '测试课件2(代码高亮)', '\n<p>测试课<strong>件a测试课件a</strong>\n  测试b</p><pre class="brush:php;toolbar:false">var_dump(a);\necho 111;\nphpinfo(); [removed]alert(1);</pre>_ueditor_page_break_tag_<p><br></p><p><br></p>\n', 1, 1433173209),
(4, 1, '测试课件3(测试多媒体)', '\n<p>\n    <br>测试外链音乐:\n</p>\n<p>\n    <embed src="http://music.163.com/style/swf/widget.swf?sid=29816800&amp;type=2&amp;auto=0&amp;width=320&amp;height=66" width="340" height="86" allowscriptaccess="never"></embed></p>\n<p>\n    <br></p>\n<p>\n    <br></p>\n<p>\n    测试在线视频:\n</p>\n<p>\n    <embed class="edui-faked-video" src="http://player.youku.com/player.php/sid/XMTI1MTk2Mzk4NA==/v.swf?f=25767509&amp;qq-pf-to=pcqq.c2c&amp;ev=2" width="420" height="280" allowscriptaccess="never"></embed></p>\n<p>\n    测试第三方视频直链(html5):\n</p>\n<p>\n    <embed class="edui-faked-video" src="http://quericyblog.qiniudn.com/osu_for_surface.mp4" width="420" height="280" allowscriptaccess="never"  autostart="false"  ></embed></p>\n', 1, 1433210399),
(6, 3, '测试课件5', '测试课件a测试课件a', 1, 1431329299),
(7, 3, '测试课件6', '测试课件a测试课件a', 1, 1431329299),
(8, 3, '测试课件7', '测试课件a测试课件a', 1, 1431329299),
(9, 1, '测试资料b', '\n<p>测试资料b测试资料bc</p>\n', 2, 1431878065),
(10, 2, '测试资料c', '测试资料b测试资料b', 2, 1431329299),
(11, 4, '测试资料d', '测试资料b测试资料b', 2, 1431329299),
(12, 2, '测试课件8', '测试课件测试课件', 1, 1431329299),
(13, 2, '测试课件9', '测试课件测试课件', 1, 1431329299),
(17, 1, '资料 - 本地图片上传展示', '\n<p style="text-align:center"><img src="/upload_files/ueditor/php/upload/image/20150511/1431338873272735.jpg" alt="1431338873272735.jpg" width="448" height="360" style="width: 448px; height: 360px;"></p><p>图片内容</p><p><br></p>\n', 2, 1433472281),
(18, 1, '测试在线表情', '\n<p><br></p><p>alert(1)</p><p><br></p><p>javascript</p><p><img src="http://img.baidu.com/hi/jx2/j_0016.gif"><img src="http://img.baidu.com/hi/jx2/j_0059.gif"><img src="http://img.baidu.com/hi/tsj/t_0008.gif"></p><table><tr class="firstRow"><td width="144"><br></td><td width="144"><br></td><td width="144"><br></td><td width="144"><br></td><td width="144"><br></td><td width="144"><br></td></tr><tr><td width="144"><br></td><td width="144"><br></td><td width="144"><br></td><td width="144"><br></td><td width="144"><br></td><td width="144"><br></td></tr></table><p><br></p>\n', 2, 1433472421),
(19, 2, '测试附件', '\n<p style="text-align: center;">aa</p><p style="text-align: center;"><img src="http://img.baidu.com/hi/jx2/j_0016.gif"></p><p>javascript:alert(1);\n  alert(1)</p><p style="line-height: 16px; text-align: right;"><em><span style="text-decoration: underline;"><strong>附件:</strong></span></em><img style="vertical-align: middle; margin-right: 2px;" src="http://ci.me/third_party/ueditor/dialogs/attachment/fileTypeImages/icon_xls.gif"><a style="font-size:12px; color:#0066cc;" href="/upload_files/ueditor/php/upload/file/20150512/1431397445970108.xls" title="1431397445970108.xls" target="_blank">1431397445970108.xls</a></p><p><br></p><p>''</p>\n', 1, 1432536916),
(21, 5, '测试资料', '\n<p>阿道夫的事<br></p>\n', 2, 1431580735),
(22, 1, '资料 - 嵌入百度地图', '\n<p style="text-align: center;"><strong>bootstrap</strong></p><p>dsffasd<img width="530" height="340" src="http://api.map.baidu.com/staticimage?center=116.404,39.915&amp;zoom=10&amp;width=530&amp;height=340&amp;markers=116.404,39.915"></p>\n', 2, 1433472214);

-- --------------------------------------------------------

--
-- 表的结构 `table_file`
--

CREATE TABLE IF NOT EXISTS `table_file` (
  `fid` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `wid` int(12) unsigned NOT NULL COMMENT '附件所属作业wid',
  `uid` int(12) unsigned NOT NULL COMMENT '提交附件的用户',
  `file_name` varchar(200) NOT NULL COMMENT '附件文件名',
  `uri` int(11) NOT NULL COMMENT '附件路径uri',
  `size` varchar(100) NOT NULL COMMENT '附件大小(KB)',
  `add_time` int(11) NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`fid`),
  KEY `type` (`uid`),
  KEY `wid` (`wid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='作业附件表' AUTO_INCREMENT=43 ;

--
-- 转存表中的数据 `table_file`
--

INSERT INTO `table_file` (`fid`, `wid`, `uid`, `file_name`, `uri`, `size`, `add_time`) VALUES
(5, 4, 1, '上传1.txt', 0, '0.03', 1432713096),
(6, 4, 1, '01.jpg', 0, '865.99', 1432713096),
(7, 4, 1, '02.jpg', 0, '1538.75', 1432714573),
(8, 1, 1, '11.jpg', 0, '1786.04', 1432714817),
(9, 4, 2, '下学期进程表.xls', 0, '446.5', 1432727418),
(10, 1, 2, '上传1.txt', 0, '0.03', 1432731153),
(11, 1, 2, '05.jpg', 0, '1303.37', 1432731407),
(12, 1, 2, '', 0, '0.03', 1432734152),
(13, 1, 2, '', 0, '0.03', 1432734279),
(14, 1, 2, '上传4.txt', 0, '0.03', 1432734335),
(15, 1, 2, '上传5.txt', 0, '0.03', 1432734808),
(16, 1, 2, '上传6.txt', 0, '0.03', 1432735437),
(17, 1, 2, '', 0, '0.03', 1432735646),
(18, 1, 2, '', 0, '0.03', 1432735961),
(19, 1, 2, '', 0, '0.03', 1432736149),
(20, 1, 2, '', 0, '0.03', 1432736266),
(21, 1, 2, '上传9.txt', 0, '0.03', 1432736356),
(22, 1, 1, 'test.xls', 0, '76', 1432795419),
(23, 1, 1, '最新4399班车路线表.xls', 0, '22.5', 1433146837),
(24, 1, 1, '网络工程实践课程设计 - 副本.doc', 0, '390', 1433146864),
(25, 1, 1, 'test.doc', 0, '390', 1433149837),
(26, 1, 1, 'test2.doc', 0, '76', 1433149851),
(27, 1, 1, '', 0, '390', 1433154628),
(28, 1, 1, '', 0, '390', 1433155069),
(29, 1, 1, '网络工程实践课程设计 -_副本.doc', 0, '390', 1433155381),
(30, 1, 4, '无标题.png', 0, '17.24', 1433156488),
(31, 5, 1, 'test.doc', 0, '390', 1433432943),
(32, 5, 1, 'Word.docx', 0, '11.31', 1433432951),
(33, 5, 1, '上传9.txt', 0, '0.03', 1433432951),
(34, 5, 2, 'test3.doc', 0, '349.5', 1433433040),
(35, 1, 2, 'cdf v2 document, corrupt cant expand summary_info.txt', 0, '0.05', 1433473348),
(36, 1, 2, '网络工程系2011级毕业设计课题选题结果.xls', 0, '76', 1433473348),
(37, 1, 5, '上传9.txt', 0, '0.03', 1433481328),
(38, 1, 5, '网络工程实践课程设计 -_副本.doc', 0, '390', 1433481328),
(39, 1, 5, '19.jpg', 0, '639.18', 1433481328),
(40, 5, 2, '上传9.txt', 0, '0.03', 1433485050),
(41, 5, 2, '19.jpg', 0, '639.18', 1433485050),
(42, 5, 2, '网络工程实践课程设计 -_副本.doc', 0, '390', 1433485050);

-- --------------------------------------------------------

--
-- 表的结构 `table_lesson`
--

CREATE TABLE IF NOT EXISTS `table_lesson` (
  `lid` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(12) unsigned NOT NULL COMMENT '教师id',
  `title` varchar(50) NOT NULL COMMENT '课程标题',
  `content` mediumtext NOT NULL COMMENT '课程正文',
  `sub_time` int(12) NOT NULL COMMENT '提交时间',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='课程列表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `table_lesson`
--

INSERT INTO `table_lesson` (`lid`, `tid`, `title`, `content`, `sub_time`) VALUES
(1, 2, '测试课程', '测试课程~~~测试课程~~~测试课程~~~', 1433081337);

-- --------------------------------------------------------

--
-- 表的结构 `table_log`
--

CREATE TABLE IF NOT EXISTS `table_log` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(12) unsigned NOT NULL COMMENT '操作管理员ID',
  `content` varchar(400) NOT NULL COMMENT '日志内容',
  `log_time` int(12) NOT NULL COMMENT '记录时间',
  `type` varchar(200) NOT NULL COMMENT '日志类型',
  PRIMARY KEY (`id`),
  KEY `log_time` (`log_time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='日志表' AUTO_INCREMENT=146 ;

--
-- 转存表中的数据 `table_log`
--

INSERT INTO `table_log` (`id`, `tid`, `content`, `log_time`, `type`) VALUES
(1, 1, '修改教师(教师id:8)状态为:启用', 1431251316, '教师管理'),
(2, 1, '修改教师(教师id:7,8)状态为:禁用', 1431251327, '教师管理'),
(6, 1, '添加教师(教师用户名:测试log)', 1431251504, '教师管理'),
(7, 1, '修改教师(教师id:18)', 1431251524, '教师管理'),
(8, 1, '删除教师(教师id:18)', 1431251542, '教师管理'),
(9, 1, '重置用户(用户id:3)密码', 1431252014, '学生管理'),
(10, 1, '修改用户(用户id:3)状态为:禁用', 1431252027, '学生管理'),
(11, 1, '修改用户(用户id:3)状态为:启用', 1431252031, '学生管理'),
(12, 1, '删除用户(用户id:3)', 1431252047, '学生管理'),
(13, 1, '修改系统设置(站点名称:教学互动平台,记住密码时间:7,默认重置密码:233333,教师权限:允许重置学生密码,不允许查看汇总数据,允许查看日志)', 1431252570, '系统参数'),
(14, 1, '修改教师(教师id:7)状态为:启用', 1431252780, '教师管理'),
(15, 1, '修改系统设置(站点名称:教学互动平台,记住密码时间:7天,默认重置密码:233333,教师权限:允许重置学生密码,不允许查看汇总数据,允许查看日志)', 1431307583, '系统参数'),
(16, 1, '修改系统设置(站点名称:教学互动平台,记住密码时间:7天,默认重置密码:233333,教师权限:允许重置学生密码,允许查看汇总数据,允许查看日志)', 1431307585, '系统参数'),
(17, 1, '重置用户(用户id:2)密码', 1431307935, '学生管理'),
(18, 1, '重置用户(用户id:2)密码', 1431307941, '学生管理'),
(19, 1, '重置用户(用户id:2)密码', 1431308088, '学生管理'),
(20, 1, '删除课件(课件id:16)', 1431332178, '课件管理'),
(21, 1, '删除课件(课件id:21)', 1431409233, '课件管理'),
(22, 1, '修改资料(资料id:9)', 1431580677, '编辑资料'),
(23, 1, '新增资料(资料标题:测试资料)', 1431580710, '编辑资料'),
(24, 1, '修改资料(资料id:21)', 1431580721, '编辑资料'),
(25, 1, '修改课件(课件id:21)', 1431580735, '编辑课件'),
(26, 1, '修改教师(教师id:1)', 1431850016, '教师管理'),
(27, 1, '修改教师(教师id:1)', 1431850152, '教师管理'),
(28, 1, '修改教师(教师id:1)', 1431850194, '教师管理'),
(29, 1, '修改教师(教师id:1)', 1431850426, '教师管理'),
(30, 1, '删除教师(教师id:17)', 1431852929, '教师管理'),
(31, 1, '修改教师(教师id:2)', 1431853282, '教师管理'),
(32, 1, '修改教师(教师id:2)', 1431853301, '教师管理'),
(33, 1, '修改教师(教师id:3)', 1431875655, '教师管理'),
(34, 1, '修改教师(教师id:5)', 1431875693, '教师管理'),
(35, 1, '修改教师(教师id:10)状态为:启用', 1431875719, '教师管理'),
(36, 1, '修改教师(教师id:9,10)状态为:禁用', 1431875724, '教师管理'),
(37, 1, '删除教师(教师id:14)', 1431875734, '教师管理'),
(38, 1, '重置用户(用户id:2)密码', 1431876483, '学生管理'),
(39, 1, '修改用户(用户id:2)状态为:禁用', 1431876488, '学生管理'),
(40, 1, '修改用户(用户id:2)状态为:启用', 1431876494, '学生管理'),
(41, 1, '重置用户(用户id:2)密码', 1431876645, '学生管理'),
(42, 1, '修改教师(教师id:10)', 1431876725, '教师管理'),
(43, 1, '修改课件(课件id:1)', 1431877251, '编辑课件'),
(44, 1, '修改课件(课件id:1)', 1431877365, '编辑课件'),
(45, 1, '修改课件(课件id:1)', 1431877434, '编辑课件'),
(46, 1, '删除课件(课件id:20)', 1431877618, '课件管理'),
(47, 1, '修改资料(资料id:9)', 1431877970, '编辑资料'),
(48, 1, '修改资料(资料id:9)', 1431877972, '编辑资料'),
(49, 1, '修改资料(资料id:9)', 1431878033, '编辑资料'),
(50, 1, '修改资料(资料id:9)', 1431878065, '编辑资料'),
(51, 1, '修改系统设置(站点名称:教学互动平台,记住密码时间:7天,默认重置密码:233333,教师权限:允许重置学生密码,允许查看汇总数据,允许查看日志)', 1431878814, '系统参数'),
(52, 1, '修改系统设置(站点名称:教学互动平台,记住密码时间:1天,默认重置密码: ,教师权限:允许重置学生密码,允许查看汇总数据,允许查看日志)', 1431878839, '系统参数'),
(53, 1, '修改系统设置(站点名称:教学互动平台,记住密码时间:1天,默认重置密码:123456,教师权限:允许重置学生密码,允许查看汇总数据,允许查看日志)', 1431878887, '系统参数'),
(54, 1, '删除问题(问题id:2)', 1431932762, '提问管理'),
(55, 1, '删除问题(问题id:2)', 1431932769, '提问管理'),
(56, 1, '删除问题(问题id:2)', 1431932790, '提问管理'),
(57, 1, '修改问题(问题id:1)状态为:关闭', 1431933030, '提问管理'),
(58, 1, '修改问题(问题id:1)状态为:开启', 1431933037, '提问管理'),
(59, 1, '修改教师(教师id:2)状态为:启用', 1431934561, '教师管理'),
(60, 1, '修改系统设置(站点名称:教学互动平台,记住密码时间:1天,默认重置密码:123456,教师权限:允许重置学生密码,允许查看汇总数据,允许查看日志)', 1432112079, '系统参数'),
(61, 1, '修改系统设置(站点名称:教学互动平台1,记住密码时间:1天,默认重置密码:123456,教师权限:允许重置学生密码,允许查看汇总数据,允许查看日志)', 1432112090, '系统参数'),
(62, 1, '修改系统设置(站点名称:教学互动平台,记住密码时间:1天,默认重置密码:123456,教师权限:允许重置学生密码,允许查看汇总数据,允许查看日志)', 1432112101, '系统参数'),
(63, 1, '修改系统设置(站点名称:教学互动平台,记住密码时间:7天,默认重置密码:123456,教师权限:允许重置学生密码,允许查看汇总数据,允许查看日志)', 1432112340, '系统参数'),
(64, 1, '修改课件(课件id:17)', 1432191823, '编辑课件'),
(65, 1, '修改课件(课件id:1)', 1432192192, '编辑课件'),
(66, 1, '修改课件(课件id:1)', 1432260113, '编辑课件'),
(67, 1, '修改课件(课件id:1)', 1432261058, '编辑课件'),
(68, 1, '修改课件(课件id:1)', 1432263011, '编辑课件'),
(69, 1, '修改课件(课件id:1)', 1432263034, '编辑课件'),
(70, 1, '修改课件(课件id:1)', 1432263201, '编辑课件'),
(71, 1, '修改课件(课件id:1)', 1432263836, '编辑课件'),
(72, 1, '修改课件(课件id:1)', 1432265476, '编辑课件'),
(73, 1, '修改系统设置(站点名称:教学互动平台,记住密码时间:0天,默认重置密码:123456,教师权限:允许重置学生密码,允许查看汇总数据,允许查看日志)', 1432301444, '系统参数'),
(74, 1, '修改系统设置(站点名称:教学互动平台,记住密码时间:6天,默认重置密码:123456,教师权限:允许重置学生密码,允许查看汇总数据,允许查看日志)', 1432301455, '系统参数'),
(75, 1, '修改系统设置(站点名称:教学互动平台,记住密码时间:7天,默认重置密码:123456,教师权限:允许重置学生密码,允许查看汇总数据,允许查看日志)', 1432301517, '系统参数'),
(76, 1, '修改系统设置(站点名称:教学互动平台1,记住密码时间:7天,默认重置密码:123456,教师权限:允许重置学生密码,允许查看汇总数据,允许查看日志)', 1432301576, '系统参数'),
(77, 1, '修改系统设置(站点名称:教学互动平台,记住密码时间:7天,默认重置密码:123456,教师权限:允许重置学生密码,允许查看汇总数据,允许查看日志)', 1432301582, '系统参数'),
(78, 1, '重置用户(用户id:1)密码', 1432312938, '学生管理'),
(79, 1, '修改系统设置(站点名称:教学互动平台,记住密码时间:8天,默认重置密码:123456,教师权限:允许重置学生密码,允许查看汇总数据,允许查看日志)', 1432388532, '系统参数'),
(80, 2, '修改课件(课件id:19)', 1432536916, '编辑课件'),
(81, 1, '重置用户(用户id:2)密码', 1432570256, '学生管理'),
(82, 1, '修改问题(问题id:8)状态为:关闭', 1432571068, '提问管理'),
(83, 1, '修改问题(问题id:8)状态为:开启', 1432571081, '提问管理'),
(84, 1, '删除问题(问题id:9)', 1432620229, '提问管理'),
(85, 1, '删除作业(作业id:2)', 1432624808, '作业管理'),
(86, 1, '新增作业(作业标题:测试)', 1432629404, '编辑作业'),
(87, 1, '修改作业(作业id:3)', 1432651309, '编辑作业'),
(88, 1, '修改作业(作业id:3)', 1432651589, '编辑作业'),
(89, 1, '修改作业(作业id:1)', 1432651600, '编辑作业'),
(90, 1, '修改作业(作业id:3)', 1432652671, '编辑作业'),
(91, 1, '修改作业(作业id:1)', 1432652686, '编辑作业'),
(92, 1, '修改作业(作业id:1)', 1432652719, '编辑作业'),
(93, 1, '新增作业(作业标题:今天的作业)', 1432653488, '编辑作业'),
(94, 1, '修改作业(作业id:4)', 1432656159, '编辑作业'),
(95, 1, '删除回答(回答id:12)', 1432739467, '答疑管理'),
(96, 1, '新增资料(资料标题:响应式布局)', 1432741049, '编辑资料'),
(97, 1, '删除课程(课程id:2)', 1433081392, '课程管理'),
(98, 1, '修改作业(作业id:1)', 1433146766, '编辑作业'),
(99, 1, '修改课件(课件id:3)', 1433173209, '编辑课件'),
(100, 1, '修改课件(课件id:4)', 1433173543, '编辑课件'),
(101, 1, '修改课件(课件id:4)', 1433173793, '编辑课件'),
(102, 1, '修改课件(课件id:4)', 1433173830, '编辑课件'),
(103, 1, '修改课件(课件id:4)', 1433174054, '编辑课件'),
(104, 1, '修改课件(课件id:4)', 1433174201, '编辑课件'),
(105, 1, '修改课件(课件id:4)', 1433174253, '编辑课件'),
(106, 1, '修改课件(课件id:4)', 1433174445, '编辑课件'),
(107, 1, '修改课件(课件id:4)', 1433174480, '编辑课件'),
(108, 1, '修改课件(课件id:4)', 1433209435, '编辑课件'),
(109, 1, '修改课件(课件id:4)', 1433209514, '编辑课件'),
(110, 1, '修改课件(课件id:4)', 1433209649, '编辑课件'),
(111, 1, '修改课件(课件id:4)', 1433209878, '编辑课件'),
(112, 1, '修改课件(课件id:4)', 1433210011, '编辑课件'),
(113, 1, '修改课件(课件id:4)', 1433210120, '编辑课件'),
(114, 1, '修改课件(课件id:4)', 1433210177, '编辑课件'),
(115, 1, '修改课件(课件id:4)', 1433210251, '编辑课件'),
(116, 1, '修改课件(课件id:4)', 1433210301, '编辑课件'),
(117, 1, '修改课件(课件id:4)', 1433210382, '编辑课件'),
(118, 1, '修改课件(课件id:4)', 1433210399, '编辑课件'),
(119, 1, '删除教师(教师id:13)', 1433217139, '教师管理'),
(120, 1, '新增作业(作业标题:网络工程作业1)', 1433432900, '编辑作业'),
(121, 1, '删除问题(问题id:11)', 1433433070, '提问管理'),
(122, 1, '修改问题(问题id:8)状态为:关闭', 1433470129, '提问管理'),
(123, 1, '删除课件(课件id:16)', 1433470355, '课件管理'),
(124, 1, '删除课件(课件id:15)', 1433470362, '课件管理'),
(125, 1, '删除课件(课件id:14)', 1433470398, '课件管理'),
(126, 1, '修改课件(课件id:5)', 1433471151, '编辑课件'),
(127, 1, '修改课件(课件id:5)', 1433471198, '编辑课件'),
(128, 1, '修改课件(课件id:5)', 1433471283, '编辑课件'),
(129, 1, '删除课件(课件id:5)', 1433471864, '课件管理'),
(130, 1, '修改课件(课件id:1)', 1433471930, '编辑课件'),
(131, 1, '修改课件(课件id:1)', 1433472060, '编辑课件'),
(132, 1, '修改课件(课件id:1)', 1433472119, '编辑课件'),
(133, 1, '修改课件(课件id:1)', 1433472152, '编辑课件'),
(134, 1, '修改资料(资料id:22)', 1433472214, '编辑资料'),
(135, 1, '修改资料(资料id:17)', 1433472281, '编辑资料'),
(136, 1, '修改课件(课件id:18)', 1433472413, '编辑课件'),
(137, 1, '修改课件(课件id:18)', 1433472421, '编辑课件'),
(138, 2, '修改作业(作业id:1)', 1433481418, '编辑作业'),
(139, 2, '修改作业(作业id:1)', 1433481451, '编辑作业'),
(140, 1, '修改作业(作业id:4)', 1433481484, '编辑作业'),
(141, 1, '修改课件(课件id:1)', 1433485012, '编辑课件'),
(142, 1, '修改问题(问题id:9,2)状态为:关闭', 1433485180, '提问管理'),
(143, 1, '删除问题(问题id:9)', 1433485198, '提问管理'),
(144, 1, '修改系统设置(站点名称:教学互动平台是,记住密码时间:8天,默认重置密码:123456,教师权限:允许重置学生密码,允许查看汇总数据,允许查看日志)', 1433485216, '系统参数'),
(145, 1, '修改作业(作业id:4)', 1433661809, '编辑作业');

-- --------------------------------------------------------

--
-- 表的结构 `table_question`
--

CREATE TABLE IF NOT EXISTS `table_question` (
  `qid` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL COMMENT '问题名称',
  `uid` int(12) unsigned NOT NULL COMMENT '提问者',
  `content` mediumtext NOT NULL COMMENT '问题内容',
  `sub_time` int(12) NOT NULL COMMENT '提交时间',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `answer_count` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '回复条数',
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='提问表' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `table_question`
--

INSERT INTO `table_question` (`qid`, `title`, `uid`, `content`, `sub_time`, `status`, `answer_count`) VALUES
(1, '测试提问1?', 1, '啦啦啦啦', 1431931666, 1, 6),
(2, '测试提问2测试提问2测试提问2测试提问2', 2, '测试测试', 1431932666, 0, 7),
(8, '这道题应该怎么做呢?', 3, '然而并没有什么卵用啊~~', 1432570104, 0, 0),
(10, '请问这题的答案是多少，有知道的么？急求，在线等。', 4, '请问书上第5页第2题要怎么做？急求，在线等。', 1433156548, 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `table_setting`
--

CREATE TABLE IF NOT EXISTS `table_setting` (
  `key` varchar(255) NOT NULL COMMENT '系统设置名称',
  `value` varchar(255) DEFAULT NULL COMMENT '系统设置的值',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `table_setting`
--

INSERT INTO `table_setting` (`key`, `value`) VALUES
('cookie_time', '8'),
('power_data_view', '1'),
('power_log_view', '1'),
('power_reset_pwd', '1'),
('reset_pwd', '123456'),
('web_name', '教学互动平台是');

-- --------------------------------------------------------

--
-- 表的结构 `table_user`
--

CREATE TABLE IF NOT EXISTS `table_user` (
  `uid` int(12) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `user_pwd` varchar(50) NOT NULL COMMENT '密码',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态',
  `login_time` int(12) DEFAULT NULL COMMENT '登录时间',
  `login_ip` varchar(15) DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生用户表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `table_user`
--

INSERT INTO `table_user` (`uid`, `user_name`, `user_pwd`, `email`, `status`, `login_time`, `login_ip`) VALUES
(1, 'quericy', 'c2c9827b9eaf3b808e4e2ff8edb7491a', 'quericy@live.com', 1, 1435471154, '127.0.0.1'),
(2, 'chenyi', 'c2c9827b9eaf3b808e4e2ff8edb7491a', 'chenyi2821267@163.com', 1, 1435471164, '127.0.0.1'),
(3, 'aaa', 'ae3a6986ac1d9ba489d155cf738832ea', 'aaa@aaa.com', 1, 1432570093, '127.0.0.1'),
(4, 'cy', '16cd298b9ca3cb04ed20a95af9b69f75', 'f85a01b4@opayq.com', 1, 1433157520, '192.168.199.186'),
(5, 'aaa2', 'd8fd78ebb24a91f32cbb4b425f9947b0', 'aaa2@aaa.com', 1, 1433481263, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `table_work`
--

CREATE TABLE IF NOT EXISTS `table_work` (
  `wid` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(12) unsigned NOT NULL COMMENT '作业发布教师id',
  `title` varchar(50) NOT NULL COMMENT '作业标题',
  `content` mediumtext NOT NULL COMMENT '作业内容',
  `start_time` int(12) NOT NULL COMMENT '开始时间',
  `end_time` int(12) NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`wid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='作业表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `table_work`
--

INSERT INTO `table_work` (`wid`, `tid`, `title`, `content`, `start_time`, `end_time`) VALUES
(1, 2, '测试作业', '\n<p style="text-align: center;"><strong>作业:</strong></p><p>完成此表格的填写</p><p><br></p><p style="text-align: right;">作业表格：</p><p style="line-height: 16px; text-align: right;"><img style="vertical-align: middle; margin-right: 2px;" src="http://ci.me/third_party/ueditor/dialogs/attachment/fileTypeImages/icon_xls.gif"><a style="font-size:12px; color:#0066cc;" href="/upload_files/ueditor/php/upload/file/20150512/1431397445970108.xls" title="1431397445970108.xls" target="_blank">1431397445970108.xls</a></p><p><br></p>\n', 1432840200, 1435363200),
(3, 1, '测试', '\n<p>123</p>\n', 1421810360, 1431704600),
(4, 1, '今天的作业', '\n<p>测试测试~~</p>\n', 1432653420, 1433692200),
(5, 1, '网络工程作业1', '\n<p>完成本科目作业：</p><p><br></p><p>正文略。。。</p><p><br></p><p><br></p><p style="line-height: 16px;"><img style="vertical-align: middle; margin-right: 2px;" src="http://ci.me/third_party/ueditor/dialogs/attachment/fileTypeImages/icon_doc.gif"><a style="font-size:12px; color:#0066cc;" href="/upload_files/ueditor/php/upload/file/20150604/1433432884102501.doc" title="网络工程实践课程设计 -_副本.doc" target="_blank">网络工程实践课程设计 -_副本.doc</a></p><p><br></p>\n', 1433432820, 1435109400);

-- --------------------------------------------------------

--
-- 表的结构 `table_work_process`
--

CREATE TABLE IF NOT EXISTS `table_work_process` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wid` int(12) unsigned NOT NULL COMMENT '作业wid',
  `uid` int(12) unsigned NOT NULL COMMENT '用户uid',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '完成状态(0:未完成,1:已上交,2:已批改)',
  `score` decimal(5,2) unsigned DEFAULT NULL COMMENT '分数',
  `content` mediumtext NOT NULL COMMENT '作业内容',
  `fid` int(12) unsigned DEFAULT NULL COMMENT '上交作业附件fid',
  `submit_time` int(12) NOT NULL COMMENT '提交时间',
  `score_time` int(12) DEFAULT NULL COMMENT '批改时间',
  PRIMARY KEY (`id`),
  KEY `wid` (`wid`,`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='作业缴交情况表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `table_work_process`
--

INSERT INTO `table_work_process` (`id`, `wid`, `uid`, `status`, `score`, `content`, `fid`, `submit_time`, `score_time`) VALUES
(1, 4, 1, 2, '93.00', '', 0, 1432714573, 1432657648),
(2, 1, 1, 1, NULL, '', NULL, 1433155381, NULL),
(3, 4, 2, 2, '88.23', '', NULL, 1432727418, 1432731034),
(4, 1, 2, 1, NULL, '', NULL, 1433473348, NULL),
(5, 1, 4, 2, '0.00', '', NULL, 1433156488, 1433172698),
(6, 5, 1, 2, '32.00', '', NULL, 1433432951, 1433433000),
(7, 5, 2, 2, '66.00', '', NULL, 1433485050, 1433485123),
(8, 1, 5, 1, NULL, '', NULL, 1433481328, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
