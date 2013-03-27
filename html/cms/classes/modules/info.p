@CLASS
info

###
###
###
@auto[]
$module_name[info.p]
$module_title[Информация (info)]
$table_name[${MAIN:sql_config.table_prefix}module_info]

###
###
###
@index[]
$f[^table::sql{select id, title, question, answer, published, updated from $table_name order by order_by ASC}]
^if($f){
<div id="faq">
	<ul>
	^f.menu{
		<li>
			<a href="javascript:dummy()" onClick="change_menu('answer_${f.id}').toggle()">$f.title</a><br />^if(def $f.question){^untaint{$f.question}}
			<ul style="display: none" id="answer_${f.id}" class="answer">
				<li>^untaint{$f.answer}</li>
			</ul>
		</li>
	}
	</ul>
</div>
}{ Ни одного вопроса не создано }


###
###
###
@admin[][]
^switch[$form:todo]{
	^case[add]{
		^if(def $form:key_id){
			$this[^table::sql{select * from $table_name where id = '$form:key_id'}]
			<h1>Редактировать вопрос</h1>
		}{
			<h1>Создать новый вопрос</h1>
		}

		<form action="${MAIN:language_prefix}/admin/submit_form_ajax/" method="post" name="create_question" id="create_question">
			<b>Тема вопроса</b>:<br />
			<input type="text" name="title" value="$this.title" size="100" />
			<br /><br />
			<b>Текст вопроса</b>:<br />
			^use[editor.p]
			$editor_name_[question]
			$editor_text[$this.question]
			^editor:main[${editor_name_};^if(def $form:$editor_name_){$form:$editor_name_}{$editor_text};100;Basic]
			<br /><br />

			<b>Текст ответа</b>:<br />
			^use[editor.p]
			$editor_name_[answer]
			$editor_text[$this.answer]
			^editor:main[${editor_name_};^if(def $form:$editor_name_){$form:$editor_name_}{$editor_text};100;Basic]
			<br /><br />

			<input type="button" name="submit_this_form" value="^if(def $form:key_id){Изменить}{Создать}" onClick="submit_form_ajax('create_question', 'update_modal(\'${MAIN:language_prefix}/admin/module/?id=${form:id}\')')" />
			<input type="hidden" name="table_name" value="${table_name}" />
			<input type="hidden" name="key_name" value="id" />
			<input type="hidden" name="key_value" value="^form:key_id.int(0)" />
			<input type="hidden" name="status" value="1" />
			$now[^date::now[]]
			<input type="hidden" name="published" value="^now.sql-string[]" />
			<input type="hidden" name="updated" value="^now.sql-string[]" />
		</form>
	}
	^case[DEFAULT]{
		<h1>$module_title</h1>

		<input type="button" name="add_new_question" value="Создать новый вопрос" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add')" />
		<p />
		$f[^table::sql{select id, title, status from $table_name order by order_by ASC}]
		^if($f){
			<ul class="sortable">
			^f.menu{
				<li class="ui-state-default" id="module_info_${f.id}">
					<span class="ui-icon ui-icon-arrowthick-2-n-s"></span>
					$f.title
					<a href="javascript:dummy()" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add&key_id=${f.id}')"><img src="/js/i/edit.png" class="admin_icon" alt="Изменить" title="Изменить" /></a>
					<a href="javascript:dummy()" onClick="please_confirm('Подтвердите удаление', 'delete_element(\'${table_name}\', \'id\', \'$f.id\', \'module_info_${f.id}\')')"><img src="/js/i/delete.png" class="admin_icon" alt="Удалить" title="Удалить" /></a>
				</li>
			}
			</ul>
		}{Не добавлено ни одного вопроса}
	}
}
