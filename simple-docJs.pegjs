

/*
 * Tag parameters.
 * author <name> [<emailAddress>]
 * callback <namepath>
 * constant [<type> <name>]
 * copyright <some copyright text>
 * default [<some value>]
 * deprecated [<some text>]
 * description <some description>
 * enum [<type>]
 * file <description>
 * param [{<type>}] <name> [[-] <description>]
 * todo <description>
 * version <versionText>
 */

start = docletStart __ (text) (__ tag)* docletEnd (.)*

docletStart = "/**" ___

docletEnd = _ "*/" ___

_ "whitespace" = [ \t]*

__ "start of line" = _"*"_

___ "end of line" = [\n\r]+

tag = tagStart tagName

tagStart = "@"

tagName
 = author _ name ___
 / author _ name _ emailAddress ___
 / callback _ namepath ___
 / constant ___
 / constant _ type _ name ___
 / copyright _ text 
 / default ___
 / default _ value ___
 / deprecated _ text 
 / description _ text 
 / enum _ type ___
 / file _ text ___
 / param _ name ___
 / param _ type _ name ___
 / param _ type _ name _ text 
 / param _ type _ name _ "-" _ text 

author = "author"
callback = "callback"
constant = "constant"
copyright = "copyright"
default = "default"
deprecated = "deprecated"
description = "description"
enum = "enum"
file = "file"
param = "param"
 
name = name:([a-zA-Z] [a-zA-Z0-9]*) {
	var s = "", i;
	for (i = 0; i < name.length; i++) {
		s += name[i];
	}
	return s;
}

namepath = name //just for now. 

type = "{" name "}"

text = text:([a-zA-Z0-9] _)+ ___ {
	var s = "", i;
	for (i = 0; i < text.length; i++) {
		s += text[i];
	}
	return s;
}

value = value:([a-zA-Z0-9]*) {
	var s = "", i;
	for (i = 0; i < value.length; i++) {
		s += value[i];
	}
	return s;
}

emailAddress = (value)+ "@" (value)+ "." (value)+
