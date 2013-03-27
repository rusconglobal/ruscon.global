
<span class="title">
	^if($MAIN:language_prefix eq "/en"){
		PRESS-RELEASES
	}{
		ПРЕСС-РЕЛИЗЫ
	}
</span> 
<img class="pic shadow radius8" src="/files/menu/100.jpg" alt="Пресс-релизы" title="Пресс-релизы" /> 
#<p> 
#<a href="/logistic/cargo/">Грузовые перевозки</a> 
#| <a href="/logistic/hranenie/">Складское хранение, перевалка и дистрибуция</a> 
#| <a href="/logistic/tamozhennoe_oformlenie/">Таможенное оформление</a> 
#| <a href="/logistic/konternizaciya/">Индустриальные решения и контейнеризация</a> 
#</p> 


$f[^table::sql{select id, title, announce, body, published, updated from ${MAIN:sql_config.table_prefix}module_publications where menu_id = '15' order by published DESC}[$.limit(5) $.offset(0)]]
^if($f){
<div id="last_news" style="width: 100%^; height: 160px^; overflow: auto^;">
	^f.menu{
		<p class="published">^f.published.left(10) | <a href="/about/press/${f.id}.html">$f.title</a></p>
		^untaint{$f.announce}
		<p><a href="/about/press/${f.id}.html">^if($MAIN:language_prefix eq "/en"){read more}{подробнее}...</a></p>
	}[
		<div class="spacer"></div>
	]
</div>
}
