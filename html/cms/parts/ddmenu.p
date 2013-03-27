
$MAIN:menu[^table::sql{select id, menu_parent_id, menu_title, menu_uri, visible from ${MAIN:sql_config.table_prefix}menu where menu_id = '^MAIN:part_params.int(0)' and menu_parent_id = '0' order by order_by ASC}]
^if($MAIN:menu){
<ul class="ddmenu">
	^MAIN:menu.menu{
		^if($MAIN:menu.visible eq "1"){
			$MAIN:submenu[^table::sql{select id, menu_parent_id, menu_title, menu_uri, visible from ${MAIN:sql_config.table_prefix}menu where menu_id = '^MAIN:part_params.int(0)' and menu_parent_id = '$MAIN:menu.id' order by order_by ASC}]

			<li>
#			<div class="servicesmenu_">
			<div class="servicesmenu_"><a href="^uri:get_uri_by_menu_id[${MAIN:menu.id}]" ^if(^MAIN:submenu.locate[id;$MAIN:menu_id] || ^MAIN:submenu.locate[menu_parent_id;$MAIN:menu_id]){class="active"}>$MAIN:menu.menu_title</a></div>
#			<li /><a href="javascript:dummy()" onClick="change_menu('submenu_${MAIN:menu.id}')" ^if(^MAIN:submenu.locate[id;$MAIN:menu_id]){class="active"}>$MAIN:menu.menu_title</a>
			^if($MAIN:submenu){
#				<div class="submenu" style="display: ^if(^MAIN:submenu.locate[id;$MAIN:menu_id] || ^MAIN:submenu.locate[menu_parent_id;$MAIN:menu_id]){block}{none}" id="submenu_${MAIN:menu.id}">
				<div class="submenu" id="submenu_${MAIN:menu.id}">
				<div class="submenu_middle"><div class="submenu_middle_">
				<ul>
					^MAIN:submenu.menu{
						<li /><a href="^uri:get_uri_by_menu_id[${MAIN:submenu.id}]" ^if($MAIN:submenu.id eq "$MAIN:menu_id"){class="active"}>$MAIN:submenu.menu_title</a>
					}
				</ul>
				</div></div>
				</div>
			}
#			</div>
			</li>
		}
	}
</ul>
}
<div class="clear"></div>

^if($MAIN:user_status eq "99"){
<div class="admin_link"><input type="button" value="Изменить меню" onClick="show_modal('${MAIN:language_prefix}/admin/edit_menu/?id=^MAIN:part_params.int(0)')" /></div>
}

