@CLASS
qlinks

###
###
###
@auto[]
$module_name[qlinks.p]
$module_title[Быстрые ссылки]
$table_name[${MAIN:sql_config.table_prefix}qlinks]

###
###
###
@short[][]
<div id="tags_cloud">
$qlinks[^table::sql{select id, title, menu_uri, order_by, size, color from $table_name order by order_by ASC}]
^qlinks.menu{<a href="${qlinks.menu_uri}" style="color: ${qlinks.color}^; font-size: ${qlinks.size}px">$qlinks.title</a>}[ ]
</div>

###
###
###
@index[]
$MAIN:hide_index_text(1)

^if(def $form:word){
	$t[^table::sql{select id, menu_id, title, h1, body, published, updated, tags from $table_name where tags like '%^form:word.trim[]%'}]
	^if($t){
		$menu[^table::sql{select id, menu_id, menu_uri, menu_parent_id from ${MAIN:sql_config.table_prefix}menu}]

		<h1>$form:word</h1>
		$MAIN:meta_title[$form:word]

		<ol>
		^t.menu{
			<li>
				^if(^menu.locate[id;$t.menu_id]){
					^if($menu.menu_parent_id eq "0"){
						$t_uri[/${menu.menu_uri}/]
					}{
						$t_uri[/${menu.menu_uri}/]
						$parent_menu_id[$menu.menu_parent_id]
						^if(^menu.locate[id;$parent_menu_id]){
							$t_uri[/${menu.menu_uri}${t_uri}]
						}
					}
				}
				<a href="^if(def $t_uri){$t_uri}{/}">$t.h1</a><br />^untaint{^t.body.left(300)} ^if(^t.body.length[] > 300){[<a href="$t_uri">...</a>]}
			</li>
		}
		</ol>

	}{ ^404[] }

}{ ^404[] }

###
###
###
@admin[][]
<link rel="stylesheet" type="text/css" href="/js/jpicker/css/jpicker-1.1.5.min.css" />
<script src="/js/jpicker/jpicker-1.1.5.min.js" type="text/javascript"></script>

^switch[$form:todo]{
	^case[add]{
		^if(def $form:key_id){
			$this[^table::sql{select * from $table_name where id = '$form:key_id'}]
			<h1>Изменить ссылку</h1>
		}{
			<h1>Новая ссылка</h1>
		}

		<form action="${MAIN:language_prefix}/admin/submit_form_ajax/" method="post" name="create_question" id="create_question">
			<b>Название</b>:<br />
			<input type="text" name="title" value="$this.title" size="100" />
			<br /><br />

			<b>Адрес ссылки (URL)</b>:<br />
			<input type="text" name="menu_uri" value="$this.menu_uri" size="100" />
			<br /><br />

			<b>Размер шрифта</b>:<br />
			<select name="size">
				$start(12)$end(22)
				^while($start <= $end){
					<option value="$start" ^if($start eq $this.size){SELECTED}>$start</option>^start.inc[]
				}
			</select>
			<br /><br />

			<b>Цвет шрифта</b>:<br />
			<input name="color" id="colorpicker1" class="colorpicker_" type="text" value="^if(def $this.color){$this.color}{333333}" />
			<br /><br />

			<input type="button" name="submit_this_form" value="^if(def $form:key_id){Изменить}{Создать}" onClick="submit_form_ajax('create_question', 'update_modal(\'${MAIN:language_prefix}/admin/module/?id=${form:id}\')')" />
			<input type="hidden" name="table_name" value="${table_name}" />
			<input type="hidden" name="key_name" value="id" />
			<input type="hidden" name="key_value" value="^form:key_id.int(0)" />
		</form>
	}
	^case[DEFAULT]{
		<h1>$module_title</h1>

		<input type="button" name="add_new_question" value="Добавить ссылку" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add')" />
		<p />
		$f[^table::sql{select id, title, menu_uri, size, color from $table_name order by order_by ASC}]
		^if($f){
			<ul class="sortable">
			^f.menu{
				<li class="ui-state-default" id="qlinks_1_${f.id}">
					<span class="ui-icon ui-icon-arrowthick-2-n-s"></span>
					$f.title
					<a href="javascript:dummy()" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add&key_id=${f.id}')"><img src="/js/i/edit.png" class="admin_icon" alt="Изменить" title="Изменить" /></a>
					<a href="javascript:dummy()" onClick="please_confirm('Подтвердите удаление', 'delete_element(\'${table_name}\', \'id\', \'$f.id\', \'module_faq_${f.id}\')')"><img src="/js/i/delete.png" class="admin_icon" alt="Удалить" title="Удалить" /></a>
				</li>
			}
			</ul>
		}{<br />Не добавлено ни одной ссылки}
	}
}

