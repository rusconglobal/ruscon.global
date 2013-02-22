
<span class="title">
	^if($MAIN:language_prefix eq "/en"){
		MARKET NEWS
	}{
		НОВОСТИ РЫНКА
	}
</span> 
#<img class="pic shadow radius8" src="/files/menu/4.jpg" alt="Новости рынка" title="Новости рынка" /> 
#<p> 
#<a href="/logistic/cargo/">Грузовые перевозки</a> 
#| <a href="/logistic/hranenie/">Складское хранение, перевалка и дистрибуция</a> 
#| <a href="/logistic/tamozhennoe_oformlenie/">Таможенное оформление</a> 
#| <a href="/logistic/konternizaciya/">Индустриальные решения и контейнеризация</a> 
#</p> 


$f[^table::sql{select id, title, announce, body, published, updated from ${MAIN:sql_config.table_prefix}module_publications where menu_id = '35' order by published DESC}[$.limit(5) $.offset(0)]]
^if($f){
<div id="last_news" style="width: 100%^; height: 260px^; overflow: auto^;">
	^f.menu{
		<p class="published">^f.published.left(10) | <a href="${MAIN:language_prefix}/about/news/${f.id}.html">$f.title</a></p>
		^untaint{$f.announce}
		<p><a href="${MAIN:language_prefix}/about/news/${f.id}.html">^if($MAIN:language_prefix eq "/en"){read more}{подробнее}...</a></p>
	}[
		<div class="spacer"></div>
	]
</div>
}
