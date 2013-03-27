@CLASS
gallery

###
###
###
@auto[]
$module_dir[/about/gallery/]
$module_name[gallery.p]
$module_title[Фотогалерея]
$table_name[${MAIN:sql_config.table_prefix}module_gallery]
$table_name_groups[${MAIN:sql_config.table_prefix}module_gallerygroups]
^use[photos.p]


###
###
###
@index[]
$limit(50)
$offset(^eval(^eval(^form:page.int(1) - 1) * $limit))

^if(^uri:path_last.pos[.html] > 0){

	$news_id[^uri:path_last.left(^uri:path_last.pos[.html])]
	$g[^table::sql{select id, title, description from $table_name_groups where id = '$news_id'}]
	^if($g){
		^if(^form:id.int(0) > 0){
			<a href="${module_dir}${g.id}.html"><small>&laquo^; вернуться в раздел &laquo^;$g.title&raquo^;</small></a><br />

#			$f[^table::sql{select id, title, published, updated from $table_name where group_id = '$news_id' and id = '^form:id.int(0)' order by order_by ASC}[$.limit($limit) $.offset($offset)]]
			$f[^table::sql{select id, title, published, updated from $table_name where group_id = '$news_id' order by order_by ASC}]
			^if(^f.locate[id;^form:id.int(0)]){
				<h1>$f.title</h1>
#				^if(def $g.description){<p>^untaint{$g.description}</p>}
				$MAIN:meta_title[$f.title]
				$MAIN:hide_index_text(1)

				<div style="width: 600px^; padding-top: 200px^; position: absolute^;">
				<div style="float: left">^f.offset(-1)<a href="${module_dir}${g.id}.html?id=$f.id" title="$f.title">^f.offset(+1)<img src="{template}pics/arrow_left.png" /></a></div>
				<div style="float: right">^f.offset(+1)<a href="${module_dir}${g.id}.html?id=$f.id" title="$f.title">^f.offset(-1)<img src="{template}pics/arrow_right.png" /></a></div>
				<div class="clear"></div>
				</div>


				<p>^f.offset(+1)<a href="${module_dir}${g.id}.html?id=$f.id" title="$f.title">^f.offset(-1)<img src="/files/gallery/${f.id}.jpg" alt="$f.title" title="$f.title" width="600" /></a></p>

#				<iframe src="http://www.facebook.com/plugins/like.php?app_id=262304953860738&amp^;href=^taint[uri][$request:uri]&amp^;send=false&amp^;layout=standard&amp^;width=450&amp^;show_faces=true&amp^;action=like&amp^;colorscheme=light&amp^;font&amp^;height=80" scrolling="no" frameborder="0" style="border:none^; overflow:hidden^; width:450px^; height:80px^; margin-top: 10px^;" allowTransparency="true"></iframe>
#				<div id="fb-root"></div><script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script><fb:comments href="${request:uri}" num_posts="3" width="660"></fb:comments>
				
			}{ ^404[] }
		}{
			<a href="${module_dir}"><small>&laquo^; вернуться к выбору раздела</small></a><br />

			<h1>$g.title</h1>
			^if(def $g.description){<p>^untaint{$g.description}</p>}
			$MAIN:meta_title[$g.title]
			$MAIN:hide_index_text(1)
			$f[^table::sql{select id, title, published, updated from $table_name where group_id = '$news_id' order by order_by ASC}[$.limit($limit) $.offset($offset)]]
			$f_total(^int:sql{select count(id) from $table_name where group_id = '$news_id'})
			^if($f){
			<div id="gallery">
				<ul>
				^f.menu{
				^if(-f "/files/gallery/${f.id}.jpg"){
#					^photos:build_preview[/files/gallery/${f.id}.jpg;/files/gallery/sm/${f.id}.jpg;100]
#					$f_[^image::measure[/files/gallery/sm/${f.id}.jpg]]
					^if(!-f "/files/gallery/sm/${f.id}.jpg"){ ^photos:build_preview[/files/gallery/${f.id}.jpg;/files/gallery/sm/${f.id}.jpg;100] }{
						$f_[^image::measure[/files/gallery/sm/${f.id}.jpg]]
					}
					<li ^if($f_.width > $f_.height){ class="horizontal" }>
						<p><a href="${module_dir}${g.id}.html?id=$f.id" title="$f.title"><img src="/files/gallery/sm/${f.id}.jpg" alt="$f.title" title="$f.title" width="100" /></a></p>
#						<p><a href="/files/gallery/${f.id}.jpg" title="$f.title" rel="shadowbox[Vacation]"><img src="/files/gallery/sm/${f.id}.jpg" alt="$f.title" title="$f.title" /></a></p>
						<p>$f.title</p>
					</li>
				}
				}
				</ul>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>

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
			<div class="clear"></div>

		}
	}
		
	}{ Ни одной фотографии не добавлено }

}{

#	$g[^table::sql{select id, title from $table_name_groups order by order_by ASC}]
#	^if($g){
#	<div id="gallery">
#		<ul>
#		^g.menu{
#		$f[^table::sql{select id, title, published, updated from $table_name where group_id = '$g.id' order by order_by ASC}[$.limit(1) $.offset(0)]]
#		^if(-f "/files/gallery/${f.id}.jpg"){
#			^if(!-f "/files/gallery/sm/${f.id}.jpg"){ ^photos:build_preview[/files/gallery/${f.id}.jpg;/files/gallery/sm/${f.id}.jpg;100] }{
#				$f_[^image::measure[/files/gallery/sm/${f.id}.jpg]]
#			}
#			<li ^if($f_.width > $f_.height){ class="horizontal" }>
#				<a href="${module_dir}${g.id}.html" title="$g.title"><img src="/files/gallery/sm/${f.id}.jpg" alt="$g.title" title="$g.title" /></a>
#				<div style="text-align: left^; padding-top: 10px^; font-size: 12px^; font-weight: bold^;"><a href="${module_dir}${g.id}.html">$g.title</a></div>
#			</li>
#		}
#		}
#		</ul>
#	</div>
#	}
	$g[^table::sql{select id, title, description from $table_name_groups order by order_by ASC}]
	^g.menu{
		$f[^table::sql{select id, title, published, updated from $table_name where group_id = '$g.id' order by order_by ASC}[$.limit(1) $.offset(0)]]
		^if(-f "/files/gallery/${f.id}.jpg"){
#			^photos:build_preview[/files/gallery/${f.id}.jpg;/files/gallery/sm/${f.id}.jpg;100]
#			$f_[^image::measure[/files/gallery/sm/${f.id}.jpg]]
			^if(!-f "/files/gallery/sm/${f.id}.jpg"){ ^photos:build_preview[/files/gallery/${f.id}.jpg;/files/gallery/sm/${f.id}.jpg;100] }{
				$f_[^image::measure[/files/gallery/sm/${f.id}.jpg]]
			}
			<div class="gallery_line">
				<div class="gallery_preview"><a href="${module_dir}${g.id}.html" title="$g.title"><img src="/files/gallery/sm/${f.id}.jpg" alt="$g.title" title="$g.title" width="100" /></a></div>
				<div class="gallery_info"><a href="${module_dir}${g.id}.html">$g.title</a><br />^untaint{$g.description}</div>
				<div class="clear"></div>
			</div>
		}
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

		<input type="button" name="add_new_question" value="Группы" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}')" />

		<br /><br />
		$now[^date::now[]]
		<form action="${MAIN:language_prefix}/admin/submit_form_ajax/" method="post" name="create_news" id="create_news" enctype="multipart/form-data">
			<b>Группа</b>:<br />
			$g[^table::sql{select id, title from $table_name_groups order by id ASC}]
			<select name="group_id">
				^g.menu{
					<option value="$g.id" ^if($form:group_id eq $g.id || $this.group_id eq $g.id){SELECTED}>$g.title</option>
				}
			</select>
			<br /><br />
			<b>Название</b>:<br />
			<input type="text" name="title" value="$this.title" size="100" />
			<br /><br />
			<b>Дата публикации</b>:<br />
			<input type="text" name="published" value_="^if($this){^this.published.left(10)}{$now_[^now.sql-string[]]^now_.left(10)}" size="30" class="datapicker" />
			<br /><br />
			<b>Описание</b>:<br />
			^use[editor.p]
			$editor_name_[description]
			$editor_text[$this.description]
			^editor:main[${editor_name_};^if(def $form:$editor_name_){$form:$editor_name_}{$editor_text};100;Basic]
			<br /><br />

			<b>Файл</b>:<br />
			<input type="file" name="image" />
			<br /><br />

			<input type="button" name="submit_this_form" value="^if(def $form:key_id){Изменить}{Добавить}" onClick="submit_form_ajax('create_news', 'update_modal(\'${MAIN:language_prefix}/admin/module/?id=${form:id}&todo=list&group_id=${form:group_id}\')')" />
			<input type="hidden" name="table_name" value="${table_name}" />
			<input type="hidden" name="key_name" value="id" />
			<input type="hidden" name="key_value" value="^form:key_id.int(0)" />
#			<input type="hidden" name="published" value="^now.sql-string[]" />
			<input type="hidden" name="updated" value="^now.sql-string[]" />
			<input type="hidden" name="upload_dir" value="/files/gallery/" />
		</form>
	}
	^case[DEFAULT]{
		^if(!def $form:group_id){
			^if($form:todo eq "add_group"){
				^if(def $form:key_id){
					$this[^table::sql{select * from $table_name_groups where id = '$form:key_id'}]
					<h1>Редактировать группу</h1>
				}{
					<h1>Добавить группу</h1>
				}

		<input type="button" name="add_new_question" value="Группы" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}')" />
		<input type="button" name="add_new_question" value="Добавить фотографию" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add^if(def $form:group_id){&group_id=$form:group_id}')" />
		<p />

				$now[^date::now[]]
				<form action="${MAIN:language_prefix}/admin/submit_form_ajax/" method="post" name="create_news" id="create_news" enctype="multipart/form-data">
					<b>Название</b>:<br />
					<input type="text" name="title" value="$this.title" size="100" />
					<br /><br />
#					<b>Дата публикации</b>:<br />
#					<input type="text" name="published" value_="^if($this){^this.published.left(10)}{$now_[^now.sql-string[]]^now_.left(10)}" size="30" class="datapicker" />
#					<br /><br />
					<b>Описание</b>:<br />
					^use[editor.p]
					$editor_name_[description]
					$editor_text[$this.description]
					^editor:main[${editor_name_};^if(def $form:$editor_name_){$form:$editor_name_}{$editor_text};100;Basic]
					<br /><br />
#					<b>Файл</b>:<br />
#					<input type="file" name="image" />
#					<br /><br />
					<input type="button" name="submit_this_form" value="^if(def $form:key_id){Изменить}{Добавить}" onClick="submit_form_ajax('create_news', 'update_modal(\'${MAIN:language_prefix}/admin/module/?id=${form:id}\')')" />
					<input type="hidden" name="table_name" value="${table_name_groups}" />
					<input type="hidden" name="key_name" value="id" />
					<input type="hidden" name="key_value" value="^form:key_id.int(0)" />
					<input type="hidden" name="published" value="^now.sql-string[]" />
					<input type="hidden" name="updated" value="^now.sql-string[]" />
					<input type="hidden" name="upload_dir" value="/files/gallery/" />
				</form>
			}{
				<h1>Группы</h1>

		<input type="button" name="add_new_question" value="Группы" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}')" />
		<input type="button" name="add_new_question" value="Добавить фотографию" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add^if(def $form:group_id){&group_id=$form:group_id}')" />
		<p />

				$g[^table::sql{select id, title from $table_name_groups order by order_by ASC}]
				^if($g){
					<ul class="sortable">
					^g.menu{
						<li class="ui-state-default" id="module_gallerygroups_${g.id}">
							$g.title
							<a href="javascript:dummy()" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=list&group_id=${g.id}')"><img src="/js/i/goods.png" class="admin_icon" alt="Открыть" title="Открыть" /></a>
							<a href="javascript:dummy()" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add_group&key_id=${g.id}')"><img src="/js/i/edit.png" class="admin_icon" alt="Редактировать" title="Редактировать" /></a>
							<a href="javascript:dummy()" onClick="please_confirm('Подтвердите удаление', 'delete_element(\'${table_name_groups}\', \'id\', \'${g.id}\', \'module_gallerygroups_${g.id}\')')"><img src="/js/i/delete.png" class="admin_icon" alt="Удалить" title="Удалить" /></a>
						</li>
					}
					</ul>
				}
				<br />
				<input type="button" name="add_new_question" value="Добавить группу" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add_group')" />
			}
		}{
				<h1>$module_title</h1>
				<input type="button" name="add_new_question" value="Группы" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}')" />
				<input type="button" name="add_new_question" value="Добавить фотографию" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add&group_id=$form:group_id')" />
				<p />
				$f[^table::sql{select id, title from $table_name where group_id = '^form:group_id.int(0)' order by order_by ASC}]
				^if($f){
					<ul class="sortable">
					^f.menu{
						<li class="ui-state-default" id="module_gallery_${f.id}">
#							<span class="ui-icon ui-icon-arrowthick-2-n-s"></span>
							$f.title
							<a href="javascript:dummy()" onClick="update_modal('${MAIN:language_prefix}/admin/module/?id=${module_name}&todo=add&key_id=${f.id}')"><img src="/js/i/edit.png" class="admin_icon" alt="Изменить" title="Изменить" /></a>
							<a href="javascript:dummy()" onClick="please_confirm('Подтвердите удаление', 'delete_element(\'${table_name}\', \'id\', \'$f.id\', \'module_gallery_${f.id}\')')"><img src="/js/i/delete.png" class="admin_icon" alt="Удалить" title="Удалить" /></a>
						</li>
					}
					</ul>
				}{<br />Не добавлено ни одной фотографии}
		}
	}
}

