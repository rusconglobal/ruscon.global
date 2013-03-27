@CLASS
spo

###
###
###
@auto[]
$module_name[spo.p]
$module_title[Специальные предложения]
$table_name[${MAIN:sql_config.table_prefix}module_spo]

###
###
###
@index[][]
index

###
###
###
@short[]
	$f[^table::sql{select id, title, body, published from $table_name order by order_by ASC}]
	^if($f){
	<div id="clients_list">
		<ul class="clients_animation_change">
		^f.menu{
			<li>
				<p>^untaint{$f.title}</p><p><b>^untaint{$f.body}</b></p>
			</li>
		}
		</ul>
	</div>
	<div class="clear"></div>
	}
^rem{
	<ul id="slide1">
	    <li> <img src="images/image-1.jpg" alt="" /></li>
	    <li> <img src="images/image-2.jpg" alt="" /></li>
	    <li> <img src="images/image-3.jpg" alt="" /></li>
	</ul>
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
			<b>Дата публикации</b>:<br />
			<input type="text" name="published" value_="^if($this){^this.published.left(10)}{$now_[^now.sql-string[]]^now_.left(10)}" size="30" class="datapicker" />
			<br /><br />
			<b>Текст</b>:<br />
			^use[editor.p]
			$editor_name_[body]
			$editor_text[$this.body]
			^editor:main[${editor_name_};^if(def $form:$editor_name_){$form:$editor_name_}{$editor_text};100;Basic]
			<br /><br />

			<input type="button" name="submit_this_form" value="^if(def $form:key_id){Изменить}{Создать}" onClick="submit_form_ajax('new_item', 'update_modal(\'${MAIN:language_prefix}/admin/module/?id=${form:id}\')')" />
			<input type="hidden" name="table_name" value="${table_name}" />
			<input type="hidden" name="key_name" value="id" />
			<input type="hidden" name="key_value" value="^form:key_id.int(0)" />
			<input type="hidden" name="upload_dir" value="clients" />
		</form>
	}
	^case[DEFAULT]{
		<h1>$module_title</h1>

		<input type="button" name="add_new_question" value="Добавить запись" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add')" />
		<p />
		$f[^table::sql{select id, title, body from $table_name order by order_by ASC}]
		^if($f){
			<ul class="sortable">
			^f.menu{
				<li class="ui-state-default" id="module_spo_${f.id}">
#					<span class="ui-icon ui-icon-arrowthick-2-n-s"></span>
					$f.title
					<a href="javascript:dummy()" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add&key_id=${f.id}')"><img src="/js/i/edit.png" class="admin_icon" alt="Изменить" title="Изменить" /></a>
					<a href="javascript:dummy()" onClick="please_confirm('Подтвердите удаление', 'delete_element(\'${table_name}\', \'id\', \'$f.id\', \'module_spo_${f.id}\')')"><img src="/js/i/delete.png" class="admin_icon" alt="Удалить" title="Удалить" /></a>
				</li>
			}
			</ul>
		}
	}
}
