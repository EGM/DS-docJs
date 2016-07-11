

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

docletStart __ ("*")* _ (text / tag) (__ ("*")* tag)* __ docletEnd

docletStart = "/**"

docletEnd = "*/"

_ "whitespace" = [ \t\n\r]*

__ "end of line" = [\n\r]+

tag = tagStart tagName

tagStart = "@"

tagName
 = author _ name __
 / author _ name _ emailAddress __
 / callback _ namepath __
 / constant __
 / constant _ type _ name __
 / copyright _ text __
 / default __
 / default _ value __
 / deprecated _ text __
 / description _ text __
 / enum _ type __
 / file _ text __
 / param _ name __
 / param _ type _ name __
 / param _ type _ name _ text __
 / param _ type _ name _ "-" _ text __

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
 
name = [a-zA-Z] [a-zA-Z0-9]*

type = name

text = ([a-zA-Z0-9] _)+

value = [a-zA-Z0-9]

emailAddress = (value)+ "@" (value)+ "." (value)+
