
ws "whitespace" = [ \t\n\r]*
hyphen = "-"

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

tag = tagStart tagName

tagStart = "@"

tagName
 = author
 / callback
 / constant
 / copyright
 / default
 / deprecated
 / description
 / enum
 / file
 / param

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
 
   author ws name
 / author ws name ws emailAddress
   callback ws namepath
   constant
 / constant ws type ws name
   copyright ws text
   default
 / default ws value
   deprecated ws text
   description ws text
   enum ws type
   file ws text
   param ws name
 / param ws type ws name
 / param ws type ws name ws text
 / param ws type ws name ws hyphen ws text
