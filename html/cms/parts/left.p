
$MAIN:menu[^table::sql{select id, menu_title, menu_uri, visible, menu_parent_id from ${MAIN:sql_config.table_prefix}menu where menu_id = '1' order by order_by ASC}]
^if(^MAIN:menu.locate[id;$MAIN:menu_id]){
$menu_id[^if($MAIN:menu.menu_parent_id ne "0"){$MAIN:menu.menu_parent_id}{$MAIN:menu.id}]

^if(^MAIN:menu.locate[id;$menu_id]){

<span class="title">$MAIN:menu.menu_title</span>
^if(-f "/files/menu/${menu_id}.jpg"){
<img class="pic shadow radius8" src="^if(def $MAIN:left_image){$MAIN:left_image}{/files/menu/^if(-f "/files/menu/${MAIN:menu_id}.jpg"){$MAIN:menu_id}{$menu_id}.jpg}" alt="$MAIN:menu.menu_title" title="$MAIN:menu.menu_title" />
}{<br /><br />}

$MAIN:submenu[^table::sql{select id, menu_id, menu_title, menu_uri, menu_parent_id, visible, module from ${MAIN:sql_config.table_prefix}menu where menu_parent_id = '${menu_id}' order by order_by ASC}]
^if($MAIN:submenu){
<p>
^MAIN:submenu.menu{
<a href="^uri:get_uri_by_menu_id[${MAIN:submenu.id}]" style="text-decoration: none">$MAIN:submenu.menu_title</a>
}[<br />]
</p>
}

^if($MAIN:menu.menu_title eq "Контакты"){
<p>Россия,<br/> 
123105, Санкт-Петербург<br/> 
ул. Бумажная, 18<br/> 
Телефон: +7 (812) 335-00-21<br/> 
Телефон: +7 (812) 335-00-21 <br/><br/> 
Факс:       +7 (812) 335-00-21<br/> 
E-mail:     <a href="">info@ruscon.delo-group.ru</a><br/></p> 
}

}

}



^rem{


<a class="spo" href="/clients/container_search/"><span>Поиск контейнера</span></a> 
<a class="spo" href="/clients/container/"><span>Затарка контейнера</span></a> 
<a class="spo" href="/clients/stavki_frahta/"><span>Ставки фрахта</span></a> 
<a class="spo" href="/clients/calendar/"><span>Расписание</span></a> 

<span class="title">ЛОГИСТИКА</span>
<img class="pic shadow radius8" src="{template}pics/pictures_28.jpg" />
<p>Lorem ipsum dolor sit amet, consectetur 
adipisicing elit, sed do eiusmod tempor 
incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud 
exercitation ullamco laboris nisi ut aliquip ex.</p>
<p><a href="">Морские перевозки</a> | <a href="">Автоперевозки</a><br/> 
<a href="">Жд перевозки</a> | <a href="">Внутренние перевозки</a>
</p>
}
