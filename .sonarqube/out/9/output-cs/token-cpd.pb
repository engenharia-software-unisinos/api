≈
óC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.Domain\AggregatesModel\ProductAggregate\IProductRepository.cs
	namespace 	
Catalog
 
. 
Domain 
. 
AggregatesModel (
.( )
ProductAggregate) 9
{ 
public 

	interface 
IProductRepository '
:( )
IRepository* 5
<5 6
Product6 =
>= >
{ 
Product 
Add 
( 
Product 
product #
)# $
;$ %
void		 
Update		 
(		 
Product		 
product		 #
)		# $
;		$ %
void

 
Remove

 
(

 
Product

 
product

 #
)

# $
;

$ %
Task 
< 
Product 
> 
GetAsync 
( 
int "
	productId# ,
), -
;- .
} 
} †,
åC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.Domain\AggregatesModel\ProductAggregate\Product.cs
	namespace 	
Catalog
 
. 
Domain 
. 
AggregatesModel (
.( )
ProductAggregate) 9
{ 
public 

class 
Product 
: 
Entity !
,! "
IAggregateRoot# 1
{ 
public		 
string		 
Code		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
Guid

 
Owner

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
Amount 
{ 
get 
;  
set! $
;$ %
}& '
public 
ProductStatus 
ProductStatus *
{+ ,
get- 0
;0 1
private2 9
set: =
;= >
}? @
private 
int 
_productStatusId $
;$ %
	protected 
Product 
( 
) 
{ 
} 
public 
Product 
( 
string 
code "
," #
Guid$ (
owner) .
,. /
string0 6
name7 ;
,; <
string= C
descriptionD O
,O P
decimalQ X
priceY ^
,^ _
int` c
amountd j
)j k
:l m
thisn r
(r s
)s t
{ 	
Code 
= 
! 
string 
. 
IsNullOrWhiteSpace -
(- .
code. 2
)2 3
?4 5
code6 :
:; <
throw= B
newC F!
ArgumentNullExceptionG \
(\ ]
nameof] c
(c d
coded h
)h i
)i j
;j k
Owner 
= 
owner 
!= 
Guid !
.! "
Empty" '
?( )
owner* /
:0 1
throw2 7
new8 ;!
ArgumentNullException< Q
(Q R
nameofR X
(X Y
ownerY ^
)^ _
)_ `
;` a
Name 
= 
! 
string 
. 
IsNullOrWhiteSpace -
(- .
name. 2
)2 3
?4 5
name6 :
:; <
throw= B
newC F!
ArgumentNullExceptionG \
(\ ]
nameof] c
(c d
named h
)h i
)i j
;j k
Description 
= 
description %
;% &
Price 
= 
price 
> 
$num 
? 
price  %
:& '
throw( -
new. 1
ArgumentException2 C
(C D
nameofD J
(J K
priceK P
)P Q
)Q R
;R S
Amount 
= 
amount 
> 
$num 
?  !
amount" (
:) *
throw+ 0
new1 4
ArgumentException5 F
(F G
nameofG M
(M N
amountN T
)T U
)U V
;V W
_productStatusId 
= 
ProductStatus ,
., -
Avaiable- 5
.5 6
Id6 8
;8 9
} 	
public!! 
void!! 
SetAvaiableStatus!! %
(!!% &
)!!& '
{"" 	
if## 
(## 
_productStatusId##  
==##! #
ProductStatus##$ 1
.##1 2
Locked##2 8
.##8 9
Id##9 ;
)##; <
{$$ 
AddDomainEvent%% 
(%% 
new%% "5
)ProductStatusChangedToAvaiableDomainEvent%%# L
(%%L M
Id%%M O
)%%O P
)%%P Q
;%%Q R
_productStatusId''  
=''! "
ProductStatus''# 0
.''0 1
Avaiable''1 9
.''9 :
Id'': <
;''< =
}(( 
})) 	
public++ 
void++ 
SetLockedStatus++ #
(++# $
)++$ %
{,, 	
if-- 
(-- 
_productStatusId--  
==--! #
ProductStatus--$ 1
.--1 2
Avaiable--2 :
.--: ;
Id--; =
)--= >
{.. 
AddDomainEvent// 
(// 
new// "3
'ProductStatusChangedToLockedDomainEvent//# J
(//J K
Id//K M
)//M N
)//N O
;//O P
_productStatusId11  
=11! "
ProductStatus11# 0
.110 1
Locked111 7
.117 8
Id118 :
;11: ;
}22 
}33 	
}44 
}55 ¬$
íC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.Domain\AggregatesModel\ProductAggregate\ProductStatus.cs
	namespace 	
Catalog
 
. 
Domain 
. 
AggregatesModel (
.( )
ProductAggregate) 9
{ 
public		 

class		 
ProductStatus		 
:		  
Enumeration		! ,
{

 
public 
static 
ProductStatus #
Avaiable$ ,
=- .
new/ 2
ProductStatus3 @
(@ A
$numA B
,B C
nameofD J
(J K
AvaiableK S
)S T
.T U
ToLowerInvariantU e
(e f
)f g
)g h
;h i
public 
static 
ProductStatus #
Locked$ *
=+ ,
new- 0
ProductStatus1 >
(> ?
$num? @
,@ A
nameofB H
(H I
LockedI O
)O P
.P Q
ToLowerInvariantQ a
(a b
)b c
)c d
;d e
public 
ProductStatus 
( 
int  
id! #
,# $
string% +
name, 0
)0 1
:2 3
base4 8
(8 9
id9 ;
,; <
name= A
)A B
{C D
}E F
public 
static 
IEnumerable !
<! "
ProductStatus" /
>/ 0
List1 5
(5 6
)6 7
=>8 :
new 
[ 
] 
{ 
Avaiable 
, 
Locked $
}% &
;& '
public 
static 
ProductStatus #
FromName$ ,
(, -
string- 3
name4 8
)8 9
{ 	
var 
state 
= 
List 
( 
) 
. 
SingleOrDefault .
(. /
s/ 0
=>1 3
string4 :
.: ;
Equals; A
(A B
sB C
.C D
NameD H
,H I
nameJ N
,N O
StringComparisonP `
.` a$
CurrentCultureIgnoreCasea y
)y z
)z {
;{ |
if 
( 
state 
== 
null 
) 
{ 
throw 
new "
CatalogDomainException 0
(0 1
$"1 3
$str3 G
{G H
nameofH N
(N O
ProductStatusO \
)\ ]
}] ^
$str^ `
{` a
Stringa g
.g h
Joinh l
(l m
$strm p
,p q
Listr v
(v w
)w x
.x y
Selecty 
(	 Ä
s
Ä Å
=>
Ç Ñ
s
Ö Ü
.
Ü á
Name
á ã
)
ã å
)
å ç
}
ç é
"
é è
)
è ê
;
ê ë
} 
return 
state 
; 
} 	
public 
static 
ProductStatus #
From$ (
(( )
int) ,
id- /
)/ 0
{   	
var!! 
state!! 
=!! 
List!! 
(!! 
)!! 
.!! 
SingleOrDefault!! .
(!!. /
s!!/ 0
=>!!1 3
s!!4 5
.!!5 6
Id!!6 8
==!!9 ;
id!!< >
)!!> ?
;!!? @
if## 
(## 
state## 
==## 
null## 
)## 
{$$ 
throw%% 
new%% "
CatalogDomainException%% 0
(%%0 1
$"%%1 3
$str%%3 G
{%%G H
nameof%%H N
(%%N O
ProductStatus%%O \
)%%\ ]
}%%] ^
$str%%^ `
{%%` a
String%%a g
.%%g h
Join%%h l
(%%l m
$str%%m p
,%%p q
List%%r v
(%%v w
)%%w x
.%%x y
Select%%y 
(	%% Ä
s
%%Ä Å
=>
%%Ç Ñ
s
%%Ö Ü
.
%%Ü á
Name
%%á ã
)
%%ã å
)
%%å ç
}
%%ç é
"
%%é è
)
%%è ê
;
%%ê ë
}&& 
return(( 
state(( 
;(( 
})) 	
}** 
}++ å
ÑC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.Domain\Events\ProductCreatedDomainEvent.cs
	namespace 	
Catalog
 
. 
Domain 
. 
Events 
{ 
public 

class %
ProductCreatedDomainEvent *
:+ ,
INotification- :
{ 
public %
ProductCreatedDomainEvent (
(( )
Product) 0
product1 8
)8 9
{		 	
Product

 
=

 
product

 
;

 
} 	
public 
Product 
Product 
{  
get! $
;$ %
}' (
} 
} º
îC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.Domain\Events\ProductStatusChangedToAvaiableDomainEvent.cs
	namespace 	
Catalog
 
. 
Domain 
. 
Events 
{ 
public 

class 5
)ProductStatusChangedToAvaiableDomainEvent :
:; <
INotification= J
{ 
public 5
)ProductStatusChangedToAvaiableDomainEvent 8
(8 9
int9 <
	productId= F
)F G
{ 	
	ProductId		 
=		 
	productId		 !
;		! "
}

 	
public 
int 
	ProductId 
{ 
get "
;" #
}$ %
} 
} ∂
íC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.Domain\Events\ProductStatusChangedToLockedDomainEvent.cs
	namespace 	
Catalog
 
. 
Domain 
. 
Events 
{ 
public 

class 3
'ProductStatusChangedToLockedDomainEvent 8
:9 :
INotification; H
{ 
public 3
'ProductStatusChangedToLockedDomainEvent 6
(6 7
int7 :
	productId; D
)D E
{ 	
	ProductId		 
=		 
	productId		 !
;		! "
}

 	
public 
int 
	ProductId 
{ 
get "
;" #
}$ %
} 
} Ë
ÖC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.Domain\Exceptions\CatalogDomainException.cs
	namespace 	
Catalog
 
. 
Domain 
. 

Exceptions #
{ 
public 

class "
CatalogDomainException '
:( )
	Exception* 3
{ 
public "
CatalogDomainException %
(% &
)& '
{ 	
}
 
public

 "
CatalogDomainException

 %
(

% &
string

& ,
message

- 4
)

4 5
: 
base 
( 
message 
) 
{ 	
}
 
public "
CatalogDomainException %
(% &
string& ,
message- 4
,4 5
	Exception6 ?
innerException@ N
)N O
: 
base 
( 
message 
, 
innerException *
)* +
{ 	
}
 
} 
} 