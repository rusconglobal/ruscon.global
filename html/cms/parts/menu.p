$MAIN:menu[^table::sql{select id, menu_title, menu_uri, visible, menu_parent_id from ${MAIN:sql_config.table_prefix}menu where menu_id = '^MAIN:part_params.int(0)' and menu_parent_id = '0' order by order_by ASC}]
^if($MAIN:menu){
#<ul>

#	<li>
		<a href="/" onMouseOver="^$('.submenu').hide()^;^$('.submenu_active').hide()^;">^if($MAIN:language_prefix eq "/en"){Home}{Главная}</a> 
#	</li>

	^MAIN:menu.menu{
		^if($MAIN:menu.visible eq "1"){
#			<li><div><a href="^uri:get_uri_by_menu_id[${MAIN:menu.id}]" onMouseOver="^$('.submenu').hide()^;^$('.submenu_active').hide()^;^$('#submenu_${MAIN:menu.id}').show()^;">$MAIN:menu.menu_title</a></div>

<a href="^uri:get_uri_by_menu_id[${MAIN:menu.id}]">$MAIN:menu.menu_title</a>

#			$MAIN:submenu[^table::sql{select id, menu_title, menu_uri, visible, menu_parent_id from ${MAIN:sql_config.table_prefix}menu where menu_id = '^MAIN:part_params.int(0)' and menu_parent_id = '$MAIN:menu.id' order by order_by ASC}]
#			^if($MAIN:submenu){
#				<ul class="submenu^if($MAIN:menu.menu_uri eq $uri:path.piece){_active}" id="submenu_${MAIN:menu.id}">
#					^MAIN:submenu.menu{
#						$submenu_uri[^uri:get_uri_by_menu_id[${MAIN:submenu.id}]]
#						^if(^submenu_uri.pos[http://] > 0){
#							$submenu_uri[^submenu_uri.right(^eval(^submenu_uri.length[] - ^submenu_uri.pos[http://]))]
#						}
#						<li><div><a href="${submenu_uri}" ^if(^submenu_uri.pos[http://] >= 0){target="_blank"}>$MAIN:submenu.menu_title</a></div></li>
#					}
#				</ul>
#			}

#			</li>
		}
	}

	^if($MAIN:language_prefix eq "/en"){
		<a href="http://www.ruscon.gcs-group.ru">По-русски</a> 
	}{
		<a href="/en/">English</a> 
	}

#</ul>

}
#<div class="clear"></div>

#<a href="">Компания</a> <a href="">Логистика</a> <a href="">Клиентам</a> <a href="">Финансовые услуги</a> <a href="">Карьера</a> <a href="">Контакты</a>

^if($MAIN:user_status eq "99"){
<div class="admin_link_"><input type="button" value="Изменить меню" onClick="show_modal('${MAIN:language_prefix}/admin/edit_menu/?id=^MAIN:part_params.int(0)')" /></div>
}

