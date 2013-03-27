
<script type="text/javascript" src="/js/carousel/jquery.jcarousel.min.js"></script>
<link rel="stylesheet" type="text/css" href=/js/carousel/skins/tango/skin.css" />

<div id="cat_promo_container">

<div class="h1">Jardin Sacre рекомендует</div>

<ul id="cat_promo" class="jcarousel-skin-tango">
$promo[^table::sql{select id, group_id, title, description, price, vip from ${MAIN:sql_config.table_prefix}module_cat where vip = '1' order by RAND()}]
^if($promo){
	$promo_groups[^table::sql{select id, title, group_uri from ${MAIN:sql_config.table_prefix}module_catgroups where id in (^promo.menu{$promo.group_id}[, ])}]
	^promo.menu{
	^if(-f "/files/cat/photos_preview2/${promo.id}.jpg" && ^promo_groups.locate[id;$promo.group_id]){
	<li>
		<div class="promo_left"><a href="/zakaz_cvetov/$promo_groups.group_uri/${promo.id}.html"><img src="/files/cat/photos_preview1/${promo.id}.jpg" alt="$promo.title" title="$promo.title" /></a></div>
		<div class="promo_right">
			<a href="/zakaz_cvetov/$promo_groups.group_uri/${promo.id}.html">$promo.title</a><br />
			^untaint{$promo.description}<br /><br />
			<a href="javascript:dummy()" onClick="add2cart('$promo.id')"><img src="{template}pics/add2cart_small.gif" alt="Добавить в корзину" title="Добавить в корзину" class="left" /></a>
			Стоимость: <b>$promo.price</b> <img src="{template}pics/rub.gif" />
		</div>
		<div class="clear"></div>
	</li>
	}
	}
}
</ul>

</div>
