@CLASS
users

###
###
###
@auto[]
$module_name[users.p]
$module_dir[/login/]
$module_title[Авторизация]
$table_name[clients]

###
###
###
@login_from_cookie[][]
^if(def $MAIN:sid){
	$sessions[^hashfile::open[/cms/temp/sessions]]
	$sid[$MAIN:sid]
	$user_id[$sessions.$sid]
	$MAIN:user[^table::sql{select ID_cl, Ref, Descr, Code1C, ClPass, id_shop, company, company2, adress, adress2, comment, form, inn, kpp, ogrn, okpo, profil, fio, tel, mob, unic, city, email, dolg, ks, m_fio, bik, dost, date_add, m_email, fio2, rs, `in`, summa, painment2, id_price from $table_name where ID_cl = '$user_id'}]
}

###
###
###
@set_cookie[user_id][]
$sessions[^hashfile::open[/cms/temp/sessions]] 
^if(!def $cookie:sid){
	$cookie:sid[$.value[^math:uuid[]]$.expires(1)]
}
$information_string[$user_id]
$sid[$cookie:sid]
$sessions.$sid[
	$.value[$information_string]
	$.expires(2)
]


###
###
###
@logoff[][]
$cookie:sid[$.value[]$.expires(-1)]
^location[/]

###
###
###
@login[][]
<h1>Вход для Клиентов</h1>
$MAIN:meta_title[Вход для Клиентов]
$show_form(1)


^if(def $form:login && def $form:password && ^form:form_verify.int(0) eq "1"){
	$MAIN:user[^table::sql{select ID_cl, Ref, Descr, Code1C, ClPass, id_shop, company, company2, adress, adress2, comment, form, inn, kpp, ogrn, okpo, profil, fio, tel, mob, unic, city, email, dolg, ks, m_fio, bik, dost, date_add, m_email, fio2, rs, `in`, summa, painment2, id_price from $table_name where Code1C = '${form:login}' and ClPass = '${form:password}'}]
	^if(^MAIN:user.ID_cl.int(0) > 0){
		$show_form(0)
		^set_cookie[^MAIN:user.ID_cl.int(0)]
		^location[/clients/]
	}{
		<font color="red">Ошибка авторизации</font>
	}

}

^if($show_form eq "1"){
	<form action="$request:uri" method="post" name="login_form" id="login_form" >
	<div class="login cornered"><div class="padding10">
	<table width="100%" cellspacing="0" cellpadding="5" border="0">
	<tr>
		<td width="100" align="right">Логин: (*)</td>
		<td><INPUT size=50 type="text" name="login" value="$form:login" class="required" ></td>
	</tr>
	<tr>
		<td width="100" align="right">Пароль: (*)</td><td><INPUT size=50 type="password" name="password" value="" class="required"></td>
	</tr>
	<tr>
		<td width="100" align="right">&nbsp^;</td><td><input type="button" name="submit_login_form" value="войти" onClick="submit_form('login_form')" /></td>
	</tr>
	</table>
	</div></div>
	</form>
}


###
###
###
@index[][]

###
##
###
@register[][]
$show_form(1)

^if($form:profil eq "Юридическое лицо"){
	^if(
		def $form:family2 &&
		def $form:name2 && 
		def $form:otch2 && 
		def $form:email && 
		def $form:tel && 
		def $form:mob && 
		def $form:forma && 
		def $form:company && 
		def $form:adress && 
		def $form:inn && 
		def $form:kpp && 
		def $form:ogrn && 
		def $form:rs && 
		def $form:in && 
		def $form:ks && 
		def $form:bik &&
		def $form:dolg && 
		def $form:family && 
		def $form:name && 
		def $form:otch && 
		def $form:dost && 
		def $form:painment2
	){
		$show_form(0)


			$ver[^int:sql{select ID_cl from $table_name where inn = '$form:inn'}[$.default{0} $.offset(0)]]
			^if(^ver.int(0) eq "0"){
				$now[^date::now[]]
				$fio[$form:family $form:name $form:otch]
				$fio2[$form:family2 $form:name2 $form:otch2]
				$unic[^math:md5[^now.sql-string[]${fio2}${form:inn}${form:adress2}]]
				$password[^math:random(9)^math:random(9)^math:random(9)^math:random(9)^math:random(9)^math:random(9)]
				^void:sql{
					INSERT INTO clients (ClPass, city, summa, form, profil, company, company2, adress, dolg, fio, inn, kpp, ogrn, rs, `in`, ks, bik, adress2, dost, fio2, email, tel, mob, comment, date_add, unic, painment2)
                                    VALUES ('$password', '$form:city', '$form:summa', '$form:forma', '$form:profil', '$form:company', '$form:company2', '$form:adress2', '$form:dolg', '$fio', '$form:inn', '$form:kpp', '$form:ogrn', '$form:rs', '$form:in', '$form:ks', '$form:bik', '$form:adress', '$form:dost', '$fio2', '$form:email', '$form:tel', '$form:mob', '$form:comment', now(), '$unic', '$form:painment2')
				}
#				$id_cl(^string:sql{select id_cl from $table_name where unic = '$unic'}[$.default{0}])
#				^void:sql{
#					INSERT INTO clientsrg (id_cl, id_sup, id_ctlg, rg) SELECT $id_cl, id_sup, id_ctlg, rg FROM clientsrg WHERE id_cl = 11
#				}
			}

			<h1>Регистрация завершена</h1>
			$MAIN:meta_title[Регистрация завершена]

			Благодарим за обращение компанию &laquo^;Технабор&raquo^;.<br />
			На Ваш e-mail отправлена регистрационная информация.

			$html[
				<p />Благодарим за обращение компанию &laquo^;Технабор&raquo^;.<br />
				<p />Ваш логин: $form:email<br />
				Пароль: $password
			]

			^mail:send[ 
				$.from[no-reply@tehnabor.ru]
				$.to[$form:email]
#				$.bcc[]
				$.subject[Регистрация на сайте $env:SERVER_NAME]
				$.html{$html} 
			]


	}
}
^if($form:profil eq "Физическое лицо"){
	^if(
		def $form:family2 && 
		def $form:name2 && 
		def $form:otch2 && 
		def $form:email && 
		def $form:tel && 
		def $form:dost 
	){
		$show_form(0)

			$ver[^int:sql{select ID_cl from $table_name where email = '$form:email'}[$.default{0} $.offset(0)]]
			^if(^ver.int(0) eq "0"){
				$now[^date::now[]]
				$fio[$form:family $form:name $form:otch]
				$fio2[$form:family2 $form:name2 $form:otch2]
				$unic[^math:md5[^now.sql-string[]${fio2}${form:inn}${form:adress2}]]
				$password[^math:random(9)^math:random(9)^math:random(9)^math:random(9)^math:random(9)^math:random(9)]

				^void:sql{
					INSERT INTO clients (ClPass, city, summa, form, profil, company, company2, adress, dolg, fio, inn, kpp, ogrn, rs, `in`, ks, bik, adress2, dost, fio2, email, tel, mob, comment, date_add, unic, painment2)
                                    VALUES ('$password', '$form:city', '$form:summa', '$form:forma', '$form:profil', '$form:company', '$form:company2', '$form:adress2', '$form:dolg', '$fio', '$form:inn', '$form:kpp', '$form:ogrn', '$form:rs', '$form:in', '$form:ks', '$form:bik', '$form:adress', '$form:dost', '$fio2', '$form:email', '$form:tel', '$form:mob', '$form:comment', now(), '$unic', '$form:painment2')
				}
#				$id_cl(^string:sql{select id_cl from $table_name where unic = '$unic'}[$.default{0}])
#				^void:sql{
#					INSERT INTO clientsrg (id_cl, id_sup, id_ctlg, rg) SELECT $id_cl, id_sup, id_ctlg, rg FROM clientsrg WHERE id_cl = 11
#				}
				<h1>Регистрация завершена</h1>
				$MAIN:meta_title[Регистрация завершена]
				Благодарим за обращение компанию &laquo^;Технабор&raquo^;.<br />
				На Ваш e-mail отправлена регистрационная информация.
			}{
				<h1>Повторная регистрация</h1>
				$MAIN:meta_title[Повторная регистрация]
				Указанный e-mail ($form:email) уже найден в нашей базе.<br />
				$show_form(1)<br />
			}
	}
}

########################################################################################### АЦЦКАЯ ФОРМА
^if($show_form eq "1"){

<script type="text/javascript" src="{template}js/register.js"></script>

<h1>Регистрация нового Клиента</h1>
$MAIN:meta_title[Регистрация нового Клиента]

Пожалуйста корректно заполните обязательные поля формы

<form action="$request:uri" method="post" name="register_new_user" id="register_new_user" >

<div class="register cornered"><div class="padding10">

<table width="100%" cellspacing="0" cellpadding="5" border="0">
<tr>
	<td width="200" align="right">Выберите Ваш статус:</td>
	<td>
		<input CHECKED onClick="^$('.fl').hide()^; ^$('.yl').show()^;" type="radio" name="profil" value="Юридическое лицо" id="_profil1"><label for="_profil1">Юридическое лицо (ООО, ОАО, ЗАО, ИП)</label><br>
		<input onClick="^$('.yl').hide()^; ^$('.fl').show()^;" type="radio" name="profil" value="Физическое лицо" id="_profil2"><label for="_profil2">Физическое лицо</label><br>
	</td>
</tr>
<tr>
	<td align="right">Регион:</td>
	<td>
		<select size=1 type="text" name="city">
<option value="Москва">Москва</option>
<option value="Московская обл.">Московская обл.</option>
<option value="Санкт-Петербург">Санкт-Петербург</option>

<option value="Томская обл.">Томская обл.</option>
<option value="Новосибирск">Новосибирск</option>
<option value="Агинский Бурятский АО">Агинский Бурятский АО</option>
<option value="Адыгея респ.">Адыгея респ.</option>
<option value="Алтай респ.">Алтай респ.</option>
<option value="Алтайский край">Алтайский край</option>

<option value="Амурская обл.">Амурская обл.</option>
<option value="Архангельская обл.">Архангельская обл.</option>
<option value="Астраханская обл.">Астраханская обл.</option>
<option value="Башкортостан респ.">Башкортостан респ.</option>
<option value="Белгородская обл.">Белгородская обл.</option>
<option value="Брянская обл.">Брянская обл.</option>

<option value="Бурятия респ.">Бурятия респ.</option>
<option value="Владимирская обл.">Владимирская обл.</option>
<option value="Волгоградская обл.">Волгоградская обл.</option>
<option value="Вологодская обл.">Вологодская обл.</option>
<option value="Воронежская обл.">Воронежская обл.</option>
<option value="Дагестан респ.">Дагестан респ.</option>

<option value="Еврейская АО">Еврейская АО</option>
<option value="Ивановская обл.">Ивановская обл.</option>
<option value="Ингушетия респ.">Ингушетия респ.</option>
<option value="Иркутская обл.">Иркутская обл.</option>
<option value="Кабардино-Балкарская респ.">Кабардино-Балкарская респ.</option>
<option value="Калининградская обл.">Калининградская обл.</option>

<option value="Калмыкия респ.">Калмыкия респ.</option>
<option value="Калужская обл.">Калужская обл.</option>
<option value="Камчатская обл.">Камчатская обл.</option>
<option value="Карачаево-Черкесская респ.">Карачаево-Черкесская респ.</option>
<option value="Карелия">Карелия</option>
<option value="Кемеровская обл.">Кемеровская обл.</option>

<option value="Кировская обл.">Кировская обл.</option>
<option value="Коми респ.">Коми респ.</option>
<option value="Коми-Пермяцкий АО">Коми-Пермяцкий АО</option>
<option value="Корякский АО">Корякский АО</option>
<option value="Костромская обл.">Костромская обл.</option>
<option value="Краснодарский край">Краснодарский край</option>

<option value="Красноярский край">Красноярский край</option>
<option value="Курганская обл.">Курганская обл.</option>
<option value="Курская обл.">Курская обл.</option>
<option value="Ленинградская обл.">Ленинградская обл.</option>
<option value="Липецкая обл.">Липецкая обл.</option>
<option value="Магаданская обл.">Магаданская обл.</option>

<option value="Марий Эл респ.">Марий Эл респ.</option>
<option value="Минская обл.">Минская обл.</option>
<option value="Мордовия респ.">Мордовия респ.</option>
<option value="Мурманская обл.">Мурманская обл.</option>
<option value="Ненецкий АО">Ненецкий АО</option>
<option value="Нижегородская обл.">Нижегородская обл.</option>

<option value="Новгородская обл.">Новгородская обл.</option>
<option value="Новосибирская обл.">Новосибирская обл.</option>
<option value="Омская обл.">Омская обл.</option>
<option value="Оренбургская обл.">Оренбургская обл.</option>
<option value="Орловская обл.">Орловская обл.</option>
<option value="Пензенская обл.">Пензенская обл.</option>

<option value="Пермская обл.">Пермская обл.</option>
<option value="Приморский край">Приморский край</option>
<option value="Псковская обл.">Псковская обл.</option>
<option value="Ростовская обл.">Ростовская обл.</option>
<option value="Рязанская обл.">Рязанская обл.</option>
<option value="Самарская обл.">Самарская обл.</option>

<option value="Саратовская обл.">Саратовская обл.</option>
<option value="Саха (Якутия) респ.">Саха (Якутия) респ.</option>
<option value="Сахалинская обл.">Сахалинская обл.</option>
<option value="Свердловская обл.">Свердловская обл.</option>
<option value="Северная/Осетия-Алания респ.">Северная/Осетия-Алания респ.</option>
<option value="Смоленская обл.">Смоленская обл.</option>

<option value="Ставропольский край">Ставропольский край</option>
<option value="Таймырский (Долгано-Ненецкий) АО">Таймырский (Долгано-Ненецкий) АО</option>
<option value="Тамбовская обл.">Тамбовская обл.</option>
<option value="Татарстан респ.">Татарстан респ.</option>
<option value="Тверская обл.">Тверская обл.</option>
<option value="Тульская обл.">Тульская обл.</option>

<option value="Тюменская обл.">Тюменская обл.</option>
<option value="Удмуртская респ.">Удмуртская респ.</option>
<option value="Ульяновская обл.">Ульяновская обл.</option>
<option value="Усть-Ордынский Бурятский АО">Усть-Ордынский Бурятский АО</option>
<option value="Хабаровский край">Хабаровский край</option>
<option value="Хакасия респ.">Хакасия респ.</option>

<option value="Ханты-Мансийский АО">Ханты-Мансийский АО</option>
<option value="Челябинская обл.">Челябинская обл.</option>
<option value="Чеченская респ.">Чеченская респ.</option>
<option value="Читинская обл.">Читинская обл.</option>
<option value="Чувашская респ.">Чувашская респ.</option>
<option value="Чукотский АО">Чукотский АО</option>

<option value="Эвенкийский АО">Эвенкийский АО</option>
<option value="Ямало-Ненецкий АО">Ямало-Ненецкий АО</option>
<option value="Ярославская обл.">Ярославская обл.</option>
</select>
</td>
</tr>

<tr>
	<td align="right">Предполагаемый объем закупок:</td>
	<td>
		<select type="text" name="summa">
		<option value="до 25000 руб.">до 25000 руб.</option>
		<option value="от 25000 руб. до 75000 руб.">от 25000 руб. до 75000 руб.</option>
		<option value="от 75000 руб. до 125000 руб.">от 75000 руб. до 125000 руб.</option>
		<option value="от 125000 руб. до 250000 руб.">от 125000 руб. до 250000 руб.</option>
		<option value="от 250000 руб. до 375000 руб.">от 250000 руб. до 375000 руб.</option>
		<option value="от 375000 руб. до 625000 руб.">от 375000 руб. до 625000 руб.</option>
		<option value="от 625000 руб. до 1250000 руб.">от 625000 руб. до 1250000 руб.</option>
		<option value="от 1250000 руб. до 2500000 руб.">от 1250000 руб. до 2500000 руб.</option>
		<option value="от 2500000 руб. до 5000000 руб.">от 2500000 руб. до 5000000 руб.</option>
		<option value="от 5000000 руб. до 10000000 руб.">от 5000000 руб. до 10000000 руб.</option>
		<option value="свыше 10000000 руб.">свыше 10000000 руб.</option>
		</select>
	</td>
</tr>
</table>

</div></div>


<div class="padding10">
<table width="100%" cellspacing="0" cellpadding="5" border="0">
<tr>
	<td width="200" align="right">&nbsp^;</td>
	<td>
		<b>Контактное лицо</b>:
	</td>
</tr>
<tr>
	<td width="200" align="right">Фамилия: (*)</td>
	<td><INPUT size=70 type="text" name="family2" value="" class="required" ></td>
</tr>
<tr>
	<td width="200" align="right">Имя: (*)</td><td><INPUT size=70 type="text" name="name2" value="" class="required"></td>
</tr>
<tr>
	<td width="200" align="right">Отчество: (*)</td><td><INPUT size=70 type="text" name="otch2" value="" class="required"></td>
</tr>
<tr>
	<td width="200" align="right">E-mail: (*)</td><td><INPUT size=70 type="text" name="email" value="" class="required"></td>
</tr>
<tr>
	<td width="200" align="right">Контактный телефон: (*)</td><td><INPUT size=70 type="text" name="tel" value="" class="required"></td>
</tr>
<tr>
	<td width="200" align="right">Мобильный телефон:</td><td><INPUT size=70 type="text" name="mob" value=""></td>
</tr>
</table>
</div>


<div class="register_ cornered yl"><div class="padding10">
<table width="100%" cellspacing="0" cellpadding="5" border="0">
<tr>
	<td width="200" align="right">Наименование организации: (*)</td>
	<td>
		<select type="text" name="forma" class="requiredyur">
			<option value="">&mdash^;</option>
			<option value="ООО">ООО</option>
			<option value="ОАО">ОАО</option>
			<option value="ЗАО">ЗАО</option>
			<option value="ИП">ИП</option>
		</select>
		&nbsp^;
		<INPUT type="text" size="57" name="company" value="" class="requiredyur">
	</td>
</tr>
<tr>
	<td width="200" align="right">Юридический адрес: (*)</td>
	<td>
		         <textarea name="adress" rows="5" cols="50" class="requiredyur"></textarea>
	</td>
</tr>
<tr>
	<td width="200" align="right">ИНН: (*)</td><td><INPUT size=70 type="text" name="inn" value="" class="requiredyur"></td>
</tr>
<tr>
	<td width="200" align="right">КПП: (*)</td><td><INPUT size=70 type="text" name="kpp" value="" class="requiredyur"></td>
</tr>
<tr>
	<td width="200" align="right">ОГРН: (*)</td><td><INPUT size=70 type="text" name="ogrn" value="" class="requiredyur"></td>
</tr>
<tr>
	<td width="200" align="right">Р/С: (*)</td><td><INPUT size=70 type="text" name="rs" value="" class="requiredyur"></td>
</tr>
<tr>
	<td width="200" align="right">Банк: (*)</td><td><INPUT size=70 type="text" name="in" value="" class="requiredyur"></td>
</tr>
<tr>
	<td width="200" align="right">К/С: (*)</td><td><INPUT size=70 type="text" name="ks" value="" class="requiredyur"></td>
</tr>
<tr>
	<td width="200" align="right">БИК: (*)</td><td><INPUT size=70 type="text" name="bik" value="" class="requiredyur"></td>
</tr>
<tr>
	<td width="200" align="right">Должность: (*)</td>
	<td>
		<select type="text" name="dolg" class="requiredyur">
		<option value="">&mdash^;</option>
		<option value="Коммерческий директор">Коммерческий директор</option>
		<option value="Генеральный директор">Генеральный директор</option>
		</select>
	</td>
</tr>
<tr>
	<td width="200" align="right">Фамилия: (*)</td>
	<td><INPUT size=70 type="text" name="family" value="" class="requiredyur"></td>
</tr>
<tr>
	<td width="200" align="right">Имя: (*)</td><td><INPUT size=70 type="text" name="name" value="" class="requiredyur"></td>
</tr>
<tr>
	<td width="200" align="right">Отчество: (*)</td><td><INPUT size=70 type="text" name="otch" value="" class="requiredyur"></td>
</tr>

</table>
</div></div>




<div class="padding10">
<table width="100%" cellspacing="0" cellpadding="5" border="0">
<tr>
	<td width="200" align="right">Доставка: (*)</td>
	<td>
		<select size=1 type="text" name="dost" class="required">
			<option value="">&mdash^;</option>
			<option value="Самовывоз с нашего склада">Самовывоз с нашего склада</option>
			<option value="Доставка по указанному адресу">Доставка по указанному адресу</option>
		</select>
	</td>
</tr>
<tr class="yl">
	<td width="200" align="right">Вид оплаты: (*)</td>
	<td>
		<select size=1 type="text" name="painment2" class="requiredyur">
			<option value="">&mdash^;</option>
			<option value="наличный">наличными</option>
			<option value="безналичный">безналичный расчет</option>
		</select>
	</td>
</tr>
<tr>
	<td width="200" align="right">Фактический почтовый адрес<br /><small>(Будет использован как адрес доставки)</small>:</td>
	<td>
		<textarea name="adress2" rows="5" cols="55"></textarea>
	</td>
</tr>
</table>
</div>


<div class="register__ cornered"><div class="padding10">
<table width="100%" cellspacing="0" cellpadding="5" border="0">
<tr>
	<td width="200" align="right">&nbsp^;</td>
	<td>
		<input type="button" name="submit_form_button" value="Отправить заявку" onClick="if( ^$('#_profil1').attr('checked') == true ) { submit_register_form_yur() } else { submit_register_form_fiz() }" />
	</td>
</tr>
</table>
</div></div>


</form>

}
