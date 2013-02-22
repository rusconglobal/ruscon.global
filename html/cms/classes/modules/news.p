@CLASS
news

###
###
###
@auto[]
$module_name[news.p]
$module_title[Новости]
$table_name[${MAIN:sql_config.table_prefix}module_news]

###
###
###
@index[]
$limit(7)
$offset(^eval(^eval(^form:page.int(1) - 1) * $limit))

^if(^uri:path_relast.pos[publications] >= 0 && $uri:path_relast ne $uri:path_last){
	$MAIN:hide_index_text(1)
	$news_id[^uri:path_last.left(^uri:path_last.pos[.html])]
	$f[^table::sql{select id, title, announce, body, published, updated from $table_name where id = '^news_id.int(0)'}]
	^if($f){
		<h1>$f.title</h1>
		$MAIN:meta_title[${f.title}]
		^untaint{$f.body}
		<p />^f.published.left(10)
		<div class="hr"></div>

		$f[^table::sql{select id, title, announce, body, published, updated from $table_name where id != '^news_id.int(0)' order by published DESC}[$.limit(5) $.offset(0)]]
		^if($f){
			<a href="${MAIN:language_prefix}/publications/">Смотрите также:</a>
			<ul>
				^f.menu{
					<li /><a href="${MAIN:language_prefix}/publications/${f.id}.html">$f.title</a> ^f.published.left(10)
				}
			</ul>
		}

	}{ ^404[] }
}{
	$f[^table::sql{select id, title, announce, body, published, updated from $table_name order by published DESC}[$.limit($limit) $.offset($offset)]]
	$f_total(^int:sql{select count(id) from $table_name})

	^if($f){
	<div id="faq">
		<ul>
		^f.menu{
			<li>
				<a href="${MAIN:language_prefix}/publications/${f.id}.html">$f.title</a>^if(def $f.announce){^untaint{$f.announce}}<p />^f.published.left(10)
			</li>
		}
		</ul>
	</div>

	<div class="scroller">
	^if(^f.count[] < $f_total){
		^use[scroller.p]
		$my_scroller[^scroller::init[$f_total;$limit;page]]
		^my_scroller.print[
			$.mode[html]
			$.target_url[./]
			$.nav_count(9)
			$.left_divider[|]
		]
	}
	</div>

	}{ Ни одной новости не добавлено }
}

###
###
###
@admin[][]
^switch[$form:todo]{
	^case[add]{
		^if(def $form:key_id){
			$this[^table::sql{select * from $table_name where id = '$form:key_id'}]
			<h1>Редактировать новость</h1>
		}{
			<h1>Добавить новость</h1>
		}

		$now[^date::now[]]
		<form action="${MAIN:language_prefix}/admin/submit_form_ajax/" method="post" name="create_news" id="create_news">
			<b>Название</b>:<br />
			<input type="text" name="title" value="$this.title" size="100" />
			<br /><br />
			<b>Дата публикации</b>:<br />
			<input type="text" name="published" value_="^if($this){^this.published.left(10)}{$now_[^now.sql-string[]]^now_.left(10)}" size="30" class="datapicker" />
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

			<input type="button" name="submit_this_form" value="^if(def $form:key_id){Изменить}{Создать}" onClick="submit_form_ajax('create_news', 'update_modal(\'${MAIN:language_prefix}/admin/module/?id=${form:id}\')')" />
			<input type="hidden" name="table_name" value="${table_name}" />
			<input type="hidden" name="key_name" value="id" />
			<input type="hidden" name="key_value" value="^form:key_id.int(0)" />
#			<input type="hidden" name="published" value="^now.sql-string[]" />
			<input type="hidden" name="updated" value="^now.sql-string[]" />
		</form>
	}
	^case[DEFAULT]{
		<h1>$module_title</h1>

		<input type="button" name="add_new_question" value="Добавить новость" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add')" />
		<p />
		$f[^table::sql{select id, title, announce from $table_name order by published DESC}]
		^if($f){
			<ul class="sortable_">
			^f.menu{
				<li class="ui-state-default" id="module_faq_${f.id}">
#					<span class="ui-icon ui-icon-arrowthick-2-n-s"></span>
					$f.title
					<a href="javascript:dummy()" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add&key_id=${f.id}')"><img src="/js/i/edit.png" class="admin_icon" alt="Изменить" title="Изменить" /></a>
					<a href="javascript:dummy()" onClick="please_confirm('Подтвердите удаление', 'delete_element(\'${table_name}\', \'id\', \'${f.id}\', \'module_faq_${f.id}\')')"><img src="/js/i/delete.png" class="admin_icon" alt="Удалить" title="Удалить" /></a>
				</li>
			}
			</ul>
		}{Не добавлено ни одной новости}
	}
}
