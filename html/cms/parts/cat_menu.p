
$MAIN:menu[^table::sql{select id, title, group_uri, visible from ${MAIN:sql_config.table_prefix}module_catgroups where visible = '1' and parent_id = '0' order by order_by ASC}]
^if($MAIN:menu){
<ul>
	^MAIN:menu.menu{
		^if($MAIN:menu.visible eq "1"){
			<li /><a href="/zakaz_cvetov/${MAIN:menu.group_uri}/">$MAIN:menu.title</a>
		}
	}
</ul>
}
<div class="clear"></div>

