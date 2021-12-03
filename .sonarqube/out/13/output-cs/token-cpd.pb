Ü
àC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Behaviours\LoggingBehaviour.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "

Behaviours" ,
{ 
public		 

class		 
LoggingBehavior		  
<		  !
TRequest		! )
,		) *
	TResponse		+ 4
>		4 5
:		6 7
IPipelineBehavior		8 I
<		I J
TRequest		J R
,		R S
	TResponse		T ]
>		] ^
{

 
private 
readonly 
ILogger  
<  !
LoggingBehavior! 0
<0 1
TRequest1 9
,9 :
	TResponse; D
>D E
>E F
_loggerG N
;N O
public 
LoggingBehavior 
( 
ILogger &
<& '
LoggingBehavior' 6
<6 7
TRequest7 ?
,? @
	TResponseA J
>J K
>K L
loggerM S
)S T
=>U W
_loggerX _
=` a
loggerb h
;h i
public 
async 
Task 
< 
	TResponse #
># $
Handle% +
(+ ,
TRequest, 4
request5 <
,< =
CancellationToken> O
cancellationTokenP a
,a b"
RequestHandlerDelegatec y
<y z
	TResponse	z É
>
É Ñ
next
Ö â
)
â ä
{ 	
_logger 
. 
LogInformation "
(" #
$str# V
,V W
requestX _
._ `
GetGenericTypeName` r
(r s
)s t
,t u
requestv }
)} ~
;~ 
var 
response 
= 
await  
next! %
(% &
)& '
;' (
_logger 
. 
LogInformation "
(" #
$str# `
,` a
requestb i
.i j
GetGenericTypeNamej |
(| }
)} ~
,~ 
response
Ä à
)
à â
;
â ä
return 
response 
; 
} 	
} 
} ˜/
åC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Behaviours\TransactionBehaviour.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "

Behaviours" ,
{ 
public 

class  
TransactionBehaviour %
<% &
TRequest& .
,. /
	TResponse0 9
>9 :
:; <
IPipelineBehavior= N
<N O
TRequestO W
,W X
	TResponseY b
>b c
{ 
private 
readonly 
ILogger  
<  ! 
TransactionBehaviour! 5
<5 6
TRequest6 >
,> ?
	TResponse@ I
>I J
>J K
_loggerL S
;S T
private 
readonly 
CatalogContext '

_dbContext( 2
;2 3
private 
readonly +
ICatalogIntegrationEventService 8+
_catalogIntegrationEventService9 X
;X Y
public  
TransactionBehaviour #
(# $
CatalogContext$ 2
	dbContext3 <
,< =+
ICatalogIntegrationEventService +*
catalogIntegrationEventService, J
,J K
ILogger 
<  
TransactionBehaviour (
<( )
TRequest) 1
,1 2
	TResponse3 <
>< =
>= >
logger? E
)E F
{ 	

_dbContext 
= 
	dbContext "
??# %
throw& +
new, /
ArgumentException0 A
(A B
nameofB H
(H I
CatalogContextI W
)W X
)X Y
;Y Z+
_catalogIntegrationEventService +
=, -*
catalogIntegrationEventService. L
??M O
throwP U
newV Y
ArgumentExceptionZ k
(k l
nameofl r
(r s+
catalogIntegrationEventService	s ë
)
ë í
)
í ì
;
ì î
_logger 
= 
logger 
?? 
throw  %
new& )
ArgumentException* ;
(; <
nameof< B
(B C
ILoggerC J
)J K
)K L
;L M
} 	
public 
async 
Task 
< 
	TResponse #
># $
Handle% +
(+ ,
TRequest, 4
request5 <
,< =
CancellationToken> O
cancellationTokenP a
,a b"
RequestHandlerDelegatec y
<y z
	TResponse	z É
>
É Ñ
next
Ö â
)
â ä
{ 	
var 
response 
= 
default "
(" #
	TResponse# ,
), -
;- .
var   
typeName   
=   
request   "
.  " #
GetGenericTypeName  # 5
(  5 6
)  6 7
;  7 8
try"" 
{## 
if$$ 
($$ 

_dbContext$$ 
.$$  
HasActiveTransaction$$ 3
)$$3 4
{%% 
return&& 
await&&  
next&&! %
(&&% &
)&&& '
;&&' (
}'' 
var)) 
strategy)) 
=)) 

_dbContext)) )
.))) *
Database))* 2
.))2 3#
CreateExecutionStrategy))3 J
())J K
)))K L
;))L M
await++ 
strategy++ 
.++ 
ExecuteAsync++ +
(+++ ,
async++, 1
(++2 3
)++3 4
=>++5 7
{,, 
Guid-- 
transactionId-- &
;--& '
using// 
(// 
var// 
transaction// *
=//+ ,
await//- 2

_dbContext//3 =
.//= >!
BeginTransactionAsync//> S
(//S T
)//T U
)//U V
using00 
(00 

LogContext00 %
.00% &
PushProperty00& 2
(002 3
$str003 G
,00G H
transaction00I T
.00T U
TransactionId00U b
)00b c
)00c d
{11 
_logger22 
.22  
LogInformation22  .
(22. /
$str22/ w
,22w x
transaction	22y Ñ
.
22Ñ Ö
TransactionId
22Ö í
,
22í ì
typeName
22î ú
,
22ú ù
request
22û •
)
22• ¶
;
22¶ ß
response44  
=44! "
await44# (
next44) -
(44- .
)44. /
;44/ 0
_logger66 
.66  
LogInformation66  .
(66. /
$str66/ k
,66k l
transaction66m x
.66x y
TransactionId	66y Ü
,
66Ü á
typeName
66à ê
)
66ê ë
;
66ë í
await88 

_dbContext88 (
.88( )"
CommitTransactionAsync88) ?
(88? @
transaction88@ K
)88K L
;88L M
transactionId:: %
=::& '
transaction::( 3
.::3 4
TransactionId::4 A
;::A B
};; 
await== +
_catalogIntegrationEventService== 9
.==9 :-
!PublishEventsThroughEventBusAsync==: [
(==[ \
transactionId==\ i
)==i j
;==j k
}>> 
)>> 
;>> 
return@@ 
response@@ 
;@@  
}AA 
catchBB 
(BB 
	ExceptionBB 
exBB 
)BB  
{CC 
_loggerDD 
.DD 
LogErrorDD  
(DD  !
exDD! #
,DD# $
$strDD% `
,DD` a
typeNameDDb j
,DDj k
requestDDl s
)DDs t
;DDt u
throwFF 
;FF 
}GG 
}HH 	
}II 
}JJ ˝
âC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Behaviours\ValidatorBehavior.cs
	namespace

 	
Catalog


 
.

 
API

 
.

 
Application

 !
.

! "

Behaviours

" ,
{ 
public 

class 
ValidatorBehavior "
<" #
TRequest# +
,+ ,
	TResponse- 6
>6 7
:8 9
IPipelineBehavior: K
<K L
TRequestL T
,T U
	TResponseV _
>_ `
{ 
private 
readonly 
ILogger  
<  !
ValidatorBehavior! 2
<2 3
TRequest3 ;
,; <
	TResponse= F
>F G
>G H
_loggerI P
;P Q
private 
readonly 

IValidator #
<# $
TRequest$ ,
>, -
[- .
]. /
_validators0 ;
;; <
public 
ValidatorBehavior  
(  !

IValidator! +
<+ ,
TRequest, 4
>4 5
[5 6
]6 7

validators8 B
,B C
ILoggerD K
<K L
ValidatorBehaviorL ]
<] ^
TRequest^ f
,f g
	TResponseh q
>q r
>r s
loggert z
)z {
{ 	
_validators 
= 

validators $
;$ %
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
< 
	TResponse #
># $
Handle% +
(+ ,
TRequest, 4
request5 <
,< =
CancellationToken> O
cancellationTokenP a
,a b"
RequestHandlerDelegatec y
<y z
	TResponse	z É
>
É Ñ
next
Ö â
)
â ä
{ 	
var 
typeName 
= 
request "
." #
GetGenericTypeName# 5
(5 6
)6 7
;7 8
_logger 
. 
LogInformation "
(" #
$str# K
,K L
typeNameM U
)U V
;V W
var 
failures 
= 
_validators &
. 
Select 
( 
v 
=> 
v 
. 
Validate '
(' (
request( /
)/ 0
)0 1
. 

SelectMany 
( 
result "
=># %
result& ,
., -
Errors- 3
)3 4
.   
Where   
(   
error   
=>   
error    %
!=  & (
null  ) -
)  - .
.!! 
ToList!! 
(!! 
)!! 
;!! 
if## 
(## 
failures## 
.## 
Any## 
(## 
)## 
)## 
{$$ 
_logger%% 
.%% 

LogWarning%% "
(%%" #
$str%%# z
,%%z {
typeName	%%| Ñ
,
%%Ñ Ö
request
%%Ü ç
,
%%ç é
failures
%%è ó
)
%%ó ò
;
%%ò ô
throw'' 
new'' "
CatalogDomainException'' 0
(''0 1
$"(( 
$str(( 9
{((9 :
typeof((: @
(((@ A
TRequest((A I
)((I J
.((J K
Name((K O
}((O P
"((P Q
,((Q R
new((S V
ValidationException((W j
(((j k
$str	((k Å
,
((Å Ç
failures
((É ã
)
((ã å
)
((å ç
;
((ç é
})) 
return++ 
await++ 
next++ 
(++ 
)++ 
;++  
},, 	
}-- 
}.. Ö
òC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Commands\CreateProduct\CreateProductCommand.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
Commands" *
.* +
CreateProduct+ 8
{		 
[

 
DataContract

 
]

 
public 

class  
CreateProductCommand %
:& '
IRequest( 0
<0 1

ProductDTO1 ;
>; <
{ 
[ 	
JsonConstructor	 
] 
public  
CreateProductCommand #
(# $
string$ *
code+ /
,/ 0
string1 7
name8 <
,< =
string> D
descriptionE P
,P Q
decimalR Y
priceZ _
,_ `
inta d
amounte k
)k l
{ 	
this 
. 
Code 
= 
code 
; 
this 
. 
Name 
= 
name 
; 
this 
. 
Description 
= 
description *
;* +
this 
. 
Price 
= 
price 
; 
this 
. 
Amount 
= 
amount  
;  !
} 	
[ 	

DataMember	 
] 
[ 	
Required	 
] 
public 
string 
Code 
{ 
get  
;  !
init" &
;& '
}( )
[ 	

DataMember	 
] 
[ 	
Required	 
] 
public 
string 
Name 
{ 
get  
;  !
init" &
;& '
}( )
[ 	

DataMember	 
] 
public 
string 
Description !
{" #
get$ '
;' (
init) -
;- .
}/ 0
[ 	

DataMember	 
] 
[   	
Required  	 
]   
public!! 
decimal!! 
Price!! 
{!! 
get!! "
;!!" #
init!!$ (
;!!( )
}!!* +
["" 	

DataMember""	 
]"" 
[## 	
Required##	 
]## 
public$$ 
int$$ 
Amount$$ 
{$$ 
get$$ 
;$$  
init$$! %
;$$% &
}$$' (
}%% 
}&& Ù*
üC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Commands\CreateProduct\CreateProductCommandHandler.cs
	namespace		 	
Catalog		
 
.		 
API		 
.		 
Application		 !
.		! "
Commands		" *
.		* +
CreateProduct		+ 8
{

 
public 

class '
CreateProductCommandHandler ,
:- .
IRequestHandler/ >
<> ? 
CreateProductCommand? S
,S T

ProductDTOU _
>_ `
{ 
private 
readonly 
IProductRepository +
_productRepository, >
;> ?
private 
readonly 
IIdentityService )
_identityService* :
;: ;
private 
readonly 
ILogger  
<  !'
CreateProductCommandHandler! <
>< =
_logger> E
;E F
public '
CreateProductCommandHandler *
(* +
IProductRepository 
productRepository 0
,0 1
IIdentityService 
identityService ,
,, -
ILogger 
< '
CreateProductCommandHandler /
>/ 0
logger1 7
)7 8
{ 	
_productRepository 
=  
productRepository! 2
??3 5
throw6 ;
new< ?!
ArgumentNullException@ U
(U V
nameofV \
(\ ]
productRepository] n
)n o
)o p
;p q
_identityService 
= 
identityService .
??/ 1
throw2 7
new8 ;!
ArgumentNullException< Q
(Q R
nameofR X
(X Y
identityServiceY h
)h i
)i j
;j k
_logger 
= 
logger 
?? 
throw  %
new& )!
ArgumentNullException* ?
(? @
nameof@ F
(F G
loggerG M
)M N
)N O
;O P
} 	
public 
async 
Task 
< 

ProductDTO $
>$ %
Handle& ,
(, - 
CreateProductCommand- A
messageB I
,I J
CancellationTokenK \
cancellationToken] n
)n o
{ 	
var 
userId 
= 
_identityService )
.) *
GetUserIdentity* 9
(9 :
): ;
;; <
var 
product 
= 
new 
Product %
(% &
message& -
.- .
Code. 2
,2 3
userId4 :
,: ;
message< C
.C D
NameD H
,H I
messageJ Q
.Q R
DescriptionR ]
,] ^
message_ f
.f g
Priceg l
,l m
messagen u
.u v
Amountv |
)| }
;} ~
_logger   
.   
LogInformation   "
(  " #
$str  # Q
,  Q R
product  S Z
)  Z [
;  [ \
product"" 
="" 
_productRepository"" (
.""( )
Add"") ,
("", -
product""- 4
)""4 5
;""5 6
if$$ 
($$ 
!$$ 
await$$ 
_productRepository$$ )
.$$) *

UnitOfWork$$* 4
.$$4 5
SaveEntitiesAsync$$5 F
($$F G
cancellationToken$$G X
)$$X Y
)$$Y Z
return%% 
null%% 
;%% 
return'' 

ProductDTO'' 
.'' 
FromItem'' &
(''& '
product''' .
)''. /
;''/ 0
}(( 	
})) 
public++ 

record++ 

ProductDTO++ 
{,, 
public-- 
int-- 
Id-- 
{-- 
get-- 
;-- 
init-- !
;--! "
}--# $
public.. 
Guid.. 
Owner.. 
{.. 
get.. 
;..  
init..! %
;..% &
}..' (
public// 
string// 
Name// 
{// 
get//  
;//  !
init//" &
;//& '
}//( )
public00 
DateTime00 
	CreatedAt00 !
{00" #
get00$ '
;00' (
init00) -
;00- .
}00/ 0
public22 
static22 

ProductDTO22  
FromItem22! )
(22) *
Product22* 1
product222 9
)229 :
{33 	
return44 
new44 

ProductDTO44 !
(44! "
)44" #
{55 
Id66 
=66 
product66 
.66 
Id66 
,66  
Owner77 
=77 
product77 
.77  
Owner77  %
,77% &
Name88 
=88 
product88 
.88 
Name88 #
,88# $
	CreatedAt99 
=99 
product99 #
.99# $
	CreatedAt99$ -
}:: 
;:: 
};; 	
}<< 
}== ù
òC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Commands\DeleteProduct\DeleteProductCommand.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
Commands" *
.* +
DeleteProduct+ 8
{ 
public 

class  
DeleteProductCommand %
:& '
IRequest( 0
<0 1
bool1 5
>5 6
{ 
public		  
DeleteProductCommand		 #
(		# $
int		$ '
	productId		( 1
)		1 2
{

 	
	ProductId 
= 
	productId !
;! "
} 	
[ 	

DataMember	 
] 
[ 	
Required	 
] 
public 
int 
	ProductId 
{ 
get "
;" #
init$ (
;( )
}* +
} 
} ’
üC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Commands\DeleteProduct\DeleteProductCommandHandler.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
Commands" *
.* +
DeleteProduct+ 8
{ 
public		 

class		 '
DeleteProductCommandHandler		 ,
:		- .
IRequestHandler		/ >
<		> ? 
DeleteProductCommand		? S
,		S T
bool		U Y
>		Y Z
{

 
private 
readonly 
IProductRepository +
_productRepository, >
;> ?
private 
readonly 
ILogger  
<  !'
DeleteProductCommandHandler! <
>< =
_logger> E
;E F
public '
DeleteProductCommandHandler *
(* +
IProductRepository+ =
productRepository> O
,O P
ILoggerQ X
<X Y'
DeleteProductCommandHandlerY t
>t u
loggerv |
)| }
{ 	
_productRepository 
=  
productRepository! 2
;2 3
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
< 
bool 
> 
Handle  &
(& ' 
DeleteProductCommand' ;
request< C
,C D
CancellationTokenE V
cancellationTokenW h
)h i
{ 	
var 
product 
= 
await 
_productRepository  2
.2 3
GetAsync3 ;
(; <
request< C
.C D
	ProductIdD M
)M N
;N O
if 
( 
product 
== 
null 
)  
return! '
false( -
;- .
_logger 
. 
LogInformation "
(" #
$str# Q
,Q R
productS Z
)Z [
;[ \
_productRepository 
. 
Remove %
(% &
product& -
)- .
;. /
return 
await 
_productRepository +
.+ ,

UnitOfWork, 6
.6 7
SaveEntitiesAsync7 H
(H I
cancellationTokenI Z
)Z [
;[ \
} 	
}   
}!! Ì
îC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Commands\EditProduct\EditProductCommand.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
Commands" *
.* +
EditProduct+ 6
{ 
public 

class 
EditProductCommand #
:$ %
IRequest& .
<. /
bool/ 3
>3 4
{		 
public

 
EditProductCommand

 !
(

! "
int

" %
	productId

& /
,

/ 0

ProductDTO

1 ;
product

< C
)

C D
{ 	
this 
. 
	ProductId 
= 
	productId &
;& '
this 
. 
Code 
= 
product 
.  
code  $
;$ %
this 
. 
Name 
= 
product 
.  
name  $
;$ %
this 
. 
Description 
= 
product &
.& '
description' 2
;2 3
this 
. 
Price 
= 
product  
.  !
price! &
;& '
this 
. 
Amount 
= 
product !
.! "
amount" (
;( )
} 	
[ 	

DataMember	 
] 
[ 	
Required	 
] 
public 
int 
	ProductId 
{ 
get "
;" #
init$ (
;( )
}* +
[ 	

DataMember	 
] 
[ 	
Required	 
] 
public 
string 
Code 
{ 
get  
;  !
init" &
;& '
}( )
[ 	

DataMember	 
] 
[ 	
Required	 
] 
public 
string 
Name 
{ 
get  
;  !
init" &
;& '
}( )
[ 	

DataMember	 
] 
public 
string 
Description !
{" #
get$ '
;' (
init) -
;- .
}/ 0
[   	

DataMember  	 
]   
[!! 	
Required!!	 
]!! 
public"" 
decimal"" 
Price"" 
{"" 
get"" "
;""" #
init""$ (
;""( )
}""* +
[## 	

DataMember##	 
]## 
[$$ 	
Required$$	 
]$$ 
public%% 
int%% 
Amount%% 
{%% 
get%% 
;%%  
init%%! %
;%%% &
}%%' (
}&& 
public(( 

record(( 

ProductDTO(( 
{)) 
public** 
string** 
code** 
{** 
get**  
;**  !
init**" &
;**& '
}**( )
public++ 
string++ 
name++ 
{++ 
get++  
;++  !
init++" &
;++& '
}++( )
public,, 
string,, 
description,, !
{,," #
get,,$ '
;,,' (
init,,) -
;,,- .
},,/ 0
public-- 
decimal-- 
price-- 
{-- 
get-- "
;--" #
init--$ (
;--( )
}--* +
public.. 
int.. 
amount.. 
{.. 
get.. 
;..  
init..! %
;..% &
}..' (
}// 
}00 Å 
õC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Commands\EditProduct\EditProductCommandHandler.cs
	namespace		 	
Catalog		
 
.		 
API		 
.		 
Application		 !
.		! "
Commands		" *
.		* +
EditProduct		+ 6
{

 
public 

class %
EditProductCommandHandler *
:+ ,
IRequestHandler- <
<< =
EditProductCommand= O
,O P
boolQ U
>U V
{ 
private 
readonly 
IProductRepository +
_productRepository, >
;> ?
private 
readonly 
IIdentityService )
_identityService* :
;: ;
private 
readonly 
ILogger  
<  !%
EditProductCommandHandler! :
>: ;
_logger< C
;C D
public %
EditProductCommandHandler (
(( )
IProductRepository) ;
productRepository< M
,M N
IIdentityServiceO _
identityService` o
,o p
ILoggerq x
<x y&
EditProductCommandHandler	y í
>
í ì
logger
î ö
)
ö õ
{ 	
_productRepository 
=  
productRepository! 2
;2 3
_identityService 
= 
identityService .
??/ 1
throw2 7
new8 ;!
ArgumentNullException< Q
(Q R
nameofR X
(X Y
identityServiceY h
)h i
)i j
;j k
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
< 
bool 
> 
Handle  &
(& '
EditProductCommand' 9
request: A
,A B
CancellationTokenC T
cancellationTokenU f
)f g
{ 	
var 
userId 
= 
_identityService )
.) *
GetUserIdentity* 9
(9 :
): ;
;; <
var 
product 
= 
await 
_productRepository  2
.2 3
GetAsync3 ;
(; <
request< C
.C D
	ProductIdD M
)M N
;N O
if 
( 
product 
== 
null 
)  
return! '
false( -
;- .
product 
. 
Code 
= 
request "
." #
Code# '
;' (
product   
.   
Owner   
=   
userId   "
;  " #
product!! 
.!! 
Name!! 
=!! 
request!! "
.!!" #
Name!!# '
;!!' (
product"" 
."" 
Description"" 
=""  !
request""" )
."") *
Description""* 5
;""5 6
product## 
.## 
Price## 
=## 
request## #
.### $
Price##$ )
;##) *
product$$ 
.$$ 
Amount$$ 
=$$ 
request$$ $
.$$$ %
Amount$$% +
;$$+ ,
_logger&& 
.&& 
LogInformation&& "
(&&" #
$str&&# M
,&&M N
product&&O V
)&&V W
;&&W X
_productRepository(( 
.(( 
Update(( %
(((% &
product((& -
)((- .
;((. /
return** 
await** 
_productRepository** +
.**+ ,

UnitOfWork**, 6
.**6 7
SaveEntitiesAsync**7 H
(**H I
cancellationToken**I Z
)**Z [
;**[ \
}++ 	
},, 
}-- †
ÆC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Commands\SetProductAvaiableStatus\SetProductAvaiableStatusCommand.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
Commands" *
.* +$
SetProductAvaiableStatus+ C
{ 
public 

class +
SetProductAvaiableStatusCommand 0
:1 2
IRequest3 ;
<; <
bool< @
>@ A
{ 
public +
SetProductAvaiableStatusCommand .
(. /
int/ 2
	productId3 <
)< =
{		 	
	ProductId

 
=

 
	productId

 !
;

! "
} 	
[ 	

DataMember	 
] 
public 
int 
	ProductId 
{ 
get "
;" #
init$ (
;( )
}* +
} 
} ˘
µC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Commands\SetProductAvaiableStatus\SetProductAvaiableStatusCommandHandler.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
Commands" *
.* +$
SetProductAvaiableStatus+ C
{ 
public 

class 2
&SetProductAvaiableStatusCommandHandler 7
:8 9
IRequestHandler: I
<I J+
SetProductAvaiableStatusCommandJ i
,i j
boolk o
>o p
{		 
private

 
readonly

 
IProductRepository

 +
_productRepository

, >
;

> ?
public 2
&SetProductAvaiableStatusCommandHandler 5
(5 6
IProductRepository6 H
productRepositoryI Z
)Z [
{ 	
_productRepository 
=  
productRepository! 2
;2 3
} 	
public 
async 
Task 
< 
bool 
> 
Handle  &
(& '+
SetProductAvaiableStatusCommand' F
commandG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 	
var 
product 
= 
await 
_productRepository  2
.2 3
GetAsync3 ;
(; <
command< C
.C D
	ProductIdD M
)M N
;N O
if 
( 
product 
== 
null 
)  
return! '
false( -
;- .
product 
. 
SetAvaiableStatus %
(% &
)& '
;' (
return 
await 
_productRepository +
.+ ,

UnitOfWork, 6
.6 7
SaveEntitiesAsync7 H
(H I
cancellationTokenI Z
)Z [
;[ \
} 	
} 
} ñ
™C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Commands\SetProductLockedStatus\SetProductLockedStatusCommand.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
Commands" *
.* +"
SetProductLockedStatus+ A
{ 
public		 

class		 )
SetProductLockedStatusCommand		 .
:		/ 0
IRequest		1 9
<		9 :
bool		: >
>		> ?
{

 
public )
SetProductLockedStatusCommand ,
(, -
int- 0
	productId1 :
): ;
{ 	
	ProductId 
= 
	productId !
;! "
} 	
[ 	

DataMember	 
] 
public 
int 
	ProductId 
{ 
get "
;" #
init$ (
;( )
}* +
} 
} È
±C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Commands\SetProductLockedStatus\SetProductLockedStatusCommandHandler.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
Commands" *
.* +"
SetProductLockedStatus+ A
{ 
public 

class 0
$SetProductLockedStatusCommandHandler 5
:6 7
IRequestHandler8 G
<G H)
SetProductLockedStatusCommandH e
,e f
boolg k
>k l
{		 
private

 
readonly

 
IProductRepository

 +
_productRepository

, >
;

> ?
public 0
$SetProductLockedStatusCommandHandler 3
(3 4
IProductRepository4 F
productRepositoryG X
)X Y
{ 	
_productRepository 
=  
productRepository! 2
;2 3
} 	
public 
async 
Task 
< 
bool 
> 
Handle  &
(& ')
SetProductLockedStatusCommand' D
commandE L
,L M
CancellationTokenN _
cancellationToken` q
)q r
{ 	
var 
product 
= 
await 
_productRepository  2
.2 3
GetAsync3 ;
(; <
command< C
.C D
	ProductIdD M
)M N
;N O
if 
( 
product 
== 
null 
)  
return! '
false( -
;- .
product 
. 
SetLockedStatus #
(# $
)$ %
;% &
return 
await 
_productRepository +
.+ ,

UnitOfWork, 6
.6 7
SaveEntitiesAsync7 H
(H I
cancellationTokenI Z
)Z [
;[ \
} 	
} 
} ı#
¡C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\DomainEventHandlers\ProductAvaiable\ProductStatusChangedToAvaiableDomainEventHandler.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
DomainEventHandlers" 5
.5 6
ProductAvaiable6 E
{ 
public 

class <
0ProductStatusChangedToAvaiableDomainEventHandler A
:B C 
INotificationHandlerD X
<X Y6
)ProductStatusChangedToAvaiableDomainEvent	Y Ç
>
Ç É
{ 
private 
readonly 
IProductRepository +
_itemRepository, ;
;; <
private 
readonly 
IIdentityService )
_identityService* :
;: ;
private 
readonly 
ILoggerFactory '
_logger( /
;/ 0
private 
readonly +
ICatalogIntegrationEventService 8+
_catalogIntegrationEventService9 X
;X Y
public <
0ProductStatusChangedToAvaiableDomainEventHandler ?
(? @
IProductRepository@ R
itemRepositoryS a
,a b
IIdentityServicec s
identityService	t É
,
É Ñ
ILoggerFactory
Ö ì
logger
î ö
,
ö õ-
ICatalogIntegrationEventService
ú ª,
catalogIntegrationEventService
º ⁄
)
⁄ €
{ 	
_itemRepository 
= 
itemRepository ,
??- /
throw0 5
new6 9!
ArgumentNullException: O
(O P
nameofP V
(V W
itemRepositoryW e
)e f
)f g
;g h
_identityService 
= 
identityService .
??/ 1
throw2 7
new8 ;!
ArgumentNullException< Q
(Q R
nameofR X
(X Y
identityServiceY h
)h i
)i j
;j k
_logger 
= 
logger 
?? 
throw  %
new& )!
ArgumentNullException* ?
(? @
nameof@ F
(F G
loggerG M
)M N
)N O
;O P+
_catalogIntegrationEventService +
=, -*
catalogIntegrationEventService. L
??M O
throwP U
newV Y!
ArgumentNullExceptionZ o
(o p
nameofp v
(v w+
catalogIntegrationEventService	w ï
)
ï ñ
)
ñ ó
;
ó ò
} 	
public 
async 
Task 
Handle  
(  !5
)ProductStatusChangedToAvaiableDomainEvent! J
notificationK W
,W X
CancellationTokenY j
cancellationTokenk |
)| }
{ 	
_logger 
. 
CreateLogger  
<  !<
0ProductStatusChangedToAvaiableDomainEventHandler! Q
>Q R
(R S
)S T
.   
LogTrace   
(   
$str   o
,  o p
notification!!  
.!!  !
	ProductId!!! *
,!!* +
nameof!!, 2
(!!2 3
ProductStatus!!3 @
.!!@ A
Avaiable!!A I
)!!I J
,!!J K
ProductStatus!!L Y
.!!Y Z
Avaiable!!Z b
.!!b c
Id!!c e
)!!e f
;!!f g
var## 
item## 
=## 
await## 
_itemRepository## ,
.##, -
GetAsync##- 5
(##5 6
notification##6 B
.##B C
	ProductId##C L
)##L M
;##M N
var%% 
integrationEvent%%  
=%%! "
new%%# &:
.ProductStatusChangedToAvaiableIntegrationEvent%%' U
(%%U V
_identityService&&  
.&&  !
GetUserIdentity&&! 0
(&&0 1
)&&1 2
,&&2 3
item'' 
.'' 
Id'' 
,'' 
item(( 
.(( 
ProductStatus(( "
.((" #
Name((# '
)((' (
;((( )
await** +
_catalogIntegrationEventService** 1
.**1 2 
AddAndSaveEventAsync**2 F
(**F G
integrationEvent**G W
)**W X
;**X Y
}++ 	
},, 
}-- ‹#
ΩC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\DomainEventHandlers\ProductLocked\ProductStatusChangedToLockedDomainEventHandler.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
DomainEventHandlers" 5
.5 6
ProductLocked6 C
{ 
public 

class :
.ProductStatusChangedToLockedDomainEventHandler ?
:@ A 
INotificationHandlerB V
<V W3
'ProductStatusChangedToLockedDomainEventW ~
>~ 
{ 
private 
readonly 
IProductRepository +
_itemRepository, ;
;; <
private 
readonly 
IIdentityService )
_identityService* :
;: ;
private 
readonly 
ILoggerFactory '
_logger( /
;/ 0
private 
readonly +
ICatalogIntegrationEventService 8+
_catalogIntegrationEventService9 X
;X Y
public :
.ProductStatusChangedToLockedDomainEventHandler =
(= >
IProductRepository> P
itemRepositoryQ _
,_ `
IIdentityServicea q
identityService	r Å
,
Å Ç
ILoggerFactory
É ë
logger
í ò
,
ò ô-
ICatalogIntegrationEventService
ö π,
catalogIntegrationEventService
∫ ÿ
)
ÿ Ÿ
{ 	
_itemRepository 
= 
itemRepository ,
??- /
throw0 5
new6 9!
ArgumentNullException: O
(O P
nameofP V
(V W
itemRepositoryW e
)e f
)f g
;g h
_identityService 
= 
identityService .
??/ 1
throw2 7
new8 ;!
ArgumentNullException< Q
(Q R
nameofR X
(X Y
identityServiceY h
)h i
)i j
;j k
_logger 
= 
logger 
?? 
throw  %
new& )!
ArgumentNullException* ?
(? @
nameof@ F
(F G
loggerG M
)M N
)N O
;O P+
_catalogIntegrationEventService +
=, -*
catalogIntegrationEventService. L
??M O
throwP U
newV Y!
ArgumentNullExceptionZ o
(o p
nameofp v
(v w+
catalogIntegrationEventService	w ï
)
ï ñ
)
ñ ó
;
ó ò
} 	
public 
async 
Task 
Handle  
(  !3
'ProductStatusChangedToLockedDomainEvent! H
notificationI U
,U V
CancellationTokenW h
cancellationTokeni z
)z {
{   	
_logger!! 
.!! 
CreateLogger!!  
<!!  !:
.ProductStatusChangedToLockedDomainEventHandler!!! O
>!!O P
(!!P Q
)!!Q R
."" 
LogTrace"" 
("" 
$str"" p
,""p q
notification##  
.##  !
	ProductId##! *
,##* +
nameof##, 2
(##2 3
ProductStatus##3 @
.##@ A
Locked##A G
)##G H
,##H I
ProductStatus##J W
.##W X
Locked##X ^
.##^ _
Id##_ a
)##a b
;##b c
var%% 
item%% 
=%% 
await%% 
_itemRepository%% ,
.%%, -
GetAsync%%- 5
(%%5 6
notification%%6 B
.%%B C
	ProductId%%C L
)%%L M
;%%M N
var'' 
integrationEvent''  
=''! "
new''# &8
,ProductStatusChangedToLockedIntegrationEvent''' S
(''S T
_identityService((  
.((  !
GetUserIdentity((! 0
(((0 1
)((1 2
,((2 3
item)) 
.)) 
Id)) 
,)) 
item** 
.** 
ProductStatus** "
.**" #
Name**# '
)**' (
;**( )
await,, +
_catalogIntegrationEventService,, 1
.,,1 2 
AddAndSaveEventAsync,,2 F
(,,F G
integrationEvent,,G W
),,W X
;,,X Y
}-- 	
}.. 
}// ⁄0
ùC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\IntegrationEvents\CatalogIntegrationEventService.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
IntegrationEvents" 3
{ 
public 

class *
CatalogIntegrationEventService /
:0 1+
ICatalogIntegrationEventService2 Q
{ 
private 
readonly 
Func 
< 
DbConnection *
,* +'
IIntegrationEventLogService, G
>G H.
"_integrationEventLogServiceFactoryI k
;k l
private 
readonly 
	IEventBus "
	_eventBus# ,
;, -
private 
readonly 
CatalogContext '
_catalogContext( 7
;7 8
private 
readonly '
IIntegrationEventLogService 4
_eventLogService5 E
;E F
private 
readonly 
ILogger  
<  !*
CatalogIntegrationEventService! ?
>? @
_loggerA H
;H I
public *
CatalogIntegrationEventService -
(- .
	IEventBus. 7
eventBus8 @
,@ A
CatalogContext 
catalogContext )
,) *
Func 
< 
DbConnection 
, '
IIntegrationEventLogService :
>: ;-
!integrationEventLogServiceFactory< ]
,] ^
ILogger 
< *
CatalogIntegrationEventService 2
>2 3
logger4 :
): ;
{ 	
_catalogContext 
= 
catalogContext ,
??- /
throw0 5
new6 9!
ArgumentNullException: O
(O P
nameofP V
(V W
catalogContextW e
)e f
)f g
;g h.
"_integrationEventLogServiceFactory .
=/ 0-
!integrationEventLogServiceFactory1 R
??S U
throwV [
new\ _!
ArgumentNullException` u
(u v
nameofv |
(| }.
!integrationEventLogServiceFactory	} û
)
û ü
)
ü †
;
† °
	_eventBus 
= 
eventBus  
??! #
throw$ )
new* -!
ArgumentNullException. C
(C D
nameofD J
(J K
eventBusK S
)S T
)T U
;U V
_eventLogService 
= .
"_integrationEventLogServiceFactory A
(A B
_catalogContextB Q
.Q R
DatabaseR Z
.Z [
GetDbConnection[ j
(j k
)k l
)l m
;m n
_logger 
= 
logger 
?? 
throw  %
new& )!
ArgumentNullException* ?
(? @
nameof@ F
(F G
loggerG M
)M N
)N O
;O P
} 	
public!! 
async!! 
Task!! -
!PublishEventsThroughEventBusAsync!! ;
(!!; <
Guid!!< @
transactionId!!A N
)!!N O
{"" 	
var## 
pendingLogEvents##  
=##! "
await### (
_eventLogService##) 9
.##9 :2
&RetrieveEventLogsPendingToPublishAsync##: `
(##` a
transactionId##a n
)##n o
;##o p
foreach%% 
(%% 
var%% 
logEvt%% 
in%%  "
pendingLogEvents%%# 3
)%%3 4
{&& 
_logger'' 
.'' 
LogInformation'' &
(''& '
$str	''' à
,
''à â
logEvt
''ä ê
.
''ê ë
EventId
''ë ò
,
''ò ô
Program
''ö °
.
''° ¢
AppName
''¢ ©
,
''© ™
logEvt
''´ ±
.
''± ≤
IntegrationEvent
''≤ ¬
)
''¬ √
;
''√ ƒ
try)) 
{** 
await++ 
_eventLogService++ *
.++* +&
MarkEventAsInProgressAsync+++ E
(++E F
logEvt++F L
.++L M
EventId++M T
)++T U
;++U V
	_eventBus,, 
.,, 
Publish,, %
(,,% &
logEvt,,& ,
.,,, -
IntegrationEvent,,- =
),,= >
;,,> ?
await-- 
_eventLogService-- *
.--* +%
MarkEventAsPublishedAsync--+ D
(--D E
logEvt--E K
.--K L
EventId--L S
)--S T
;--T U
}.. 
catch// 
(// 
	Exception//  
ex//! #
)//# $
{00 
_logger11 
.11 
LogError11 $
(11$ %
ex11% '
,11' (
$str11) r
,11r s
logEvt11t z
.11z {
EventId	11{ Ç
,
11Ç É
Program
11Ñ ã
.
11ã å
AppName
11å ì
)
11ì î
;
11î ï
await33 
_eventLogService33 *
.33* +"
MarkEventAsFailedAsync33+ A
(33A B
logEvt33B H
.33H I
EventId33I P
)33P Q
;33Q R
}44 
}55 
}66 	
public88 
async88 
Task88  
AddAndSaveEventAsync88 .
(88. /
IntegrationEvent88/ ?
evt88@ C
)88C D
{99 	
_logger:: 
.:: 
LogInformation:: "
(::" #
$str::# 
,	:: Ä
evt
::Å Ñ
.
::Ñ Ö
Id
::Ö á
,
::á à
evt
::â å
)
::å ç
;
::ç é
await<< 
_eventLogService<< "
.<<" #
SaveEventAsync<<# 1
(<<1 2
evt<<2 5
,<<5 6
_catalogContext<<7 F
.<<F G!
GetCurrentTransaction<<G \
(<<\ ]
)<<] ^
)<<^ _
;<<_ `
}== 	
}>> 
}?? ◊	
´C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\IntegrationEvents\Events\ProductAddedToCatalogIntegrationEvent.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
IntegrationEvents" 3
.3 4
Events4 :
{ 
public		 

record		 1
%ProductAddedToCatalogIntegrationEvent		 7
:		8 9
IntegrationEvent		: J
{

 
public 1
%ProductAddedToCatalogIntegrationEvent 4
(4 5
int5 8
	productId9 B
,B C
GuidD H
userIdI O
)O P
{ 	
	ProductId 
= 
	productId !
;! "
UserId 
= 
userId 
; 
} 	
public 
int 
	ProductId 
{ 
get "
;" #
init$ (
;( )
}* +
public 
Guid 
UserId 
{ 
get  
;  !
init" &
;& '
}( )
} 
} √
¥C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\IntegrationEvents\Events\ProductStatusChangedToAvaiableIntegrationEvent.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
IntegrationEvents" 3
.3 4
Events4 :
{ 
public 

record :
.ProductStatusChangedToAvaiableIntegrationEvent @
:A B
IntegrationEventC S
{ 
public :
.ProductStatusChangedToAvaiableIntegrationEvent =
(= >
Guid> B
userIdC I
,I J
intK N
	productIdO X
,X Y
stringZ `
productStatusa n
)n o
{		 	
UserId

 
=

 
userId

 
;

 
	ProductId 
= 
	productId !
;! "
ProductStatus 
= 
productStatus )
;) *
} 	
public 
Guid 
UserId 
{ 
get  
;  !
}" #
public 
int 
	ProductId 
{ 
get "
;" #
}$ %
public 
string 
ProductStatus #
{$ %
get& )
;) *
}+ ,
} 
} Ω
≤C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\IntegrationEvents\Events\ProductStatusChangedToLockedIntegrationEvent.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
IntegrationEvents" 3
.3 4
Events4 :
{ 
public 

record 8
,ProductStatusChangedToLockedIntegrationEvent >
:? @
IntegrationEventA Q
{ 
public 8
,ProductStatusChangedToLockedIntegrationEvent ;
(; <
Guid< @
userIdA G
,G H
intI L
	productIdM V
,V W
stringX ^
productStatus_ l
)l m
{		 	
UserId

 
=

 
userId

 
;

 
	ProductId 
= 
	productId !
;! "
ProductStatus 
= 
productStatus )
;) *
} 	
public 
Guid 
UserId 
{ 
get  
;  !
}" #
public 
int 
	ProductId 
{ 
get "
;" #
}$ %
public 
string 
ProductStatus #
{$ %
get& )
;) *
}+ ,
} 
} ¸
ûC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\IntegrationEvents\ICatalogIntegrationEventService.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
IntegrationEvents" 3
{ 
public 

	interface +
ICatalogIntegrationEventService 4
{ 
Task		 -
!PublishEventsThroughEventBusAsync		 .
(		. /
Guid		/ 3
transactionId		4 A
)		A B
;		B C
Task

  
AddAndSaveEventAsync

 !
(

! "
IntegrationEvent

" 2
evt

3 6
)

6 7
;

7 8
} 
} Ê
ÑC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Queries\IProductQueries.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
Queries" )
{ 
public 

	interface 
IProductQueries $
{ 
Task		 
<		 
IEnumerable		 
<		 
Product		  
>		  !
>		! "
GetProductsAsync		# 3
(		3 4
)		4 5
;		5 6
Task

 
<

 
Product

 
>

 
GetProductAsync

 %
(

% &
int

& )
id

* ,
)

, -
;

- .
Task 
< 
IEnumerable 
< 
ProductStatus &
>& '
>' (!
GetProductStatusAsync) >
(> ?
)? @
;@ A
} 
} ≤ 
ÉC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Queries\ProductQueries.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
Queries" )
{		 
public 

class 
ProductQueries 
:  !
IProductQueries" 1
{ 
private 
string 
_connectionString (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
ProductQueries 
( 
string $
constr% +
)+ ,
{ 	
_connectionString 
= 
!  !
string! '
.' (
IsNullOrWhiteSpace( :
(: ;
constr; A
)A B
?C D
constrE K
:L M
throwN S
newT W!
ArgumentNullExceptionX m
(m n
nameofn t
(t u
constru {
){ |
)| }
;} ~
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Product& -
>- .
>. /
GetProductsAsync0 @
(@ A
)A B
{ 	
using 
( 
var 

connection !
=" #
new$ '
SqlConnection( 5
(5 6
_connectionString6 G
)G H
)H I
{ 

connection 
. 
Open 
(  
)  !
;! "
return 
await 

connection '
.' (

QueryAsync( 2
<2 3
Product3 :
>: ;
(; <
$str< ]
)] ^
;^ _
} 
} 	
public 
async 
Task 
< 
Product !
>! "
GetProductAsync# 2
(2 3
int3 6
id7 9
)9 :
{ 	
using 
( 
var 

connection !
=" #
new$ '
SqlConnection( 5
(5 6
_connectionString6 G
)G H
)H I
{   

connection!! 
.!! 
Open!! 
(!!  
)!!  !
;!!! "
var## 
result## 
=## 
await## "

connection### -
.##- .

QueryAsync##. 8
<##8 9
Product##9 @
>##@ A
(##A B
$str##B v
,##v w
new##x {
{##| }
id	##~ Ä
}
##Å Ç
)
##Ç É
;
##É Ñ
if%% 
(%% 
result%% 
.%% 
AsList%% !
(%%! "
)%%" #
.%%# $
Count%%$ )
==%%* ,
$num%%- .
)%%. /
throw&& 
new&&  
KeyNotFoundException&& 2
(&&2 3
)&&3 4
;&&4 5
return(( 
result(( 
.(( 
First(( #
(((# $
)(($ %
;((% &
})) 
}** 	
public,, 
async,, 
Task,, 
<,, 
IEnumerable,, %
<,,% &
ProductStatus,,& 3
>,,3 4
>,,4 5!
GetProductStatusAsync,,6 K
(,,K L
),,L M
{-- 	
using.. 
(.. 
var.. 

connection.. !
=.." #
new..$ '
SqlConnection..( 5
(..5 6
_connectionString..6 G
)..G H
)..H I
{// 

connection00 
.00 
Open00 
(00  
)00  !
;00! "
return22 
await22 

connection22 '
.22' (

QueryAsync22( 2
<222 3
ProductStatus223 @
>22@ A
(22A B
$str22B i
)22i j
;22j k
}33 
}44 	
}55 
}66 ì
ÜC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Queries\ProductViewModels.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
Queries" )
{ 
public 

record 
Product 
{ 
public 
int 
id 
{ 
get 
; 
init !
;! "
}# $
public 
string 
code 
{ 
get  
;  !
init" &
;& '
}( )
public		 
Guid		 
owner		 
{		 
get		 
;		  
init		! %
;		% &
}		' (
public

 
string

 
name

 
{

 
get

  
;

  !
init

" &
;

& '
}

( )
public 
string 
description !
{" #
get$ '
;' (
init) -
;- .
}/ 0
public 
decimal 
price 
{ 
get "
;" #
init$ (
;( )
}* +
public 
int 
amount 
{ 
get 
;  
init! %
;% &
}' (
public 
DateTime 
	createdAt !
{" #
get$ '
;' (
init) -
;- .
}/ 0
public 
DateTime 
	updatedAt !
{" #
get$ '
;' (
init) -
;- .
}/ 0
} 
public 

record 
ProductStatus 
{ 
public 
int 
id 
{ 
get 
; 
init !
;! "
}# $
public 
string 
name 
{ 
get  
;  !
init" &
;& '
}( )
} 
} †
ñC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Validations\CreateProductCommandValidator.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
Validations" -
{ 
public 

class )
CreateProductCommandValidator .
:/ 0
AbstractValidator1 B
<B C 
CreateProductCommandC W
>W X
{ 
public		 )
CreateProductCommandValidator		 ,
(		, -
ILogger		- 4
<		4 5)
CreateProductCommandValidator		5 R
>		R S
logger		T Z
)		Z [
{

 	
RuleFor 
( 
command 
=> 
command &
.& '
Code' +
)+ ,
., -
NotEmpty- 5
(5 6
)6 7
;7 8
RuleFor 
( 
command 
=> 
command &
.& '
Name' +
)+ ,
., -
NotEmpty- 5
(5 6
)6 7
;7 8
RuleFor 
( 
command 
=> 
command &
.& '
Price' ,
), -
.- .
GreaterThan. 9
(9 :
$num: ;
); <
;< =
RuleFor 
( 
command 
=> 
command &
.& '
Amount' -
)- .
.. /
GreaterThan/ :
(: ;
$num; <
)< =
;= >
logger 
. 
LogTrace 
( 
$str A
,A B
GetTypeC J
(J K
)K L
.L M
NameM Q
)Q R
;R S
} 	
} 
} Ì	
ñC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Application\Validations\DeleteProductCommandValidator.cs
	namespace 	
Catalog
 
. 
API 
. 
Application !
.! "
Validations" -
{ 
public 

class )
DeleteProductCommandValidator .
:/ 0
AbstractValidator1 B
<B C 
DeleteProductCommandC W
>W X
{ 
public		 )
DeleteProductCommandValidator		 ,
(		, -
ILogger		- 4
<		4 5)
DeleteProductCommandValidator		5 R
>		R S
logger		T Z
)		Z [
{

 	
RuleFor 
( 
command 
=> 
command &
.& '
	ProductId' 0
)0 1
.1 2
GreaterThan2 =
(= >
$num> ?
)? @
;@ A
logger 
. 
LogTrace 
( 
$str A
,A B
GetTypeC J
(J K
)K L
.L M
NameM Q
)Q R
;R S
} 	
} 
} Ç
pC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\CatalogSettings.cs
	namespace 	
Catalog
 
. 
API 
{ 
public 

class 
CatalogSettings  
{ 
public 
string 
ConnectionString &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
EventBusConnection (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
}		 ˝
{C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Controllers\HomeController.cs
public 
class 
HomeController 
: 

Controller (
{ 
public 

IActionResult 
Index 
( 
)  
{ 
return 
new 
RedirectResult !
(! "
$str" -
)- .
;. /
} 
}		 ™b
~C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Controllers\ProductController.cs
	namespace 	
Catalog
 
. 
API 
. 
Controllers !
{ 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
	Authorize 
] 
[ 
ApiController 
] 
public 

class 
ProductController "
:# $
ControllerBase% 3
{ 
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private 
readonly 
IProductQueries (
_productQueries) 8
;8 9
private 
readonly 
IIdentityService )
_identityService* :
;: ;
private 
readonly 
ILogger  
<  !
ProductController! 2
>2 3
_logger4 ;
;; <
public 
ProductController  
(  !
	IMediator! *
mediator+ 3
,3 4
IProductQueries5 D
productQueriesE S
,S T
IIdentityServiceU e
identityServicef u
,u v
ILoggerw ~
<~ 
ProductController	 ê
>
ê ë
logger
í ò
)
ò ô
{   	
	_mediator!! 
=!! 
mediator!!  
??!!! #
throw!!$ )
new!!* -!
ArgumentNullException!!. C
(!!C D
nameof!!D J
(!!J K
mediator!!K S
)!!S T
)!!T U
;!!U V
_identityService"" 
="" 
identityService"" .
??""/ 1
throw""2 7
new""8 ;!
ArgumentNullException""< Q
(""Q R
nameof""R X
(""X Y
identityService""Y h
)""h i
)""i j
;""j k
_productQueries## 
=## 
productQueries## ,
??##- /
throw##0 5
new##6 9!
ArgumentNullException##: O
(##O P
nameof##P V
(##V W
productQueries##W e
)##e f
)##f g
;##g h
_logger$$ 
=$$ 
logger$$ 
??$$ 
throw$$  %
new$$& )!
ArgumentNullException$$* ?
($$? @
nameof$$@ F
($$F G
logger$$G M
)$$M N
)$$N O
;$$O P
}%% 	
['' 	
Route''	 
('' 
$str'' 
)'' 
]'' 
[(( 	
HttpGet((	 
](( 
[)) 	 
ProducesResponseType))	 
()) 
typeof)) $
())$ %
IEnumerable))% 0
<))0 1
Product))1 8
>))8 9
)))9 :
,)): ;
())< =
int))= @
)))@ A
HttpStatusCode))A O
.))O P
OK))P R
)))R S
]))S T
public** 
async** 
Task** 
<** 
ActionResult** &
<**& '
IEnumerable**' 2
<**2 3
Product**3 :
>**: ;
>**; <
>**< =
GetProducts**> I
(**I J
)**J K
{++ 	
var,, 
products,, 
=,, 
await,,  
_productQueries,,! 0
.,,0 1
GetProductsAsync,,1 A
(,,A B
),,B C
;,,C D
return.. 
Ok.. 
(.. 
products.. 
).. 
;..  
}// 	
[11 	
Route11	 
(11 
$str11  
)11  !
]11! "
[22 	
HttpGet22	 
]22 
[33 	 
ProducesResponseType33	 
(33 
typeof33 $
(33$ %
Product33% ,
)33, -
,33- .
(33/ 0
int330 3
)333 4
HttpStatusCode334 B
.33B C
OK33C E
)33E F
]33F G
[44 	 
ProducesResponseType44	 
(44 
(44 
int44 "
)44" #
HttpStatusCode44# 1
.441 2
NotFound442 :
)44: ;
]44; <
public55 
async55 
Task55 
<55 
ActionResult55 &
<55& '
IEnumerable55' 2
<552 3
ProductStatus553 @
>55@ A
>55A B
>55B C

GetProduct55D N
(55N O
int55O R
	productId55S \
)55\ ]
{66 	
try77 
{88 
var99 
product99 
=99 
await99 #
_productQueries99$ 3
.993 4
GetProductAsync994 C
(99C D
	productId99D M
)99M N
;99N O
return:: 
Ok:: 
(:: 
product:: !
)::! "
;::" #
};; 
catch<< 
{== 
return>> 
NotFound>> 
(>>  
)>>  !
;>>! "
}?? 
}@@ 	
[BB 	
RouteBB	 
(BB 
$strBB 
)BB 
]BB 
[CC 	
HttpPostCC	 
]CC 
publicDD 
asyncDD 
TaskDD 
<DD 
IActionResultDD '
>DD' (
CreateProductDD) 6
(DD6 7
[EE 
FromBodyEE 
]EE  
CreateProductCommandEE +
commandEE, 3
)EE3 4
{FF 	
_loggerGG 
.GG 
LogInformationGG "
(GG" #
$strGG# q
,GGq r
commandHH 
.HH 
GetGenericTypeNameHH *
(HH* +
)HH+ ,
,HH, -
$strII 
,II 
_identityServiceJJ  
.JJ  !
GetUserIdentityJJ! 0
(JJ0 1
)JJ1 2
,JJ2 3
commandKK 
)KK 
;KK 
varMM 
resultMM 
=MM 
awaitMM 
	_mediatorMM (
.MM( )
SendMM) -
(MM- .
commandMM. 5
)MM5 6
;MM6 7
returnOO 
OkOO 
(OO 
resultOO 
)OO 
;OO 
}PP 	
[RR 	
RouteRR	 
(RR 
$strRR 
)RR 
]RR 
[SS 	
HttpPutSS	 
]SS 
publicTT 
asyncTT 
TaskTT 
<TT 
IActionResultTT '
>TT' ("
SetProductLockedStatusTT) ?
(TT? @
[UU 
FromBodyUU 
]UU )
SetProductLockedStatusCommandUU 4
commandUU5 <
)UU< =
{VV 	
_loggerWW 
.WW 
LogInformationWW "
(WW" #
$strWW# q
,WWq r
commandXX 
.XX 
GetGenericTypeNameXX *
(XX* +
)XX+ ,
,XX, -
$strYY 
,YY 
_identityServiceZZ  
.ZZ  !
GetUserIdentityZZ! 0
(ZZ0 1
)ZZ1 2
,ZZ2 3
command[[ 
)[[ 
;[[ 
var]] 
result]] 
=]] 
await]] 
	_mediator]] (
.]]( )
Send]]) -
(]]- .
command]]. 5
)]]5 6
;]]6 7
return__ 
Ok__ 
(__ 
result__ 
)__ 
;__ 
}`` 	
[cc 	
Routecc	 
(cc 
$strcc 
)cc 
]cc 
[dd 	
HttpPutdd	 
]dd 
publicee 
asyncee 
Taskee 
<ee 
IActionResultee '
>ee' ($
SetProductAvaiableStatusee) A
(eeA B
[ff 
FromBodyff 
]ff +
SetProductAvaiableStatusCommandff 6
commandff7 >
)ff> ?
{gg 	
_loggerhh 
.hh 
LogInformationhh "
(hh" #
$strhh# q
,hhq r
commandii 
.ii 
GetGenericTypeNameii *
(ii* +
)ii+ ,
,ii, -
$strjj 
,jj 
_identityServicekk  
.kk  !
GetUserIdentitykk! 0
(kk0 1
)kk1 2
,kk2 3
commandll 
)ll 
;ll 
varnn 
resultnn 
=nn 
awaitnn 
	_mediatornn (
.nn( )
Sendnn) -
(nn- .
commandnn. 5
)nn5 6
;nn6 7
returnpp 
Okpp 
(pp 
resultpp 
)pp 
;pp 
}qq 	
[ss 	
Routess	 
(ss 
$strss 
)ss 
]ss 
[tt 	

HttpDeletett	 
]tt 
publicuu 
asyncuu 
Taskuu 
<uu 
IActionResultuu '
>uu' (
DeleteProductuu) 6
(uu6 7
[uu7 8
	FromRouteuu8 A
]uuA B
intuuC F
	productIduuG P
)uuP Q
{vv 	
varww 
commandww 
=ww 
newww  
DeleteProductCommandww 2
(ww2 3
	productIdww3 <
)ww< =
;ww= >
varyy 
resultyy 
=yy 
awaityy 
	_mediatoryy (
.yy( )
Sendyy) -
(yy- .
commandyy. 5
)yy5 6
;yy6 7
if{{ 
({{ 
!{{ 
result{{ 
){{ 
return{{ 
NotFound{{  (
({{( )
){{) *
;{{* +
return}} 
	NoContent}} 
(}} 
)}} 
;}} 
}~~ 	
[
ÄÄ 	
Route
ÄÄ	 
(
ÄÄ 
$str
ÄÄ  
)
ÄÄ  !
]
ÄÄ! "
[
ÅÅ 	
HttpPut
ÅÅ	 
]
ÅÅ 
public
ÇÇ 
async
ÇÇ 
Task
ÇÇ 
<
ÇÇ 
IActionResult
ÇÇ '
>
ÇÇ' (
EditProduct
ÇÇ) 4
(
ÇÇ4 5
[
ÉÉ 
	FromRoute
ÉÉ 
]
ÉÉ 
int
ÉÉ 
	productId
ÉÉ %
,
ÉÉ% &
[
ÑÑ 
FromBody
ÑÑ 
]
ÑÑ 
Application
ÑÑ "
.
ÑÑ" #
Commands
ÑÑ# +
.
ÑÑ+ ,
EditProduct
ÑÑ, 7
.
ÑÑ7 8

ProductDTO
ÑÑ8 B
product
ÑÑC J
)
ÑÑJ K
{
ÖÖ 	
var
ÜÜ 
command
ÜÜ 
=
ÜÜ 
new
ÜÜ  
EditProductCommand
ÜÜ 0
(
ÜÜ0 1
	productId
ÜÜ1 :
,
ÜÜ: ;
product
ÜÜ< C
)
ÜÜC D
;
ÜÜD E
var
àà 
result
àà 
=
àà 
await
àà 
	_mediator
àà (
.
àà( )
Send
àà) -
(
àà- .
command
àà. 5
)
àà5 6
;
àà6 7
if
ää 
(
ää 
!
ää 
result
ää 
)
ää 
return
ää 
NotFound
ää  (
(
ää( )
)
ää) *
;
ää* +
return
åå 
Ok
åå 
(
åå 
result
åå 
)
åå 
;
åå 
}
çç 	
[
èè 	
Route
èè	 
(
èè 
$str
èè 
)
èè  
]
èè  !
[
êê 	
HttpGet
êê	 
]
êê 
[
ëë 	"
ProducesResponseType
ëë	 
(
ëë 
typeof
ëë $
(
ëë$ %
IEnumerable
ëë% 0
<
ëë0 1
ProductStatus
ëë1 >
>
ëë> ?
)
ëë? @
,
ëë@ A
(
ëëB C
int
ëëC F
)
ëëF G
HttpStatusCode
ëëG U
.
ëëU V
OK
ëëV X
)
ëëX Y
]
ëëY Z
public
íí 
async
íí 
Task
íí 
<
íí 
ActionResult
íí &
<
íí& '
IEnumerable
íí' 2
<
íí2 3
ProductStatus
íí3 @
>
íí@ A
>
ííA B
>
ííB C#
GetProductStatusAsync
ííD Y
(
ííY Z
)
ííZ [
{
ìì 	
var
îî 
productStatus
îî 
=
îî 
await
îî  %
_productQueries
îî& 5
.
îî5 6#
GetProductStatusAsync
îî6 K
(
îîK L
)
îîL M
;
îîM N
return
ññ 
Ok
ññ 
(
ññ 
productStatus
ññ #
)
ññ# $
;
ññ$ %
}
óó 	
}
òò 
}ôô §.
ÄC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Extensions\LinqSelectExtensions.cs
	namespace 	
Catalog
 
. 
API 
. 

Extensions  
{ 
public 

static 
class  
LinqSelectExtensions ,
{		 
public

 
static

 
IEnumerable

 !
<

! "
SelectTryResult

" 1
<

1 2
TSource

2 9
,

9 :
TResult

; B
>

B C
>

C D
	SelectTry

E N
<

N O
TSource

O V
,

V W
TResult

X _
>

_ `
(

` a
this

a e
IEnumerable

f q
<

q r
TSource

r y
>

y z

enumerable	

{ Ö
,


Ö Ü
Func


á ã
<


ã å
TSource


å ì
,


ì î
TResult


ï ú
>


ú ù
selector


û ¶
)


¶ ß
{ 	
foreach 
( 
TSource 
element $
in% '

enumerable( 2
)2 3
{ 
SelectTryResult 
<  
TSource  '
,' (
TResult) 0
>0 1
returnedValue2 ?
;? @
try 
{ 
returnedValue !
=" #
new$ '
SelectTryResult( 7
<7 8
TSource8 ?
,? @
TResultA H
>H I
(I J
elementJ Q
,Q R
selectorS [
([ \
element\ c
)c d
,d e
nullf j
)j k
;k l
} 
catch 
( 
	Exception  
ex! #
)# $
{ 
returnedValue !
=" #
new$ '
SelectTryResult( 7
<7 8
TSource8 ?
,? @
TResultA H
>H I
(I J
elementJ Q
,Q R
defaultS Z
(Z [
TResult[ b
)b c
,c d
exe g
)g h
;h i
} 
yield 
return 
returnedValue *
;* +
} 
} 	
public 
static 
IEnumerable !
<! "
TResult" )
>) *
OnCaughtException+ <
<< =
TSource= D
,D E
TResultF M
>M N
(N O
thisO S
IEnumerableT _
<_ `
SelectTryResult` o
<o p
TSourcep w
,w x
TResult	y Ä
>
Ä Å
>
Å Ç

enumerable
É ç
,
ç é
Func
è ì
<
ì î
	Exception
î ù
,
ù û
TResult
ü ¶
>
¶ ß
exceptionHandler
® ∏
)
∏ π
{ 	
return 

enumerable 
. 
Select $
($ %
x% &
=>' )
x* +
.+ ,
CaughtException, ;
==< >
null? C
?D E
xF G
.G H
ResultH N
:O P
exceptionHandlerQ a
(a b
xb c
.c d
CaughtExceptiond s
)s t
)t u
;u v
} 	
public   
static   
IEnumerable   !
<  ! "
TResult  " )
>  ) *
OnCaughtException  + <
<  < =
TSource  = D
,  D E
TResult  F M
>  M N
(  N O
this  O S
IEnumerable  T _
<  _ `
SelectTryResult  ` o
<  o p
TSource  p w
,  w x
TResult	  y Ä
>
  Ä Å
>
  Å Ç

enumerable
  É ç
,
  ç é
Func
  è ì
<
  ì î
TSource
  î õ
,
  õ ú
	Exception
  ù ¶
,
  ¶ ß
TResult
  ® Ø
>
  Ø ∞
exceptionHandler
  ± ¡
)
  ¡ ¬
{!! 	
return"" 

enumerable"" 
."" 
Select"" $
(""$ %
x""% &
=>""' )
x""* +
.""+ ,
CaughtException"", ;
==""< >
null""? C
?""D E
x""F G
.""G H
Result""H N
:""O P
exceptionHandler""Q a
(""a b
x""b c
.""c d
Source""d j
,""j k
x""l m
.""m n
CaughtException""n }
)""} ~
)""~ 
;	"" Ä
}## 	
public%% 
class%% 
SelectTryResult%% $
<%%$ %
TSource%%% ,
,%%, -
TResult%%. 5
>%%5 6
{&& 	
internal'' 
SelectTryResult'' $
(''$ %
TSource''% ,
source''- 3
,''3 4
TResult''5 <
result''= C
,''C D
	Exception''E N
	exception''O X
)''X Y
{(( 
Source)) 
=)) 
source)) 
;))  
Result** 
=** 
result** 
;**  
CaughtException++ 
=++  !
	exception++" +
;+++ ,
},, 
public.. 
TSource.. 
Source.. !
{.." #
get..$ '
;..' (
private..) 0
set..1 4
;..4 5
}..6 7
public// 
TResult// 
Result// !
{//" #
get//$ '
;//' (
private//) 0
set//1 4
;//4 5
}//6 7
public00 
	Exception00 
CaughtException00 ,
{00- .
get00/ 2
;002 3
private004 ;
set00< ?
;00? @
}00A B
}11 	
}22 
}33 Ú
ùC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Infrastructure\ActionResults\InternalServerErrorObjectResult.cs
	namespace 	
Catalog
 
. 
API 
. 
Infrastructure $
.$ %
ActionResults% 2
{ 
public 

class +
InternalServerErrorObjectResult 0
:1 2
ObjectResult3 ?
{ 
public +
InternalServerErrorObjectResult .
(. /
object/ 5
error6 ;
); <
:		 
base		 
(		 
error		 
)		 
{

 	

StatusCode 
= 
StatusCodes $
.$ %(
Status500InternalServerError% A
;A B
} 	
} 
} ‰
êC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Infrastructure\AutofacModules\ApplicationModule.cs
	namespace		 	
Catalog		
 
.		 
API		 
.		 
Infrastructure		 $
.		$ %
AutofacModules		% 3
{

 
public 

class 
ApplicationModule "
: 
Autofac 
. 
Module 
{ 
public 
string #
QueriesConnectionString -
{. /
get0 3
;3 4
}5 6
public 
ApplicationModule  
(  !
string! '
qconstr( /
)/ 0
{ 	#
QueriesConnectionString #
=$ %
qconstr& -
;- .
} 	
	protected 
override 
void 
Load  $
($ %
ContainerBuilder% 5
builder6 =
)= >
{ 	
builder 
. 
Register 
( 
c 
=> !
new" %
ProductQueries& 4
(4 5#
QueriesConnectionString5 L
)L M
)M N
. 
As 
< 
IProductQueries #
># $
($ %
)% &
. $
InstancePerLifetimeScope )
() *
)* +
;+ ,
builder 
. 
RegisterType  
<  !
ProductRepository! 2
>2 3
(3 4
)4 5
. 
As 
< 
IProductRepository &
>& '
(' (
)( )
.   $
InstancePerLifetimeScope   )
(  ) *
)  * +
;  + ,
builder"" 
."" !
RegisterAssemblyTypes"" )
("") *
typeof""* 0
(""0 1'
CreateProductCommandHandler""1 L
)""L M
.""M N
GetTypeInfo""N Y
(""Y Z
)""Z [
.""[ \
Assembly""\ d
)""d e
.## 
AsClosedTypesOf##  
(##  !
typeof##! '
(##' ($
IIntegrationEventHandler##( @
<##@ A
>##A B
)##B C
)##C D
;##D E
}$$ 	
}%% 
}&& ≠&
çC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Infrastructure\AutofacModules\MediatorModule.cs
	namespace 	
Catalog
 
. 
API 
. 
Infrastructure $
.$ %
AutofacModules% 3
{ 
public 

class 
MediatorModule 
:  !
Autofac" )
.) *
Module* 0
{ 
	protected 
override 
void 
Load  $
($ %
ContainerBuilder% 5
builder6 =
)= >
{ 	
builder 
. !
RegisterAssemblyTypes )
() *
typeof* 0
(0 1
	IMediator1 :
): ;
.; <
GetTypeInfo< G
(G H
)H I
.I J
AssemblyJ R
)R S
. #
AsImplementedInterfaces (
(( )
)) *
;* +
builder 
. !
RegisterAssemblyTypes )
() *
typeof* 0
(0 1 
CreateProductCommand1 E
)E F
.F G
GetTypeInfoG R
(R S
)S T
.T U
AssemblyU ]
)] ^
. 
AsClosedTypesOf  
(  !
typeof! '
(' (
IRequestHandler( 7
<7 8
,8 9
>9 :
): ;
); <
;< =
builder 
. !
RegisterAssemblyTypes )
() *
typeof* 0
(0 1<
0ProductStatusChangedToAvaiableDomainEventHandler1 a
)a b
.b c
GetTypeInfoc n
(n o
)o p
.p q
Assemblyq y
)y z
. 
AsClosedTypesOf  
(  !
typeof! '
(' ( 
INotificationHandler( <
<< =
>= >
)> ?
)? @
;@ A
builder 
. !
RegisterAssemblyTypes &
(& '
typeof' -
(- .)
CreateProductCommandValidator. K
)K L
.L M
GetTypeInfoM X
(X Y
)Y Z
.Z [
Assembly[ c
)c d
. 
Where 
( 
t 
=> 
t 
. 
IsClosedTypeOf ,
(, -
typeof- 3
(3 4

IValidator4 >
<> ?
>? @
)@ A
)A B
)B C
.   #
AsImplementedInterfaces   (
(  ( )
)  ) *
;  * +
builder## 
.## 
Register## 
<## 
ServiceFactory## +
>##+ ,
(##, -
context##- 4
=>##5 7
{$$ 
var%% 
componentContext%% $
=%%% &
context%%' .
.%%. /
Resolve%%/ 6
<%%6 7
IComponentContext%%7 H
>%%H I
(%%I J
)%%J K
;%%K L
return&& 
t&& 
=>&& 
{&& 
object&& $
o&&% &
;&&& '
return&&( .
componentContext&&/ ?
.&&? @

TryResolve&&@ J
(&&J K
t&&K L
,&&L M
out&&N Q
o&&R S
)&&S T
?&&U V
o&&W X
:&&Y Z
null&&[ _
;&&_ `
}&&a b
;&&b c
}'' 
)'' 
;'' 
builder)) 
.)) 
RegisterGeneric)) #
())# $
typeof))$ *
())* +
LoggingBehavior))+ :
<)): ;
,)); <
>))< =
)))= >
)))> ?
.))? @
As))@ B
())B C
typeof))C I
())I J
IPipelineBehavior))J [
<))[ \
,))\ ]
>))] ^
)))^ _
)))_ `
;))` a
builder** 
.** 
RegisterGeneric** #
(**# $
typeof**$ *
(*** +
ValidatorBehavior**+ <
<**< =
,**= >
>**> ?
)**? @
)**@ A
.**A B
As**B D
(**D E
typeof**E K
(**K L
IPipelineBehavior**L ]
<**] ^
,**^ _
>**_ `
)**` a
)**a b
;**b c
builder++ 
.++ 
RegisterGeneric++ #
(++# $
typeof++$ *
(++* + 
TransactionBehaviour+++ ?
<++? @
,++@ A
>++A B
)++B C
)++C D
.++D E
As++E G
(++G H
typeof++H N
(++N O
IPipelineBehavior++O `
<++` a
,++a b
>++b c
)++c d
)++d e
;++e f
}-- 	
}.. 
}// ’O
ÇC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Infrastructure\CatalogContextSeed.cs
	namespace 	
Catalog
 
. 
API 
. 
Infrastructure $
{ 
public 

class 
CatalogContextSeed #
{ 
public 
async 
Task 
	SeedAsync #
(# $
CatalogContext$ 2
context3 :
,: ;
IWebHostEnvironment< O
envP S
,S T
IOptionsU ]
<] ^
CatalogSettings^ m
>m n
settingso w
,w x
ILogger	y Ä
<
Ä Å 
CatalogContextSeed
Å ì
>
ì î
logger
ï õ
)
õ ú
{ 	
var 
policy 
= 
CreatePolicy %
(% &
logger& ,
,, -
nameof. 4
(4 5
CatalogContextSeed5 G
)G H
)H I
;I J
await 
policy 
. 
ExecuteAsync %
(% &
async& +
(, -
)- .
=>/ 1
{ 
var 
contentRootPath #
=$ %
env& )
.) *
ContentRootPath* 9
;9 :
using 
( 
context 
) 
{ 
context   
.   
Database   $
.  $ %
Migrate  % ,
(  , -
)  - .
;  . /
if"" 
("" 
!"" 
context""  
.""  !
ProductStatus""! .
."". /
Any""/ 2
(""2 3
)""3 4
)""4 5
{## 
context$$ 
.$$  
ProductStatus$$  -
.$$- .
AddRange$$. 6
($$6 7$
GetProductStatusFromFile$$7 O
($$O P
contentRootPath$$P _
,$$_ `
logger$$a g
)$$g h
)$$h i
;$$i j
await%% 
context%% %
.%%% &
SaveChangesAsync%%& 6
(%%6 7
)%%7 8
;%%8 9
}&& 
await(( 
context(( !
.((! "
SaveChangesAsync((" 2
(((2 3
)((3 4
;((4 5
})) 
}** 
)** 
;** 
}++ 	
private-- 
IEnumerable-- 
<-- 
ProductStatus-- )
>--) *$
GetProductStatusFromFile--+ C
(--C D
string--D J
path--K O
,--O P
ILogger--Q X
<--X Y
CatalogContextSeed--Y k
>--k l
log--m p
)--p q
{.. 	
string// 
csvFileCardTypes// #
=//$ %
Path//& *
.//* +
Combine//+ 2
(//2 3
path//3 7
,//7 8
$str//9 @
,//@ A
$str//B U
)//U V
;//V W
if11 
(11 
!11 
File11 
.11 
Exists11 
(11 
csvFileCardTypes11 -
)11- .
)11. /
{22 
return33 
Enumeration33 "
.33" #
GetAll33# )
<33) *
ProductStatus33* 7
>337 8
(338 9
)339 :
;33: ;
}44 
string66 
[66 
]66 

csvheaders66 
;66  
try77 
{88 
string99 
[99 
]99 
requiredHeaders99 (
=99) *
{99+ ,
$str99- <
}99= >
;99> ?

csvheaders:: 
=:: 

GetHeaders:: '
(::' (
requiredHeaders::( 7
,::7 8
csvFileCardTypes::9 I
)::I J
;::J K
};; 
catch<< 
(<< 
	Exception<< 
ex<< 
)<<  
{== 
log>> 
.>> 
LogError>> 
(>> 
ex>> 
,>>  
$str>>! =
,>>= >
ex>>? A
.>>A B
Message>>B I
)>>I J
;>>J K
return?? 
Enumeration?? "
.??" #
GetAll??# )
<??) *
ProductStatus??* 7
>??7 8
(??8 9
)??9 :
;??: ;
}@@ 
intBB 
idBB 
=BB 
$numBB 
;BB 
returnCC 
FileCC 
.CC 
ReadAllLinesCC $
(CC$ %
csvFileCardTypesCC% 5
)CC5 6
.DD 
SkipDD 
(DD 
$numDD 
)DD 
.EE 
	SelectTryEE 
(EE 
xEE 
=>EE 
CreateProductStatusEE  3
(EE3 4
xEE4 5
,EE5 6
refEE7 :
idEE; =
)EE= >
)EE> ?
.FF 
OnCaughtExceptionFF "
(FF" #
exFF# %
=>FF& (
{FF) *
logFF+ .
.FF. /
LogErrorFF/ 7
(FF7 8
exFF8 :
,FF: ;
$strFF< X
,FFX Y
exFFZ \
.FF\ ]
MessageFF] d
)FFd e
;FFe f
returnFFg m
nullFFn r
;FFr s
}FFt u
)FFu v
.GG 
WhereGG 
(GG 
xGG 
=>GG 
xGG 
!=GG  
nullGG! %
)GG% &
;GG& '
}HH 	
privateJJ 
ProductStatusJJ 
CreateProductStatusJJ 1
(JJ1 2
stringJJ2 8
valueJJ9 >
,JJ> ?
refJJ@ C
intJJD G
idJJH J
)JJJ K
{KK 	
ifLL 
(LL 
StringLL 
.LL 
IsNullOrEmptyLL $
(LL$ %
valueLL% *
)LL* +
)LL+ ,
{MM 
throwNN 
newNN 
	ExceptionNN #
(NN# $
$strNN$ D
)NND E
;NNE F
}OO 
returnQQ 
newQQ 
ProductStatusQQ $
(QQ$ %
idQQ% '
++QQ' )
,QQ) *
valueQQ+ 0
.QQ0 1
TrimQQ1 5
(QQ5 6
$charQQ6 9
)QQ9 :
.QQ: ;
TrimQQ; ?
(QQ? @
)QQ@ A
)QQA B
;QQB C
}RR 	
privateTT 
stringTT 
[TT 
]TT 

GetHeadersTT #
(TT# $
stringTT$ *
[TT* +
]TT+ ,
requiredHeadersTT- <
,TT< =
stringTT> D
csvfileTTE L
)TTL M
{UU 	
stringVV 
[VV 
]VV 

csvheadersVV 
=VV  !
FileVV" &
.VV& '
	ReadLinesVV' 0
(VV0 1
csvfileVV1 8
)VV8 9
.VV9 :
FirstVV: ?
(VV? @
)VV@ A
.VVA B
ToLowerInvariantVVB R
(VVR S
)VVS T
.VVT U
SplitVVU Z
(VVZ [
$charVV[ ^
)VV^ _
;VV_ `
ifXX 
(XX 

csvheadersXX 
.XX 
CountXX  
(XX  !
)XX! "
!=XX# %
requiredHeadersXX& 5
.XX5 6
CountXX6 ;
(XX; <
)XX< =
)XX= >
{YY 
throwZZ 
newZZ 
	ExceptionZZ #
(ZZ# $
$"ZZ$ &
$strZZ& <
{ZZ< =
requiredHeadersZZ> M
.ZZM N
CountZZN S
(ZZS T
)ZZT U
}ZZU V
$strZZV w
{ZZw x

csvheaders	ZZx Ç
.
ZZÇ É
Count
ZZÉ à
(
ZZà â
)
ZZâ ä
}
ZZä ã
$str
ZZã å
"
ZZå ç
)
ZZç é
;
ZZé è
}[[ 
foreach]] 
(]] 
var]] 
requiredHeader]] '
in]]( *
requiredHeaders]]+ :
)]]: ;
{^^ 
if__ 
(__ 
!__ 

csvheaders__ 
.__  
Contains__  (
(__( )
requiredHeader__) 7
)__7 8
)__8 9
{`` 
throwaa 
newaa 
	Exceptionaa '
(aa' (
$"aa( *
$straa* L
{aaL M
requiredHeaderaaM [
}aa[ \
$straa\ ]
"aa] ^
)aa^ _
;aa_ `
}bb 
}cc 
returnee 

csvheadersee 
;ee 
}ff 	
privatehh 
AsyncRetryPolicyhh  
CreatePolicyhh! -
(hh- .
ILoggerhh. 5
<hh5 6
CatalogContextSeedhh6 H
>hhH I
loggerhhJ P
,hhP Q
stringhhR X
prefixhhY _
,hh_ `
inthha d
retrieshhe l
=hhm n
$numhho p
)hhp q
{ii 	
returnjj 
Policyjj 
.jj 
Handlejj  
<jj  !
SqlExceptionjj! -
>jj- .
(jj. /
)jj/ 0
.jj0 1
WaitAndRetryAsynckk !
(kk! "

retryCountll 
:ll 
retriesll  '
,ll' (!
sleepDurationProvidermm )
:mm) *
retrymm+ 0
=>mm1 3
TimeSpanmm4 <
.mm< =
FromSecondsmm= H
(mmH I
$nummmI J
)mmJ K
,mmK L
onRetrynn 
:nn 
(nn 
	exceptionnn '
,nn' (
timeSpannn) 1
,nn1 2
retrynn3 8
,nn8 9
ctxnn: =
)nn= >
=>nn? A
{oo 
loggerpp 
.pp 

LogWarningpp )
(pp) *
	exceptionpp* 3
,pp3 4
$str	pp5 õ
,
ppõ ú
prefix
ppù £
,
pp£ §
	exception
pp• Æ
.
ppÆ Ø
GetType
ppØ ∂
(
pp∂ ∑
)
pp∑ ∏
.
pp∏ π
Name
ppπ Ω
,
ppΩ æ
	exception
ppø »
.
pp» …
Message
pp… –
,
pp– —
retry
pp“ ◊
,
pp◊ ÿ
retries
ppŸ ‡
)
pp‡ ·
;
pp· ‚
}qq 
)rr 
;rr 
}ss 	
}tt 
}uu Ç
ëC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Infrastructure\Factories\CatalogDbContextFactory.cs
	namespace 	
Catalog
 
. 
API 
. 
Infrastructure $
.$ %
	Factories% .
{ 
public		 

class		 #
CatalogDbContextFactory		 (
:		) *'
IDesignTimeDbContextFactory		+ F
<		F G
CatalogContext		G U
>		U V
{

 
public 
CatalogContext 
CreateDbContext -
(- .
string. 4
[4 5
]5 6
args7 ;
); <
{ 	
var 
config 
= 
new  
ConfigurationBuilder 1
(1 2
)2 3
. 
SetBasePath 
( 
Path  
.  !
Combine! (
(( )
	Directory) 2
.2 3
GetCurrentDirectory3 F
(F G
)G H
)H I
)I J
. 
AddJsonFile 
( 
$str .
). /
. #
AddEnvironmentVariables '
(' (
)( )
. 
Build 
( 
) 
; 
var 
optionsBuilder 
=  
new! $#
DbContextOptionsBuilder% <
<< =
CatalogContext= K
>K L
(L M
)M N
;N O
optionsBuilder 
. 
UseSqlServer '
(' (
config( .
[. /
$str/ A
]A B
,B C"
sqlServerOptionsActionD Z
:Z [
o\ ]
=>^ `
oa b
.b c
MigrationsAssemblyc u
(u v
$str	v É
)
É Ñ
)
Ñ Ö
;
Ö Ü
return 
new 
CatalogContext %
(% &
optionsBuilder& 4
.4 5
Options5 <
)< =
;= >
} 	
} 
} ˙
ïC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Infrastructure\Filters\AuthorizeCheckOperationFilter.cs
	namespace 	
Catalog
 
. 
API 
. 
Infrastructure $
.$ %
Filters% ,
{ 
public		 

class		 )
AuthorizeCheckOperationFilter		 .
:		/ 0
IOperationFilter		1 A
{

 
public 
void 
Apply 
( 
OpenApiOperation *
	operation+ 4
,4 5"
OperationFilterContext6 L
contextM T
)T U
{ 	
var 
hasAuthorize 
= 
context &
.& '

MethodInfo' 1
.1 2
DeclaringType2 ?
.? @
GetCustomAttributes@ S
(S T
trueT X
)X Y
.Y Z
OfTypeZ `
<` a
AuthorizeAttributea s
>s t
(t u
)u v
.v w
Anyw z
(z {
){ |
||} 
context &
.& '

MethodInfo' 1
.1 2
GetCustomAttributes2 E
(E F
trueF J
)J K
.K L
OfTypeL R
<R S
AuthorizeAttributeS e
>e f
(f g
)g h
.h i
Anyi l
(l m
)m n
;n o
if 
( 
! 
hasAuthorize 
) 
return %
;% &
	operation 
. 
	Responses 
.  
TryAdd  &
(& '
$str' ,
,, -
new. 1
OpenApiResponse2 A
{B C
DescriptionD O
=P Q
$strR `
}a b
)b c
;c d
	operation 
. 
	Responses 
.  
TryAdd  &
(& '
$str' ,
,, -
new. 1
OpenApiResponse2 A
{B C
DescriptionD O
=P Q
$strR ]
}^ _
)_ `
;` a
var 
scheme 
= 
new !
OpenApiSecurityScheme 2
{ 
	Reference 
= 
new 
OpenApiReference  0
{1 2
Type3 7
=8 9
ReferenceType: G
.G H
SecuritySchemeH V
,V W
IdX Z
=[ \
$str] e
}f g
} 
; 
	operation 
. 
Security 
=  
new! $
List% )
<) *&
OpenApiSecurityRequirement* D
>D E
{ 
new &
OpenApiSecurityRequirement .
{ 
{ 
scheme   
,   
new!! 
string!! "
[!!" #
]!!# $
{!!% &
}!!& '
}"" 
}## 
}$$ 
;$$ 
}%% 	
}&& 
}'' Õ)
ëC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Infrastructure\Filters\HttpGlobalExceptionFilter.cs
	namespace 	
Catalog
 
. 
API 
. 
Infrastructure $
.$ %
Filters% ,
{ 
public 

class %
HttpGlobalExceptionFilter *
:+ ,
IExceptionFilter- =
{ 
private 
readonly 
IWebHostEnvironment ,
env- 0
;0 1
private 
readonly 
ILogger  
<  !%
HttpGlobalExceptionFilter! :
>: ;
logger< B
;B C
public %
HttpGlobalExceptionFilter (
(( )
IWebHostEnvironment) <
env= @
,@ A
ILoggerB I
<I J%
HttpGlobalExceptionFilterJ c
>c d
loggere k
)k l
{ 	
this 
. 
env 
= 
env 
; 
this 
. 
logger 
= 
logger  
;  !
} 	
public 
void 
OnException 
(  
ExceptionContext  0
context1 8
)8 9
{ 	
logger 
. 
LogError 
( 
new 
EventId  '
(' (
context( /
./ 0
	Exception0 9
.9 :
HResult: A
)A B
,B C
context 
. 
	Exception !
,! "
context   
.   
	Exception   !
.  ! "
Message  " )
)  ) *
;  * +
if"" 
("" 
context"" 
."" 
	Exception"" !
.""! "
GetType""" )
("") *
)""* +
=="", .
typeof""/ 5
(""5 6"
CatalogDomainException""6 L
)""L M
)""M N
{## 
var$$ 
problemDetails$$ "
=$$# $
new$$% ($
ValidationProblemDetails$$) A
($$A B
)$$B C
{%% 
Instance&& 
=&& 
context&& &
.&&& '
HttpContext&&' 2
.&&2 3
Request&&3 :
.&&: ;
Path&&; ?
,&&? @
Status'' 
='' 
StatusCodes'' (
.''( )
Status400BadRequest'') <
,''< =
Detail(( 
=(( 
$str(( Z
})) 
;)) 
problemDetails++ 
.++ 
Errors++ %
.++% &
Add++& )
(++) *
$str++* =
,++= >
new++? B
string++C I
[++I J
]++J K
{++L M
context++N U
.++U V
	Exception++V _
.++_ `
Message++` g
.++g h
ToString++h p
(++p q
)++q r
}++s t
)++t u
;++u v
context-- 
.-- 
Result-- 
=--  
new--! $"
BadRequestObjectResult--% ;
(--; <
problemDetails--< J
)--J K
;--K L
context.. 
... 
HttpContext.. #
...# $
Response..$ ,
..., -

StatusCode..- 7
=..8 9
(..: ;
int..; >
)..> ?
HttpStatusCode..? M
...M N

BadRequest..N X
;..X Y
}// 
else00 
{11 
var22 
json22 
=22 
new22 
JsonErrorResponse22 0
{33 
Messages44 
=44 
new44 "
[44" #
]44# $
{44% &
$str44' E
}44F G
}55 
;55 
if77 
(77 
env77 
.77 
IsDevelopment77 %
(77% &
)77& '
)77' (
{88 
json99 
.99 
DeveloperMessage99 )
=99* +
context99, 3
.993 4
	Exception994 =
;99= >
}:: 
context>> 
.>> 
Result>> 
=>>  
new>>! $+
InternalServerErrorObjectResult>>% D
(>>D E
json>>E I
)>>I J
;>>J K
context?? 
.?? 
HttpContext?? #
.??# $
Response??$ ,
.??, -

StatusCode??- 7
=??8 9
(??: ;
int??; >
)??> ?
HttpStatusCode??? M
.??M N
InternalServerError??N a
;??a b
}@@ 
contextAA 
.AA 
ExceptionHandledAA $
=AA% &
trueAA' +
;AA+ ,
}BB 	
privateDD 
classDD 
JsonErrorResponseDD '
{EE 	
publicFF 
stringFF 
[FF 
]FF 
MessagesFF $
{FF% &
getFF' *
;FF* +
setFF, /
;FF/ 0
}FF1 2
publicHH 
objectHH 
DeveloperMessageHH *
{HH+ ,
getHH- 0
;HH0 1
setHH2 5
;HH5 6
}HH7 8
}II 	
}JJ 
}KK û
®C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Infrastructure\IntegrationEventMigrations\20210913094108_Initial_Create.cs
	namespace 	
Catalog
 
. 
API 
. 
Infrastructure $
.$ %&
IntegrationEventMigrations% ?
{ 
public 

partial 
class 
Initial_Create '
:( )
	Migration* 3
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{		 	
migrationBuilder

 
.

 
CreateTable

 (
(

( )
name 
: 
$str +
,+ ,
columns 
: 
table 
=> !
new" %
{ 
EventId 
= 
table #
.# $
Column$ *
<* +
Guid+ /
>/ 0
(0 1
type1 5
:5 6
$str7 I
,I J
nullableK S
:S T
falseU Z
)Z [
,[ \
EventTypeName !
=" #
table$ )
.) *
Column* 0
<0 1
string1 7
>7 8
(8 9
type9 =
:= >
$str? N
,N O
nullableP X
:X Y
falseZ _
)_ `
,` a
State 
= 
table !
.! "
Column" (
<( )
int) ,
>, -
(- .
type. 2
:2 3
$str4 9
,9 :
nullable; C
:C D
falseE J
)J K
,K L
	TimesSent 
= 
table  %
.% &
Column& ,
<, -
int- 0
>0 1
(1 2
type2 6
:6 7
$str8 =
,= >
nullable? G
:G H
falseI N
)N O
,O P
CreationTime  
=! "
table# (
.( )
Column) /
</ 0
DateTime0 8
>8 9
(9 :
type: >
:> ?
$str@ K
,K L
nullableM U
:U V
falseW \
)\ ]
,] ^
Content 
= 
table #
.# $
Column$ *
<* +
string+ 1
>1 2
(2 3
type3 7
:7 8
$str9 H
,H I
nullableJ R
:R S
falseT Y
)Y Z
,Z [
TransactionId !
=" #
table$ )
.) *
Column* 0
<0 1
string1 7
>7 8
(8 9
type9 =
:= >
$str? N
,N O
nullableP X
:X Y
trueZ ^
)^ _
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% =
,= >
x? @
=>A C
xD E
.E F
EventIdF M
)M N
;N O
} 
) 
; 
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 
	DropTable &
(& '
name 
: 
$str +
)+ ,
;, -
}   	
}!! 
}"" »
∂C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Infrastructure\IntegrationEventMigrations\IntegrationEventLogContextDesignTimeFactory.cs
	namespace 	
Catalog
 
. 
API 
. 
Infrastructure $
.$ %&
IntegrationEventMigrations% ?
{ 
public 

class 7
+IntegrationEventLogContextDesignTimeFactory <
:= >'
IDesignTimeDbContextFactory? Z
<Z [&
IntegrationEventLogContext[ u
>u v
{ 
public		 &
IntegrationEventLogContext		 )
CreateDbContext		* 9
(		9 :
string		: @
[		@ A
]		A B
args		C G
)		G H
{

 	
var 
optionsBuilder 
=  
new! $#
DbContextOptionsBuilder% <
<< =&
IntegrationEventLogContext= W
>W X
(X Y
)Y Z
;Z [
optionsBuilder 
. 
UseSqlServer '
(' (
$str( +
,+ ,
options- 4
=>5 7
options8 ?
.? @
MigrationsAssembly@ R
(R S
GetTypeS Z
(Z [
)[ \
.\ ]
Assembly] e
.e f
GetNamef m
(m n
)n o
.o p
Namep t
)t u
)u v
;v w
return 
new &
IntegrationEventLogContext 1
(1 2
optionsBuilder2 @
.@ A
OptionsA H
)H I
;I J
} 	
} 
} ú=
òC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Infrastructure\Migrations\20210913093804_Initial_Create.cs
	namespace 	
Catalog
 
. 
API 
. 
Infrastructure $
.$ %

Migrations% /
{ 
public 

partial 
class 
Initial_Create '
:( )
	Migration* 3
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{		 	
migrationBuilder

 
.

 
EnsureSchema

 )
(

) *
name 
: 
$str 
)  
;  !
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str &
,& '
schema 
: 
$str !
,! "
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
type+ /
:/ 0
$str1 6
,6 7
nullable8 @
:@ A
falseB G
,G H
defaultValueI U
:U V
$numW X
)X Y
,Y Z
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 E
,E F
	maxLengthG P
:P Q
$numR U
,U V
nullableW _
:_ `
falsea f
)f g
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 8
,8 9
x: ;
=>< >
x? @
.@ A
IdA C
)C D
;D E
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str  
,  !
schema 
: 
$str !
,! "
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
type+ /
:/ 0
$str1 6
,6 7
nullable8 @
:@ A
falseB G
)G H
.   

Annotation   #
(  # $
$str  $ 8
,  8 9
$str  : @
)  @ A
,  A B
Code!! 
=!! 
table!!  
.!!  !
Column!!! '
<!!' (
string!!( .
>!!. /
(!!/ 0
type!!0 4
:!!4 5
$str!!6 E
,!!E F
nullable!!G O
:!!O P
false!!Q V
)!!V W
,!!W X
Owner"" 
="" 
table"" !
.""! "
Column""" (
<""( )
Guid"") -
>""- .
("". /
type""/ 3
:""3 4
$str""5 G
,""G H
nullable""I Q
:""Q R
false""S X
)""X Y
,""Y Z
Name## 
=## 
table##  
.##  !
Column##! '
<##' (
string##( .
>##. /
(##/ 0
type##0 4
:##4 5
$str##6 E
,##E F
nullable##G O
:##O P
false##Q V
)##V W
,##W X
Price$$ 
=$$ 
table$$ !
.$$! "
Column$$" (
<$$( )
decimal$$) 0
>$$0 1
($$1 2
type$$2 6
:$$6 7
$str$$8 G
,$$G H
nullable$$I Q
:$$Q R
false$$S X
)$$X Y
,$$Y Z
Description%% 
=%%  !
table%%" '
.%%' (
Column%%( .
<%%. /
string%%/ 5
>%%5 6
(%%6 7
type%%7 ;
:%%; <
$str%%= L
,%%L M
nullable%%N V
:%%V W
true%%X \
)%%\ ]
,%%] ^
Amount&& 
=&& 
table&& "
.&&" #
Column&&# )
<&&) *
int&&* -
>&&- .
(&&. /
type&&/ 3
:&&3 4
$str&&5 :
,&&: ;
nullable&&< D
:&&D E
false&&F K
)&&K L
,&&L M
ProductStatusId'' #
=''$ %
table''& +
.''+ ,
Column'', 2
<''2 3
int''3 6
>''6 7
(''7 8
type''8 <
:''< =
$str''> C
,''C D
nullable''E M
:''M N
false''O T
)''T U
,''U V
	CreatedAt(( 
=(( 
table((  %
.((% &
Column((& ,
<((, -
DateTime((- 5
>((5 6
(((6 7
type((7 ;
:((; <
$str((= H
,((H I
nullable((J R
:((R S
false((T Y
)((Y Z
,((Z [
	UpdatedAt)) 
=)) 
table))  %
.))% &
Column))& ,
<)), -
DateTime))- 5
>))5 6
())6 7
type))7 ;
:)); <
$str))= H
,))H I
nullable))J R
:))R S
true))T X
)))X Y
}** 
,** 
constraints++ 
:++ 
table++ "
=>++# %
{,, 
table-- 
.-- 

PrimaryKey-- $
(--$ %
$str--% 2
,--2 3
x--4 5
=>--6 8
x--9 :
.--: ;
Id--; =
)--= >
;--> ?
table.. 
... 

ForeignKey.. $
(..$ %
name// 
:// 
$str// J
,//J K
column00 
:00 
x00  !
=>00" $
x00% &
.00& '
ProductStatusId00' 6
,006 7
principalSchema11 '
:11' (
$str11) 2
,112 3
principalTable22 &
:22& '
$str22( 8
,228 9
principalColumn33 '
:33' (
$str33) -
,33- .
onDelete44  
:44  !
ReferentialAction44" 3
.443 4
Cascade444 ;
)44; <
;44< =
}55 
)55 
;55 
migrationBuilder77 
.77 
CreateIndex77 (
(77( )
name88 
:88 
$str88 3
,883 4
schema99 
:99 
$str99 !
,99! "
table:: 
::: 
$str:: !
,::! "
column;; 
:;; 
$str;; )
);;) *
;;;* +
}<< 	
	protected>> 
override>> 
void>> 
Down>>  $
(>>$ %
MigrationBuilder>>% 5
migrationBuilder>>6 F
)>>F G
{?? 	
migrationBuilder@@ 
.@@ 
	DropTable@@ &
(@@& '
nameAA 
:AA 
$strAA  
,AA  !
schemaBB 
:BB 
$strBB !
)BB! "
;BB" #
migrationBuilderDD 
.DD 
	DropTableDD &
(DD& '
nameEE 
:EE 
$strEE &
,EE& '
schemaFF 
:FF 
$strFF !
)FF! "
;FF" #
}GG 	
}HH 
}II ÙG
hC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Program.cs
	namespace 	
Catalog
 
. 
API 
{ 
public 

class 
Program 
{ 
public 
static 
readonly 
string %
	Namespace& /
=0 1
typeof2 8
(8 9
Program9 @
)@ A
.A B
	NamespaceB K
;K L
public 
static 
readonly 
string %
AppName& -
=. /
	Namespace0 9
.9 :
	Substring: C
(C D
	NamespaceD M
.M N
LastIndexOfN Y
(Y Z
$charZ ]
,] ^
	Namespace_ h
.h i
LastIndexOfi t
(t u
$charu x
)x y
-z {
$num| }
)} ~
+	 Ä
$num
Å Ç
)
Ç É
;
É Ñ
public 
static 
int 
Main 
( 
string %
[% &
]& '
args( ,
), -
{ 	
var 
configuration 
= 
GetConfiguration  0
(0 1
)1 2
;2 3
Log   
.   
Logger   
=   
CreateSerilogLogger   ,
(  , -
configuration  - :
)  : ;
;  ; <
try"" 
{## 
Log$$ 
.$$ 
Information$$ 
($$  
$str$$  P
,$$P Q
AppName$$R Y
)$$Y Z
;$$Z [
var%% 
host%% 
=%% 
BuildWebHost%% '
(%%' (
configuration%%( 5
,%%5 6
args%%7 ;
)%%; <
;%%< =
Log'' 
.'' 
Information'' 
(''  
$str''  O
,''O P
AppName''Q X
)''X Y
;''Y Z
host(( 
.(( 
MigrateDbContext(( %
<((% &
CatalogContext((& 4
>((4 5
(((5 6
(((6 7
context((7 >
,((> ?
services((@ H
)((H I
=>((J L
{)) 
var** 
env** 
=** 
services** &
.**& '

GetService**' 1
<**1 2
IWebHostEnvironment**2 E
>**E F
(**F G
)**G H
;**H I
var++ 
settings++  
=++! "
services++# +
.+++ ,

GetService++, 6
<++6 7
IOptions++7 ?
<++? @
CatalogSettings++@ O
>++O P
>++P Q
(++Q R
)++R S
;++S T
var,, 
logger,, 
=,,  
services,,! )
.,,) *

GetService,,* 4
<,,4 5
ILogger,,5 <
<,,< =
CatalogContextSeed,,= O
>,,O P
>,,P Q
(,,Q R
),,R S
;,,S T
new.. 
CatalogContextSeed.. *
(..* +
)..+ ,
.// 
	SeedAsync// "
(//" #
context//# *
,//* +
env//, /
,/// 0
settings//1 9
,//9 :
logger//; A
)//A B
.00 
Wait00 
(00 
)00 
;00  
}11 
)11 
.22 
MigrateDbContext22 !
<22! "&
IntegrationEventLogContext22" <
>22< =
(22= >
(22> ?
_22? @
,22@ A
__22B D
)22D E
=>22F H
{22I J
}22K L
)22L M
;22M N
Log44 
.44 
Information44 
(44  
$str44  M
,44M N
AppName44O V
)44V W
;44W X
host55 
.55 
Run55 
(55 
)55 
;55 
return77 
$num77 
;77 
}88 
catch99 
(99 
	Exception99 
ex99 
)99  
{:: 
Log;; 
.;; 
Fatal;; 
(;; 
ex;; 
,;; 
$str;; W
,;;W X
AppName;;Y `
);;` a
;;;a b
return<< 
$num<< 
;<< 
}== 
finally>> 
{?? 
Log@@ 
.@@ 
CloseAndFlush@@ !
(@@! "
)@@" #
;@@# $
}AA 
}BB 	
privateDD 
staticDD 
SerilogDD 
.DD 
ILoggerDD &
CreateSerilogLoggerDD' :
(DD: ;
IConfigurationDD; I
configurationDDJ W
)DDW X
{EE 	
varFF 
seqServerUrlFF 
=FF 
configurationFF ,
[FF, -
$strFF- C
]FFC D
;FFD E
varGG 
logstashUrlGG 
=GG 
configurationGG +
[GG+ ,
$strGG, B
]GGB C
;GGC D
returnHH 
newHH 
LoggerConfigurationHH *
(HH* +
)HH+ ,
.II 
MinimumLevelII 
.II 
VerboseII %
(II% &
)II& '
.JJ 
EnrichJJ 
.JJ 
WithPropertyJJ $
(JJ$ %
$strJJ% 9
,JJ9 :
AppNameJJ; B
)JJB C
.KK 
EnrichKK 
.KK 
FromLogContextKK &
(KK& '
)KK' (
.LL 
WriteToLL 
.LL 
ConsoleLL  
(LL  !
)LL! "
.MM 
WriteToMM 
.MM 
SeqMM 
(MM 
stringMM #
.MM# $
IsNullOrWhiteSpaceMM$ 6
(MM6 7
seqServerUrlMM7 C
)MMC D
?MME F
$strMMG S
:MMT U
seqServerUrlMMV b
)MMb c
.NN 
WriteToNN 
.NN 
HttpNN 
(NN 
stringNN $
.NN$ %
IsNullOrWhiteSpaceNN% 7
(NN7 8
logstashUrlNN8 C
)NNC D
?NNE F
$strNNG ]
:NN^ _
logstashUrlNN` k
)NNk l
.OO 
ReadFromOO 
.OO 
ConfigurationOO '
(OO' (
configurationOO( 5
)OO5 6
.PP 
CreateLoggerPP 
(PP 
)PP 
;PP  
}QQ 	
privateSS 
staticSS 
IConfigurationSS %
GetConfigurationSS& 6
(SS6 7
)SS7 8
{TT 	
varUU 
builderUU 
=UU 
newUU  
ConfigurationBuilderUU 2
(UU2 3
)UU3 4
.VV 
SetBasePathVV 
(VV 
	DirectoryVV &
.VV& '
GetCurrentDirectoryVV' :
(VV: ;
)VV; <
)VV< =
.WW 
AddJsonFileWW 
(WW 
$strWW /
,WW/ 0
optionalWW1 9
:WW9 :
falseWW; @
,WW@ A
reloadOnChangeWWB P
:WWP Q
trueWWR V
)WWV W
.XX #
AddEnvironmentVariablesXX (
(XX( )
)XX) *
;XX* +
returnZZ 
builderZZ 
.ZZ 
BuildZZ  
(ZZ  !
)ZZ! "
;ZZ" #
}[[ 	
private]] 
static]] 
IWebHost]] 
BuildWebHost]]  ,
(]], -
IConfiguration]]- ;
configuration]]< I
,]]I J
string]]K Q
[]]Q R
]]]R S
args]]T X
)]]X Y
=>]]Z \
WebHost^^ 
.^^  
CreateDefaultBuilder^^ (
(^^( )
args^^) -
)^^- .
.__  
CaptureStartupErrors__ %
(__% &
false__& +
)__+ ,
.`` 
ConfigureKestrel`` !
(``! "
options``" )
=>``* ,
{aa 
optionsbb 
.bb 
Listenbb "
(bb" #
	IPAddressbb# ,
.bb, -
Anybb- 0
,bb0 1
$numbb2 4
,bb4 5
listenOptionsbb6 C
=>bbD F
{cc 
listenOptionsdd %
.dd% &
	Protocolsdd& /
=dd0 1
HttpProtocolsdd2 ?
.dd? @
Http1AndHttp2dd@ M
;ddM N
}ee 
)ee 
;ee 
}ff 
)ff 
.gg %
ConfigureAppConfigurationgg *
(gg* +
xgg+ ,
=>gg- /
xgg0 1
.gg1 2
AddConfigurationgg2 B
(ggB C
configurationggC P
)ggP Q
)ggQ R
.hh 

UseStartuphh 
<hh 
Startuphh #
>hh# $
(hh$ %
)hh% &
.ii 
UseContentRootii 
(ii  
	Directoryii  )
.ii) *
GetCurrentDirectoryii* =
(ii= >
)ii> ?
)ii? @
.jj 

UseSerilogjj 
(jj 
)jj 
.kk 
Buildkk 
(kk 
)kk 
;kk 
}ll 
}mm ˝B
hC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Startup.cs
	namespace 	
Catalog
 
. 
API 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public!! 
virtual!! 
IServiceProvider!! '
ConfigureServices!!( 9
(!!9 :
IServiceCollection!!: L
services!!M U
)!!U V
{"" 	
services## 
.$$ 
AddCustomMvc$$ 
($$ 
)$$ 
.%% 
AddHealthChecks%%  
(%%  !
Configuration%%! .
)%%. /
.&& 
AddCustomDbContext&& #
(&&# $
Configuration&&$ 1
)&&1 2
.'' 
AddCustomSwagger'' !
(''! "
Configuration''" /
)''/ 0
.(( !
AddCustomIntegrations(( &
(((& '
Configuration((' 4
)((4 5
.)) "
AddCustomConfiguration)) '
())' (
Configuration))( 5
)))5 6
.** 
AddEventBus** 
(** 
Configuration** *
)*** +
.++ #
AddCustomAuthentication++ (
(++( )
Configuration++) 6
)++6 7
;++7 8
var-- 
	container-- 
=-- 
new-- 
ContainerBuilder--  0
(--0 1
)--1 2
;--2 3
	container.. 
... 
Populate.. 
(.. 
services.. '
)..' (
;..( )
	container00 
.00 
RegisterModule00 $
(00$ %
new00% (
MediatorModule00) 7
(007 8
)008 9
)009 :
;00: ;
	container11 
.11 
RegisterModule11 $
(11$ %
new11% (
ApplicationModule11) :
(11: ;
Configuration11; H
[11H I
$str11I [
]11[ \
)11\ ]
)11] ^
;11^ _
return33 
new33 "
AutofacServiceProvider33 -
(33- .
	container33. 7
.337 8
Build338 =
(33= >
)33> ?
)33? @
;33@ A
}44 	
public77 
void77 
	Configure77 
(77 
IApplicationBuilder77 1
app772 5
,775 6
IWebHostEnvironment777 J
env77K N
,77N O
ILoggerFactory77P ^
loggerFactory77_ l
)77l m
{88 	
var99 
pathBase99 
=99 
Configuration99 (
[99( )
$str99) 4
]994 5
;995 6
if:: 
(:: 
!:: 
string:: 
.:: 
IsNullOrEmpty:: %
(::% &
pathBase::& .
)::. /
)::/ 0
{;; 
loggerFactory<< 
.<< 
CreateLogger<< *
<<<* +
Startup<<+ 2
><<2 3
(<<3 4
)<<4 5
.<<5 6
LogDebug<<6 >
(<<> ?
$str<<? ]
,<<] ^
pathBase<<_ g
)<<g h
;<<h i
app== 
.== 
UsePathBase== 
(==  
pathBase==  (
)==( )
;==) *
}>> 
if@@ 
(@@ 
env@@ 
.@@ 
IsDevelopment@@ !
(@@! "
)@@" #
)@@# $
{AA $
IdentityModelEventSourceBB (
.BB( )
ShowPIIBB) 0
=BB1 2
trueBB3 7
;BB7 8
appDD 
.DD 

UseSwaggerDD 
(DD 
)DD  
;DD  !
appEE 
.EE 
UseSwaggerUIEE  
(EE  !
cEE! "
=>EE# %
{FF 
cGG 
.GG 
SwaggerEndpointGG %
(GG% &
$"GG& (
{GG( )
(GG* +
!GG+ ,
stringGG, 2
.GG2 3
IsNullOrEmptyGG3 @
(GG@ A
pathBaseGGA I
)GGI J
?GGK L
pathBaseGGM U
:GGV W
stringGGX ^
.GG^ _
EmptyGG_ d
)GGd e
}GGf g
$strGGg 
"	GG Ä
,
GGÄ Å
$str
GGÇ í
)
GGí ì
;
GGì î
cHH 
.HH 
OAuthClientIdHH #
(HH# $
ConfigurationHH$ 1
.HH1 2

GetSectionHH2 <
(HH< =
$strHH= I
)HHI J
.HHJ K
GetValueHHK S
<HHS T
stringHHT Z
>HHZ [
(HH[ \
$strHH\ m
)HHm n
)HHn o
;HHo p
cII 
.II 
OAuthAppNameII "
(II" #
$strII# 6
)II6 7
;II7 8
cKK 
.KK 
ConfigObjectKK "
.KK" #
OAuth2RedirectUrlKK# 4
=KK5 6
$"KK7 9
$strKK9 N
{KKN O
(KKP Q
!KKQ R
stringKKR X
.KKX Y
IsNullOrEmptyKKY f
(KKf g
pathBaseKKg o
)KKo p
?KKq r
pathBaseKKs {
:KK| }
string	KK~ Ñ
.
KKÑ Ö
Empty
KKÖ ä
)
KKä ã
}
KKå ç
$str
KKç ™
"
KK™ ´
;
KK´ ¨
}LL 
)LL 
;LL 
}NN 
appPP 
.PP 
UseHttpsRedirectionPP #
(PP# $
)PP$ %
;PP% &
appQQ 
.QQ 

UseRoutingQQ 
(QQ 
)QQ 
;QQ 
appRR 
.RR 
UseCorsRR 
(RR 
$strRR $
)RR$ %
;RR% &
ConfigureAuthTT 
(TT 
appTT 
)TT 
;TT 
appVV 
.VV 
UseEndpointsVV 
(VV 
	endpointsVV &
=>VV' )
{WW 
	endpointsXX 
.XX %
MapDefaultControllerRouteXX 3
(XX3 4
)XX4 5
;XX5 6
	endpointsYY 
.YY 
MapControllersYY (
(YY( )
)YY) *
;YY* +
	endpointsZZ 
.ZZ 
MapHealthChecksZZ )
(ZZ) *
$strZZ* /
,ZZ/ 0
newZZ1 4
HealthCheckOptionsZZ5 G
(ZZG H
)ZZH I
{[[ 
	Predicate\\ 
=\\ 
_\\  !
=>\\" $
true\\% )
,\\) *
ResponseWriter]] "
=]]# $
UIResponseWriter]]% 5
.]]5 6&
WriteHealthCheckUIResponse]]6 P
}^^ 
)^^ 
;^^ 
	endpoints__ 
.__ 
MapHealthChecks__ )
(__) *
$str__* 5
,__5 6
new__7 :
HealthCheckOptions__; M
(__M N
)__N O
{`` 
	Predicateaa 
=aa 
raa  !
=>aa" $
raa% &
.aa& '
Nameaa' +
.aa+ ,
Containsaa, 4
(aa4 5
$straa5 ;
)aa; <
}bb 
)bb 
;bb 
}cc 
)cc 
;cc 
ConfigureEventBusee 
(ee 
appee !
)ee! "
;ee" #
}ff 	
	protectedhh 
virtualhh 
voidhh 
ConfigureAuthhh ,
(hh, -
IApplicationBuilderhh- @
apphhA D
)hhD E
{ii 	
appjj 
.jj 
UseAuthenticationjj !
(jj! "
)jj" #
;jj# $
appkk 
.kk 
UseAuthorizationkk  
(kk  !
)kk! "
;kk" #
}ll 	
privatenn 
voidnn 
ConfigureEventBusnn &
(nn& '
IApplicationBuildernn' :
appnn; >
)nn> ?
{oo 	
varpp 
eventBuspp 
=pp 
apppp 
.pp 
ApplicationServicespp 2
.pp2 3
GetRequiredServicepp3 E
<ppE F
BuildingBlocksppF T
.ppT U
EventBusppU ]
.pp] ^
Abstractionspp^ j
.ppj k
	IEventBusppk t
>ppt u
(ppu v
)ppv w
;ppw x
}tt 	
}uu 
}vv Ç∏
sC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.API\Startup.Extensions.cs
	namespace 	
Catalog
 
. 
API 
{ 
internal   
static   
class   
StartupExtensions   +
{!! 
public"" 
static"" 
IServiceCollection"" (
AddCustomMvc"") 5
(""5 6
this""6 :
IServiceCollection""; M
services""N V
)""V W
{## 	
services$$ 
.$$ 

AddRouting$$ 
($$  
options$$  '
=>$$( *
{%% 
options&& 
.&& 
LowercaseUrls&& %
=&&& '
true&&( ,
;&&, -
options'' 
.'' !
LowercaseQueryStrings'' -
=''. /
true''0 4
;''4 5
}(( 
)(( 
;(( 
services++ 
.++ 
AddControllers++ #
(++# $
options++$ +
=>++, .
{,, 
options-- 
.-- 
Filters-- 
.--  
Add--  #
(--# $
typeof--$ *
(--* +%
HttpGlobalExceptionFilter--+ D
)--D E
)--E F
;--F G
}.. 
).. 
.// 
AddApplicationPart// #
(//# $
typeof//$ *
(//* +
HomeController//+ 9
)//9 :
.//: ;
Assembly//; C
)//C D
.00 
AddJsonOptions00 
(00  
options00  '
=>00( *
{11 
options22 
.22 !
JsonSerializerOptions22 1
.221 2
WriteIndented222 ?
=22@ A
true22B F
;22F G
options33 
.33 !
JsonSerializerOptions33 1
.331 2 
PropertyNamingPolicy332 F
=33G H
JsonNamingPolicy33I Y
.33Y Z
	CamelCase33Z c
;33c d
}44 
)44 
.55 #
SetCompatibilityVersion55 (
(55( ) 
CompatibilityVersion55) =
.55= >
Version_3_055> I
)55I J
;55J K
services77 
.77 
AddCors77 
(77 
options77 $
=>77% '
{88 
options99 
.99 
	AddPolicy99 !
(99! "
$str99" .
,99. /
builder:: 
=>:: 
builder:: &
.;; 
SetIsOriginAllowed;; '
(;;' (
(;;( )
host;;) -
);;- .
=>;;/ 1
true;;2 6
);;6 7
.<< 
AllowAnyMethod<< #
(<<# $
)<<$ %
.== 
AllowAnyHeader== #
(==# $
)==$ %
.>> 
AllowCredentials>> %
(>>% &
)>>& '
)>>' (
;>>( )
}?? 
)?? 
;?? 
returnAA 
servicesAA 
;AA 
}BB 	
publicDD 
staticDD 
IServiceCollectionDD (
AddHealthChecksDD) 8
(DD8 9
thisDD9 =
IServiceCollectionDD> P
servicesDDQ Y
,DDY Z
IConfigurationDD[ i
configurationDDj w
)DDw x
{EE 	
varFF 
	hcBuilderFF 
=FF 
servicesFF $
.FF$ %
AddHealthChecksFF% 4
(FF4 5
)FF5 6
;FF6 7
	hcBuilderHH 
.HH 
AddCheckHH 
(HH 
$strHH %
,HH% &
(HH' (
)HH( )
=>HH* ,
HealthCheckResultHH- >
.HH> ?
HealthyHH? F
(HHF G
)HHG H
)HHH I
;HHI J
	hcBuilderJJ 
.KK 
AddSqlServerKK 
(KK 
configurationLL !
[LL! "
$strLL" 4
]LL4 5
,LL5 6
nameMM 
:MM 
$strMM +
,MM+ ,
tagsNN 
:NN 
newNN 
stringNN $
[NN$ %
]NN% &
{NN' (
$strNN) 4
}NN5 6
)NN6 7
;NN7 8
	hcBuilderPP 
.QQ 
AddRabbitMQQQ 
(QQ 
$"RR 
$strRR 
{RR 
configurationRR +
[RR+ ,
$strRR, @
]RR@ A
}RRA B
"RRB C
,RRC D
nameSS 
:SS 
$strSS 5
,SS5 6
tagsTT 
:TT 
newTT 
stringTT $
[TT$ %
]TT% &
{TT' (
$strTT) 6
}TT7 8
)TT8 9
;TT9 :
returnVV 
servicesVV 
;VV 
}WW 	
publicYY 
staticYY 
IServiceCollectionYY (
AddCustomDbContextYY) ;
(YY; <
thisYY< @
IServiceCollectionYYA S
servicesYYT \
,YY\ ]
IConfigurationYY^ l
configurationYYm z
)YYz {
{ZZ 	
services[[ 
.[[ 
AddDbContext[[ !
<[[! "
CatalogContext[[" 0
>[[0 1
([[1 2
options[[2 9
=>[[: <
{\\ 
options]] 
.]] 
UseSqlServer]] $
(]]$ %
configuration]]% 2
[]]2 3
$str]]3 E
]]]E F
,]]F G"
sqlServerOptionsAction^^ *
:^^* +

sqlOptions^^, 6
=>^^7 9
{__ 

sqlOptions`` "
.``" #
MigrationsAssembly``# 5
(``5 6
typeof``6 <
(``< =
Startup``= D
)``D E
.``E F
GetTypeInfo``F Q
(``Q R
)``R S
.``S T
Assembly``T \
.``\ ]
GetName``] d
(``d e
)``e f
.``f g
Name``g k
)``k l
;``l m

sqlOptionsaa "
.aa" # 
EnableRetryOnFailureaa# 7
(aa7 8
maxRetryCountaa8 E
:aaE F
$numaaG I
,aaI J
maxRetryDelayaaK X
:aaX Y
TimeSpanaaZ b
.aab c
FromSecondsaac n
(aan o
$numaao q
)aaq r
,aar s
errorNumbersToAdd	aat Ö
:
aaÖ Ü
null
aaá ã
)
aaã å
;
aaå ç
}bb 
)bb 
;bb 
}cc 
,cc 
ServiceLifetimecc 
.cc 
Scopedcc %
)cc% &
;cc& '
servicesff 
.ff 
AddDbContextff !
<ff! "&
IntegrationEventLogContextff" <
>ff< =
(ff= >
optionsff> E
=>ffF H
{gg 
optionshh 
.hh 
UseSqlServerhh $
(hh$ %
configurationhh% 2
[hh2 3
$strhh3 E
]hhE F
,hhF G"
sqlServerOptionsActionii *
:ii* +

sqlOptionsii, 6
=>ii7 9
{jj 

sqlOptionskk "
.kk" #
MigrationsAssemblykk# 5
(kk5 6
typeofkk6 <
(kk< =
Startupkk= D
)kkD E
.kkE F
GetTypeInfokkF Q
(kkQ R
)kkR S
.kkS T
AssemblykkT \
.kk\ ]
GetNamekk] d
(kkd e
)kke f
.kkf g
Namekkg k
)kkk l
;kkl m

sqlOptionsmm "
.mm" # 
EnableRetryOnFailuremm# 7
(mm7 8
maxRetryCountmm8 E
:mmE F
$nummmG I
,mmI J
maxRetryDelaymmK X
:mmX Y
TimeSpanmmZ b
.mmb c
FromSecondsmmc n
(mmn o
$nummmo q
)mmq r
,mmr s
errorNumbersToAdd	mmt Ö
:
mmÖ Ü
null
mmá ã
)
mmã å
;
mmå ç
}nn 
)nn 
;nn 
}oo 
)oo 
;oo 
returnqq 
servicesqq 
;qq 
}rr 	
publictt 
statictt 
IServiceCollectiontt ( 
AddInMemoryDbContexttt) =
(tt= >
thistt> B
IServiceCollectionttC U
servicesttV ^
,tt^ _
IConfigurationtt` n
configurationtto |
)tt| }
{uu 	
servicesvv 
.vv 
AddDbContextvv !
<vv! "
CatalogContextvv" 0
>vv0 1
(vv1 2
optionsvv2 9
=>vv: <
{ww 
optionsxx 
.xx 
UseInMemoryDatabasexx +
(xx+ ,
databaseNamexx, 8
:xx8 9
$strxx: E
)xxE F
;xxF G
}yy 
,yy 
ServiceLifetimeyy 
.yy 
Scopedyy %
)yy% &
;yy& '
services|| 
.|| 
AddDbContext|| !
<||! "&
IntegrationEventLogContext||" <
>||< =
(||= >
options||> E
=>||F H
{}} 
options~~ 
.~~ 
UseInMemoryDatabase~~ +
(~~+ ,
databaseName~~, 8
:~~8 9
$str~~: X
)~~X Y
;~~Y Z
} 
) 
; 
return
ÅÅ 
services
ÅÅ 
;
ÅÅ 
}
ÇÇ 	
public
ÑÑ 
static
ÑÑ  
IServiceCollection
ÑÑ (
AddCustomSwagger
ÑÑ) 9
(
ÑÑ9 :
this
ÑÑ: > 
IServiceCollection
ÑÑ? Q
services
ÑÑR Z
,
ÑÑZ [
IConfiguration
ÑÑ\ j
configuration
ÑÑk x
)
ÑÑx y
{
ÖÖ 	
services
ÜÜ 
.
ÜÜ 
AddSwaggerGen
ÜÜ "
(
ÜÜ" #
options
ÜÜ# *
=>
ÜÜ+ -
{
áá 
options
àà 
.
àà 

SwaggerDoc
àà "
(
àà" #
$str
àà# '
,
àà' (
new
àà) ,
OpenApiInfo
àà- 8
{
ââ 
Title
ää 
=
ää 
$str
ää 6
,
ää6 7
Version
ãã 
=
ãã 
$str
ãã "
,
ãã" #
Description
åå 
=
åå  !
$str
åå" @
}
çç 
)
çç 
;
çç 
options
èè 
.
èè #
AddSecurityDefinition
èè -
(
èè- .
$str
èè. 6
,
èè6 7
new
èè8 ;#
OpenApiSecurityScheme
èè< Q
{
êê 
Type
ëë 
=
ëë  
SecuritySchemeType
ëë -
.
ëë- .
OAuth2
ëë. 4
,
ëë4 5
Description
íí 
=
íí  !
$str
íí" ?
,
íí? @
Flows
ìì 
=
ìì 
new
ìì 
OpenApiOAuthFlows
ìì  1
(
ìì1 2
)
ìì2 3
{
îî 
Implicit
ïï  
=
ïï! "
new
ïï# &
OpenApiOAuthFlow
ïï' 7
(
ïï7 8
)
ïï8 9
{
ññ 
AuthorizationUrl
óó ,
=
óó- .
new
óó/ 2
Uri
óó3 6
(
óó6 7
$stróó7 ø
)óóø ¿
,óó¿ ¡
TokenUrl
òò $
=
òò% &
new
òò' *
Uri
òò+ .
(
òò. /
$stròò/ ¶
)òò¶ ß
,òòß ®
Scopes
ôô "
=
ôô# $
new
ôô% (

Dictionary
ôô) 3
<
ôô3 4
string
ôô4 :
,
ôô: ;
string
ôô< B
>
ôôB C
(
ôôC D
)
ôôD E
{
öö 
{
õõ  !
$str
õõ" g
,
õõg h
$strõõi è
}õõè ê
,õõê ë
{
úú  !
$str
úú" c
,
úúc d
$str
úúe r
}
úús t
,
úút u
{
ùù  !
$str
ùù" d
,
ùùd e
$str
ùùf t
}
ùùu v
}
ûû 
}
üü 
}
†† 
}
°° 
)
°° 
;
°° 
options
££ 
.
££ 
OperationFilter
££ '
<
££' (+
AuthorizeCheckOperationFilter
££( E
>
££E F
(
££F G
)
££G H
;
££H I
}
§§ 
)
§§ 
;
§§ 
return
¶¶ 
services
¶¶ 
;
¶¶ 
}
ßß 	
public
©© 
static
©©  
IServiceCollection
©© (#
AddCustomIntegrations
©©) >
(
©©> ?
this
©©? C 
IServiceCollection
©©D V
services
©©W _
,
©©_ `
IConfiguration
©©a o
configuration
©©p }
)
©©} ~
{
™™ 	
services
´´ 
.
´´ 
AddSingleton
´´ !
<
´´! ""
IHttpContextAccessor
´´" 6
,
´´6 7!
HttpContextAccessor
´´8 K
>
´´K L
(
´´L M
)
´´M N
;
´´N O
services
¨¨ 
.
¨¨ 
AddTransient
¨¨ !
<
¨¨! "
IIdentityService
¨¨" 2
,
¨¨2 3
IdentityService
¨¨4 C
>
¨¨C D
(
¨¨D E
)
¨¨E F
;
¨¨F G
services
≠≠ 
.
≠≠ 
AddTransient
≠≠ !
<
≠≠! "
Func
≠≠" &
<
≠≠& '
DbConnection
≠≠' 3
,
≠≠3 4)
IIntegrationEventLogService
≠≠5 P
>
≠≠P Q
>
≠≠Q R
(
≠≠R S
sp
ÆÆ 
=>
ÆÆ 
(
ÆÆ 
DbConnection
ÆÆ #
c
ÆÆ$ %
)
ÆÆ% &
=>
ÆÆ' )
new
ÆÆ* -(
IntegrationEventLogService
ÆÆ. H
(
ÆÆH I
c
ÆÆI J
)
ÆÆJ K
)
ÆÆK L
;
ÆÆL M
services
∞∞ 
.
∞∞ 
AddTransient
∞∞ !
<
∞∞! "-
ICatalogIntegrationEventService
∞∞" A
,
∞∞A B,
CatalogIntegrationEventService
∞∞C a
>
∞∞a b
(
∞∞b c
)
∞∞c d
;
∞∞d e
services
≤≤ 
.
≤≤ 
AddSingleton
≤≤ !
<
≤≤! "+
IRabbitMQPersistentConnection
≤≤" ?
>
≤≤? @
(
≤≤@ A
sp
≤≤A C
=>
≤≤D F
{
≥≥ 
var
¥¥ 
logger
¥¥ 
=
¥¥ 
sp
¥¥ 
.
¥¥   
GetRequiredService
¥¥  2
<
¥¥2 3
ILogger
¥¥3 :
<
¥¥: ;1
#DefaultRabbitMQPersistentConnection
¥¥; ^
>
¥¥^ _
>
¥¥_ `
(
¥¥` a
)
¥¥a b
;
¥¥b c
var
∂∂ 
factory
∂∂ 
=
∂∂ 
new
∂∂ !
ConnectionFactory
∂∂" 3
(
∂∂3 4
)
∂∂4 5
{
∑∑ 
HostName
∏∏ 
=
∏∏ 
configuration
∏∏ ,
[
∏∏, -
$str
∏∏- A
]
∏∏A B
,
∏∏B C$
DispatchConsumersAsync
ππ *
=
ππ+ ,
true
ππ- 1
}
∫∫ 
;
∫∫ 
if
ºº 
(
ºº 
!
ºº 
string
ºº 
.
ºº 
IsNullOrEmpty
ºº )
(
ºº) *
configuration
ºº* 7
[
ºº7 8
$str
ºº8 J
]
ººJ K
)
ººK L
)
ººL M
{
ΩΩ 
factory
ææ 
.
ææ 
UserName
ææ $
=
ææ% &
configuration
ææ' 4
[
ææ4 5
$str
ææ5 G
]
ææG H
;
ææH I
}
øø 
if
¡¡ 
(
¡¡ 
!
¡¡ 
string
¡¡ 
.
¡¡ 
IsNullOrEmpty
¡¡ )
(
¡¡) *
configuration
¡¡* 7
[
¡¡7 8
$str
¡¡8 J
]
¡¡J K
)
¡¡K L
)
¡¡L M
{
¬¬ 
factory
√√ 
.
√√ 
Password
√√ $
=
√√% &
configuration
√√' 4
[
√√4 5
$str
√√5 G
]
√√G H
;
√√H I
}
ƒƒ 
var
∆∆ 

retryCount
∆∆ 
=
∆∆  
$num
∆∆! "
;
∆∆" #
if
«« 
(
«« 
!
«« 
string
«« 
.
«« 
IsNullOrEmpty
«« )
(
««) *
configuration
««* 7
[
««7 8
$str
««8 L
]
««L M
)
««M N
)
««N O
{
»» 

retryCount
…… 
=
……  
int
……! $
.
……$ %
Parse
……% *
(
……* +
configuration
……+ 8
[
……8 9
$str
……9 M
]
……M N
)
……N O
;
……O P
}
   
return
ÃÃ 
new
ÃÃ 1
#DefaultRabbitMQPersistentConnection
ÃÃ >
(
ÃÃ> ?
factory
ÃÃ? F
,
ÃÃF G
logger
ÃÃH N
,
ÃÃN O

retryCount
ÃÃP Z
)
ÃÃZ [
;
ÃÃ[ \
}
ÕÕ 
)
ÕÕ 
;
ÕÕ 
return
œœ 
services
œœ 
;
œœ 
}
–– 	
public
““ 
static
““  
IServiceCollection
““ ($
AddCustomConfiguration
““) ?
(
““? @
this
““@ D 
IServiceCollection
““E W
services
““X `
,
““` a
IConfiguration
““b p
configuration
““q ~
)
““~ 
{
”” 	
services
‘‘ 
.
‘‘ 

AddOptions
‘‘ 
(
‘‘  
)
‘‘  !
;
‘‘! "
services
’’ 
.
’’ 
	Configure
’’ 
<
’’ 
CatalogSettings
’’ .
>
’’. /
(
’’/ 0
configuration
’’0 =
)
’’= >
;
’’> ?
services
÷÷ 
.
÷÷ 
	Configure
÷÷ 
<
÷÷  
ApiBehaviorOptions
÷÷ 1
>
÷÷1 2
(
÷÷2 3
options
÷÷3 :
=>
÷÷; =
{
◊◊ 
options
ÿÿ 
.
ÿÿ .
 InvalidModelStateResponseFactory
ÿÿ 8
=
ÿÿ9 :
context
ÿÿ; B
=>
ÿÿC E
{
ŸŸ 
var
⁄⁄ 
problemDetails
⁄⁄ &
=
⁄⁄' (
new
⁄⁄) ,&
ValidationProblemDetails
⁄⁄- E
(
⁄⁄E F
context
⁄⁄F M
.
⁄⁄M N

ModelState
⁄⁄N X
)
⁄⁄X Y
{
€€ 
Instance
‹‹  
=
‹‹! "
context
‹‹# *
.
‹‹* +
HttpContext
‹‹+ 6
.
‹‹6 7
Request
‹‹7 >
.
‹‹> ?
Path
‹‹? C
,
‹‹C D
Status
›› 
=
››  
StatusCodes
››! ,
.
››, -!
Status400BadRequest
››- @
,
››@ A
Detail
ﬁﬁ 
=
ﬁﬁ  
$str
ﬁﬁ! ^
}
ﬂﬂ 
;
ﬂﬂ 
return
·· 
new
·· $
BadRequestObjectResult
·· 5
(
··5 6
problemDetails
··6 D
)
··D E
{
‚‚ 
ContentTypes
„„ $
=
„„% &
{
„„' (
$str
„„) C
,
„„C D
$str
„„E ^
}
„„_ `
}
‰‰ 
;
‰‰ 
}
ÂÂ 
;
ÂÂ 
}
ÊÊ 
)
ÊÊ 
;
ÊÊ 
return
ËË 
services
ËË 
;
ËË 
}
ÈÈ 	
public
ÎÎ 
static
ÎÎ  
IServiceCollection
ÎÎ (
AddEventBus
ÎÎ) 4
(
ÎÎ4 5
this
ÎÎ5 9 
IServiceCollection
ÎÎ: L
services
ÎÎM U
,
ÎÎU V
IConfiguration
ÎÎW e
configuration
ÎÎf s
)
ÎÎs t
{
ÏÏ 	
services
ÌÌ 
.
ÌÌ 
AddSingleton
ÌÌ !
<
ÌÌ! "
	IEventBus
ÌÌ" +
,
ÌÌ+ ,
EventBusRabbitMQ
ÌÌ- =
>
ÌÌ= >
(
ÌÌ> ?
sp
ÌÌ? A
=>
ÌÌB D
{
ÓÓ 
var
ÔÔ $
subscriptionClientName
ÔÔ *
=
ÔÔ+ ,
configuration
ÔÔ- :
[
ÔÔ: ;
$str
ÔÔ; S
]
ÔÔS T
;
ÔÔT U
var
 *
rabbitMQPersistentConnection
 0
=
1 2
sp
3 5
.
5 6 
GetRequiredService
6 H
<
H I+
IRabbitMQPersistentConnection
I f
>
f g
(
g h
)
h i
;
i j
var
ÒÒ 
iLifetimeScope
ÒÒ "
=
ÒÒ# $
sp
ÒÒ% '
.
ÒÒ' ( 
GetRequiredService
ÒÒ( :
<
ÒÒ: ;
ILifetimeScope
ÒÒ; I
>
ÒÒI J
(
ÒÒJ K
)
ÒÒK L
;
ÒÒL M
var
ÚÚ 
logger
ÚÚ 
=
ÚÚ 
sp
ÚÚ 
.
ÚÚ   
GetRequiredService
ÚÚ  2
<
ÚÚ2 3
ILogger
ÚÚ3 :
<
ÚÚ: ;
EventBusRabbitMQ
ÚÚ; K
>
ÚÚK L
>
ÚÚL M
(
ÚÚM N
)
ÚÚN O
;
ÚÚO P
var
ÛÛ )
eventBusSubcriptionsManager
ÛÛ /
=
ÛÛ0 1
sp
ÛÛ2 4
.
ÛÛ4 5 
GetRequiredService
ÛÛ5 G
<
ÛÛG H+
IEventBusSubscriptionsManager
ÛÛH e
>
ÛÛe f
(
ÛÛf g
)
ÛÛg h
;
ÛÛh i
var
ıı 

retryCount
ıı 
=
ıı  
$num
ıı! "
;
ıı" #
if
ˆˆ 
(
ˆˆ 
!
ˆˆ 
string
ˆˆ 
.
ˆˆ 
IsNullOrEmpty
ˆˆ )
(
ˆˆ) *
configuration
ˆˆ* 7
[
ˆˆ7 8
$str
ˆˆ8 L
]
ˆˆL M
)
ˆˆM N
)
ˆˆN O
{
˜˜ 

retryCount
¯¯ 
=
¯¯  
int
¯¯! $
.
¯¯$ %
Parse
¯¯% *
(
¯¯* +
configuration
¯¯+ 8
[
¯¯8 9
$str
¯¯9 M
]
¯¯M N
)
¯¯N O
;
¯¯O P
}
˘˘ 
return
˚˚ 
new
˚˚ 
EventBusRabbitMQ
˚˚ +
(
˚˚+ ,*
rabbitMQPersistentConnection
˚˚, H
,
˚˚H I
logger
˚˚J P
,
˚˚P Q
iLifetimeScope
˚˚R `
,
˚˚` a)
eventBusSubcriptionsManager
˚˚b }
,
˚˚} ~%
subscriptionClientName˚˚ ï
,˚˚ï ñ

retryCount˚˚ó °
)˚˚° ¢
;˚˚¢ £
}
¸¸ 
)
¸¸ 
;
¸¸ 
services
˛˛ 
.
˛˛ 
AddSingleton
˛˛ !
<
˛˛! "+
IEventBusSubscriptionsManager
˛˛" ?
,
˛˛? @2
$InMemoryEventBusSubscriptionsManager
˛˛A e
>
˛˛e f
(
˛˛f g
)
˛˛g h
;
˛˛h i
return
ÄÄ 
services
ÄÄ 
;
ÄÄ 
}
ÅÅ 	
public
ÉÉ 
static
ÉÉ  
IServiceCollection
ÉÉ (%
AddCustomAuthentication
ÉÉ) @
(
ÉÉ@ A
this
ÉÉA E 
IServiceCollection
ÉÉF X
services
ÉÉY a
,
ÉÉa b
IConfiguration
ÉÉc q
configuration
ÉÉr 
)ÉÉ Ä
{
ÑÑ 	
services
àà 
.
ââ 
AddAuthentication
ââ "
(
ââ" #
JwtBearerDefaults
ââ# 4
.
ââ4 5"
AuthenticationScheme
ââ5 I
)
ââI J
.
ää (
AddMicrosoftIdentityWebApi
ää +
(
ää+ ,
jwtBearerOptions
ää, <
=>
ää= ?
{
ãã 
configuration
åå !
.
åå! "
Bind
åå" &
(
åå& '
$str
åå' 3
,
åå3 4
jwtBearerOptions
åå5 E
)
ååE F
;
ååF G
jwtBearerOptions
çç $
.
çç$ %'
TokenValidationParameters
çç% >
.
çç> ?
NameClaimType
çç? L
=
ççM N
$str
ççO U
;
ççU V
}
éé 
,
éé 
msIdentityOptions
éé $
=>
éé% '
{
éé( )
configuration
éé* 7
.
éé7 8
Bind
éé8 <
(
éé< =
$str
éé= I
,
ééI J
msIdentityOptions
ééK \
)
éé\ ]
;
éé] ^
}
éé_ `
)
éé` a
;
ééa b
return
êê 
services
êê 
;
êê 
}
ëë 	
}
íí 
}ìì 