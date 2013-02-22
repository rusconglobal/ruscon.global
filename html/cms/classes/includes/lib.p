###########################################################################
# $Id: lib.p,v 1.65 2006/06/16 10:36:54 misha Exp $
###########################################################################

##  @color[sColor1;sColor2]			every odd call return $sColor1, every even - $sColor2
##  @include[sFileName]				load and process file $sFileName
##  @trim[sText;sChar]				cut trailing and leading chars $sChar (whitespaces by default) for string $sText
##  @image[sFileName;sAttr]			print <img src="..." width="..." height="..." $sAttr /> if file with $sFileName exist
##  @image_size[sFileName]			print width="" height="" with sizes for image if that image exist
##  @file_copy[sFileFrom;sFileTo]	coping file $sFileFrom to $sFileTo
##  @file_size[sFileName;hName;sDivider]	print string with file size
##  @dir_copy[sDirFrom;sDirTo;params]		copy directory $sDirFrom to $sDirTo
##  @href[sUrl;sLabel;sAttr]		print link to $sUrl with attributes $sAttr if $sUrl specified, otherwise just print $sLabel
##  @location[sUrl;hParam]			make $response:location to $sUrl, and set flag for prevent cacheing
##  @is_email[sEmail]				check email format
##  @createTreeHash[tData;sKey]		make hash of tables from the table
##  @node2str[nNode;sRootTag]		print $nNode as string (something like ^xdoc.string[])
##  @doc2str[xDoc]					print $xDoc as string removing xml declaration
##  @dec2bin[iNum;iLength]			print $iNum as a decimal string
##  @run_time[jCode;sVarName]		calculate time/memory usage while running $jCode code
##  @setExpireHeaders[date]			set response headers Last-Modified/Expires for prevent caching by browsers
##  @getParserVersion[]				return hash with parser version fields
##  @foreach[hash;key;value;code;separator;direction]	operator look over all hash element with specified order
##  @number_format[sNumber;sThousandDivider;sDecimalDivider;iFracLength]	print number with thousand and decimal delimiters

##  @getIconPathByExt[sFileExt;sIconSuffix]
##  @getIconByExt[sFileExt;sIconSuffix;sImageAttr]
##  @getIconByFile[sFileName;sIconSuffix;sImageAttr]


###
###
###
@normalize_date[date][date;temp]
$temp[^dtf:create[$date]]
$result[^dtf:format[%d %h %Y;$temp;^if($MAIN:language_prefix eq "/en"){$dtf:ei-locale}{$dtf:rr-locale}]]

###
###
###
@build_path[path][path]
^if($path){
<div id="path">
	<div class="path_home"><a href="/"><img src="/cms/templates/drums/pics/home.gif" alt="Главная страница" title="Главная страница" /></a></div>
	<div class="path_arrow"><img src="/cms/templates/drums/pics/arrow.gif" /></div>
	<div class="path_home"><a href="/cat/">Ударные музыкальные инструменты</a></div>
	<div class="path_arrow"><img src="/cms/templates/drums/pics/arrow.gif" /></div>
	^path.sort(^path.line[])[desc]
	^path.menu{
		<div class="path_link">^if(def $path.uri){<a href="$path.uri">}$path.title^if(def $path.uri){</a>}</div>
	}[<div class="path_arrow"><img src="/cms/templates/drums/pics/arrow.gif" /></div>]
	<div class="clear"></div>
</div>
}

@format_price[temp]
^if(^temp.pos[,] > 0){$temp[^temp.left(^temp.pos[,])]}
$temp[^reverse_string[$temp]]
$i(0)$i_(1)
$temp_[^while($i < ^temp.length[]){^temp.mid($i;1)^if($i_ eq 3){ $i_(0)}^i.inc[]^i_.inc[]}]
$result[^reverse_string[$temp_] <span class="rur">p<s>]


@reverse_string[temp][temp;temp_]
^if(def $temp){
	$temp_[]
	$i(0)
	^while($i <= ^temp.length[]){
		$temp_[${temp_}^temp.mid(^eval(^temp.length[] - $i);1)]
		^i.inc[]
	}
	$result[$temp_]
}


@num_decline[num;nominative;genitive_singular;genitive_plural]
^if($num > 10 && (($num % 100) \ 10) == 1){
        $result[$genitive_plural]
}{
        ^switch($num % 10){
                ^case(1){$result[$nominative]}
                ^case(2;3;4){$result[$genitive_singular]}
                ^case(5;6;7;8;9;0){$result[$genitive_plural]}
        }
}

###########################################################################
# every odd call return $sColor1, every even - $sColor2
# call without parameters will reset sequence
@color[sColor1;sColor2]
^if(!def $iColorSwitcher || (!def $sColor1 && !def $sColor2)){$iColorSwitcher(0)}
$iColorSwitcher($iColorSwitcher !| 1)
$result[^if($iColorSwitcher & 1){$sColor2}{$sColor1}]
#end @color[]



###########################################################################
# load and process file $sFileName
@include[sFileName][fFile]
^if(def $sFileName && -f $sFileName){
	$fFile[^file::load[text;$sFileName]]
	^if(def $caller.self){
		$result[^process[$caller.self]{^taint[as-is][$fFile.text]}]
	}{
#		backward compatibility
		$result[^process{^taint[as-is][$fFile.text]}]
	}
}{
	$result[]
}
#end @include[]



###########################################################################
# cut trailing and leading chars $sChar (whitespaces by default) for string $sText
# for parser 3.1.2 or higher ^string.trim[] would be better
@trim[sText;sChar][tbl]
^if(def $sText){
	^if(!def $sChar){$sChar[\s]}
	$sText[^sText.match[^^$sChar*][]{}]
	$tbl[^sText.match[^^(.*[^^$sChar])$sChar*^$]]
	$result[$tbl.1]
}{
	$result[]
}
#end @trim[]



###########################################################################
# measure and print width="" height="" with sizes for image if that image exist
@image_size[sFileName][fImage]
^if(def $sFileName && -f $sFileName){
	$fImage[^image::measure[$sFileName]]
	$result[ width="$fImage.width" height="$fImage.height" ]
}{
	$result[]
}
#end @image_size[]



###########################################################################
# print <img src="..." width="..." height="..." $sAttr /> if file with $sFileName exist
@image[sFileName;sAttr][fImage]
^if(def $sFileName && -f $sFileName){
	$fImage[^image::measure[$sFileName]]
	$result[<img src="$fImage.src" width="$fImage.width" height="$fImage.height"^if(def $sAttr){ $sAttr} />]
}{
	$result[]
}
#end @image[]



###########################################################################
# print string with file size. bytes/KB/MB texts and delimiter can be overrided
@file_size[sFileName;hName;sDivider][fFile]
^if(def $sFileName && -f $sFileName){
	^if(!$hName){$hName[$.b[вЎ©]$.kb[ЛЃ]$.mb[НЃ]]}
	$fFile[^file::stat[$sFileName]]
	^if($fFile.size < 1000){
		$result[$fFile.size $hName.b]
	}{
		^if($fFile.size < 1000000){
			$result[^eval($fFile.size/1024)[%.1f] $hName.kb]
		}{
			$result[^eval($fFile.size/1048576)[%.1f] $hName.mb]
		}
	}
	$result[^result.match[\.0(\s)][]{$match.1}]
	^if(def $sDivider){
		$result[^result.match[\.][]{$sDivider}]
	}
}{
	$result[]
}
#end @file_size[]



###########################################################################
# coping file $sFileFrom to $sFileTo
@file_copy[sFileFrom;sFileTo][fFile]
^if(def $sFileFrom && -f $sFileFrom && def $sFileTo && $sFileFrom ne $sFileTo){
	$fFile[^file::load[binary;$sFileFrom]]
	^fFile.save[binary;$sFileTo]
}
$result[]
#end @file_copy[]



###########################################################################
# copy directory $sDirFrom to $sDirTo
# with $.is_recursive(1) all subdirectories will be copyed as well
@dir_copy[sDirFrom;sDirTo;hParam][tFileList]
^if(def $sDirFrom && -d $sDirFrom && def $sDirTo && $sDirFrom ne $sDirTo){
	$tFileList[^file:list[$sDirFrom]]
	^tFileList.menu{
		^if($hParam.is_recursive && -d "$sDirFrom/$tFileList.name"){
			^dir_copy[$sDirFrom/$tFileList.name;$sDirTo/$tFileList.name;$hParam]
		}
		^if(-f "$sDirFrom/$tFileList.name"){
			^file_copy[$sDirFrom/$tFileList.name;$sDirTo/$tFileList.name]
		}
	}
}
$result[]
#end @dir_copy[]



###########################################################################
# print link to $sUrl with attributes $sAttr if $sUrl specified, otherwise just print $sLabel
@href[sUrl;sLabel;sAttr]
^if(!def $sLabel){$sLabel[$sUrl]}
^if(def $sUrl){
	$result[<a href="$sUrl"^if(def $sAttr){ $sAttr}>$sLabel</a>]
}{
	$result[$sLabel]
}
#end @href[]



###########################################################################
# make $response:location to $sUrl, and set flag for prevent cacheing
@location[sUrl;hParam]
^if(def $sUrl){
#$response:location[http://${env:SERVER_NAME}${sUrl}]
$response:refresh[ 
   $.value(0) 
   $.url[$sUrl] 
]
}
$result[]
#end @location[]



###########################################################################
# check email format
@is_email[sEmail]
$result(^if(def $sEmail && ^sEmail.pos[@] > 0 && ^sEmail.match[^^\w+([.-]?\w+)+\@\w+([.-]?\w+)*\.[a-z]{2,4}^$][i]){1}{0})
#end @is_email[]



###########################################################################
# print $nNode as string (something like ^xdoc.string[])
@node2str[nNode;sRootTag][xDoc;nCurrent;_tmp]
$xDoc[^xdoc::create{<?xml version="1.0" encoding="$request:charset" ?><^if(def $sRootTag){$sRootTag}{dummy-parent-tag} />}}]
$nCurrent[$nNode.firstChild]
^while($nCurrent){
	$_tmp[^xDoc.documentElement.appendChild[^xDoc.importNode[$nCurrent](1)]]
	$nCurrent[$nCurrent.nextSibling]
}
$result[^doc2str[$xDoc]]
^if(!def $sRootTag){
	$result[^result.match[</?dummy-parent-tag.*?>][g]{}]
}
#end @node2str[]



###########################################################################
# print $xDoc as string removing xml declaration
@doc2str[xDoc]
$result[^trim[^xDoc.string[
    $.omit-xml-declaration[yes]
]]]
$result[^result.match[<!DOCTYPE[^^>]+>][i]{}]
#end @doc2str[]



###########################################################################
# print $iNum as a decimal string
@dec2bin[iNum;iLength][i]
$i(1 << (^iLength.int(24)-1))
$result[^while($i>=1){^if($iNum & $i){1}{0}$i($i >> 1)}]
#end @dec2bin[]



###########################################################################
# make hash of tables from the table. if $sKey not specified 'parent_id' column will used
@createTreeHash[tData;sKey][tEmpty]
^if($tData is "table"){
	^if(!def $sKey){
		$sKey[parent_id]
	}
	^try{
		$result[^tData.hash[$sKey][$.distinct[tables]]]
	}{
		^rem{ *** for old parser versions do it ourself *** }
		$exception.handled(1)
		$result[^hash::create[]]
		$tEmpty[^table::create[$tData][$.limit(0)]]
		^tData.menu{
			^if(!$result.[$tData.$sKey]){$result.[$tData.$sKey][^table::create[$tEmpty]]}
			^result.[$tData.$sKey].join[$tData][$.offset[cur]$.limit(1)]
		}
	}
}{
	$result[^hash::create[]]
}
#end @createTreeHash[]



###########################################################################
# print number with thousand and decimal delimiters
@number_format[sNumber;sThousandDivider;sDecimalDivider;iFracLength][iTriadCount;iSign;tPart;sIntegerPart;sMantissa;sNumberOut;iMantLength;tIncomplTriad;iZeroCount;sZero]
$iSign(^math:sign($sNumber))
$tPart[^sNumber.split[.][lh]]
$sIntegerPart[^eval(^math:abs($tPart.0))[%.0f]]
$sMantissa[$tPart.1]
$iMantLength(^sMantissa.length[])
$iFracLength(^iFracLength.int($iMantLength))
^if(!def $sThousandDivider){
	$sThousandDivider[&nbsp^;]
}

^if(^sIntegerPart.length[] > 4){
	$iIncomplTriadLength(^sIntegerPart.length[] % 3)
	^if($iIncomplTriadLength){
		$tIncomplTriad[^sIntegerPart.match[^^(\d{$iIncomplTriadLength})(\d*)]]
		$sNumberOut[$tIncomplTriad.1]
		$sIntegerPart[$tIncomplTriad.2]
		$iTriadCount(1)
	}{
		$sNumberOut[]
		$iTriadCount(0)
	}
	$sNumberOut[$sNumberOut^sIntegerPart.match[(\d{3})][g]{^if($iTriadCount){$sThousandDivider}$match.1^iTriadCount.inc(1)}]
}{
	$sNumberOut[$sIntegerPart]
}

$result[^if($iSign < 0){-}$sNumberOut^if($iFracLength > 0){^if(def $sDecimalDivider){$sDecimalDivider}{,}^sMantissa.left($iFracLength)$iZeroCount($iFracLength-^if(def $sMantissa)($iMantLength)(0))^if($iZeroCount > 0){$sZero[0]^sZero.format[%0${iZeroCount}d]}}]
#end @number_format[]



###########################################################################
# operator look over all hash element with specified order
@foreach[hash;key;value;code;separator;direction][_keys;_int]
^if($hash is "hash"){
	$direction[^if(def $direction){$direction}{asc}]
	$_keys[^hash._keys[]]
	$_int(0)
	^_keys.menu{^if(^_keys.key.int(0)){$_int(1)}}
	^if($_int){
		^_keys.sort($_keys.key)[$direction]
	}{
		^_keys.sort{$_keys.key}[$direction]
	}
	^_keys.menu{
		$caller.[$key][$_keys.key]
		$caller.[$value][$hash.[$_keys.key]]
		$code
	}[$separator]
}{
	^throw[parser.runtime;foreach;Variable must be hash]
}
#end @foreach[]



###########################################################################
# calculate time/memory usage while running $jCode code
#	.time - 'dirty' execution time (millisecond)
#	.utime - 'pure' execution time (second)
#	.memory_kb - used memory (KB)
#	.memory_block - used memory (memory blocks)
@run_time[jCode;sVarName][hBegin;hEnd]
^if(def $sVarName){
	^try{
		$hBegin[
			$.rusage[$status:rusage]
			$.memory[$status:memory]
		]
	}{
		$exception.handled(1)
	}
	$result[$jCode]
	^try{
		$hEnd[
			$.rusage[$status:rusage]
			$.memory[$status:memory]
		]
	}{
		$exception.handled(1)
	}
	$caller.[$sVarName][
		$.time((^hEnd.rusage.tv_sec.double[] - ^hBegin.rusage.tv_sec.double[])*1000 + (^hEnd.rusage.tv_usec.double[] - ^hBegin.rusage.tv_usec.double[])/1000)
		$.utime($hEnd.rusage.utime - $hBegin.rusage.utime)
		$.memory_block($hEnd.rusage.maxrss - $hBegin.rusage.maxrss)
		^if($hBegin.memory){
#			$.memory_kb($hBegin.memory.free - $hEnd.memory.free)
			$.memory_kb($hEnd.memory.used - $hBegin.memory.used)
		}
	]
}{
	$result[$jCode]
}
#end @run_time[]



###########################################################################
# set response headers Last-Modified/Expires for prevent caching by browsers
@setExpireHeaders[dtDate][_dt]
^if(def $dtDate){
	^if($dtDate is "string"){
		$_dt[^date::create[$dtDate]]
	}
	^if($dtDate is "date"){
		$_dt[^date::create($dtDate)]
	}
}
^if($_dt && $_dt < ^date::now(-7)){
	$response:Last-Modified[$_dt]
}{
	$response:expires[Fri, 23 Mar 2001 09:32:23 GMT]
	$response:cache-control[no-store, no-cache, must-revalidate, proxy-revalidate]
	$response:pragma[no-cache]
}
$result[]
#end @setExpireHeaders[]



###########################################################################
@getParserVersion[]
$result[^hash::create[]]
^if(def $env:PARSER_VERSION){
	^env:PARSER_VERSION.match[^^(\d+)\.((\d+)\.(\d+))(\S*)\s*(.*)][]{
		$result[
			$.name[$match.1]
			$.ver(^match.3.int(0))
			$.subver(^match.4.int(0))
			$.fullver(^match.2.double(0))
			$.sp[$match.5]
			$.comment[$match.6]
		]
	}
}
#end @getParserVersion[]



###########################################################################
@getIconPathByExt[sFileExt;sIconSuffix][sIconDir;sFileName]
$sIconDir[/i/icons]
$sFileName[$sIconDir/^if(def $sFileExt){^sFileExt.lower[]}${sIconSuffix}.gif]
$result[^if(def $sFileName && -f $sFileName){$sFileName}{$sIconDir/none^if(def $sIconSuffix){^sIconSuffix.lower[]}.gif}]
#end @getIconPathByExt[]



###########################################################################
@getIconByExt[sFileExt;sIconSuffix;sImageAttr]
$result[^image[^getIconPathByExt[$sFileExt;$sIconSuffix];border="0"^if(def $sImageAttr){ $sImageAttr}]]
#end @getIconByExt[]



###########################################################################
@getIconByFile[sFileName;sIconSuffix;sImageAttr]
$result[^getIconByExt[^file:justext[$sFileName];$sIconSuffix;$sImageAttr]]
#end @getIconByFile[]



###########################################################################
###########################################################################
# for backward compatibility (for a while)


###########################################################################
@default[var;dflt][v]
# works like ^default[] from parser2
# don't forget to use correct brakets: ^default{$val;$dflt}
$v[$var]
$result[^if(def $v){$v}{$dflt}]
#end @default[]



###########################################################################
@ifdef[var;def;undef][v]
# works like ^ifdef[] from parser2
# don't forget to use correct brakets: ^ifdef{$var;$def;$undef}
$v[$var]
$result[^if(def $v){$def}{$undef}]
#end @ifdef[]



###########################################################################
@is_flag[data]
$result(^if(^data.int(0)){1}{0})
#end @is_flag[]



###########################################################################
@max[inhash][tmp;max;key;value]
# return maximum hash value
$tmp[^inhash._keys[]]
$max[$tmp.key]
^inhash.foreach[key;value]{^if($value > $max){$max[$value]}}
$result[$max]
#end @max[]



###########################################################################
@load[param1;param2][named;file;f]
# works like ^load[] from parser2
# much better just use ^table::load[filename] 
^if(def $param2){
	$file[$param2]
	$named[$param1]
}{
	$file[$param1]
	$named[]
}
$f[^file:find[$file]]
^if(def $f){
	^if(def $named){
		$result[^table::load[$f]]
	}{
		$result[^table::load[nameless;$f]]
	}
}{
	$result[^table::create[nameless]{}]
}
#end @load[]



###########################################################################
@remove[in;pos;cnt;where][first;last]
# remove $cnt lines from table $in starting from line $pos
# in $where you can specify your own conditions (ex: ^remove[$tbl;2;1]{^if($tbl.a eq a4){1}{0}} )
# much better just use ^table.select(conditions)
^if(def $in){
	$first(^pos.int(0))
	$last($first+^cnt.int(1))
	$result[^in.select(((^in.line[]<$first) || (^in.line[]>=$last+$count)) && !$where)]
}{
	$result[$in]
}
#end @remove[]



###########################################################################
@getFileExt[sFileName]
# return extention for specified file
# can be usable long time ago because of ^file:justext[] was absent
$result[^file:justext[$sFileName]]
#end @getFileExt[]



###########################################################################
@imageSize[sFileName]
# backward compatibility
$result[^image_size[$sFileName]]
#end @imageSize[]



###########################################################################
@fileSize[sFileName;hName;sDivider]
# backward compatibility
$result[^file_size[$sFileName;$hName;$sDivider]]
#end @fileSize[]



###########################################################################
@macro_use[sFileName]
# works like ^macro_use[] from parser2
# can be usable only if $CLASS_PATH declared as string but not as table
^if($MAIN:CLASS_PATH is "string" && def $sFileName){
	$result[^include[$MAIN:CLASS_PATH/$sFileName]]
}{
	$result[]
}
#end @macro_use[]



###########################################################################
@nodeToStr[nNode;sRootTag]
# backward compatibility
$result[^node2str[$nNode;$sRootTag]]
#end @nodeToStr[]
