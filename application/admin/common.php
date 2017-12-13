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
function genTree($items) {
    foreach ($items as $item)
        $items[$item['pid']]['son'][$item['id']] = &$items[$item['id']];
    return isset($items[0]['son']) ? $items[0]['son'] : array();
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

