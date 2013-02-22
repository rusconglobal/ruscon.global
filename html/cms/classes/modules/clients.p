@CLASS
clients

###
###
###
@auto[]
$module_name[clients.p]
$module_title[Клиенты]
$table_name[${MAIN:sql_config.table_prefix}module_clients]

###
###
###
@short[][]
<h3>Спонсоры и партнеры</h3>

$f[^table::sql{select id, title from ${MAIN:sql_config.table_prefix}module_clients order by order_by ASC}[$.limit(10) $.offset(0)]]
^if($f){
<ul class="clients_animation_slide">
^f.menu{
	^if(-f "/files/clients${MAIN:language_prefix}/${f.id}.gif"){$filename[/files/clients${MAIN:language_prefix}/${f.id}.gif]}
	^if(-f "/files/clients${MAIN:language_prefix}/${f.id}.jpg"){$filename[/files/clients${MAIN:language_prefix}/${f.id}.jpg]}
	^if(-f "/files/clients${MAIN:language_prefix}/${f.id}.png"){$filename[/files/clients${MAIN:language_prefix}/${f.id}.png]}
	<li><img src="${filename}" alt="$f.title" title="$f.title" /></li>
}
</ul>
}


###
###
###
@index[]
	$f[^table::sql{select id, title, announce, body, published from $table_name order by order_by ASC}]
	^if($f){
	<div id="clients_list">
		<ul>
		^f.menu{
			<li>
				^if(-f "/files/clients${MAIN:language_prefix}/${f.id}.gif"){$filename[/files/clients${MAIN:language_prefix}/${f.id}.gif]}
				^if(-f "/files/clients${MAIN:language_prefix}/${f.id}.jpg"){$filename[/files/clients${MAIN:language_prefix}/${f.id}.jpg]}
				^if(-f "/files/clients${MAIN:language_prefix}/${f.id}.png"){$filename[/files/clients${MAIN:language_prefix}/${f.id}.png]}
				<img src="${filename}" alt="$f.title" title="$f.title" />
			</li>
		}
		</ul>
	</div>
	<div class="clear"></div>
	}

###
###
###
@admin[][]
^switch[$form:todo]{
	^case[add]{
		^if(def $form:key_id){
			$this[^table::sql{select * from $table_name where id = '$form:key_id'}]
			<h1>Редактировать запись</h1>
		}{
			<h1>Добавить запись</h1>
		}

		$now[^date::now[]]
		<form action="${MAIN:language_prefix}/admin/submit_form_ajax/" method="post" name="new_item" id="new_item" enctype="multipart/form-data">
			<b>Название</b>:<br />
			<input type="text" name="title" value="$this.title" size="100" />
			<br /><br />
			<b>Логотип 190х80 пикселей</b>:<br />
			<input type="file" name="logo" />
			<br /><br />
#			<b>Скан отзыва Клиента</b>:<br />
#			<input type="file" name="scan" />
#			<br /><br />
			<b>Дата публикации</b>:<br />
			<input type="text" name="published" value_="^if($this){^this.published.left(10)}{$now_[^now.sql-string[]]^now_.left(10)}" size="30" class="datapicker" />
			<br /><br />
			<b>Аннотация</b>:<br />
			^use[editor.p]
			$editor_name_[announce]
			$editor_text[$this.announce]
			^editor:main[${editor_name_};^if(def $form:$editor_name_){$form:$editor_name_}{$editor_text};100;Basic]
			<br /><br />

			<b>Текст отзыва</b>:<br />
			^use[editor.p]
			$editor_name_[body]
			$editor_text[$this.body]
			^editor:main[${editor_name_};^if(def $form:$editor_name_){$form:$editor_name_}{$editor_text};300;]
			<br /><br />

			<input type="button" name="submit_this_form" value="^if(def $form:key_id){Изменить}{Создать}" onClick="submit_form_ajax('new_item', 'update_modal(\'${MAIN:language_prefix}/admin/module/?id=${form:id}\')')" />
			<input type="hidden" name="table_name" value="${table_name}" />
			<input type="hidden" name="key_name" value="id" />
			<input type="hidden" name="key_value" value="^form:key_id.int(0)" />
			<input type="hidden" name="upload_dir" value="/files/clients/" />
		</form>
	}
	^case[DEFAULT]{
		<h1>$module_title</h1>

		<input type="button" name="add_new_question" value="Добавить запись" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add')" />
		<p />
		$f[^table::sql{select id, title, announce from $table_name order by order_by ASC}]
		^if($f){
			<ul class="sortable">
			^f.menu{
				<li class="ui-state-default" id="module_clients_${f.id}">
#					<span class="ui-icon ui-icon-arrowthick-2-n-s"></span>
					$f.title
					<a href="javascript:dummy()" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add&key_id=${f.id}')"><img src="/js/i/edit.png" class="admin_icon" alt="Изменить" title="Изменить" /></a>
					<a href="javascript:dummy()" onClick="please_confirm('Подтвердите удаление', 'delete_element(\'${table_name}\', \'id\', \'$f.id\', \'module_clients_${f.id}\')')"><img src="/js/i/delete.png" class="admin_icon" alt="Удалить" title="Удалить" /></a>
				</li>
			}
			</ul>
		}
	}
}
