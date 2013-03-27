@CLASS
cat

###
###
###
@auto[]
$module_name[cat.p]
$module_dir[/cat/]
$module_title[Каталог]
$table_name[ars_model]

###
###
###
@index[][]
$MAIN:hide_index_text(1)
^switch[^uri:path.count[]]{
	^case[3]{$good_id[$uri:path_last]^if(^good_id.pos[.html] > 0){$good_id[^good_id.left(^good_id.pos[.html])]^cat_good[$uri:path_second;$good_id]}{^404[]}}
	^case[2]{^cat_group[$uri:path_last]}
	^case[1]{^cat_index[]}
	^case[DEFAULT]{^404[]}
}

###
###
###
@cat_good[group_uri;good_id][group;good]
$group[^table::sql{select id, parent_id, title, level, uri, order_by from cat where uri = '$group_uri'}]
$good[^table::sql{select good_id as id, articul, title, description, body, options, reviews, dop, vendor_id from cat_goods where good_id = '$good_id'}]
^show_path[$group.id]
<h1>$good.title</h1>
^if(-f "/files/cat/original/${good.id}.jpg"){<img src="/files/cat/original/${good.id}.jpg" alt="$good.title" title="$good.title" /><br /><br />}
$MAIN:meta_title[$good.title]
^if(^good.body.pos[К сожалению, на данный момент мы не имеем описание данной модели] > 0){ ^untaint{$good.description} }{ ^untaint{$good.body} }
^if(def $good.options){ <hr />^untaint{$good.options} }

###
###
###
@cat_index[][]
<h1>Ударные музыкальные инструменты</h1>
$MAIN:meta_title[Ударные музыкальные инструменты]

$cat[^table::sql{select id, parent_id, title, level, uri, order_by from cat order by level ASC, order_by ASC}]
^build_cat[$cat.parent_id]

@build_cat[parent_id][c;parent_id]
$c[^cat.select($cat.parent_id eq $parent_id)]
^c.sort{$c.order_by $c.title}[asc]
^if($c){
<ul>
	^c.menu{
		<li>
		<a href="${module_dir}${c.uri}/">$c.title</a>
		^build_cat[$c.id]
		</li>
	}
</ul>
}

###
###
###
@cat_group[group_uri][group;goods]
$group[^table::sql{select id, parent_id, title, level, uri, order_by from cat where uri = '$group_uri'}]
^if(^group.count[] eq "1"){
	^show_path[$group.id]
	<h1>$group.title</h1>
	$MAIN:meta_title[$group.title]
	$goods[^table::sql{select good_id as id, articul, title, description, vendor_id from cat_goods where cat_id = '$group.id'}]
	^if($goods){
		<ul id="goods">
			^goods.menu{
				<li>
					^if(-f "/files/cat/original/${goods.id}.jpg"){
						^if(!-f "/files/cat/small/${goods.id}.jpg"){
							^build_preview[/files/cat/original/${goods.id}.jpg;/files/cat/small/${goods.id}.jpg;100]
						}
						<a href="${module_dir}${group_uri}/${goods.id}.html"><img src="/files/cat/small/${goods.id}.jpg" width="100" alt="$goods.title" title="$goods.title" /></a><br />
					}
					<a href="${module_dir}${group_uri}/${goods.id}.html">$goods.title</a><br />^untaint{$goods.description}
				</li>
			}
		</ul>
	}{
		$cat[^table::sql{select id, parent_id, title, level, uri, order_by from cat order by level ASC, order_by ASC}]
		^build_cat[$group.id]
	}
}{
	^group.count[] <-- должно быть = 1
}

###
###
###
@show_path[path_id][path]
^if(!def $MAIN:path_){
	$MAIN:path_[^table::create{id	title	uri}]
}
$path[^table::sql{select id, parent_id, title, level, uri from cat where id = '$path_id'}]
^if($path.parent_id ne "0"){
	^MAIN:path_.append{$path.id	$path.title	/cat/${path.uri}/}
	^show_path[$path.parent_id]
}{
	^build_path[$MAIN:path_]
}


###
###
###
@build_preview[source_filename;destination_filename;size;watermark][source_filename;destination_filename;size;f]
^if(def $source_filename && def $destination_filename && def $size){

$preview_size(^size.int(0))

#^if(-f "$source_filename" && def $nconvert_filename){

^file:copy[$source_filename;$destination_filename]
$destination_file[^image::measure[$destination_filename]]
#$f[^file::exec[/../cgi/nconvert;;-overwrite;-q 75;-ratio;-resize 100;-o ${destination_filename};${destination_filename}]]
$f[^file::exec[/../cgi/nconvert;;-ratio;-resize;100;100;${env:DOCUMENT_ROOT}${destination_filename}]]

#	^if($unix eq "1"){
#-wmfile;${watermark_filename};-wmflag;center
#		^if(def $watermark){
#			$f[^file::exec[$nconvert_filename;;-overwrite;-q;75;-ratio;-resize;^if($destination_file.width >= $destination_file.height){$preview_size}{ };^if($destination_file.width < $destination_file.height){$preview_size}{ };-wmfile;${watermark_filename};-wmflag;center;-o;^if($without_fullpath eq "1"){${env:DOCUMENT_ROOT}}${destination_filename};^if($without_fullpath eq "1"){${env:DOCUMENT_ROOT}}${destination_filename}]]
#		}{
#			$f[^file::exec[$nconvert_filename;;-overwrite;-q;75;-ratio;-resize;^if($destination_file.width >= $destination_file.height){$preview_size}{0};^if($destination_file.width < $destination_file.height){$preview_size}{0};-o;${destination_filename};${destination_filename}]]
#		}
#	}{
#		$f[^file::exec[$nconvert_filename;;-overwrite;-q 75;-ratio;^if($destination_file.width >= $destination_file.height){-resize $preview_size}{-resize 0 $preview_size};^if(def $watermark){-wmfile $watermark_filename};^if(def $watermark){-wmflag center};-o ^if($without_fullpath eq "1"){$env:DOCUMENT_ROOT}${destination_filename};^if($without_fullpath eq "1"){$env:DOCUMENT_ROOT}${destination_filename}]]
#	}

#}

}
