<?php


//驼峰转下划线
function humpToLine($str){
	$str = lcfirst($str);
    $str = preg_replace_callback('/([A-Z]{1})/',function($matches){
        return '_'.strtolower($matches[0]);
    },$str);
    return $str;
}

//无限级分类树
function genTree5($items) {
    foreach ($items as $item)
        $items[$item['pid']]['son'][$item['id']] = &$items[$item['id']];
    return isset($items[0]['son']) ? $items[0]['son'] : array();
}
  
//无限级分类树
function genTree9($items) {
    $tree = array(); //格式化好的树
    foreach ($items as $item)
        if (isset($items[$item['pid']]))
            $items[$item['pid']]['son'][] = &$items[$item['id']];
        else
            $tree[] = &$items[$item['id']];
    return $tree;
}

//无限级分类树--递归
function getTree($data, $pId){
    $tree = '';
    foreach($data as $k => $v){
        if($v['pid'] == $pId){        //父亲找到儿子
            $v['son'] = getTree($data, $v['id']);
            $tree[] = $v;
        }
    }
    return $tree;
}

//无限级分类树--递归
function getTree2($data, $pId){
    //echo "ssssssss";exit;
    $tree_str = '';
    foreach($data as $k => $v){
        if($v['pid'] == $pId){        //父亲找到儿子
            $tree_str .= '<li class="active"><a href="#"  data-addtab="'.$v['id'].'" data-url="/admin/'.$v['name'].'.html"><i class="'.$v['icon'].'"></i> <span>'.$v['title'].'222222</span></a>';
            $tree_str .= getTree2($data, $v['id']);

            $tree_str .= '</li>';
        }
    }
    return $tree_str? '<ul>'.$tree_str.'</ul>' : $tree_str;
}



        // <li class="active"><a href="#"  data-addtab="admin" data-url="/admin/admin/index.html"><i class="fa fa fa-th"></i> <span>管理员管理</span></a></li>
        // <li class=""><a href="#"  data-addtab="auth_group" data-url="/admin/auth_group/index.html"><i class="fa fa fa-th"></i> <span>权限组管理</span></a></li>
        // <li class=""><a href="#"  data-addtab="auth_rule" data-url="/admin/auth_rule/index.html"><i class="fa fa fa-th"></i> <span>规则管理</span></a></li>


        // <li><a href="#" data-addtab="message1" data-url="http://www.qq.com"><i class="fa fa-folder"></i> <span>分类二多级分类</span></a></li>
        // <li class="treeview">
        //   <a href="#"><i class="fa fa-edit"></i> <span>多级分类多级分类</span>
        //     <span class="pull-right-container">
        //         <i class="fa fa-angle-left pull-right"></i>
        //       </span>
        //   </a>
        //   <ul class="treeview-menu">
        //     <li class="treeview"><a href="#" data-addtab="message2" data-url="http://www.taobao.com"><i class="fa fa-edit"></i> <span>22222222</span>
        //     <span class="pull-right-container">
        //         <i class="fa fa-angle-left pull-right"></i>
        //       </span></a>

        //     <ul class="treeview-menu">
        //       <li><a href="#" data-addtab="message2" data-url="http://www.taobao.com"><i class="fa fa-edit"></i> 33333333</a></li>
        //       <li><a href="#" data-addtab="message4" data-url="http://www.jd.com"><i class="fa fa-edit"></i> 44444444</a></li>
        //     </ul>
        //     </li>
        //     <li><a href="#" data-addtab="message4" data-url="http://www.jd.com"><i class="fa fa-edit"></i> 多级分类</a></li>
        //   </ul>
        // </li>

