$default[header_default.jpg]
^if(^request:uri.pos[/tamozhennoe_oformlenie/] >= 0){
	$default[header_default2.jpg]
}
^if(^request:uri.pos[/soprovozhdenie_biznesa/] >= 0){
	$default[header_default3.jpg]
}
^if(^request:uri.pos[/goods/] >= 0){
	$default[header_default4.jpg]
}

style="background: #ffffff url(/cms/templates/gcs/pics/$default) top left repeat-x^;"
