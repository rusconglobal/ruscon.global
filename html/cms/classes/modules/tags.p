@CLASS
tags

###
###
###
@auto[]
$module_name[tags.p]
$module_title[Тэги]
$table_name[${MAIN:sql_config.table_prefix}content]

###
###
###
@short[][]
<div id="tags_cloud">
$t[^table::sql{select DISTINCT tags from $table_name}]
^if($t){
	$tags[^table::create{title	colwo}]
	^t.menu{
		$t_[^t.tags.lsplit[,]]
		^t_.menu{
			^if(!^tags.locate[title;^t_.piece.trim[]]){
				^tags.append{^t_.piece.trim[]	1}
			}{
				$tags_[^tags.select($tags.title eq "^t_.piece.trim[]")]
				$tags_colwo(^tags_.colwo.int(1))^tags_colwo.inc[]
				$tags[^tags.select($tags.title ne "^t_.piece.trim[]")]
				^tags.append{^t_.piece.trim[]	$tags_colwo}
			}
		}
	}

	^if($tags){
		$tags_total(0)^tags.menu{ $tags_total($tags_total + $tags.colwo) }
		^tags.sort($tags.colwo)[asc]$tags_low($tags.colwo)
		$max_fontsize(22)
		$min_fontsize(12)
$tags_colors[^table::create{fontsize	color
12	AAAAAA
13	999999
14	888888
15	777777
16	666666
17	555555
18	444444
19	333333
20	222222
21	111111
22	000000}]

		^tags.sort{$tags.title}[asc]
		^tags.menu{
			$fontsize(12 + ^eval($tags.colwo - $tags_low))
			<a href="${MAIN:language_prefix}/tags/tag.html?word=^taint[uri][$tags.title]" style="font-size: ^if($fontsize <= $max_fontsize){$fontsize}{$max_fontsize}px^; color: ^if(^tags_colors.locate[fontsize;$fontsize]){$tags_colors.color}">$tags.title</a>
		}[&nbsp^;&nbsp^;&nbsp^;]
	}
}
</div>

###
###
###
@index[]
$MAIN:hide_index_text(1)

^if(def $form:word){
	$t[^table::sql{select id, menu_id, title, h1, body, published, updated, tags from $table_name where tags like '%^form:word.trim[]%'}]
	^if($t){
		$menu[^table::sql{select id, menu_id, menu_uri, menu_parent_id from ${MAIN:sql_config.table_prefix}menu}]

		<h1>$form:word</h1>
		$MAIN:meta_title[$form:word]

		<ol>
		^t.menu{
			<li>
				^if(^menu.locate[id;$t.menu_id]){
					^if($menu.menu_parent_id eq "0"){
						$t_uri[/${menu.menu_uri}/]
					}{
						$t_uri[/${menu.menu_uri}/]
						$parent_menu_id[$menu.menu_parent_id]
						^if(^menu.locate[id;$parent_menu_id]){
							$t_uri[/${menu.menu_uri}${t_uri}]
						}
					}
				}
				<a href="^if(def $t_uri){$t_uri}{/}">$t.h1</a><br />^untaint{^t.body.left(300)} ^if(^t.body.length[] > 300){[<a href="$t_uri">...</a>]}
			</li>
		}
		</ol>

	}{ ^404[] }

}{ ^404[] }

###
###
###
@admin[][]
admin

