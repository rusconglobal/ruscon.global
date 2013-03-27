@CLASS
people

###
###
###
@auto[]
$module_name[people.p]
$module_title[Сборная команда]
$table_name[${MAIN:sql_config.table_prefix}module_people]
$module_dir[/sbornaya/]

###
###
###
@index[]
$temp_uri[$request:uri]
^switch[$temp_uri]{
	^case[/sbornaya/]{
#		$now[^date::now[]]
#		$first_year[$now.year - 24]
#where RIGHT(birthdate, 4) <= $first_year
		$f[^table::sql{select id, programm, fio, birthdate, zvanie, fso, city, okrug, trener, result1, result2 from $table_name order by fio ASC}]
		^if($f){
			<div id="peoples">
			^f.menu{
				<div class="people">
					<div class="people_image">
#^f.birthdate.right(4)
						<a href="${module_dir}id_${f.id}/"><img src="{template}pics/nofoto.gif" alt="$f.fio" title="$f.fio" /></a>
					</div>
					<div class="people_title"><a href="${module_dir}id_${f.id}/">$f.fio</a></div>
				</div>
			}
			<div class="clear"></div>
			</div>
		}
	}
	^case[DEFAULT]{
		^if(^uri:path_second.left(3) eq "id_"){
			$id[^uri:path_second.right(^eval(^uri:path_second.length[] - 3))]
			$f[^table::sql{select id, programm, fio, birthdate, zvanie, fso, city, okrug, trener, result1, result2 from $table_name where id = '$id'}]
			^if($f){
				$MAIN:hide_index_text(1)

				<img src="{template}pics/nofoto_big.gif" style="float: left^; padding-right: 20px^; padding-bottom: 20px^;" />

				<h1>$f.fio</h1>
				$MAIN:meta_title[$f.fio]

				<table class="people_table" cellspacing="1" cellpadding="5">
				<tr>
					<td class="people_table_td1">Вид программы:</td>
					<td>$f.programm</td>
				</tr>
				<tr>
					<td class="people_table_td1">Дата рождения</td>
					<td>$f.birthdate</td>
				</tr>
				<tr>
					<td class="people_table_td1">Спортивное или почетное спортивное звание</td>
					<td>$f.zvanie</td>
				</tr>
				<tr>
					<td class="people_table_td1">Физкультурно спортивное общество, ФОИВ</td>
					<td>$f.fso</td>
				</tr>
				<tr>
					<td class="people_table_td1">Субъект РФ, город</td>
					<td>$f.city</td>
				</tr>
				<tr>
					<td class="people_table_td1">Федеральный округ РФ</td>
					<td>$f.okrug</td>
				</tr>
				<tr>
					<td class="people_table_td1">Личный тренер</td>
					<td>$f.trener</td>
				</tr>
				<tr>
					<td class="people_table_td1">Высший результат сезона на МС</td>
					<td>$f.result1</td>
				</tr>
				<tr>
					<td class="people_table_td1">Высший результат сезона на ВС</td>
					<td>$f.result2</td>
				</tr>
				</table>

				<div class="clear"></div>

				$f_[^table::sql{select id, programm, fio, birthdate, zvanie, fso, city, okrug, trener, result1, result2 from $table_name order by fio ASC}]
				^if(^f_.locate[id;$f.id]){
					<table width="100%" cellspacing="0" cellpadding="0" border="0" style="padding-top: 20px^; ">
					<tr>
					<td width="50%" align="left">
						^f_.offset(-1)
						&laquo^; <a href="${module_dir}id_${f_.id}/">$f_.fio</a>
					</td>
					<td width="50%" align="right">
						^f_.offset(+2)
						<a href="${module_dir}id_${f_.id}/">$f_.fio</a> &raquo^;
					</td>
					</tr>
					</table>
				}


			}{ ^404[] }
		}{ ^404[] }
	}
}

###
###
###
@admin[][]
^switch[$form:todo]{
	^case[add]{
		^if(def $form:key_id){
			$this[^table::sql{select * from $table_name where id = '$form:key_id'}]
			<h1>Редактировать фотографию</h1>
		}{
			<h1>Добавить фотографию</h1>
		}

		$now[^date::now[]]
		<form action="${MAIN:language_prefix}/admin/submit_form_ajax/" method="post" name="create_news" id="create_news" enctype="multipart/form-data">
			<b>Название</b>:<br />
			<input type="text" name="title" value="$this.title" size="100" />
			<br /><br />
			<b>Дата публикации</b>:<br />
			<input type="text" name="published" value_="^if($this){^this.published.left(10)}{$now_[^now.sql-string[]]^now_.left(10)}" size="30" class="datapicker" />
			<br /><br />
			<b>Описание</b>:<br />
			^use[editor.p]
			$editor_name_[description]
			$editor_text[$this.announce]
			^editor:main[${editor_name_};^if(def $form:$editor_name_){$form:$editor_name_}{$editor_text};100;Basic]
			<br /><br />

			<b>Файл</b>:<br />
			<input type="file" name="image" />
			<br /><br />

			<input type="button" name="submit_this_form" value="^if(def $form:key_id){Изменить}{Добавить}" onClick="submit_form_ajax('create_news', 'update_modal(\'${MAIN:language_prefix}/admin/module/?id=${form:id}\')')" />
			<input type="hidden" name="table_name" value="${table_name}" />
			<input type="hidden" name="key_name" value="id" />
			<input type="hidden" name="key_value" value="^form:key_id.int(0)" />
#			<input type="hidden" name="published" value="^now.sql-string[]" />
			<input type="hidden" name="updated" value="^now.sql-string[]" />
			<input type="hidden" name="upload_dir" value="gallery" />
		</form>
	}
	^case[DEFAULT]{
		<h1>$module_title</h1>

		<input type="button" name="add_new_question" value="Добавить спортсмена" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add')" />
		<p />
		$f[^table::sql{select id, fio from $table_name order by fio ASC}]
		^if($f){
			<ul class="sortable_">
			^f.menu{
				<li class="ui-state-default" id="module_gallery_${f.id}">
#					<span class="ui-icon ui-icon-arrowthick-2-n-s"></span>
					$f.fio
					<a href="javascript:dummy()" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add&key_id=${f.id}')"><img src="/js/i/edit.png" class="admin_icon" alt="Изменить" title="Изменить" /></a>
					<a href="javascript:dummy()" onClick="please_confirm('Подтвердите удаление', 'delete_element(\'${table_name}\', \'id\', \'$f.id\', \'module_faq_${f.id}\')')"><img src="/js/i/delete.png" class="admin_icon" alt="Удалить" title="Удалить" /></a>
				</li>
			}
			</ul>
		}{Не добавлено ни одного спортсмена}
	}
}
