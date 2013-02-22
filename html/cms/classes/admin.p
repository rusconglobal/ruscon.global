@CLASS
admin

###
###
###
@auto[]

@css[]
<link href="/cms/templates/derevo/css/admin.css" rel="stylesheet" type="text/css" />

###
###
###
@main[]
^if($MAIN:user_status eq "99"){
^switch[$uri:path_second]{
	^case[submit_form_ajax]{ ^submit_form_ajax[] }
	^case[subscribe_email]{ ^subscribe_email[] }
	^case[edit_text]{ ^css[]^edit_text[] }
	^case[edit_content]{ ^css[]^edit_content[] }
	^case[edit_menu]{ ^css[]^edit_menu[] }
	^case[edit_serialize]{ ^edit_serialize[] }
	^case[delete_element]{ ^delete_element[] }
	^case[module]{ ^module[] }
	^case[DEFAULT]{ default }
}
}{ ^404[] }

###
###
###
@delete_element[][]
^void:sql{delete from $form:table_name where $form:key_id = '^form:key_value.int(0)'}

###
###
###
@edit_serialize[][s;s_]
$s_[^table::create{id	order_by}]
$s[^form:string.lsplit[amp^;]]
$i(1)
^s.menu{
	^s_.append{^s.piece.right(^eval(^s.piece.length[] - ^s.piece.pos[=] - 1))	$i}
	^i.inc[]
}

^if($s_){

$table_name[^s.piece.left(^s.piece.pos[_])]
^if($table_name eq "module"){
	$table_name_[^s.piece.mid(^eval(^table_name.length[] + 1);^s.piece.length[])]
	$table_name_[^table_name_.left(^table_name_.pos[^[])]
	$table_name[${table_name}_${table_name_}]
}

$menu_id[$s.piece]
$menu_id[^menu_id.mid(^eval(^menu_id.pos[_] + 1);^menu_id.length[])]
$menu_id[^menu_id.left(^eval(^menu_id.length[] - ^eval(^menu_id.length[] - ^menu_id.pos[^[])))]

^s_.menu{
	^void:sql{update ${MAIN:sql_config.table_prefix}${table_name} set order_by = '$s_.order_by' where id = '$s_.id' ^if($table_name eq "menu"){and menu_id = '$menu_id'}}
}

}

###
###
###
@edit_content[][editor_text;this]
$this[^table::sql{select title, keywords, description, h1, body, published, updated, tags from ${MAIN:sql_config.table_prefix}content where menu_id = '^form:id.int(0)'}]
$editor_text[$this.body]

<h1>Редактировать текст</h1>

<form action="${MAIN:language_prefix}/admin/submit_form_ajax/" method="post" name="edit_content" id="edit_content">

<b>Заголовок (H1)</b>:<br />
<input type="text" name="h1" value="$this.h1" size="100" /> <input type="button" name="show_more" value="МЕТА тэги" onClick="^$('#meta_tags').toggle()^;" />

<br /><br />
<b>Тэги (через запятую)</b>:<br />
<input type="text" name="tags" value="$this.tags" size="100" />

<div id="meta_tags" style="display: none">
<br />
<b>META TITLE</b>:<br />
<input type="text" name="title" value="$this.title" size="100" />
<br /><br />
<b>META KEYWORDS</b>:<br />
<input type="text" name="keywords" value="$this.keywords" size="100" />
<br /><br />
<b>META DESCRIPTION</b>:<br />
<input type="text" name="description" value="$this.description" size="100" />
</div>

<br /><br />
<b>Текст документа</b>:<br />
^use[editor.p]
$editor_name_[body]
^editor:main[${editor_name_};^if(def $form:$editor_name_){$form:$editor_name_}{$editor_text};300;]

<br /><br />

<input type="button" name="submit_edit_content_form" value="Изменить" onClick="submit_form_ajax('edit_content')" />

<input type="hidden" name="table_name" value="${MAIN:sql_config.table_prefix}content" />
<input type="hidden" name="key_name" value="menu_id" />
<input type="hidden" name="key_value" value="^form:id.int(0)" />

</form>


###
###
###
@edit_text[][editor_text]
$editor_text[^string:sql{select text_body from ${MAIN:sql_config.table_prefix}texts where text_id = '^form:id.int(0)'}[$.default{} $.limit(1) $.offset(0)]]
#^if(def $editor_text){

<h1>Редактировать текст</h1>

<form action="${MAIN:language_prefix}/admin/submit_form_ajax/" method="post" name="edit_text" id="edit_text">
^use[editor.p]
$editor_name_[text_body]
^editor:main[${editor_name_};^if(def $form:$editor_name_){$form:$editor_name_}{$editor_text};300;Basic]

<br /><br />
<input type="button" name="submit_edit_text_form" value="Изменить" onClick="submit_form_ajax('edit_text')" />

<input type="hidden" name="table_name" value="${MAIN:sql_config.table_prefix}texts" />
<input type="hidden" name="key_name" value="text_id" />
<input type="hidden" name="key_value" value="^form:id.int(0)" />

</form>

#}

###
###
###
@submit_form_ajax[][]
^if(def $form:table_name && def $form:key_name && def $form:key_value){

$fields_[^table::create{field_name	form_name}]
$files_[^table::create{field_name	form_name}]

^form:fields.foreach[field;value]{
	^if($field ne "uri" && $field ne "key_value" && $field ne "table_name" && $field ne "key_name" && $field ne "upload_dir" && $field ne "image" && $field ne "attach"){
		^fields_.append{^if(^field.left(7) eq "editor_"){^field.right(^eval(^field.length[] - 7))}{$field}	$field}
	}
	^if($field eq "parent_id"){
		$level(^int:sql{select level + 1 from $form:table_name where id = '$form:parent_id'}[$.default{1}])
	}
}

$key_value[$form:key_value]

$todo(^int:sql{select id from $form:table_name where $form:key_name = '$form:key_value'}[$.limit(1) $.offset(0) $.default{0}])
^if($todo eq "0"){
	^if($form:key_name eq "id"){
		$count_(^int:sql{select count(id) from $form:table_name}[$.default{0}])
		^if($count_ eq "0"){
			$key_value(1)
		}{
			$key_value(^int:sql{select max(id) + 1 from $form:table_name})
		}
		^void:sql{insert into $form:table_name (id) values ('$key_value')}
	}{
		^void:sql{insert into $form:table_name ($form:key_name) values ('$form:key_value')}
	}
}

^form:fields.foreach[field;value]{
	^if($form:$field is "file"){
		^files_.append{$field	$field}
		^form:$field.save[binary;^if(def $form:upload_dir){$form:upload_dir}{/files/unsorted/}${key_value}.^file:justext[$form:$field.name]]
	}
}

^fields_.menu{
	$current_[$fields_.form_name]
	^if(^files_.locate[form_name;$current_]){
		$fields_[^fields_.select($fields_.form_name ne $current_)]
	}
}

#$log[update $form:table_name set ^if(def $level){level = '$level', } ^fields_.menu{ $form_name[$fields_.form_name]$field_name[$fields_.field_name]$field_name = '$form:$form_name' }[, ] where $form:key_name = '$key_value']
#^log.save[append;/log.txt]

^void:sql{update $form:table_name set ^if(def $level){level = '$level', } ^fields_.menu{ $form_name[$fields_.form_name]$field_name[$fields_.field_name]$field_name = '$form:$form_name' }[, ] where $form:key_name = '$key_value'}

}

###
###
###
@edit_menu[][m]
^switch[$form:todo]{
	^case[create_section]{
		^if(def $form:section_id){
			$this[^table::sql{select * from ${MAIN:sql_config.table_prefix}menu where id = '$form:section_id'}]
			<h1>Редактировать раздел</h1>
		}{
			<h1>Создать новый раздел</h1>
		}

		<form action="${MAIN:language_prefix}/admin/submit_form_ajax/" method="post" name="create_section" id="create_section">
			<b>Название</b>:<br />
			<input type="text" name="menu_title" value="$this.menu_title" size="100" />
			<br /><br />
			<b>Адрес раздела</b>:<br />
			<input type="text" name="menu_uri" value="$this.menu_uri" size="100" />
			<br /><br />
			<b>Вложенность</b>:<br />
			<select name="menu_parent_id">
			<option value="0">&mdash^;</option>
				$m[^table::sql{select id, menu_title, visible from ${MAIN:sql_config.table_prefix}menu where menu_id = '^form:id.int(0)' and menu_parent_id = '0' order by order_by ASC}]
				^m.menu{
					<option value="$m.id" ^if($this.menu_parent_id eq $m.id){SELECTED}>$m.menu_title</option>
					$m_[^table::sql{select id, menu_title, visible from ${MAIN:sql_config.table_prefix}menu where menu_id = '^form:id.int(0)' and menu_parent_id = '$m.id' order by order_by ASC}]
					^if($m_){
						^m_.menu{
							<option value="$m_.id" ^if($this.menu_parent_id eq $m_.id){SELECTED}>&mdash^; $m_.menu_title</option>
						}
					}
				}
			</select>
			<br /><br />
			<b>Модуль</b>:<br />
			<select name="module">
			<option value="">&mdash^;</option>
				$modules[^file:list[/cms/classes/modules/;.p]]
				^if($modules){
					^modules.menu{
						<option value="$modules.name" ^if($this.module eq $modules.name){SELECTED}>$modules.name</option>
					}
				}
			</select>
			<br /><br />
			<b>Отображать на сайте</b>:<br />
			<select name="visible">
				<option value="1">Да</option>
				<option value="0" ^if($this.visible eq "0"){SELECTED}>Нет</option>
			</select>
			<br /><br />
			<input type="button" name="submit_edit_content_form" value="^if(def $form:section_id){Изменить}{Создать}" onClick="submit_form_ajax('create_section', 'update_modal(\'${MAIN:language_prefix}/admin/edit_menu/?id=^form:id.int(0)\')')" />
			<input type="hidden" name="table_name" value="${MAIN:sql_config.table_prefix}menu" />
			<input type="hidden" name="key_name" value="id" />
			<input type="hidden" name="menu_id" value="^form:id.int(0)" />
			<input type="hidden" name="key_value" value="^this.id.int(0)" />
		</form>
	}
	^case[DEFAULT]{

		<h1>Редактировать меню</h1>

		<input type="button" name="add_new_section" value="Создать новый раздел" onClick="update_modal('${MAIN:language_prefix}/admin/edit_menu/?id=^form:id.int(0)&todo=create_section')" />
		<br />

		$MAIN:menu[^table::sql{select id, menu_id, menu_title, menu_uri, visible from ${MAIN:sql_config.table_prefix}menu where menu_id = '^form:id.int(0)' and menu_parent_id = '0' order by order_by ASC}]
		^if($MAIN:menu){
			<ul class="sortable">
			^MAIN:menu.menu{
				<li class="ui-state-default" id="menu_^form:id.int(0)_${MAIN:menu.id}"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>$MAIN:menu.menu_title
				^if($MAIN:menu.visible eq "0"){ (скрыто) }
				<a href="javascript:dummy()" onClick="update_modal('${MAIN:language_prefix}/admin/edit_menu/?id=^form:id.int(0)&todo=create_section&section_id=$MAIN:menu.id')"><img src="/js/i/edit.png" class="admin_icon" alt="Изменить" title="Изменить" /></a>
				<a href="javascript:dummy()" onClick="please_confirm('Подтвердите удаление', 'delete_element(\'${MAIN:sql_config.table_prefix}menu\', \'id\', \'${MAIN:menu.id}\', \'menu_^form:id.int(0)_${MAIN:menu.id}\')')"><img src="/js/i/delete.png" class="admin_icon" alt="Удалить" title="Удалить" /></a>
				$MAIN:submenu[^table::sql{select id, menu_title, menu_uri, visible from ${MAIN:sql_config.table_prefix}menu where menu_id = '^form:id.int(0)' and menu_parent_id = '$MAIN:menu.id' order by order_by ASC}]
				^if($MAIN:submenu){
					<ul class="sortable">
						^MAIN:submenu.menu{
							<li class="ui-state-default_" id="menu_^form:id.int(0)_${MAIN:submenu.id}"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>$MAIN:submenu.menu_title
								<a href="javascript:dummy()" onClick="update_modal('${MAIN:language_prefix}/admin/edit_menu/?id=^form:id.int(0)&todo=create_section&section_id=$MAIN:submenu.id')"><img src="/js/i/edit.png" class="admin_icon" alt="Изменить" title="Изменить" /></a>
								<a href="javascript:dummy()" onClick="please_confirm('Подтвердите удаление', 'delete_element(\'${MAIN:sql_config.table_prefix}menu\', \'id\', \'${MAIN:submenu.id}\', \'menu_^form:id.int(0)_${MAIN:submenu.id}\')')"><img src="/js/i/delete.png" class="admin_icon" alt="Удалить" title="Удалить" /></a>
							</li>
						}
					</ul>
				}
				</li>
			}
			</ul>
		}
	}
}


###
###
###
@module[][]
$module_name[$form:id]
^if(-f "/cms/classes/modules/$module_name"){
	^use[$module_name]
	^process{^^^module_name.left(^module_name.pos[.]):admin[]}
}

###
###
###
@subscribe_email[][]
^if(def $form:email){
$now[^date::now[]]
$text[На сайте $env:HTTP_HOST запросили подписку на новости:

E-mail: $form:email

---
IP-отправителя: $env:REMOTE_ADDR
Дата и время: ^now.sql-string[]]
$html[<p>На сайте $env:HTTP_HOST запросили подписку на новости:<p>E-mail: <b>$form:email</b><p>---<br />IP-отправителя: $env:REMOTE_ADDR<br />Дата и время: ^now.sql-string[]]

^try{
	^mail:send[
		$.from[$MAIN:from_email]
		$.to[$MAIN:to_email]
		^if(def $MAIN:cc_email){$.cc[$MAIN:cc_email]}
		^if(def $MAIN:bcc_email){$.bcc[$MAIN:bcc_email]}
		$.subject[Подписка на новости с сайта millmark.ru]
		$.text[$text]
		$.html{$html}
	] 
}{
	$exception.handled(true)
	Не могу отправить почту.
}

}

