@CLASS
search

###
###
###
@auto[]
$module_name[search.p]
$module_title[Поиск по сайту]
$table_name[${MAIN:sql_config.table_prefix}search]

###
###
###
@short[][]
<div id="search">
	<form action="${MAIN:language_prefix}/search/" method="post" name="search_form">
		<input type="text" name="search_string" id="search_string" value="$form:search_string" />
	</form>
</div>

###
###
###
@index[]
^if(def $form:search_string){
	^if(^form:search_string.length[] >= 3){

		$content[^table::create{id	menu_id	title	description	h1	body}]

################ Ищем в контенте
		$content_[^table::sql{select id, menu_id, title, description, h1, body, published, updated from ${MAIN:sql_config.table_prefix}content where title like '%${form:search_string}%' or description like '%${form:search_string}%' or h1 like '%${form:search_string}%' or body like '%${form:search_string}%'}]
		^if($content_){
			^content_.menu{
				^content.append{$content_.id	$content_.menu_id	$content_.title	$content_.description	$content_.h1	$content_.body}
			}
		}
################ Ищем в названиях пунктов меню
		$content_menu[^table::sql{select id, id as menu_id, menu_title as title, menu_title as h1 from ${MAIN:sql_config.table_prefix}menu where menu_title like '%${form:search_string}%'}]
		^if($content_menu){
			^content_menu.menu{
				^content.append{$content_menu.id	$content_menu.menu_id	$content_menu.title		$content_menu.h1	}
			}
		}
################ Ищем в FAQ
		$content_faq[^table::sql{select id, title, answer, published, updated from ${MAIN:sql_config.table_prefix}module_faq where title like '%${form:search_string}%' or answer like '%${form:search_string}%'}]
		^if($content_faq){
			^content_faq.menu{
				^content.append{$content_faq.id	27	$content_faq.title		$content_faq.title	$content_faq.answer}
			}
		}
################ Ищем в Информации
#		$content_info[^table::sql{select id, title, answer, published, updated from ${MAIN:sql_config.table_prefix}module_info where title like '%${form:search_string}%' or answer like '%${form:search_string}%'}]
#		^if($content_info){
#			^content_info.menu{
#				^content.append{$content_info.id	6	$content_info.title		$content_info.title	$content_info.answer}
#			}
#		}
################ Ищем в новостях
		$content_news[^table::sql{select id, title, announce, body, published, updated from ${MAIN:sql_config.table_prefix}module_news where title like '%${form:search_string}%' or announce like '%${form:search_string}%' or body like '%${form:search_string}%'}]
		^if($content_news){
			^content_news.menu{
				^content.append{$content_news.id	4	$content_news.title		$content_news.title	$content_news.announce}
			}
		}

		^if($content){
			<ol>
			^content.menu{
				<li /><a href="^uri:get_uri_by_menu_id[$content.menu_id]">^if(def $content.h1){$content.h1}{$content.title}</a><br />
				$description[^if(def $content.description){$content.description}{^content.body.left(100) [...]}]
				$description[^description.match[<([a-zA-Z]+)>][g]{}]
				$description[^description.match[</([a-zA-Z]+)>][g]{}]
				$description[^description.match[<([a-zA-Z]+) \[...\]][g]{}]
				^untaint{$description}
			}
			</ol>
		}{К сожалению, ничего не найдено. Попробуйте скорректировать поисковой запрос.}

	}{Поисковый запрос должен быть больше 2х символов.}
}

###
###
###
@admin[][]
admin
