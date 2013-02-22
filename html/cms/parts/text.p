
$MAIN:text[^table::sql{select id, text_id, text_body from ${MAIN:sql_config.table_prefix}texts where text_id = '^MAIN:part_params.int(0)'}]
^if($MAIN:text){
	^untaint{$MAIN:text.text_body}
}

^if($MAIN:user_status eq "99"){
<div class="admin_link"><input type="button" value="Изменить надпись" onClick="show_modal('${MAIN:language_prefix}/admin/edit_text/?id=^MAIN:part_params.int(0)')" /></div>
}

