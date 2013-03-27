$limit(4)
$offset(0)
$table_name[cms_module_publications]
$MAIN:menu_id[1]
$f[^table::sql{select id, title, announce, body, published, updated from $table_name where menu_id = '${MAIN:menu_id}' and vip = '1' order by published DESC}[$.limit($limit) $.offset($offset)]]
$f_[^f.select(^f.line[] ne "1")]

<table width="100%" cellspacing="0" cellpadding="0">
<tr>
<td width="380" valign="top">
	$filename[]
	^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.jpg]] }
	^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.jpeg]] }
	^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.gif]] }
	^if(!def $filename){ $filename[^file:find[/files/publications/${f.id}.png]] }
	^if(def $filename){
$repa___[^table::create{from	to
/files/publications/	/files/publications/sm_index/}]
		^if(!-f "^filename.replace[$repa___]"){
			^use[photos.p]
			^photos:build_preview[$filename;^filename.replace[$repa___];380]
		}
		<div class="news_index_image" style="background-image: url('^filename.replace[$repa___]')^; cursor: pointer^;" onClick="location.href='^uri:get_uri_by_menu_id[$MAIN:menu_id]${f.id}.html'"></div>
		<div class="news_index_title"><div class="padding10">
			<a href="^uri:get_uri_by_menu_id[$MAIN:menu_id]${f.id}.html">^f.title.trim[]</a> <nobr><i>^normalize_date[^f.published.left(10)]</i></nobr>
		</div></div>
#		<div class="news_index_image"><a href="^uri:get_uri_by_menu_id[$MAIN:menu_id]${f.id}.html"><img src="^filename.replace[$repa___]" width="380" alt="$f.title" title="$f.title" /></a></div>
		<div class="news_index_description">^untaint{$f.announce}</div>
	}
</td>
<td width="10">&nbsp;</td>
<td valign="top" bgcolor="#d3e2eb">
<div class="padding10">
	<h2>Новости лыжного спорта</h2>
	<ul id="news_index_list">
	^f_.menu{
		<li>
			$filename[]
			^if(!def $filename){ $filename[^file:find[/files/publications/${f_.id}.jpg]] }
			^if(!def $filename){ $filename[^file:find[/files/publications/${f_.id}.jpeg]] }
			^if(!def $filename){ $filename[^file:find[/files/publications/${f_.id}.gif]] }
			^if(!def $filename){ $filename[^file:find[/files/publications/${f_.id}.png]] }
			^if(def $filename){
$repa___[^table::create{from	to
/files/publications/	/files/publications/sm3/}]
				^if(!-f "^filename.replace[$repa___]"){
					^use[photos.p]
					^photos:build_preview[$filename;^filename.replace[$repa___];60]
				}
				<a href="^uri:get_uri_by_menu_id[$MAIN:menu_id]${f_.id}.html"><img src="^filename.replace[$repa___]" width="60" alt="$f_.title" title="$f_.title" /></a>
			}

			<i>^normalize_date[^f_.published.left(10)]</i><br />
			<a href="^uri:get_uri_by_menu_id[$MAIN:menu_id]${f_.id}.html">$f_.title</a><br />
			^untaint{$f_.announce}
		</li>	
	}
	</ul>
</div>
</td>
</tr>
</table>
