@CLASS
ajax

###
###
###
@auto[]
$module_name[ajax.p]
$module_dir[/ajax/]
$module_title[AJAX]
$table_name[_cart]

###
###
###
@main[]
$MAIN:template[ajax]
^switch[$uri:path_second]{
	^case[show_cart]{
		^use[cat.p]
		^cat:ajax_cart[]
	}
	^case[editcart]{
		^if(def $form:id && def $form:code && def $form:supp && def $form:colwo){
			^if(^form:colwo.int(0) eq "0"){
				^void:sql{delete from $table_name where Ref = '$form:id' and PartNumber = '$form:code' and Supplier = '$form:supp' and session_id = '$MAIN:session_id'}
				<center><img src="{template}pics/icon_no.png" /><br /> Товар был удален из корзины</center>
			}{
				^void:sql{update $table_name set colwo = '^form:colwo.int(0)' where Ref = '$form:id' and PartNumber = '$form:code' and Supplier = '$form:supp' and session_id = '$MAIN:session_id'}
				<center><img src="{template}pics/icon_.png" /><br /> Количество изменено</center>
			}
		}
	}
	^case[updatecart]{
		^use[cat.p]
		^cat:small_cart[]
	}
	^case[add2cart]{
		^if(def $cookie:cms_session && def $form:id){
			$package(^int:sql{select Package from _goods where Ref = '$form:id' and PartNumber = '$form:code' and Supplier = '$form:supp'}[$.default{1}])
			^if(^package.int(0) eq "0"){$package(1)}

			$ver[^string:sql{select Ref from $table_name where session_id = '$cookie:cms_session' and Ref = '$form:id' and PartNumber = '$form:code' and Supplier = '$form:supp'}[$.default{0}]]
			^if($ver eq "0"){
				^void:sql{insert into $table_name (session_id, Ref, PartNumber, Supplier, Manufacturer, ManufacturerId, colwo, datetime) values ('$cookie:cms_session', '$form:id', '$form:code', '$form:supp', '$form:manuf', '$form:manufid', '$package', now())}
				<center><img src="{template}pics/icon_yes.png" /><br /> Товар был добавлен в корзину</center>
			}{
				<center><img src="{template}pics/icon_.png" /><br /> Товар уже присутствует в корзине</center>
			}
		}{ ^ajax_404[] }
	}
	^case[DEFAULT]{^ajax_404[]}
}


###
###
###
@ajax_404[]
404
