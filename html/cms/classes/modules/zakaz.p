@CLASS
zakaz

###
###
###
@auto[]
$module_name[zakaz.p]
$module_title[Отслеживание заказа]
$table_name[${MAIN:sql_config.table_prefix}module_zakaz]

###
###
###
@index[]
$auth(0)

$path_last[$uri:path_last]
^if(^path_last.pos[?] > 0){$path_last[^path_last.left(^path_last.pos[?])]}

^if(def $form:login && def $form:password){
	$MAIN:user[^table::sql{select * from ${table_name} where status = '2' and login = '$form:login' and password = '$form:password' order by id DESC}[$.limit(1) $.offset(0)]]
	^if($MAIN:user){
		$cookie:millmark_user[
			$.value[^MAIN:user.id.int(0)]
			$.expires[session]
		]
	}{
		$MAIN:user[^table::sql{select * from $table_name where status = '1' and email='$form:login' and password='$form:password' or status = '1' and login='$form:login' and password='$form:password'}[$.limit(1) $.offset(0)]]
		^if($MAIN:user){
			$cookie:millmark_user[
				$.value[^MAIN:user.id.int(0)]
				$.expires[session]
			]
		}
	}
}{
	^if(def $cookie:millmark_user){
		$MAIN:user[^table::sql{select * from $table_name where id='^cookie:millmark_user.int(0)'}[$.limit(1) $.offset(0)]]
	}
}

###
### Менеджер авторизовался
###
^if($MAIN:user.status eq "1"){
	$MAIN:hide_index_text(1)
	$auth(1)

	<h1>Отслеживание заказа</h1>
	$MAIN:meta_title[Отслеживание заказа | Личный кабинет менеджера]

	^switch[$path_last]{
		^case[logoff.html]{
			^logoff[]
		}
		^case[order_status.html]{
			$c[^table::sql{select * from ${table_name} where id = '^form:id.int(0)'}]
			$this[^table::sql{select * from ${table_name}_history where dogovor='$c.dogovor'}]

				<a href="/order/"><img src="{template}pics/button_clients_list.gif" alt="Вернуться к списку Клиентов" title="Вернуться к списку Клиентов" /></a>
				<a href="/order/logoff.html"><img src="{template}pics/button_exit.gif" alt="Выход" title="Выход" /></a>

	<table class="foxietable_">
		<tr class="row1">
			<td>Исполнитель</td>
			<td>
				$manager[^table::sql{select * from ${table_name} where id = '$c.created_by'}]
				$manager.fio
			</td>
		</tr>
		<tr class="row2">
			<td>Контактный телефон</td>
			<td>
				$manager.phone
			</td>
		</tr>
		<tr class="row1">
			<td>E-mail</td>
			<td>
				<a href="mailto:$manager.email">$manager.email</a>
			</td>
		</tr>
	</table>

	<h2>Работа с заказом $this.dogovor</h2>

	<table class="foxietable_">

		$statuses[^table::sql{select * from ${table_name}_history where dogovor = '$c.dogovor' order by published ASC}]
		^if($statuses){
			^statuses.menu{
				$tr_color[^color[row2;row1]]
				<tr class="$tr_color">
					<td>^statuses.published.left(10)</td>
					<td>$statuses.status</td>
				</tr>
			}
		}
	</table>

	<a href="javascript:dummy()" onClick="^$('#change_status_').toggle()^;"><img src="{template}pics/button_status_change.gif" alt="Изменить статус" title="Изменить статус" /></a>
	<div id="change_status_" style="display: none">
	^add_history[$c.dogovor]
	</div>



		}
		^case[edit_order.html]{
			$this[^table::sql{select * from ${table_name}_history where manager_id = '$MAIN:user.id' and id='^form:id.int(0)'}]
			^if($this){
				<a href="/order/client_id.html?id=$this.client_id"><img src="{template}pics/button_history_list.gif" alt="Все заказы Клиента" title="Все заказы Клиента" /></a>
				<a href="/order/"><img src="{template}pics/button_clients_list.gif" alt="Вернуться к списку Клиентов" title="Вернуться к списку Клиентов" /></a>
				<a href="/order/logoff.html"><img src="{template}pics/button_exit.gif" alt="Выход" title="Выход" /></a>

				$client[^table::sql{select id, fio, phone, email, status, company, password, created_by from $table_name where created_by = '$MAIN:user.id' and id = '^this.client_id.int(0)'}]
				<h2>Изменить параметры заказа</h2>
				^add_new_order_form[$client.id]
			}
		}
		^case[new_order.html]{
			<a href="/order/"><img src="{template}pics/button_clients_list.gif" alt="Вернуться к списку Клиентов" title="Вернуться к списку Клиентов" /></a>
			<a href="/order/logoff.html"><img src="{template}pics/button_exit.gif" alt="Выход" title="Выход" /></a>

			$client[^table::sql{select id, fio, phone, email, status, company, password, created_by from $table_name where created_by = '$MAIN:user.id' and id = '^form:id.int(0)'}]
			<h2>${client.fio}. Новый заказ</h2>

			^add_new_order_form[$client.id]

		}
		^case[client_id.html]{
			$this[^table::sql{select * from $table_name where created_by = '$MAIN:user.id' and id = '^form:id.int(0)'}]
			<p />
				<a href="/order/"><img src="{template}pics/button_clients_list.gif" alt="Вернуться к списку Клиентов" title="Вернуться к списку Клиентов" /></a>
				<a href="/order/logoff.html"><img src="{template}pics/button_exit.gif" alt="Выход" title="Выход" /></a>

			<h2>Клиент $this.fio ($this.company)</h2>

			<div class="hr"></div>

			^add_new_user_form[2]
			</div>

		}
		^case[add_new_client.html]{
			<a href="/order/"><img src="{template}pics/button_clients_list.gif" alt="Вернуться к списку Клиентов" title="Вернуться к списку Клиентов" /></a>
			<a href="/order/logoff.html"><img src="{template}pics/button_exit.gif" alt="Выход" title="Выход" /></a>

			<h2>Добавление нового Клиента</h2>
			^add_new_user_form[2]
		}
		^case[DEFAULT]{
			<p /><a href="/order/add_new_client.html"><img src="{template}pics/button_client_add.gif" alt="Добавить нового Клиента" title="Добавить нового Клиента" /></a>
			<a href="/order/logoff.html"><img src="{template}pics/button_exit.gif" alt="Выход" title="Выход" /></a>

			$f[^table::sql{select * from $table_name where created_by = '$MAIN:user.id'}]
			^if($f){
				<h2>Ваши Клиенты</h2>
				<table class="foxietable">
					<tr class="header">
						<td>Фамилия, Имя</td>
						<td>Телефон</td>
						<td>E-mail</td>
						<td>Компания</td>
						<td>Услуга</td>
						<td>Статус</td>

					</tr>
					^f.menu{
						<tr class="^color[row1;row2]">
							<td><a href="/order/client_id.html?id=$f.id" title="Редактировать персональные данные">$f.fio</a></td>
							<td>$f.phone</td>
							<td><a href="mailto:$f.email">$f.email</a></td>
							<td>$f.company</td>
							<td>$f.service</td>
							<td>
								<a href="/order/order_status.html?id=$f.id" title="Обновить статус заказа">
								$statuses[^table::sql{select id, published, status from ${table_name}_history where dogovor = '$z.dogovor' order by published DESC}]
								^if($statuses){
									$statuses.status
								}{
									Новый заказ
								}
								</a>
							</td>

						</tr>
					}
				</table>
			}			
		}
	}
}

###
### Клиент авторизовался
###
^if($MAIN:user.status eq "2"){

	^switch[$path_last]{
		^case[logoff.html]{
			^logoff[]
		}

		^case[DEFAULT]{

	$auth(1)

	$MAIN:hide_index_text(1)
	$auth(1)

	<h1>Отслеживание заказа</h1>
	$MAIN:meta_title[Отслеживание заказа]

	<a href="/order/logoff.html"><img src="{template}pics/button_exit.gif" alt="Выход" title="Выход" /></a>
	<br /><br />

#	$z[^table::sql{select id, manager_id, client_id, dogovor, description, published, status from ${table_name}_history where id = '$MAIN:dogovor.id'}]
#	^if($z){
	<table class="foxietable_">
		<tr class="row1">
			<td>Исполнитель</td>
			<td>
				$manager[^table::sql{select * from ${table_name} where id = '$MAIN:user.created_by'}]
				$manager.fio
			</td>
		</tr>
		<tr class="row2">
			<td>Контактный телефон</td>
			<td>
				$manager.phone
			</td>
		</tr>
		<tr class="row1">
			<td>E-mail</td>
			<td>
				<a href="mailto:$manager.email">$manager.email</a>
			</td>
		</tr>
	</table>

	<h2>Работа с заказом $z.dogovor</h2>

	<table class="foxietable_">

		$statuses[^table::sql{select id, published, status from ${table_name}_history where dogovor = '$MAIN:user.dogovor' order by published ASC}]
		^statuses.menu{
			$tr_color[^color[row2;row1]]
			<tr class="$tr_color">
				<td>^statuses.published.left(10)</td>
				<td>$statuses.status</td>
			</tr>
		}
	</table>

#	}

		}
	}


}


^if($auth eq "0"){

^if(def $form:login && def $form:password){
	<h2>Ошибка авторизации</h2>
}

<div id="service_order">
	<form action="$request:uri" method="post" name="zakaz_auth" id="zakaz_auth" onSubmit="submit_form('zakaz_auth')^;return false^;">
	<ul>
		<li>
			<ul>
				<li class="left_li"><span>Логин</span></li>
				<li>
					<input type="text" name="login" value="$form:login" class="input_text required" />
				</li>
			</ul>
			<div class="clear"></div>
		</li>
		<li>
			<ul>
				<li class="left_li"><span>Пароль</span></li>
				<li>
					<input type="password" name="password" value="" class="input_text required" />
				</li>
			</ul>
			<div class="clear"></div>
		</li>
		<li>
			<ul>
				<li class="left_li_">&nbsp^;</li>
				<li>
					<input type="submit" value="Войти" />
				</li>
			</ul>
		</li>
	</ul>
	</form>
</div>
}

###
###
###
@admin[][]
^switch[$form:todo]{
	^case[add]{
		^if(def $form:key_id){
			$this[^table::sql{select * from $table_name where id = '$form:key_id'}]
			<h1>Редактировать пользователя</h1>
		}{
			<h1>Добавить пользователя</h1>
		}
		^add_new_user_form[]
	}
	^case[DEFAULT]{
		<h1>$module_title</h1>

		<input type="button" name="add_new_question" value="Добавить пользователя" onClick="update_modal('/admin/module/?id=${module_name}&todo=add')" />
		<p />

		$f[^table::sql{select id, fio, phone, email from $table_name where status = '1' order by id DESC}]
		^if($f){
			<h2>Менеджеры</h2>
			<ul class="sortable_">
			^f.menu{
				<li class="ui-state-default" id="module_clients_${f.id}">
#					<span class="ui-icon ui-icon-arrowthick-2-n-s"></span>
					$f.fio
					<a href="javascript:dummy()" onClick="update_modal('/admin/module/?id=${module_name}&todo=add&key_id=${f.id}')"><img src="/js/i/edit.png" class="admin_icon" alt="Изменить" title="Изменить" /></a>
					<a href="javascript:dummy()" onClick="please_confirm('Подтвердите удаление', 'delete_element(\'${table_name}\', \'id\', \'$f.id\', \'module_clients_${f.id}\')')"><img src="/js/i/delete.png" class="admin_icon" alt="Удалить" title="Удалить" /></a>
				</li>
			}
			</ul>
		}

		$f[^table::sql{select id, fio, phone, email from $table_name where status = '2' order by id DESC}]
		^if($f){
			<h2>Клиенты</h2>
			<ul class="sortable_">
			^f.menu{
				<li class="ui-state-default" id="module_clients_${f.id}">
#					<span class="ui-icon ui-icon-arrowthick-2-n-s"></span>
					$f.fio
					<a href="javascript:dummy()" onClick="update_modal('/admin/module/?id=${module_name}&todo=add&key_id=${f.id}')"><img src="/js/i/edit.png" class="admin_icon" alt="Изменить" title="Изменить" /></a>
					<a href="javascript:dummy()" onClick="please_confirm('Подтвердите удаление', 'delete_element(\'${table_name}\', \'id\', \'$f.id\', \'module_clients_${f.id}\')')"><img src="/js/i/delete.png" class="admin_icon" alt="Удалить" title="Удалить" /></a>
				</li>
			}
			</ul>
		}
	}
}

###
###
###
@add_new_user_form[status][]
		$now[^date::now[]]
		<form action="/admin/submit_form_ajax/" method="post" name="new_item" id="new_item" enctype="multipart/form-data">
		^if(!def $status){
			<b>Статус</b>:<br />
			<select name="status" onChange="^$('#client_').toggle()^;">
				<option value="1" ^if($this.status eq "1"){SELECTED}>Менеджер</option>
				<option value="2" ^if($this.status eq "2"){SELECTED}>Клиент</option>
			</select>
			<br /><br />
		}{
			<input type="hidden" name="status" value="$status" />
		}

			<b>ФИО</b>:<br />
			<input type="text" name="fio" value="$this.fio" size="100" class="required" />
			<br /><br />

			<b>Телефон</b>:<br />
			<input type="text" name="phone" value="$this.phone" size="100" class="required" />
			<br /><br />

			<b>E-mail</b>:<br />
			<input type="text" name="email" value="$this.email" size="100" class="required" />
			<br /><br />

			<b>Логин</b>:<br />
			<input type="text" name="login" value="$this.login" size="100" class="required" />
			<br /><br />

			<b>Пароль</b>:<br />
			<input type="password" name="password" value="$this.password" size="100" class="required" />
			<br /><br />

^if(!def $status){
			<div id="client_" style="display: ^if($this.status eq "2"){block}{none}^;">
}

			<b>Название компании</b>:<br />
			<input type="text" name="company" value="$this.company" size="100" />
			<br /><br />

			<b>Услуга</b>:<br />
			$menu_select[^table::sql{select id, menu_title from ${MAIN:sql_config.table_prefix}menu where menu_parent_id = '0' and visible = '1' and menu_id = '3' order by order_by ASC}]
			<select name="service" class="input_select required">
				^menu_select.menu{
					<option value="$menu_select.menu_title" ^if($this.service eq $menu_select.menu_title){SELECTED}>$menu_select.menu_title</option>
					$menu_select_childs[^table::sql{select id, menu_title from ${MAIN:sql_config.table_prefix}menu where menu_parent_id = '$menu_select.id' and visible = '1' and menu_id = '3' order by order_by ASC}]
					^menu_select_childs.menu{
						<option value="$menu_select_childs.menu_title" ^if($this.service eq $menu_select_childs.menu_title){SELECTED}>&mdash^;&mdash^; $menu_select_childs.menu_title</option>
					}
				}
			</select>
			<br /><br />

			<b>Договор</b>:<br />
			<input type="text" name="dogovor" value="$this.dogovor" size="100" />
			<br /><br />

			^if($MAIN:user.status eq "1"){
				<input type="hidden" name="created_by" value="$MAIN:user.id" />
			}{
			<b>Менеджер</b>:<br />
			<select name="created_by">
				<option value="0">&mdash^;</option>
				$m[^table::sql{select id, fio from ${table_name} where status = '1' order by id ASC}]
				^if($m){
					^m.menu{
						<option value="$m.id" ^if($this.created_by eq $m.id){SELECTED}>$m.fio</option>
					}
				}
			</select>
			<br /><br />
			}

^if(!def $status){
			</div>
}

			<input type="button" name="submit_this_form" value="^if(def $this){Изменить}{Создать}" onClick="submit_form_ajax('new_item', ^if(!def $status){ 'update_modal(\'/admin/module/?id=${form:id}\')' }{ 'location.href=\'/order/\'' } )" />
			<input type="hidden" name="table_name" value="${table_name}" />
			<input type="hidden" name="key_name" value="id" />
			<input type="hidden" name="key_value" value="^this.id.int(0)" />
			<input type="hidden" name="upload_dir" value="clients" />
		</form>


###
###
###
@add_new_order_form[client_id;dogovor][]
		$now[^date::now[]]
		<form action="/admin/submit_form_ajax/" method="post" name="new_item" id="new_item" enctype="multipart/form-data">

		^if(def $dogovor){
			<input type="hidden" name="dogovor" value="$dogovor" />
		}{
			<b>Номер договора</b>:<br />
			<input type="text" name="dogovor" value="$this.dogovor" class="input_text required" />
			<br /><br />

			<b>Логин</b>:<br />
			<input type="text" name="login" value="$this.login" class="input_text required" />
			<br /><br />

			<b>Пароль</b>:<br />
			<input type="text" name="password" value="$this.password" class="input_text required" />
			<br /><br />
		}

		^if(def $dogovor){
			<b>Комментарий</b>:<br />
		}{
			<b>Описание услуги</b>:<br />
		}
			<textarea name="description" class="input_textarea required">^if(def $dogovor){}{$this.description}</textarea>
			<br /><br />

			<b>Дата</b>:<br />
			<input type="text" name="published" value_="^if($this){^this.published.left(10)}{$now_[^now.sql-string[]]^now_.left(10)}" size="30" class="datapicker" />
			<br /><br />

			<b>Статус</b>:<br />
			<input type="text" name="status" value="^if(def $dogovor){}{$this.status}" class="input_text required" />
			<br /><br />

		^if(def $dogovor){
		}{
			<input type="hidden" name="manager_id" value="$MAIN:user.id" />
			<input type="hidden" name="client_id" value="$client_id" />
		}

			<input type="button" name="submit_this_form" value="^if(def $this){Изменить}{Создать}" onClick="submit_form_ajax( 'new_item', 'location.href=\'/order/client_id.html?id=${client_id}\'' )" />
			<input type="hidden" name="table_name" value="${table_name}_history^if(def $dogovor){_history}" />
			<input type="hidden" name="key_name" value="id" />
		^if(def $dogovor){
			<input type="hidden" name="key_value" value="0" />
		}{
			<input type="hidden" name="key_value" value="^this.id.int(0)" />
		}
			<input type="hidden" name="upload_dir" value="clients" />
		</form>


###
###
###
@add_history[dogovor][]
$now[^date::now[]]
<form action="/admin/submit_form_ajax/" method="post" name="new_item" id="new_item" enctype="multipart/form-data">

		^if(def $dogovor){
			<input type="hidden" name="dogovor" value="$dogovor" />
		}{
			<b>Номер договора</b>:<br />
			<input type="text" name="dogovor" value="$this.dogovor" class="input_text required" />
			<br /><br />
		}


		<b>Дата</b>:<br />
		<input type="text" name="published" value_="^if($this){^this.published.left(10)}{$now_[^now.sql-string[]]^now_.left(10)}" size="30" class="datapicker" />
		<br /><br />

		<b>Статус</b>:<br />
		<input type="text" name="status" value="^if(def $dogovor){}{$this.status}" class="input_text required" />
		<br /><br />


		<input type="button" name="submit_this_form" value="Изменить" onClick="submit_form_ajax( 'new_item', 'location.href=\'/order/order_status.html?id=^form:id.int(0)\'' )" />
		<input type="hidden" name="table_name" value="${table_name}_history" />
		<input type="hidden" name="key_name" value="id" />
		<input type="hidden" name="key_value" value="0" />
		<input type="hidden" name="upload_dir" value="clients" />
</form>


###
###
###
@logoff[][]
			$MAIN:hide_index_text(1)
			$MAIN:template[ajax]
			$cookie:millmark_user[
				$.value[0]
				$.expires(-1)
			]
#			$response:refresh[
#				$.value(0)
#				$.url[/]
#			]
			$response:location[http://${env:HTTP_HOST}]

