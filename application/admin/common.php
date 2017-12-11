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