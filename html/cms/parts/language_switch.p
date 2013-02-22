
$temp_uri[^uri:path.menu{${uri:path.piece}/}]
<a href="http://www.gcschina.ru/${temp_uri}"><img src="{template}pics/lang_rus^if($MAIN:language_prefix ne ""){_}.gif" alt="Русская версия" title="Русская версия" /></a>
<a href="http://www.gcschina.ru/en/${temp_uri}"><img src="{template}pics/lang_eng^if($MAIN:language_prefix ne "/en"){_}.gif" alt="English language" title="English language" /></a>
<a href="http://www.gcschina.ru/cn/${temp_uri}"><img src="{template}pics/lang_china^if($MAIN:language_prefix ne "/cn"){_}.gif" alt="China language" title="China language" /></a>
