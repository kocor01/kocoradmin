<?php  

// +----------------------------------------------------------------------
// | KocorAdmin 只为自己开发框架
// +----------------------------------------------------------------------
// | Copyright © 2017 KOCOR. 版权所有.
// +----------------------------------------------------------------------
// | Author: Kocor <502117269@qq.com>
// +----------------------------------------------------------------------

namespace kocor;

/** 
* 通用的树型类，可以生成任何树型结构 
*/  
class Tree {  
    /** 
    * 生成树型结构所需要的2维数组 
    * @var array 
    */  
    public $arr = array();  
  
    /** 
    * 生成树型结构所需修饰符号，可以换成图片 
    * @var array 
    */  
    public $icon = array('│','├','└');  
    public $nbsp = "&nbsp;&nbsp;";  
    public $pid_str = "";  
    public $name_str = ""; 
    public $str = "";  
  
    /** 
    * @access private 
    */  
    public $ret = '';  
    public $newarr = [];  
  
    /** 
    * 构造函数，初始化类 
    * @param array 2维数组，例如： 
    * array( 
    *      1 => array('id'=>'1','pid'=>0,'name'=>'一级栏目一'), 
    *      2 => array('id'=>'2','pid'=>0,'name'=>'一级栏目二'), 
    *      3 => array('id'=>'3','pid'=>1,'name'=>'二级栏目一'), 
    *      4 => array('id'=>'4','pid'=>1,'name'=>'二级栏目二'), 
    *      5 => array('id'=>'5','pid'=>2,'name'=>'二级栏目三'), 
    *      6 => array('id'=>'6','pid'=>3,'name'=>'三级栏目一'), 
    *      7 => array('id'=>'7','pid'=>3,'name'=>'三级栏目二') 
    *      ) 
    */  
    public function init($arr=array(),$pid_str='pid',$name_str='title'){  
       $this->arr = $arr;  
       $this->pid_str = $pid_str;  
       $this->name_str = $name_str;  
       $this->ret = '';  
       return is_array($arr);  
    }  
  
    /** 
    * 得到父级数组 
    * @param int 
    * @return array 
    */  
    public function get_parent($myid){  
        $newarr = array();  
        if(!isset($this->arr[$myid])) return false;  
        $pid = $this->arr[$myid][$this->pid_str];  
        $pid = $this->arr[$pid][$this->pid_str];  
        if(is_array($this->arr)){  
            foreach($this->arr as $id => $a){  
                if($a[$this->pid_str] == $pid) $newarr[$id] = $a;  
            }  
        }  
        return $newarr;  
    }  
  
    /** 
    * 得到子级数组 
    * @param int 
    * @return array 
    */  
    public function get_child($myid){  
        $a = $newarr = array();  
        if(is_array($this->arr)){  
            foreach($this->arr as $id => $a){  
                if($a[$this->pid_str] == $myid) $newarr[$id] = $a;  
            }  
        }  
        return $newarr ? $newarr : false;  
    }
  
    /** 
    * 得到所有子级数组 
    * @param int 
    * @return array 
    */  
    public function get_all_child($myid,&$newarr=[]){  
        $child = $this->get_child($myid);  
        if(is_array($child)){ 
            foreach($child as $key=>$value){   
                $newarr['list'][$key] = $value;
                $this->get_all_child($value['id'],&$newarr['list'][$key]);
            }
        }
        print_r($newarr);exit;

        return $newarr;
    } 
  
    /** 
    * 得到所有子级数组 
    * @param int 
    * @return array 
    */  
    public function get_all_child_id($myid){  
        $child = $this->get_child($myid);  
        if(is_array($child)){ 
            foreach($child as $key=>$value){   
                $this->newarr[] = $value['id'];
                print_r($child);
                echo $value['id'];exit;
                $this->get_all_child_id($value['id']);
            }
        }
        print_r($newarr);exit;

        return $newarr;
    }  
  
    /** 
    * 得到当前位置数组 
    * @param int 
    * @return array 
    */  
    public function get_pos($myid,&$newarr){  
        $a = array();  
        if(!isset($this->arr[$myid])) return false;  
        $newarr[] = $this->arr[$myid];  
        $pid = $this->arr[$myid][$this->pid_str];  
        if(isset($this->arr[$pid])){  
            $this->get_pos($pid,$newarr);  
        }  
        if(is_array($newarr)){  
            krsort($newarr);  
            foreach($newarr as $v){  
                $a[$v['id']] = $v;  
            }  
        }  
        return $a;  
    }  
  
    /** 
    * 得到树型结构 
    * @param int ID，表示获得这个ID下的所有子级 
    * @param string 生成树型结构的基本代码，例如："<option value=\$id \$selected>\$spacer\$name</option>" 
    * @param int 被选中的ID，比如在做树型下拉框的时候需要用到 
    * @return string 
    */  
    public function get_tree($myid, $str, $sid = 0, $adds = '', $str_group = ''){  
        $number=1;  
        $child = $this->get_child($myid);  
        if(is_array($child)){  
            $total = count($child); 
            //print_r($child);
            foreach($child as $value){  
                $j=$k='';  
                if($number==$total){  
                    $j .= $this->icon[2];  
                }else{  
                    $j .= $this->icon[1];  
                    //$k = $adds ? $this->icon[0] : '';  
                    $k = $this->icon[0];  
                }  

                @extract($value); 
                $pid_str = $this->pid_str;
                if($$pid_str == 0 && $str_group){
                    $spacer = $str_group.$j;
                }else{
                    //$spacer = $adds ? $adds.$j : '';   
                    $spacer = $adds.$j;   
                }
                $selected = $id==$sid ? 'selected' : '';  
                eval("\$nstr = \"$str\";");  
                $this->ret .= $nstr;  
                $nbsp = $this->nbsp;  
                $this->get_tree($id, $str, $sid, $adds.$k.$nbsp,$str_group);  
                $number++;  
            }  
        }  
        return $this->ret;  
    }  
    /** 
    * 同上一方法类似,但允许多选 
    */  
    public function get_tree_multi($myid, $str, $sid = 0, $adds = ''){  
        $number=1;  
        $child = $this->get_child($myid);  
        if(is_array($child)){  
            $total = count($child);  
            foreach($child as $id=>$a){  
                $j=$k='';  
                if($number==$total){  
                    $j .= $this->icon[2];  
                }else{  
                    $j .= $this->icon[1];  
                    $k = $adds ? $this->icon[0] : '';  
                }  
                $spacer = $adds ? $adds.$j : '';  
                  
                $selected = $this->have($sid,$id) ? 'selected' : '';  
                @extract($a);  
                eval("\$nstr = \"$str\";");  
                $this->ret .= $nstr;  
                $this->get_tree_multi($id, $str, $sid, $adds.$k.' ');  
                $number++;  
            }  
        }  
        return $this->ret;  
    }  
     /** 
    * @param integer $myid 要查询的ID 
    * @param string $str   第一种HTML代码方式 
    * @param string $str2  第二种HTML代码方式 
    * @param integer $sid  默认选中 
    * @param integer $adds 前缀 
    */  
    public function get_tree_category($myid, $str, $str2, $sid = 0, $adds = ''){  
        $number=1;  
        $child = $this->get_child($myid);  
        if(is_array($child)){  
            $total = count($child);  
            foreach($child as $id=>$a){  
                $j=$k='';  
                if($number==$total){  
                    $j .= $this->icon[2];  
                }else{  
                    $j .= $this->icon[1];  
                    $k = $adds ? $this->icon[0] : '';  
                }  
                $spacer = $adds ? $adds.$j : '';  
                  
                $selected = $this->have($sid,$id) ? 'selected' : '';  
                @extract($a);  
                if (empty($html_disabled)) {  
                    eval("\$nstr = \"$str\";");  
                } else {  
                    eval("\$nstr = \"$str2\";");  
                }  
                $this->ret .= $nstr;  
                $this->get_tree_category($id, $str, $str2, $sid, $adds.$k.' ');  
                $number++;  
            }  
        }  
        return $this->ret;  
    }  
      
    /** 
     * 同上一类方法，jquery treeview 风格，可伸缩样式（需要treeview插件支持） 
     * @param $myid 表示获得这个ID下的所有子级 
     * @param $effected_id 需要生成treeview目录数的id 
     * @param $str 末级样式 
     * @param $str2 目录级别样式 
     * @param $showlevel 直接显示层级数，其余为异步显示，0为全部限制 
     * @param $style 目录样式 默认 filetree 可增加其他样式如'filetree treeview-famfamfam' 
     * @param $currentlevel 计算当前层级，递归使用 适用改函数时不需要用该参数 
     * @param $recursion 递归使用 外部调用时为FALSE 
     */  
    function get_treeview($myid,$effected_id='example',$str="<span class='file'>\$name</span>", $str2="<span class='folder'>\$name</span>" ,$showlevel = 0 ,$style='filetree ' , $currentlevel = 1,$recursion=FALSE) {  
        $child = $this->get_child($myid);  
        if(!defined('EFFECTED_INIT')){  
           $effected = ' id="'.$effected_id.'"';  
           define('EFFECTED_INIT', 1);  
        } else {  
           $effected = '';  
        }  
        $placeholder =  '<ul><li><span class="placeholder"></span></li></ul>';  
        if(!$recursion) $this->str .='<ul'.$effected.'  class="'.$style.'">';  
        foreach($child as $id=>$a) {  
  
            @extract($a);  
            if($showlevel > 0 && $showlevel == $currentlevel && $this->get_child($id)) $folder = 'hasChildren'; //如设置显示层级模式
            $floder_status = isset($folder) ? ' class="'.$folder.'"' : '';        
            $this->str .= $recursion ? '<ul><li'.$floder_status.' id=\''.$id.'\'>' : '<li'.$floder_status.' id=\''.$id.'\'>';  
            $recursion = FALSE;  
            if($this->get_child($id)){  
                eval("\$nstr = \"$str2\";");  
                $this->str .= $nstr;  
                if($showlevel == 0 || ($showlevel > 0 && $showlevel > $currentlevel)) {  
                    $this->get_treeview($id, $effected_id, $str, $str2, $showlevel, $style, $currentlevel+1, TRUE);  
                } elseif($showlevel > 0 && $showlevel == $currentlevel) {  
                    $this->str .= $placeholder;  
                }  
            } else {  
                eval("\$nstr = \"$str\";");  
                $this->str .= $nstr;  
            }  
            $this->str .=$recursion ? '</li></ul>': '</li>';  
        }  
        if(!$recursion)  $this->str .='</ul>';  
        return $this->str;  
    }  
      
    /** 
     * 获取子栏目json 
     * Enter description here ... 
     * @param unknown_type $myid 
     */  
    public function creat_sub_json($myid, $str='') {  
        $sub_cats = $this->get_child($myid);  
        $n = 0;  
        if(is_array($sub_cats)) foreach($sub_cats as $c) {        
            $data[$n]['id'] = iconv('GB2312','utf-8',$c['id']);  
            if($this->get_child($c['id'])) {  
                $data[$n]['liclass'] = 'hasChildren';  
                $data[$n]['children'] = array(array('text'=>' ','classes'=>'placeholder'));  
                $data[$n]['classes'] = 'folder';  
                //$data[$n]['text'] = iconv('GBK','utf-8',$c[$this->name_str]);
                $data[$n]['text'] = $c[$this->name_str];  
            } else {                  
                if($str) {  
                    @extract(array_iconv($c,'GB2312','utf-8'));  
                    eval("\$data[$n]['text'] = \"$str\";");  
                } else {  
                    $data[$n]['text'] = iconv('GB2312','utf-8',$c[$this->name_str]); 
                    $data[$n]['text'] = iconv('GB2312','utf-8',$c[$this->name_str]);  
                }  
            }  
            $n++;  
        }  
        return json_encode($data);        
    } 
      
    /** 
     * 获取下级json数据
     * Enter description here ... 
     * @param unknown_type $myid 
     */   
    public function get_tree_json($myid, $adds = '', $str_group = ''){  
        $number=1;  
        $child = $this->get_child($myid);

        if(is_array($child)){  
            $total = count($child);  
            foreach($child as $value){
                $j=$k='';  
                if($number==$total){  
                    $j .= $this->icon[2];  
                }else{  
                    $j .= $this->icon[1];  
                    $k = $adds ? $this->icon[0] : '';  
                }  

            
                $pid_str = $this->pid_str;
                if($value[$this->pid_str] == 0 && $str_group){
                    $spacer = $str_group.$j; 
                }else{
                    $spacer = $adds ? $adds.$j : '';   
                }

                $child = $this->get_child($value['id']);
                if(is_array($child)){  
                    $value['has_child'] = 1;
                }else{
                    $value['has_child'] = 0;
                }
                 

                $value[$this->name_str] = $spacer.$value[$this->name_str];
                $nbsp = $this->nbsp; 
                $this->newarr[] = $value;

                //print_r($value);
                $this->get_tree_json($value['id'], $adds.$k.$nbsp,$str_group);  
                $number++;  
            }  
        }  
        return $this->newarr;  
    }
      
    /** 
     * 获取jstree所需格式数据
     * Enter description here ... 
     * @param unknown_type $myid 
     */   
    public function get_treeview_arr($sid = ''){  
        $id_arr = explode(',', $sid);
        if(is_array($this->arr)){  
            foreach($this->arr as $value){ 
                $value['is_selected'] = in_array($value['id'], $id_arr)?1:0;
                $this->newarr[] = $value;
            }  
        }  
        return $this->newarr;  
    }  




    private function have($list,$item){  
        return(strpos(',,'.$list.',',','.$item.','));  
    }  
}  
?>  