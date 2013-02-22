@CLASS
publications

###
###
###
@auto[]
$module_name[publications.p]
$module_title[Публикации]
$table_name[${MAIN:sql_config.table_prefix}module_publications]

###
###
###
@short[][]
$f[^table::sql{select id, title, announce, body, published, updated from $table_name where menu_id = '2' order by published DESC}[$.limit(5) $.offset(0)]]
^if($f){
<div id="last_publications">
	<ul>
	^f.menu{
		<li>
			<a href="^uri:get_uri_by_menu_id[2]${f.id}.html">$f.title</a>^if(def $f.announce){^untaint{$f.announce}}
#<p />^f.published.left(10)
		</li>
	}
	</ul>
</div>
}

###
###
###
@index[]
$limit(7)
$offset(^eval(^eval(^form:page.int(1) - 1) * $limit))

^if(^uri:path_last.pos[.html] > 0){
	$MAIN:hide_index_text(1)
	$publication_id[^uri:path_last.left(^uri:path_last.pos[.html])]
	$f[^table::sql{select id, title, announce, body, published, updated from $table_name where id = '^publication_id.int(0)'}]
	^if($f){
		<h1>$f.title</h1>
		^if(^request:uri.pos[/news/] >= 0){<p /><i>^normalize_date[^f.published.left(10)]</i><br />}
		$MAIN:meta_title[${f.title}]

		^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.jpg]] }
		^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.jpeg]] }
		^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.gif]] }
		^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.png]] }
		^if(def $filename){
					$MAIN:left_image[$filename]
		}

#$repa___[^table::create{from	to
#/files/publications/	/files/publications/sm/}]
#			^if(!-f "^filename.replace[$repa___]"){
#				^use[photos.p]
#				^photos:build_preview[$filename;^filename.replace[$repa___];200]
#			}
#			<a href="$filename" rel="lightbox"><img src="^filename.replace[$repa___]" width="200" style="float: left^; padding-right: 10px^; padding-bottom: 10px^;" alt="$f.title" title="$f.title" /></a>

		^untaint{$f.body}

		$filename[]
		^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.pdf]] }
		^if(def $filename){
		$file_stat[^file::stat[$filename]]
		<br />
			<a href="${filename}" target="_blank"><img src="/js/i/file.png" width="16" height="16" style="float: left^; padding-right: 10px^; padding-bottom: 10px^;" alt="Скачать прикрепленный файл" title="Скачать прикрепленный файл" /></a>
			<a href="${filename}" target="_blank">Скачать прикрепленный файл (^file:justext[$filename], ^eval($file_stat.size / 1000)[%.0d] Кб )</a>
		}

#		<br /><br />
#		<hr />
#		$f[^table::sql{select id, title, announce, body, published, updated from $table_name where id != '^publication_id.int(0)' and menu_id = '$MAIN:menu_id' order by published DESC}[$.limit(5) $.offset(0)]]
#		^if($f){
#			<a href="^uri:get_uri_by_menu_id[$MAIN:menu_id]">Смотрите также:</a>
#			<ul>
#				^f.menu{
#					<li /><a href="^uri:get_uri_by_menu_id[$MAIN:menu_id]${f.id}.html">$f.title</a> (<i>^normalize_date[^f.published.left(10)]</i>)
#				}
#			</ul>
#		}

	}{ ^404[] }
}{
	$f[^table::sql{select id, title, announce, body, published, updated from $table_name where menu_id = '$MAIN:menu_id' order by published DESC}[$.limit($limit) $.offset($offset)]]
	$f_total(^int:sql{select count(id) from $table_name where menu_id = '$MAIN:menu_id'})

	^if(^f.count[] < $f_total){
	<div class="scroller">
		^use[scroller.p]
		$my_scroller[^scroller::init[$f_total;$limit;page]]
		^my_scroller.print[
			$.mode[html]
			$.target_url[./]
			$.nav_count(9)
			$.left_divider[|]
		]
	</div>
	}

	^if($f){
#	<div id="faq">
#		<ul>
		^f.menu{
			<li style="list-style: none^; margin-bottom: 20px^;">
#				$filename[]
#				^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.jpg]] }
#				^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.jpeg]] }
#				^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.gif]] }
#				^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.png]] }
#				^if(def $filename){
#				}
#$repa___[^table::create{from	to
#/files/publications/	/files/publications/sm2/}]
#					^if(!-f "^filename.replace[$repa___]"){
#						^use[photos.p]
#						^photos:build_preview[$filename;^filename.replace[$repa___];100]
#					}
#					<a href="^uri:get_uri_by_menu_id[$MAIN:menu_id]${f.id}.html"><img src="^filename.replace[$repa___]" width="100" style="float: left^; padding-right: 10px^; padding-bottom: 10px^;" alt="$f.title" title="$f.title" /></a>

#				^if(^request:uri.pos[/news/] >= 0){<i>^normalize_date[^f.published.left(10)]</i><br />}
#				<a href="^uri:get_uri_by_menu_id[$MAIN:menu_id]${f.id}.html">$f.title</a>
#				<br />^if(def $f.announce){^untaint{$f.announce}}

				^if(^request:uri.pos[/news/] >= 0){<p /><i>^normalize_date[^f.published.left(10)]</i><br />}
				<b>$f.title</b>
#				<a href="^uri:get_uri_by_menu_id[$MAIN:menu_id]${f.id}.html" style="text-decoration: none^;"><h2>$f.title</h2></a>
#				<span class="date">12 августа 2011 года</span>
$rep_announce[^table::create{from	to
<p>	
</p>	}]
				$announce[^untaint{$f.announce}]
				$announce[^announce.replace[$rep_announce]]
				<p>$announce<br /><a href="^uri:get_uri_by_menu_id[$MAIN:menu_id]${f.id}.html">подробнее...</a></p>

#			</li>
		}
#		</ul>
#	</div>
#	<div class="clear"></div>


	^if(^f.count[] < $f_total){
	<div class="scroller">
		^use[scroller.p]
		$my_scroller[^scroller::init[$f_total;$limit;page]]
		^my_scroller.print[
			$.mode[html]
			$.target_url[./]
			$.nav_count(9)
			$.left_divider[|]
		]
	</div>
	}

	}{ Ни одной публикации не добавлено }
}

###
###
###
@admin[][]

^switch[$form:todo]{
	^case[add]{
		<input type="button" name="question_list" value="Список публикаций" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&menu_id=${form:menu_id}')" />
		<p />

		^if(def $form:key_id){
			$this[^table::sql{select * from $table_name where id = '$form:key_id'}]
			<h1>Редактировать публикацию</h1>
		}{
			<h1>Добавить публикацию</h1>
		}

		$now[^date::now[]]
		<form action="${MAIN:language_prefix}/admin/submit_form_ajax/" method="post" name="create_publication" id="create_publication" enctype="multipart/form-data">

			<b>Раздел</b>:<br />
			<select name="menu_id">
			<option value="0">&mdash^;</option>
				$m[^table::sql{select id, menu_title, visible from ${MAIN:sql_config.table_prefix}menu where menu_parent_id = '0' order by order_by ASC}]
				^m.menu{
					<option value="$m.id" ^if(def $form:menu_id){ ^if($m.id eq $form:menu_id){SELECTED} }{ ^if($this.menu_id eq $m.id){SELECTED} }>$m.menu_title</option>
					$m_[^table::sql{select id, menu_title, visible from ${MAIN:sql_config.table_prefix}menu where menu_parent_id = '$m.id' order by order_by ASC}]
					^if($m_){
						^m_.menu{
							<option value="$m_.id" ^if(def $form:menu_id){ ^if($m_.id eq $form:menu_id){SELECTED} }{ ^if($this.menu_id eq $m_.id){SELECTED} }>&mdash^; $m_.menu_title</option>
						}
					}
				}
			</select>
			<br /><br />

			<b>Название</b>:<br />
			<input type="text" name="title" value="$this.title" size="100" />
			<br /><br />
			<b>Дата публикации</b>:<br />
			<input type="text" name="published" value_="^if($this){^this.published.left(10)}{$now_[^now.sql-string[]]^now_.left(10)}" size="30" class="datapicker" />
			<br /><br />
			<table cellspacing="0" cellpadding="0">
			<tr>
			<td>
				<b>Иллюстрация</b>:<br />
				<input type="file" name="image" />
			</td>
			<td>
				<b>Прикрепить файл</b>:<br />
				<input type="file" name="attach" />
			</td>
			<td>
				<b>VIP-публикация</b>:<br />
				<select name="vip">
					<option value="0" ^if($this.vip eq "0"){SELECTED}>Нет</option>
					<option value="1" ^if($this.vip eq "1"){SELECTED}>Да</option>
				</select>
			</td>
			</tr>
			</table>
			<br /><br />
			<b>Анонс</b>:<br />
			^use[editor.p]
			$editor_name_[announce]
			$editor_text[$this.announce]
			^editor:main[${editor_name_};^if(def $form:$editor_name_){$form:$editor_name_}{$editor_text};100;Basic]
			<br /><br />

			<b>Текст</b>:<br />
			^use[editor.p]
			$editor_name_[body]
			$editor_text[$this.body]
			^editor:main[${editor_name_};^if(def $form:$editor_name_){$form:$editor_name_}{$editor_text};300;]
			<br /><br />

			<input type="button" name="submit_this_form" value="^if(def $form:key_id){Изменить}{Создать}" onClick="submit_form_ajax('create_publication', 'update_modal(\'${MAIN:language_prefix}/admin/module/?id=${form:id}&menu_id=${form:menu_id}\')')" />
			<input type="hidden" name="table_name" value="${table_name}" />
			<input type="hidden" name="key_name" value="id" />
			<input type="hidden" name="key_value" value="^form:key_id.int(0)" />
			<input type="hidden" name="published" value="^now.sql-string[]" />
			<input type="hidden" name="updated" value="^now.sql-string[]" />
			<input type="hidden" name="upload_dir" value="/files/publications/" />
		</form>
	}
	^case[DEFAULT]{
		<h1>$module_title</h1>

		<input type="button" name="add_new_question" value="Добавить публикацию" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add&menu_id=${form:menu_id}')" />
		<p />
		$f[^table::sql{select id, title, announce, published, vip from $table_name where menu_id = '$form:menu_id' order by published DESC}]
		^if($f){
			<ul class="sortable_">
			^f.menu{
				<li class="ui-state-default" id="module_faq_${f.id}">
#					<span class="ui-icon ui-icon-arrowthick-2-n-s"></span>

					$filename[]
					^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.jpg]] }
					^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.jpeg]] }
					^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.gif]] }
					^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.png]] }
					^if(def $filename){
						<a href="${filename}" target="_blank"><img src="/js/i/photo.png" class="admin_icon" alt="Добавлена фотография" title="Добавлена фотография" /></a>
					}{ <img src="/js/i/photo_.png" class="admin_icon" /> }

					$filename[]
					^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.pdf]] }
					^if(def $filename){
						<a href="${filename}" target="_blank"><img src="/js/i/file.png" class="admin_icon" alt="Добавлен файл" title="Добавлен файл" /></a>
					}{ <img src="/js/i/file_.png" class="admin_icon" /> }

					<img src="/js/i/vip^if($f.vip eq "0"){_}.png" class="admin_icon" alt="VIP публикация" title="VIP публикация" /></a>

					$f.title | ^normalize_date[^f.published.left(10)]

					<a href="javascript:dummy()" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add&key_id=${f.id}&menu_id=${form:menu_id}')"><img src="/js/i/edit.png" class="admin_icon" alt="Изменить" title="Изменить" /></a>
					<a href="javascript:dummy()" onClick="please_confirm('Подтвердите удаление', 'delete_element(\'${table_name}\', \'id\', \'${f.id}\', \'module_faq_${f.id}\')')"><img src="/js/i/delete.png" class="admin_icon" alt="Удалить" title="Удалить" /></a>
				</li>
			}
			</ul>
		}{Не добавлено ни одной публикации}
	}
}
