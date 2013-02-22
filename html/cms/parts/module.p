
$module_name[${MAIN:part_params}.p]
^if(-f "/cms/classes/modules/$module_name"){

^use[$module_name]
^process{^^$MAIN:part_params:short[]}

^if($MAIN:user_status eq "99" && ${MAIN:part_params} ne "search"){
	<div class="admin_link"><input type="button" value="Управление модулем" onClick="show_modal('${MAIN:language_prefix}/admin/module/?id=$module_name')" /></div>
}

}

