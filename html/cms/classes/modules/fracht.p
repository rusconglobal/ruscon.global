@CLASS
fracht

###
###
###
@auto[]
$module_name[fracht.p]
$module_title[Ставки фрахта]
$table_name[${MAIN:sql_config.table_prefix}module_fracht]

###
###
###
@short[][]


###
###
###
@index[]
^if(def $form:port && def $form:destination && def $form:mode && def $form:type && $form:fracht_todo eq "1"){
	$z_[^table::load[/cms/cfg/fracht/^form:port.int(1).cfg]]
	$z[^z_.select($z_.id eq "$form:destination")]
	$column_name[${form:mode}_${form:type}]

	<h2>Цена автодоставки: $z.$column_name руб.</h2>
	<ol class="numbered_list">
		<li>Ставка действительна до конца сентября 2011г</li>
		<li>Ставки указаны без учёта НДС</li>
		<li>Для направления по ЮФО и СЗФО ставка дана до 18 тонн далее по 2000 рублей за тонну перегруза</li>
		<li>Для направления за пределами ЮФО и СЗФО ставка дана до 18 тонн далее по 2500 рублей за тонну перегруза</li>
		<li>Ставки указаны без учёта оформления ВТТ</li>
	</ol>
	<br />
	<hr />
}

<form action="$request:uri" method="post" name="fracht" id="fracht">
	<input type="hidden" id="fracht_todo" name="fracht_todo" value="0" />
	
	$f[^table::load[/cms/cfg/fracht/^form:port.int(1).cfg]]
	^f.sort{$f.title}[asc]
	<div style="margin-bottom: 10px^;">
		<div style="width: 100px^; float: left^;">Порт</div>
		<div>
			<select name="port" onChange="^$('#fracht_todo').val('0')^; ^$('#fracht').submit()^;">
				<option value="1">Новороссийск</option>
				<option value="2" ^if($form:port eq "2"){SELECTED}>Санкт-Петербург</option>
			</select>
		</div>
		<div class="clear"></div>
	</div>
	<div style="margin-bottom: 10px^;">
		<div style="width: 100px^; float: left^;">Пункт Назначения</div>
		<div>
			<select name="destination">
				^f.menu{
					<option value="$f.id">$f.title</option>
				}
			</select>
		</div>
		<div class="clear"></div>
	</div>
	<div style="margin-bottom: 10px^;">
		<div style="width: 100px^; float: left^;">Таможенный режим</div>
		<div>
			<select name="mode">
				<option value="vtt">ВТТ</option>
				<option value="gtd">ГТД</option>
			</select>
		</div>
		<div class="clear"></div>
	</div>
	<div style="margin-bottom: 10px^;">
		<div style="width: 100px^; float: left^;">Таможенный режим</div>
		<div>
			<select name="type">
				<option value="20dc">20'DC</option>
				<option value="40dc">40'DC</option>
				<option value="40hc">40'HC</option>
			</select>
		</div>
		<div class="clear"></div>
	</div>
	<div style="margin-bottom: 10px^;">
		<div style="width: 100px^; float: left^;">&nbsp^;</div>
		<div>
			<input type="button" onClick="^$('#fracht_todo').val('1')^; ^$('#fracht').submit()^;" value="Рассчитать" />
		</div>
		<div class="clear"></div>
	</div>
</form>


###
###
###
@admin[]
