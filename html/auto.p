###
###
###
@auto[]
$CLASS_PATH[^table::create{path
/cms/classes/modules/
/cms/classes/includes/
/cms/classes/}]

###
### Формируем HTTP-заголовки
###
$response:Last-Modified[^date::now[]]
$response:Expires[^date::now(+((1/24/60/60)*1))]

$request:charset[utf-8]
$response:charset[utf-8]
$response:content-type[
	$.value[text/html]
	$.charset[utf-8]
]
$response:cache-control[no-cache]

^if(^request:uri.pos[/en/] >= 0){
	$MAIN:language_prefix[/en]
	$MAIN:sql_config[^table::load[/cms/cfg/sql_en.cfg]]
}{
	$MAIN:language_prefix[]
	$MAIN:sql_config[^table::load[/cms/cfg/sql.cfg]]
}

###
### Текущая сессия
###
^if(!def $cookie:cms_session){
	$MAIN:session_id[^math:uuid[]]
	$cookie:cms_session[
		$.value[$MAIN:session_id]
		$.expires[session]
	]
}{ $MAIN:session_id[$cookie:cms_session] }

###
### Настройки
###
$MAIN:current_theme[ruscon]
^if($cookie:ruscon_is_admin eq "1" || $env:HTTP_HOST eq "ruscon"){ $MAIN:user_status(99) }
$MAIN:from_email[no-reply@ruscon.ru]
$MAIN:to_email[gynsus@yandex.ru]
#$MAIN:cc_email[]
#$MAIN:bcc_email[gynsus@yandex.ru]




###
###
###
@main[]
^use[lib.p]
^use[dtf.p]
#^use[sql.p]
^use[uri.p]
^use[templates.p]
^use[mailto.p]

^if(^uri:path_last.right(4) eq ".css"){^templates:parse_css[${MAIN:current_theme};$uri:path_last]}{^generate_page[]}




###
###
###
@generate_page[]
###
###
###
^connect[mysql://${MAIN:sql_config.login}:${MAIN:sql_config.password}@${MAIN:sql_config.host}/${MAIN:sql_config.base}?charset=utf8]{

###
### Сессии Клиентов
###
#^if(def $cookie:sid){
#	$MAIN:sid[$cookie:sid]
#	^use[users.p]
#	^users:login_from_cookie[]
#}


$repa___[^table::create{from	to
#/en/order/	/order/
href="/"	href="${MAIN:language_prefix}/"
info@ruscon.delo-group.ru	info@ruscon.gcs-group.ru}]
$rep_antispam[^table::create{from	to
#^@	<img src="{template}pics/sobaka.png" width="10" height="10" />
}]

^if(^request:uri.pos[/en/] >= 0){
	^repa___.append{подробнее	read more}
}

	$MAIN:content[^content[]]
	$MAIN:page[
		^switch[$uri:path_first]{
			^case[admin]{ ^templates:parse_template[${MAIN:current_theme};ajax] }
			^case[]{ ^templates:parse_template[${MAIN:current_theme};index] }
			^case[DEFAULT]{
				^if($request:uri eq "/clients/container_search/" || $request:uri eq "/clients/container/"){
					^templates:parse_template[${MAIN:current_theme};module]
				}{
					^templates:parse_template[${MAIN:current_theme};^if(def $MAIN:template){$MAIN:template}{default}]
				}
			}
		}
	]
	$MAIN:page[^MAIN:page.replace[$repa___]]
#	$MAIN:page[^MAIN:page.replace[$rep_antispam]]
	^mailto:crypt[$MAIN:page][html]

}
