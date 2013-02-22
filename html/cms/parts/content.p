
$MAIN:content[^table::sql{select id, title, keywords, description, h1, body, published, updated from ${MAIN:sql_config.table_prefix}content where menu_id = '^MAIN:part_params.int(0)'}]
^if($MAIN:content){
	$MAIN:meta_title[$MAIN:content.title]
	$MAIN:meta_keywords[$MAIN:content.keywords]
	$MAIN:meta_description[$MAIN:content.description]
	<h1>$MAIN:content.h1</h1>
	^untaint{$MAIN:content.body}
}

^if($MAIN:user_status eq "99"){
<div class="admin_link"><input type="button" value="Редактировать страницу" onClick="show_modal('${MAIN:language_prefix}/admin/edit_content/?id=^MAIN:part_params.int(0)')" /></div>
}

