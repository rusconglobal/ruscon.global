###
###
###
@CLASS
photos

@auto[]

###
###
###
@main[]

###
###
###
@build_preview[source_filename;destination_filename;size;size2][source_filename;destination_filename;size]
^if(def $source_filename && def $destination_filename && def $size){
$preview_size(^size.int(0))
^if(-f "/../cgi-bin/nconvert.exe"){$nconvert_filename[/../cgi-bin/nconvert.exe]}
^if(-f "/../../cgi-bin/nconvert.exe"){$nconvert_filename[/../../cgi-bin/nconvert.exe]}
^if(-f "/../../../cgi-bin/nconvert.exe"){$nconvert_filename[/../../../cgi-bin/nconvert.exe]}
^if(-f "/../cgi-bin/nconvert"){$nconvert_filename[/../cgi-bin/nconvert]}

^if(-f "$source_filename" && def -f "$nconvert_filename"){
#	^file:copy[$source_filename;$destination_filename]
#	$destination_file[^image::measure[$destination_filename]]
#${env:DOCUMENT_ROOT}/
	^if(def $size2){
		$f[^file::load[binary;http://preview.bfg.su/?source_filename=http://ruscon.gcs-group.ru${source_filename};$.timeout(10)]]
		^f.save[binary;$destination_filename]
#		$f[^file::exec[$nconvert_filename;;-ratio;-q;90;-rtype;lanczos;-resize;80;0;-overwrite;${env:DOCUMENT_ROOT}/${destination_filename}]]
#		$f[^file::exec[$nconvert_filename;;-jpegcrop;10;10;$size2;$size2;-overwrite;${env:DOCUMENT_ROOT}/${destination_filename}]]
	}{
		$f[^file::load[binary;http://preview.bfg.su/?source_filename=http://ruscon.gcs-group.ru${source_filename};$.timeout(10)]]
		^f.save[binary;$destination_filename]
#		$f[^file::exec[$nconvert_filename;;-ratio;-q;90;-rtype;lanczos;-resize;${preview_size};0;-overwrite;${env:DOCUMENT_ROOT}/${destination_filename}]]
	}
}

}


###
###
###
@find_picture[dir;name][filename]
^if(-d "${dir}"){
	$filename[]
	^if(-f "${dir}${name}.jpg"){$filename[${dir}${name}.jpg]}
	^if(-f "${dir}${name}.JPG"){^file:move[${dir}${name}.JPG;${dir}${name}.jpg]$filename[${dir}${name}.jpg]}
	^if(-f "${dir}${name}.gif"){$filename[${dir}${name}.gif]}
	^if(-f "${dir}${name}.GIF"){^file:move[${dir}${name}.GIF;${dir}${name}.gif]$filename[${dir}${name}.jpg]}
	^if(-f "${dir}${name}.png"){$filename[${dir}${name}.png]}
	^if(-f "${dir}${name}.PNG"){^file:move[${dir}${name}.PNG;${dir}${name}.png]$filename[${dir}${name}.png]}
	^if(-f "${dir}${name}.jpeg"){^file:move[${dir}${name}.jpeg;${dir}${name}.jpg]$filename[${dir}${name}.jpg]}
	^if(-f "${dir}${name}.JPEG"){^file:move[${dir}${name}.JPEG;${dir}${name}.jpg]$filename[${dir}${name}.jpg]}
	$result[^if(def $filename){$filename}{0}]
}{
	$result[0]
}
