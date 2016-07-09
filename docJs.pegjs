/*
 * JSDoc Grammar
 * =============
 *
 * Based on http://usejsdoc.org/
 *
 * Parses the JavaDoc-like comments
 * in a javascript file.
 * 
 * Sections of code borrowed from
 * example 'javascript.pegjs'.
 */

/* ~~~ (A) Lexical Grammar ~~~ */

SourceCharacter
  = .

WhiteSpace "whitespace"
  = "\t"
  / "\v"
  / "\f"
  / " "
  / "\u00A0"
  / "\uFEFF"
  / Zs

LineTerminator
  = [\n\r\u2028\u2029]

LineTerminatorSequence "end of line"
  = "\n"
  / "\r\n"
  / "\r"
  / "\u2028"
  / "\u2029"

Comment "comment"
  = MultiLineComment
  / SingleLineComment

MultiLineComment
  = "/*" (!"*/" SourceCharacter)* "*/"

MultiLineCommentNoLineTerminator
  = "/*" (!("*/" / LineTerminator) SourceCharacter)* "*/"

SingleLineComment
  = "//" (!LineTerminator SourceCharacter)*

/* ~~~ (B) Tags ~~~ */
/*
 * Tag parameters.
 * From: http://usejsdoc.org/
 * ==========================
 * BLOCK -->
 * abstract 
 * access <private|protected|public>
 * alias <aliasNamepath>
 * augments <namepath>
 * author <name> [<emailAddress>]
 * borrows <that namepath> as <this namepath>
 * callback <namepath>
 * class [<type> <name>]
 * classdesc <some description>
 * constant [<type> <name>]
 * constructs [<name>]
 * copyright <some copyright text>
 * default [<some value>]
 * deprecated [<some text>]
 * description <some description>
 * enum [<type>]
 * event <className>#[event:]<eventName>
 * example 
 * exports <moduleName>
 * external <NameOfExternal>
 * file <description>
 * fires <className>#[event:]<eventName>
 * function [<FunctionName>]
 * global 
 * ignore 
 * implements {typeExpression}
 * inheritdoc 
 * inner
 * instance
 * interface [<name>]
 * kind <kindName>
 *  Accepted kindNames:
 *  - class
 *  - constant
 *  - event
 *  - external
 *  - file
 *  - function
 *  - member
 *  - mixin
 *  - module
 *  - namespace
 *  - typedef
 * lends <namepath>
 * license <identifier>
 * listens <eventName>
 * member [<type>] [<name>]
 * memberof <parentNamepath>
 * mixes <OtherObjectPath>
 * mixin [<MixinName>]
 * module [[{<type>}] <moduleName>]
 * name <namePath>
 * namespace [{<type>}] <SomeName>]
 * override 
 * param [{<type>}] <name> [[-] <description>]
 * private
 * property [{<type>}] <name> [[-] <description>]
 * protected 
 * public
 * readonly
 * requires <someModuleName>
 * returns {<type>} [[-] <description>]
 * see <namepath>
 * since <versionDescription>
 * static 
 * summary <summaryDescription>
 * this <namePath
 * throws [{<type>}] [<description>]
 * todo <description>
 * tutorial <tutorialIdentifier>
 * type {<typeName>}
 * typedef [<type>] <namePath>
 * variation <variationNumber>
 * version <versionText>
 *
 * INLINE -->
 * link
 *   {@link namepathOrUrl}
 *   [link text]{@link namepathOrUrl}
 *   {@link namepathOrUrl link text}
 *   {@link namepathOrUrl|link text}
 * tutorial
 *   {@tutorial tutorialId}
 *   [link text]{@tutorial tutorialId}
 *   {@tutorial tutorialId link text}
 *   {@tutorial tutorialId|link text}
 */
  
BlockTagStart
  = "@"
  
InlineTagStart
  = "{@"
  
InlineTagEnd
  = "}"
  
Tag 
  = BlockTagStart BlockToken
  / InlineTagStart InlineToken InlineTagEnd

BlockToken
  = AbstractToken
  / AccessToken
  / AliasToken
  / AugmentsToken
  / AuthorToken
  / BorrowsToken
  / CallbackToken
  / ClassToken
  / ClassdescToken
  / ConstantToken
  / ConstructsToken
  / CopyrightToken
  / DefaultToken
  / DeprecatedToken
  / DescriptionToken
  / EnumToken
  / EventToken
  / ExampleToken
  / ExportsToken
  / ExternalToken
  / FileToken
  / FiresToken
  / FunctionToken
  / GlobalToken
  / IgnoreToken
  / ImplementsToken
  / InheritdocToken
  / InnerToken
  / InstanceToken
  / InterfaceToken
  / KindToken
  / LendsToken
  / LicenseToken
  / ListensToken
  / MemberToken
  / MemberofToken
  / MixesToken
  / MixinToken
  / ModuleToken
  / NameToken
  / NamespaceToken
  / OverrideToken
  / ParamToken
  / PrivateToken
  / PropertyToken
  / ProtectedToken
  / PublicToken
  / ReadonlyToken
  / Requires
  / ReturnsToken
  / SeeToken
  / SinceToken
  / StaticToken
  / SummaryToken
  / ThisToken
  / ThrowsToken
  / TodoToken
  / TutorialToken
  / TypeToken
  / TypedefToken
  / VariationToken
  / VersionToken

InlineToken
  = LinkToken
  / TutorialToken

AbstractToken 		= "abstract"
  					/ "virtual"
AccessToken 		= "access"
AliasToken 			= "alias"
AugmentsToken 		= "augments"
  					/ "extends"
AuthorToken 		= "author"
BorrowsToken 		= "borrows"
CallbackToken 		= "callback"
ClassToken 			= "class"
  					/ "constructor"
ClassdescToken 		= "classdesc"
ConstantToken 		= "constant"
  					/ "const"
ConstructsToken 	= "constructs"
CopyrightToken 		= "copyright"
DefaultToken 		= "default"
  					/ "defaultvalue"
DeprecatedToken 	= "deprecated"
DescriptionToken	= "description"
  					/ "desc"
EnumToken 			= "enum"
EventToken 			= "event"
ExampleToken 		= "example"
ExportsToken 		= "exports"
ExternalToken 		= "external"
  					/ "host"
FileToken 			= "file"
  					/ "fileoverview"
  					/ "overview"
FiresToken 			= "fires"
  					/ "emits"
FunctionToken 		= "function"
  					/ "func"
  					/ "method"
GlobalToken 		= "global"
IgnoreToken 		= "ignore"
ImplementsToken 	= "implements"
InheritdocToken 	= "inheritdoc"
InnerToken 			= "inner"
InstanceToken 		= "instance"
InterfaceToken 		= "interface"
KindToken 			= "kind"
LendsToken 			= "lends"
LicenseToken 		= "license"
LinkToken 			= "link"
ListensToken 		= "listens"
MemberToken 		= "member"
  					/ "var"
MemberofToken 		= "memberof"
MixesToken 			= "mixes"
MixinToken 			= "mixin"
ModuleToken 		= "module"
NameToken 			= "name"
NamespaceToken 		= "namespace"
OverrideToken 		= "override"
ParamToken 			= "param"
  					/ "arg"
  					/ "argument"
PrivateToken 		= "private"
PropertyToken 		= "property"
  					/ "prop"
ProtectedToken 		= "protected"
PublicToken 		= "public"
ReadonlyToken 		= "readonly"
RequiresToken 		= "requires"
ReturnsToken 		= "returns"
  					/ "return"
SeeToken 			= "see"
SinceToken 			= "since"
StaticToken 		= "static"
SummaryToken 		= "summary"
ThisToken 			= "this"
ThrowsToken 		= "throws"
  					/ "exception"
TodoToken 			= "todo"
TutorialToken 		= "tutorial"
TypeToken 			= "type"
TypedefToken 		= "typedef"
VariationToken 		= "variation"
VersionToken 		= "version"




