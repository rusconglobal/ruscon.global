@CLASS
templates

###
### Класс для работы с шаблонами
###
@auto[]

###
### Таблица автозамены для корректного парсинга файлов
###
$prepare_for_parse[^table::create{from	to
#^taint[^#0A]	
^taint[^#09]	}]
$prepare_for_parse2[^table::create{from	to
#^taint[^#0A]	
^taint[^#09]	}]


###
###
###
$cms_parts_replace[^table::create{from	to
^{cms_part:	
^}	}]


######################################################################### @parse_css start
###
### Парсим файл стилей
###

@parse_css[theme;filename][filename;f;t_replace;template;content;parts;part_name;part_executed;part_]
$t_replace[^table::create{from	to
{template}	/cms/templates/${theme}/}]
##
^if(-f "/cms/templates/${theme}/css/${filename}.template"){
	$f[^file::load[text;/cms/templates/${theme}/css/${filename}.template]]
	$template[^untaint{$f.text}]
	$template[^template.replace[$t_replace]]
	$result[$template]
}

###
###
###
######################################################################### @parse_css end


######################################################################### @parse_template start
###
### Парсим файл шаблона
###

@parse_template[theme;filename][filename;f;t_replace;template;content;parts;part_name;part_executed;part_]
$t_replace[^table::create{from	to
}]
^if(-f "/cms/templates/${theme}/${filename}.template"){

	$f[^file::load[text;/cms/templates/${theme}/${filename}.template]]
	$template[^untaint{$f.text}]

#########
	$parts[^file:list[/cms/parts/]]
	^parts.menu{
		$part_name[^parts.name.left(^parts.name.pos[.p])]
		^if(^template.pos[{${part_name}}] > 0){
			$part_[^file::load[text;/cms/parts/${part_name}.p]]
			$part_executed[^process{^taint[as-is][${part_.text}]}]
			^t_replace.append{{${part_name}}	^part_executed.replace[$prepare_for_parse]}
		}
	}
#########

^if(def $MAIN:content){
	^t_replace.append{{page_content}	^MAIN:content.replace[$prepare_for_parse]}
}

#########

	$cms_parts[^template.match[({cms_part:[0-9a-zA-Z]+:[0-9a-zA-Z]+})]['g]]
	^if($cms_parts){
		$cms_parts_located[^table::create{part_name	part_params}]
		^cms_parts.menu{
			$part_id[^cms_parts.1.replace[$cms_parts_replace]]
			$part_id[^part_id.trim[]]
			^cms_parts_located.append{^part_id.left(^part_id.pos[:])	^part_id.right(^eval(^part_id.length[] - 1 - ^part_id.pos[:]))}
		}
	}
	^if($cms_parts_located){
		$cms_parts_replace_[^table::create{from	to}]
		^cms_parts_located.menu{
			$part_code[]
			$part_name[/cms/parts/${cms_parts_located.part_name}.p]
			$MAIN:part_params[$cms_parts_located.part_params]
			^if(-f "$part_name"){$part_[^file::load[text;${part_name}]]$part_code[^process{^taint[as-is][${part_.text}]}]}
			^if(def $part_code){
				^cms_parts_replace_.append{^{cms_part:${cms_parts_located.part_name}:${cms_parts_located.part_params}^}	^part_code.replace[$prepare_for_parse]}
			}
		}
		$template[^template.replace[$cms_parts_replace_]]
	}

#########
$t_replace_[^table::create{from	to
{template}	/cms/templates/${theme}/
{meta_title}	$MAIN:meta_title
{meta_description}	$MAIN:meta_description
{meta_keywords}	$MAIN:meta_keywords}]

	$template[^template.replace[$t_replace]]
	$template[^template.replace[$t_replace_]]
	$template[^template.replace[$prepare_for_parse2]]

	$template
#	$result[$template]

}

###
###
###
######################################################################### @parse_template end

