â
äC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\Behaviours\LoggingBehaviour.cs
	namespace

 	
Ordering


 
.

 
API

 
.

 
Application

 "
.

" #

Behaviours

# -
{ 
public 

class 
LoggingBehavior  
<  !
TRequest! )
,) *
	TResponse+ 4
>4 5
:6 7
IPipelineBehavior8 I
<I J
TRequestJ R
,R S
	TResponseT ]
>] ^
{ 
private 
readonly 
ILogger  
<  !
LoggingBehavior! 0
<0 1
TRequest1 9
,9 :
	TResponse; D
>D E
>E F
_loggerG N
;N O
public 
LoggingBehavior 
( 
ILogger &
<& '
LoggingBehavior' 6
<6 7
TRequest7 ?
,? @
	TResponseA J
>J K
>K L
loggerM S
)S T
=>U W
_loggerX _
=` a
loggerb h
;h i
public 
async 
Task 
< 
	TResponse #
># $
Handle% +
(+ ,
TRequest, 4
request5 <
,< =
CancellationToken> O
cancellationTokenP a
,a b"
RequestHandlerDelegatec y
<y z
	TResponse	z É
>
É Ñ
next
Ö â
)
â ä
{ 	
_logger 
. 
LogInformation "
(" #
$str# V
,V W
requestX _
._ `
GetGenericTypeName` r
(r s
)s t
,t u
requestv }
)} ~
;~ 
var 
response 
= 
await  
next! %
(% &
)& '
;' (
_logger 
. 
LogInformation "
(" #
$str# `
,` a
requestb i
.i j
GetGenericTypeNamej |
(| }
)} ~
,~ 
response
Ä à
)
à â
;
â ä
return 
response 
; 
} 	
} 
} Ö0
éC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\Behaviours\TransactionBehaviour.cs
	namespace 	
Ordering
 
. 
API 
. 
Application "
." #

Behaviours# -
{ 
public 

class  
TransactionBehaviour %
<% &
TRequest& .
,. /
	TResponse0 9
>9 :
:; <
IPipelineBehavior= N
<N O
TRequestO W
,W X
	TResponseY b
>b c
{ 
private 
readonly 
ILogger  
<  ! 
TransactionBehaviour! 5
<5 6
TRequest6 >
,> ?
	TResponse@ I
>I J
>J K
_loggerL S
;S T
private 
readonly 
OrderingContext (

_dbContext) 3
;3 4
private 
readonly ,
 IOrderingIntegrationEventService 9,
 _orderingIntegrationEventService: Z
;Z [
public  
TransactionBehaviour #
(# $
OrderingContext$ 3
	dbContext4 =
,= >,
 IOrderingIntegrationEventService ,+
orderingIntegrationEventService- L
,L M
ILogger 
<  
TransactionBehaviour (
<( )
TRequest) 1
,1 2
	TResponse3 <
>< =
>= >
logger? E
)E F
{ 	

_dbContext 
= 
	dbContext "
??# %
throw& +
new, /
ArgumentException0 A
(A B
nameofB H
(H I
OrderingContextI X
)X Y
)Y Z
;Z [,
 _orderingIntegrationEventService ,
=- .+
orderingIntegrationEventService/ N
??O Q
throwR W
newX [
ArgumentException\ m
(m n
nameofn t
(t u,
orderingIntegrationEventService	u î
)
î ï
)
ï ñ
;
ñ ó
_logger 
= 
logger 
?? 
throw  %
new& )
ArgumentException* ;
(; <
nameof< B
(B C
ILoggerC J
)J K
)K L
;L M
} 	
public 
async 
Task 
< 
	TResponse #
># $
Handle% +
(+ ,
TRequest, 4
request5 <
,< =
CancellationToken> O
cancellationTokenP a
,a b"
RequestHandlerDelegatec y
<y z
	TResponse	z É
>
É Ñ
next
Ö â
)
â ä
{   	
var!! 
response!! 
=!! 
default!! "
(!!" #
	TResponse!!# ,
)!!, -
;!!- .
var"" 
typeName"" 
="" 
request"" "
.""" #
GetGenericTypeName""# 5
(""5 6
)""6 7
;""7 8
try$$ 
{%% 
if&& 
(&& 

_dbContext&& 
.&&  
HasActiveTransaction&& 3
)&&3 4
{'' 
return(( 
await((  
next((! %
(((% &
)((& '
;((' (
})) 
var++ 
strategy++ 
=++ 

_dbContext++ )
.++) *
Database++* 2
.++2 3#
CreateExecutionStrategy++3 J
(++J K
)++K L
;++L M
await-- 
strategy-- 
.-- 
ExecuteAsync-- +
(--+ ,
async--, 1
(--2 3
)--3 4
=>--5 7
{.. 
Guid// 
transactionId// &
;//& '
using11 
(11 
var11 
transaction11 *
=11+ ,
await11- 2

_dbContext113 =
.11= >!
BeginTransactionAsync11> S
(11S T
)11T U
)11U V
using22 
(22 

LogContext22 %
.22% &
PushProperty22& 2
(222 3
$str223 G
,22G H
transaction22I T
.22T U
TransactionId22U b
)22b c
)22c d
{33 
_logger44 
.44  
LogInformation44  .
(44. /
$str44/ w
,44w x
transaction	44y Ñ
.
44Ñ Ö
TransactionId
44Ö í
,
44í ì
typeName
44î ú
,
44ú ù
request
44û •
)
44• ¶
;
44¶ ß
response66  
=66! "
await66# (
next66) -
(66- .
)66. /
;66/ 0
_logger88 
.88  
LogInformation88  .
(88. /
$str88/ k
,88k l
transaction88m x
.88x y
TransactionId	88y Ü
,
88Ü á
typeName
88à ê
)
88ê ë
;
88ë í
await:: 

_dbContext:: (
.::( )"
CommitTransactionAsync::) ?
(::? @
transaction::@ K
)::K L
;::L M
transactionId<< %
=<<& '
transaction<<( 3
.<<3 4
TransactionId<<4 A
;<<A B
}== 
await?? ,
 _orderingIntegrationEventService?? :
.??: ;-
!PublishEventsThroughEventBusAsync??; \
(??\ ]
transactionId??] j
)??j k
;??k l
}@@ 
)@@ 
;@@ 
returnBB 
responseBB 
;BB  
}CC 
catchDD 
(DD 
	ExceptionDD 
exDD 
)DD  
{EE 
_loggerFF 
.FF 
LogErrorFF  
(FF  !
exFF! #
,FF# $
$strFF% `
,FF` a
typeNameFFb j
,FFj k
requestFFl s
)FFs t
;FFt u
throwHH 
;HH 
}II 
}JJ 	
}KK 
}LL Å 
ãC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\Behaviours\ValidatorBehavior.cs
	namespace

 	
Ordering


 
.

 
API

 
.

 
Application

 "
.

" #

Behaviours

# -
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
new'' #
OrderingDomainException'' 1
(''1 2
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
}.. ”
òC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\Commands\AddOrderItem\AddOrderItemCommand.cs
	namespace		 	
Ordering		
 
.		 
API		 
.		 
Application		 "
.		" #
Commands		# +
.		+ ,
AddOrderItem		, 8
{

 
[ 
DataContract 
] 
public 

class 
AddOrderItemCommand $
:% &
IRequest' /
</ 0
bool0 4
>4 5
{ 
public 
AddOrderItemCommand "
(" #
int# &
	productId' 0
,0 1
string2 8

producName9 C
,C D
decimalE L
productPriceM Y
,Y Z
int[ ^
amount_ e
)e f
{ 	
	ProductId 
= 
	productId !
;! "

ProducName 
= 

producName #
;# $
ProductPrice 
= 
productPrice '
;' (
Amount 
= 
amount 
; 
} 	
[ 	

DataMember	 
] 
public 
int 
	ProductId 
{ 
get "
;" #
init$ (
;( )
}* +
[ 	

DataMember	 
] 
public 
string 

ProducName  
{! "
get# &
;& '
init( ,
;, -
}. /
[ 	

DataMember	 
] 
public 
decimal 
ProductPrice #
{$ %
get& )
;) *
init+ /
;/ 0
}1 2
[ 	

DataMember	 
] 
public 
int 
Amount 
{ 
get 
;  
init! %
;% &
}' (
} 
public   

class   &
AddOrderItemCommandHandler   +
:  , -
IRequestHandler  . =
<  = >
AddOrderItemCommand  > Q
,  Q R
bool  S W
>  W X
{!! 
private"" 
readonly"" 
IOrderRepository"" )
_orderRepository""* :
;"": ;
private## 
readonly## 
IIdentityService## )
_identityService##* :
;##: ;
private$$ 
readonly$$ 
ILogger$$  
<$$  !&
AddOrderItemCommandHandler$$! ;
>$$; <
_logger$$= D
;$$D E
public&& &
AddOrderItemCommandHandler&& )
(&&) *
IOrderRepository&&* :
orderRepository&&; J
,&&J K
IIdentityService&&L \
identityService&&] l
,&&l m
ILogger&&n u
<&&u v'
AddOrderItemCommandHandler	&&v ê
>
&&ê ë
logger
&&í ò
)
&&ò ô
{'' 	
_orderRepository(( 
=(( 
orderRepository(( .
;((. /
_identityService)) 
=)) 
identityService)) .
;)). /
_logger** 
=** 
logger** 
;** 
}++ 	
public-- 
async-- 
Task-- 
<-- 
bool-- 
>-- 
Handle--  &
(--& '
AddOrderItemCommand--' :
request--; B
,--B C
CancellationToken--D U
cancellationToken--V g
)--g h
{.. 	
var// 
userId// 
=// 
_identityService// )
.//) *
GetUserIdentity//* 9
(//9 :
)//: ;
;//; <
return11 
true11 
;11 
}22 	
}33 
}44 ¥	
†C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\Commands\CreateOrderDraft\CreateOrderDraftCommand.cs
	namespace 	
Ordering
 
. 
API 
. 
Application "
." #
Commands# +
.+ ,
CreateOrderDraft, <
{ 
[ 
DataContract 
] 
public		 

class		 #
CreateOrderDraftCommand		 (
:		) *
IRequest		+ 3
<		3 4
OrderDraftDTO		4 A
>		A B
{

 
public #
CreateOrderDraftCommand &
(& '
IEnumerable' 2
<2 3
CartItem3 ;
>; <
	cartItems= F
)F G
{ 	
	CartItems 
= 
	cartItems !
;! "
} 	
[ 	

DataMember	 
] 
public 
IEnumerable 
< 
CartItem #
># $
	CartItems% .
{/ 0
get1 4
;4 5
init6 :
;: ;
}< =
} 
} ÷
ßC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\Commands\CreateOrderDraft\CreateOrderDraftCommandHandler.cs
	namespace

 	
Ordering


 
.

 
API

 
.

 
Application

 "
.

" #
Commands

# +
.

+ ,
CreateOrderDraft

, <
{ 
public 

class *
CreateOrderDraftCommandHandler /
:0 1
IRequestHandler2 A
<A B#
CreateOrderDraftCommandB Y
,Y Z
OrderDraftDTO[ h
>h i
{ 
public *
CreateOrderDraftCommandHandler -
(- .
). /
{0 1
}2 3
public 
Task 
< 
OrderDraftDTO !
>! "
Handle# )
() *#
CreateOrderDraftCommand* A
requestB I
,I J
CancellationTokenK \
cancellationToken] n
)n o
{ 	
var 
order 
= 
Order 
. 
NewDraft &
(& '
)' (
;( )
var 

orderItems 
= 
request $
.$ %
	CartItems% .
.. /
Select/ 5
(5 6
x6 7
=>8 :
x; <
.< =
ToOrderItemDTO= K
(K L
)L M
)M N
;N O
foreach 
( 
var 
item 
in 

orderItems  *
)* +
{ 
order 
. 
AddOrderItem "
(" #
item# '
.' (
	ProductId( 1
,1 2
item3 7
.7 8
ProductName8 C
,C D
itemE I
.I J
ProductPriceJ V
,V W
itemX \
.\ ]
Amount] c
)c d
;d e
} 
return 
Task 
. 

FromResult "
(" #
OrderDraftDTO# 0
.0 1
	FromOrder1 :
(: ;
order; @
)@ A
)A B
;B C
} 	
} 
public 

record 
OrderDraftDTO 
{   
public!! 
IEnumerable!! 
<!! 
OrderItemDTO!! '
>!!' (

OrderItems!!) 3
{!!4 5
get!!6 9
;!!9 :
init!!; ?
;!!? @
}!!A B
public"" 
decimal"" 

TotalPrice"" !
{""" #
get""$ '
;""' (
init"") -
;""- .
}""/ 0
public## 
static## 
OrderDraftDTO## #
	FromOrder##$ -
(##- .
Order##. 3
order##4 9
)##9 :
{$$ 	
return%% 
new%% 
OrderDraftDTO%% $
(%%$ %
)%%% &
{&& 

OrderItems'' 
='' 
order'' "
.''" #

OrderItems''# -
.''- .
Select''. 4
(''4 5
x''5 6
=>''7 9
new'': =
OrderItemDTO''> J
{(( 
	ProductId)) 
=)) 
x))  !
.))! "
	ProductId))" +
,))+ ,
ProductName** 
=**  !
x**" #
.**# $
GetProductName**$ 2
(**2 3
)**3 4
,**4 5
ProductPrice++  
=++! "
x++# $
.++$ %
GetProductPrice++% 4
(++4 5
)++5 6
,++6 7
Amount,, 
=,, 
x,, 
.,, 
	GetAmount,, (
(,,( )
),,) *
}-- 
)-- 
,-- 

TotalPrice.. 
=.. 
order.. "
..." #
GetTotalPrice..# 0
(..0 1
)..1 2
}// 
;// 
}00 	
}11 
}22 ê
ñC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\Commands\CreateOrder\CreateOrderCommand.cs
	namespace		 	
Ordering		
 
.		 
API		 
.		 
Application		 "
.		" #
Commands		# +
.		+ ,
CreateOrder		, 7
{

 
[ 
DataContract 
] 
public 

class 
CreateOrderCommand #
:$ %
IRequest& .
<. /
bool/ 3
>3 4
{ 
[ 	

DataMember	 
] 
public 
string 
Observation !
{" #
get$ '
;' (
init) -
;- .
}/ 0
[ 	

DataMember	 
] 
public 
IEnumerable 
< 
OrderItemDTO '
>' (

OrderItems) 3
{4 5
get6 9
;9 :
init; ?
;? @
}A B
[ 	
JsonConstructor	 
] 
public 
CreateOrderCommand !
(! "
string" (
observation) 4
,4 5
IEnumerable6 A
<A B
OrderItemDTOB N
>N O

orderItemsP Z
)Z [
{ 	

OrderItems 
= 

orderItems #
;# $
Observation 
= 
observation %
;% &
}   	
}!! 
public## 

record## 
OrderItemDTO## 
{$$ 
public%% 
int%% 
	ProductId%% 
{%% 
get%% "
;%%" #
init%%$ (
;%%( )
}%%* +
public&& 
string&& 
ProductName&& !
{&&" #
get&&$ '
;&&' (
init&&) -
;&&- .
}&&/ 0
public'' 
decimal'' 
ProductPrice'' #
{''$ %
get''& )
;'') *
init''+ /
;''/ 0
}''1 2
public(( 
int(( 
Amount(( 
{(( 
get(( 
;((  
init((! %
;((% &
}((' (
})) 
}** …
ùC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\Commands\CreateOrder\CreateOrderCommandHandler.cs
	namespace 	
Ordering
 
. 
API 
. 
Application "
." #
Commands# +
.+ ,
CreateOrder, 7
{ 
public 

class %
CreateOrderCommandHandler *
:+ ,
IRequestHandler- <
<< =
CreateOrderCommand= O
,O P
boolQ U
>U V
{ 
private 
readonly 
IOrderRepository )
_orderRepository* :
;: ;
private 
readonly 
IIdentityService )
_identityService* :
;: ;
private 
readonly 
ILogger  
<  !%
CreateOrderCommandHandler! :
>: ;
_logger< C
;C D
public %
CreateOrderCommandHandler (
(( )
IOrderRepository) 9
orderRepository: I
,I J
IIdentityServiceK [
identityService\ k
,k l
ILoggerm t
<t u&
CreateOrderCommandHandler	u é
>
é è
logger
ê ñ
)
ñ ó
{ 	
_orderRepository 
= 
orderRepository .
??/ 1
throw2 7
new8 ;!
ArgumentNullException< Q
(Q R
nameofR X
(X Y
orderRepositoryY h
)h i
)i j
;j k
_identityService 
= 
identityService .
??/ 1
throw2 7
new8 ;!
ArgumentNullException< Q
(Q R
nameofR X
(X Y
identityServiceY h
)h i
)i j
;j k
_logger 
= 
logger 
?? 
throw  %
new& )!
ArgumentNullException* ?
(? @
nameof@ F
(F G
loggerG M
)M N
)N O
;O P
} 	
public 
async 
Task 
< 
bool 
> 
Handle  &
(& '
CreateOrderCommand' 9
request: A
,A B
CancellationTokenC T
cancellationTokenU f
)f g
{ 	
var 
userId 
= 
_identityService )
.) *
GetUserIdentity* 9
(9 :
): ;
;; <
var 
order 
= 
new 
Order !
(! "
userId" (
,( )
request* 1
.1 2
Observation2 =
)= >
;> ?
foreach   
(   
var   
item   
in   
request    '
.  ' (

OrderItems  ( 2
)  2 3
{!! 
order"" 
."" 
AddOrderItem"" "
(""" #
item""# '
.""' (
	ProductId""( 1
,""1 2
item""3 7
.""7 8
ProductName""8 C
,""C D
item""E I
.""I J
ProductPrice""J V
,""V W
item""X \
.""\ ]
Amount""] c
)""c d
;""d e
}## 
_logger%% 
.%% 
LogInformation%% "
(%%" #
$str%%# J
,%%J K
order%%L Q
)%%Q R
;%%R S
_orderRepository'' 
.'' 
Add''  
(''  !
order''! &
)''& '
;''' (
return)) 
await)) 
_orderRepository)) )
.))) *

UnitOfWork))* 4
.))4 5
SaveEntitiesAsync))5 F
())F G
cancellationToken))G X
)))X Y
;))Y Z
}** 	
}++ 
},, Á	
âC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\Commands\IdentifiedCommand.cs
	namespace 	
Ordering
 
. 
API 
. 
Application "
." #
Commands# +
{ 
public 

class 
IdentifiedCommand "
<" #
T# $
,$ %
R& '
>' (
:) *
IRequest+ 3
<3 4
R4 5
>5 6
where 
T 
: 
IRequest 
< 
R 
> 
{ 
public		 
T		 
Command		 
{		 
get		 
;		 
}		  !
public

 
Guid

 
Id

 
{

 
get

 
;

 
}

 
public 
IdentifiedCommand  
(  !
T! "
command# *
,* +
Guid, 0
id1 3
)3 4
{ 	
Command 
= 
command 
; 
Id 
= 
id 
; 
} 	
} 
} õ+
êC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\Commands\IdentifiedCommandHandler.cs
	namespace		 	
Ordering		
 
.		 
API		 
.		 
Application		 "
.		" #
Commands		# +
{

 
public 

class $
IdentifiedCommandHandler )
<) *
T* +
,+ ,
R- .
>. /
:0 1
IRequestHandler2 A
<A B
IdentifiedCommandB S
<S T
TT U
,U V
RW X
>X Y
,Y Z
R[ \
>\ ]
where 
T 
: 
IRequest 
< 
R 
> 
{ 
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private 
readonly 
IRequestManager (
_requestManager) 8
;8 9
private 
readonly 
ILogger  
<  !$
IdentifiedCommandHandler! 9
<9 :
T: ;
,; <
R= >
>> ?
>? @
_loggerA H
;H I
public $
IdentifiedCommandHandler '
(' (
	IMediator 
mediator 
, 
IRequestManager 
requestManager *
,* +
ILogger 
< $
IdentifiedCommandHandler ,
<, -
T- .
,. /
R0 1
>1 2
>2 3
logger4 :
): ;
{ 	
	_mediator 
= 
mediator  
;  !
_requestManager 
= 
requestManager ,
;, -
_logger 
= 
logger 
?? 
throw  %
new& )
System* 0
.0 1!
ArgumentNullException1 F
(F G
nameofG M
(M N
loggerN T
)T U
)U V
;V W
}   	
	protected&& 
virtual&& 
R&& +
CreateResultForDuplicateRequest&& ;
(&&; <
)&&< =
{'' 	
return(( 
default(( 
((( 
R(( 
)(( 
;(( 
})) 	
public11 
async11 
Task11 
<11 
R11 
>11 
Handle11 #
(11# $
IdentifiedCommand11$ 5
<115 6
T116 7
,117 8
R119 :
>11: ;
message11< C
,11C D
CancellationToken11E V
cancellationToken11W h
)11h i
{22 	
var33 
alreadyExists33 
=33 
await33  %
_requestManager33& 5
.335 6

ExistAsync336 @
(33@ A
message33A H
.33H I
Id33I K
)33K L
;33L M
if55 
(55 
alreadyExists55 
)55 
{66 
return77 +
CreateResultForDuplicateRequest77 6
(776 7
)777 8
;778 9
}88 
else99 
{:: 
await;; 
_requestManager;; %
.;;% &(
CreateRequestForCommandAsync;;& B
<;;B C
T;;C D
>;;D E
(;;E F
message;;F M
.;;M N
Id;;N P
);;P Q
;;;Q R
try<< 
{== 
var>> 
command>> 
=>>  !
message>>" )
.>>) *
Command>>* 1
;>>1 2
var?? 
commandName?? #
=??$ %
command??& -
.??- .
GetGenericTypeName??. @
(??@ A
)??A B
;??B C
var@@ 

idProperty@@ "
=@@# $
string@@% +
.@@+ ,
Empty@@, 1
;@@1 2
varAA 
	commandIdAA !
=AA" #
stringAA$ *
.AA* +
EmptyAA+ 0
;AA0 1
switchCC 
(CC 
commandCC #
)CC# $
{DD 
defaultJJ 
:JJ  

idPropertyKK &
=KK' (
$strKK) .
;KK. /
	commandIdLL %
=LL& '
$strLL( -
;LL- .
breakMM !
;MM! "
}NN 
_loggerPP 
.PP 
LogInformationPP *
(PP* +
$strQQ g
,QQg h
commandNameRR #
,RR# $

idPropertySS "
,SS" #
	commandIdTT !
,TT! "
commandUU 
)UU  
;UU  !
varXX 
resultXX 
=XX  
awaitXX! &
	_mediatorXX' 0
.XX0 1
SendXX1 5
(XX5 6
commandXX6 =
,XX= >
cancellationTokenXX? P
)XXP Q
;XXQ R
_loggerZZ 
.ZZ 
LogInformationZZ *
(ZZ* +
$str[[ r
,[[r s
result\\ 
,\\ 
commandName]] #
,]]# $

idProperty^^ "
,^^" #
	commandId__ !
,__! "
command`` 
)``  
;``  !
returnbb 
resultbb !
;bb! "
}cc 
catchdd 
{ee 
returnff 
defaultff "
(ff" #
Rff# $
)ff$ %
;ff% &
}gg 
}hh 
}ii 	
}jj 
}kk “
ÆC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\DomainEventHandlers\OrderStarted\OrderStartedDomainEventHandler.cs
	namespace		 	
Ordering		
 
.		 
API		 
.		 
Application		 "
.		" #
DomainEventHandlers		# 6
{

 
public 

class *
OrderStartedDomainEventHandler /
:0 1 
INotificationHandler2 F
<F G#
OrderStartedDomainEventG ^
>^ _
{ 
private 
readonly 
ILoggerFactory '
_logger( /
;/ 0
private 
readonly ,
 IOrderingIntegrationEventService 9,
 _orderingIntegrationEventService: Z
;Z [
public *
OrderStartedDomainEventHandler -
(- .
ILoggerFactory. <
logger= C
,C D,
 IOrderingIntegrationEventServiceE e,
orderingIntegrationEventService	f Ö
)
Ö Ü
{ 	
_logger 
= 
logger 
; ,
 _orderingIntegrationEventService ,
=- .+
orderingIntegrationEventService/ N
;N O
} 	
public 
async 
Task 
Handle  
(  !#
OrderStartedDomainEvent! 8
notification9 E
,E F
CancellationTokenG X
cancellationTokenY j
)j k
{ 	
_logger 
. 
CreateLogger  
<  !*
OrderStartedDomainEventHandler! ?
>? @
(@ A
)A B
. 
LogTrace 
( 
$str p
,p q
notification  
.  !
Order! &
.& '
Id' )
,) *
notification+ 7
.7 8
Order8 =
.= >
BuyerId> E
)E F
;F G
var 
integrationEvent  
=! "
new# &(
OrderStartedIntegrationEvent' C
(C D
notificationD P
.P Q
OrderQ V
.V W
IdW Y
,Y Z
notification[ g
.g h
Orderh m
.m n
BuyerIdn u
)u v
;v w
await ,
 _orderingIntegrationEventService 2
.2 3 
AddAndSaveEventAsync3 G
(G H
integrationEventH X
)X Y
;Y Z
} 	
}   
}!! ∑	
§C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\IntegrationEvents\Events\OrderStartedIntegrationEvent.cs
	namespace 	
Ordering
 
. 
API 
. 
Application "
." #
IntegrationEvents# 4
.4 5
Events5 ;
{ 
public 

record (
OrderStartedIntegrationEvent .
:/ 0
IntegrationEvent1 A
{ 
public (
OrderStartedIntegrationEvent +
(+ ,
int, /
orderId0 7
,7 8
Guid9 =
userId> D
)D E
{		 	
OrderId

 
=

 
orderId

 
;

 
UserId 
= 
userId 
; 
} 	
public 
int 
OrderId 
{ 
get  
;  !
init" &
;& '
}( )
public 
Guid 
UserId 
{ 
get  
;  !
init" &
;& '
}( )
} 
} Å
°C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\IntegrationEvents\IOrderingIntegrationEventService.cs
	namespace 	
Ordering
 
. 
API 
. 
Application "
." #
IntegrationEvents# 4
{ 
public 

	interface ,
 IOrderingIntegrationEventService 5
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
} Ï0
†C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\IntegrationEvents\OrderingIntegrationEventService.cs
	namespace 	
Ordering
 
. 
API 
. 
Application "
." #
IntegrationEvents# 4
{ 
public 

class +
OrderingIntegrationEventService 0
:1 2,
 IOrderingIntegrationEventService3 S
{ 
private 
readonly 
Func 
< 
DbConnection *
,* +'
IIntegrationEventLogService, G
>G H.
"_integrationEventLogServiceFactoryI k
;k l
private 
readonly 
	IEventBus "
	_eventBus# ,
;, -
private 
readonly 
OrderingContext (
_orderingContext) 9
;9 :
private 
readonly '
IIntegrationEventLogService 4
_eventLogService5 E
;E F
private 
readonly 
ILogger  
<  !+
OrderingIntegrationEventService! @
>@ A
_loggerB I
;I J
public +
OrderingIntegrationEventService .
(. /
	IEventBus/ 8
eventBus9 A
,A B
OrderingContext 
orderingContext +
,+ ,
Func 
< 
DbConnection 
, '
IIntegrationEventLogService :
>: ;-
!integrationEventLogServiceFactory< ]
,] ^
ILogger 
< +
OrderingIntegrationEventService 3
>3 4
logger5 ;
); <
{ 	
_orderingContext 
= 
orderingContext .
??/ 1
throw2 7
new8 ;!
ArgumentNullException< Q
(Q R
nameofR X
(X Y
orderingContextY h
)h i
)i j
;j k.
"_integrationEventLogServiceFactory .
=/ 0-
!integrationEventLogServiceFactory1 R
??S U
throwV [
new\ _!
ArgumentNullException` u
(u v
nameofv |
(| }.
!integrationEventLogServiceFactory	} û
)
û ü
)
ü †
;
† °
	_eventBus 
= 
eventBus  
??! #
throw$ )
new* -!
ArgumentNullException. C
(C D
nameofD J
(J K
eventBusK S
)S T
)T U
;U V
_eventLogService 
= .
"_integrationEventLogServiceFactory A
(A B
_orderingContextB R
.R S
DatabaseS [
.[ \
GetDbConnection\ k
(k l
)l m
)m n
;n o
_logger 
= 
logger 
?? 
throw  %
new& )!
ArgumentNullException* ?
(? @
nameof@ F
(F G
loggerG M
)M N
)N O
;O P
}   	
public"" 
async"" 
Task"" -
!PublishEventsThroughEventBusAsync"" ;
(""; <
Guid""< @
transactionId""A N
)""N O
{## 	
var$$ 
pendingLogEvents$$  
=$$! "
await$$# (
_eventLogService$$) 9
.$$9 :2
&RetrieveEventLogsPendingToPublishAsync$$: `
($$` a
transactionId$$a n
)$$n o
;$$o p
foreach&& 
(&& 
var&& 
logEvt&& 
in&&  "
pendingLogEvents&&# 3
)&&3 4
{'' 
_logger(( 
.(( 
LogInformation(( &
(((& '
$str	((' à
,
((à â
logEvt
((ä ê
.
((ê ë
EventId
((ë ò
,
((ò ô
Program
((ö °
.
((° ¢
AppName
((¢ ©
,
((© ™
logEvt
((´ ±
.
((± ≤
IntegrationEvent
((≤ ¬
)
((¬ √
;
((√ ƒ
try** 
{++ 
await,, 
_eventLogService,, *
.,,* +&
MarkEventAsInProgressAsync,,+ E
(,,E F
logEvt,,F L
.,,L M
EventId,,M T
),,T U
;,,U V
	_eventBus-- 
.-- 
Publish-- %
(--% &
logEvt--& ,
.--, -
IntegrationEvent--- =
)--= >
;--> ?
await.. 
_eventLogService.. *
...* +%
MarkEventAsPublishedAsync..+ D
(..D E
logEvt..E K
...K L
EventId..L S
)..S T
;..T U
}// 
catch00 
(00 
	Exception00  
ex00! #
)00# $
{11 
_logger22 
.22 
LogError22 $
(22$ %
ex22% '
,22' (
$str22) r
,22r s
logEvt22t z
.22z {
EventId	22{ Ç
,
22Ç É
Program
22Ñ ã
.
22ã å
AppName
22å ì
)
22ì î
;
22î ï
await44 
_eventLogService44 *
.44* +"
MarkEventAsFailedAsync44+ A
(44A B
logEvt44B H
.44H I
EventId44I P
)44P Q
;44Q R
}55 
}66 
}77 	
public99 
async99 
Task99  
AddAndSaveEventAsync99 .
(99. /
IntegrationEvent99/ ?
evt99@ C
)99C D
{:: 	
_logger;; 
.;; 
LogInformation;; "
(;;" #
$str;;# 
,	;; Ä
evt
;;Å Ñ
.
;;Ñ Ö
Id
;;Ö á
,
;;á à
evt
;;â å
)
;;å ç
;
;;ç é
await== 
_eventLogService== "
.==" #
SaveEventAsync==# 1
(==1 2
evt==2 5
,==5 6
_orderingContext==7 G
.==G H!
GetCurrentTransaction==H ]
(==] ^
)==^ _
)==_ `
;==` a
}>> 	
}?? 
}@@ ò	
~C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\Models\CartItem.cs
	namespace 	
Ordering
 
. 
API 
. 
Application "
." #
Models# )
{ 
public 

record 
CartItem 
{ 
public 
string 
Id 
{ 
get 
; 
init  $
;$ %
}& '
public		 
int		 
	ProductId		 
{		 
get		 "
;		" #
init		$ (
;		( )
}		* +
public

 
string

 
ProductName

 !
{

" #
get

$ '
;

' (
init

) -
;

- .
}

/ 0
public 
decimal 
ProductPrice #
{$ %
get& )
;) *
init+ /
;/ 0
}1 2
public 
int 
Amount 
{ 
get 
;  
init! %
;% &
}' (
} 
} µ
ÑC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\Queries\IOrderQueries.cs
	namespace 	
Ordering
 
. 
API 
. 
Application "
." #
Queries# *
{ 
public 

	interface 
IOrderQueries "
{ 
Task		 
<		 
Item		 
>		 
GetItemAsync		 
(		  
int		  #
id		$ &
)		& '
;		' (
Task

 
<

 
IEnumerable

 
<

 
Item

 
>

 
>

 !
GetItemsFromUserAsync

  5
(

5 6
Guid

6 :
userId

; A
)

A B
;

B C
} 
} ê	
{C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\Queries\Item.cs
	namespace 	
Ordering
 
. 
API 
. 
Application "
." #
Queries# *
{ 
public 

record 
Item 
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
name 
{ 
get  
;  !
init" &
;& '
}( )
public		 
string		 
identity		 
{		  
get		! $
;		$ %
init		& *
;		* +
}		, -
public

 
DateTime

 
	createdAt

 !
{

" #
get

$ '
;

' (
init

) -
;

- .
}

/ 0
public 
DateTime 
	updatedAt !
{" #
get$ '
;' (
init) -
;- .
}/ 0
} 
} Ü
ÉC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\Queries\OrderQueries.cs
	namespace 	
Ordering
 
. 
API 
. 
Application "
." #
Queries# *
{		 
public

 

class

 
OrderQueries

 
:

 
IOrderQueries

  -
{ 
private 
string 
_connectionString (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
OrderQueries 
( 
string "
constr# )
)) *
{ 	
_connectionString 
= 
!  !
string! '
.' (
IsNullOrWhiteSpace( :
(: ;
constr; A
)A B
?C D
constrE K
:L M
throwN S
newT W!
ArgumentNullExceptionX m
(m n
nameofn t
(t u
constru {
){ |
)| }
;} ~
} 	
public 
async 
Task 
< 
Item 
> 
GetItemAsync  ,
(, -
int- 0
id1 3
)3 4
{ 	
using 
( 
var 

connection !
=" #
new$ '
SqlConnection( 5
(5 6
_connectionString6 G
)G H
)H I
{ 

connection 
. 
Open 
(  
)  !
;! "
var 
result 
= 
await "

connection# -
.- .

QueryAsync. 8
<8 9
Item9 =
>= >
(> ?
$str? o
,o p
newq t
{u v
idw y
}z {
){ |
;| }
if 
( 
result 
. 
AsList !
(! "
)" #
.# $
Count$ )
==* ,
$num- .
). /
throw 
new  
KeyNotFoundException 2
(2 3
)3 4
;4 5
return 
result 
. 
First #
(# $
)$ %
;% &
} 
} 	
public!! 
async!! 
Task!! 
<!! 
IEnumerable!! %
<!!% &
Item!!& *
>!!* +
>!!+ ,!
GetItemsFromUserAsync!!- B
(!!B C
Guid!!C G
userId!!H N
)!!N O
{"" 	
using## 
(## 
var## 

connection## !
=##" #
new##$ '
SqlConnection##( 5
(##5 6
_connectionString##6 G
)##G H
)##H I
{$$ 

connection%% 
.%% 
Open%% 
(%%  
)%%  !
;%%! "
return'' 
await'' 

connection'' '
.''' (

QueryAsync''( 2
<''2 3
Item''3 7
>''7 8
(''8 9
$str''9 X
)''X Y
;''Y Z
}(( 
})) 	
}** 
}++ ù
ñC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\Validations\CreateOrderCommandValidator.cs
	namespace 	
Ordering
 
. 
API 
. 
Application "
." #
Validations# .
{ 
public		 

class		 '
CreateOrderCommandValidator		 ,
:		- .
AbstractValidator		/ @
<		@ A
CreateOrderCommand		A S
>		S T
{

 
public '
CreateOrderCommandValidator *
(* +
ILogger+ 2
<2 3'
CreateOrderCommandValidator3 N
>N O
loggerP V
)V W
{ 	
RuleFor 
( 
x 
=> 
x 
. 

OrderItems %
)% &
.& '
Must' +
(+ ,
ContainOrderItems, =
)= >
.> ?
WithMessage? J
(J K
$strK a
)a b
;b c
logger 
. 
LogTrace 
( 
$str A
,A B
GetTypeC J
(J K
)K L
.L M
NameM Q
)Q R
;R S
} 	
private 
bool 
ContainOrderItems &
(& '
IEnumerable' 2
<2 3
OrderItemDTO3 ?
>? @

orderItemsA K
)K L
{ 	
return 

orderItems 
. 
Any !
(! "
)" #
;# $
} 	
} 
} Õ
õC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Application\Validations\CreateOrderDraftCommandValidator.cs
	namespace 	
Ordering
 
. 
API 
. 
Application "
." #
Validations# .
{ 
public		 

class		 ,
 CreateOrderDraftCommandValidator		 1
:		2 3
AbstractValidator		4 E
<		E F#
CreateOrderDraftCommand		F ]
>		] ^
{

 
public ,
 CreateOrderDraftCommandValidator /
(/ 0
ILogger0 7
<7 8'
CreateOrderCommandValidator8 S
>S T
loggerU [
)[ \
{ 	
RuleFor 
( 
x 
=> 
x 
. 
	CartItems $
)$ %
.% &
Must& *
(* +
ContainCartItems+ ;
); <
.< =
WithMessage= H
(H I
$strI ^
)^ _
;_ `
logger 
. 
LogTrace 
( 
$str A
,A B
GetTypeC J
(J K
)K L
.L M
NameM Q
)Q R
;R S
} 	
private 
bool 
ContainCartItems %
(% &
IEnumerable& 1
<1 2
Models2 8
.8 9
CartItem9 A
>A B

orderItemsC M
)M N
{ 	
return 

orderItems 
. 
Any !
(! "
)" #
;# $
} 	
} 
} í
}C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Controllers\HomeController.cs
	namespace 	
Ordering
 
. 
API 
. 
Controllers "
{ 
public 

class 
HomeController 
:  !

Controller" ,
{ 
public 
IActionResult 
Index "
(" #
)# $
{ 	
return		 
new		 
RedirectResult		 %
(		% &
$str		& 1
)		1 2
;		2 3
}

 	
} 
} Ñ$
~C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Controllers\OrderController.cs
	namespace 	
Ordering
 
. 
API 
. 
Controllers "
{ 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
	Authorize 
] 
[ 
ApiController 
] 
public 

class 
OrderController  
:! "
ControllerBase# 1
{ 
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private 
readonly 
IIdentityService )
_identityService* :
;: ;
private 
readonly 
ILogger  
<  !
OrderController! 0
>0 1
_logger2 9
;9 :
public 
OrderController 
( 
	IMediator (
mediator) 1
,1 2
IIdentityService3 C
identityServiceD S
,S T
ILoggerU \
<\ ]
OrderController] l
>l m
loggern t
)t u
{ 	
	_mediator 
= 
mediator  
??! #
throw$ )
new* -!
ArgumentNullException. C
(C D
nameofD J
(J K
mediatorK S
)S T
)T U
;U V
_identityService 
= 
identityService .
??/ 1
throw2 7
new8 ;!
ArgumentNullException< Q
(Q R
nameofR X
(X Y
mediatorY a
)a b
)b c
;c d
_logger 
= 
logger 
?? 
throw  %
new& )!
ArgumentNullException* ?
(? @
nameof@ F
(F G
mediatorG O
)O P
)P Q
;Q R
} 	
[ 	
Route	 
( 
$str 
) 
] 
[ 	
HttpPost	 
] 
public   
async   
Task   
<   
IActionResult   '
>  ' ()
CreateOrderFromCartItemsAsync  ) F
(  F G
[!! 
FromBody!! 
]!! 
CreateOrderCommand!! )
command!!* 1
)!!1 2
{"" 	
_logger## 
.## 
LogInformation## "
(##" #
$str### q
,##q r
command$$ 
.$$ 
GetGenericTypeName$$ *
($$* +
)$$+ ,
,$$, -
$str%% 
,%% 
_identityService&&  
.&&  !
GetUserIdentity&&! 0
(&&0 1
)&&1 2
,&&2 3
command'' 
)'' 
;'' 
var)) 
result)) 
=)) 
await)) 
	_mediator)) (
.))( )
Send))) -
())- .
command)). 5
)))5 6
;))6 7
if++ 
(++ 
!++ 
result++ 
)++ 
return++ 

BadRequest++  *
(++* +
)+++ ,
;++, -
return-- 
Ok-- 
(-- 
)-- 
;-- 
}.. 	
[00 	
Route00	 
(00 
$str00 
)00 
]00 
[11 	
HttpPost11	 
]11 
public22 
async22 
Task22 
<22 
ActionResult22 &
<22& '
OrderDraftDTO22' 4
>224 5
>225 6.
"CreateOrderDraftFromCartItemsAsync227 Y
(22Y Z
[33 
FromBody33 
]33 #
CreateOrderDraftCommand33 .
command33/ 6
)336 7
{44 	
_logger55 
.55 
LogInformation55 "
(55" #
$str55# q
,55q r
command66 
.66 
GetGenericTypeName66 *
(66* +
)66+ ,
,66, -
$str77 
,77 
_identityService88  
.88  !
GetUserIdentity88! 0
(880 1
)881 2
,882 3
command99 
)99 
;99 
return;; 
await;; 
	_mediator;; "
.;;" #
Send;;# '
(;;' (
command;;( /
);;/ 0
;;;0 1
}<< 	
}XX 
}YY Â
ÄC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Extensions\CartItemExtensions.cs
	namespace 	
Ordering
 
. 
API 
. 

Extensions !
{ 
public 

static 
class 
CartItemExtensions *
{ 
public		 
static		 
IEnumerable		 !
<		! "
OrderItemDTO		" .
>		. /
ToOrderItemsDTO		0 ?
(		? @
this		@ D
IEnumerable		E P
<		P Q
CartItem		Q Y
>		Y Z
	cartItems		[ d
)		d e
{

 	
foreach 
( 
var 
item 
in  
	cartItems! *
)* +
{ 
yield 
return 
item !
.! "
ToOrderItemDTO" 0
(0 1
)1 2
;2 3
} 
} 	
public 
static 
OrderItemDTO "
ToOrderItemDTO# 1
(1 2
this2 6
CartItem7 ?
item@ D
)D E
{ 	
return 
new 
OrderItemDTO #
{ 
	ProductId 
= 
item  
.  !
	ProductId! *
,* +
ProductName 
= 
item "
." #
ProductName# .
,. /
ProductPrice 
= 
item #
.# $
ProductPrice$ 0
,0 1
Amount 
= 
item 
. 
Amount $
} 
; 
} 	
} 
} ß.
ÇC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Extensions\LinqSelectExtensions.cs
	namespace 	
Ordering
 
. 
API 
. 

Extensions !
{ 
public 

static 
class  
LinqSelectExtensions ,
{ 
public		 
static		 
IEnumerable		 !
<		! "
SelectTryResult		" 1
<		1 2
TSource		2 9
,		9 :
TResult		; B
>		B C
>		C D
	SelectTry		E N
<		N O
TSource		O V
,		V W
TResult		X _
>		_ `
(		` a
this		a e
IEnumerable		f q
<		q r
TSource		r y
>		y z

enumerable			{ Ö
,
		Ö Ü
Func
		á ã
<
		ã å
TSource
		å ì
,
		ì î
TResult
		ï ú
>
		ú ù
selector
		û ¶
)
		¶ ß
{

 	
foreach 
( 
TSource 
element $
in% '

enumerable( 2
)2 3
{ 
SelectTryResult 
<  
TSource  '
,' (
TResult) 0
>0 1
returnedValue2 ?
;? @
try 
{ 
returnedValue !
=" #
new$ '
SelectTryResult( 7
<7 8
TSource8 ?
,? @
TResultA H
>H I
(I J
elementJ Q
,Q R
selectorS [
([ \
element\ c
)c d
,d e
nullf j
)j k
;k l
} 
catch 
( 
	Exception  
ex! #
)# $
{ 
returnedValue !
=" #
new$ '
SelectTryResult( 7
<7 8
TSource8 ?
,? @
TResultA H
>H I
(I J
elementJ Q
,Q R
defaultS Z
(Z [
TResult[ b
)b c
,c d
exe g
)g h
;h i
} 
yield 
return 
returnedValue *
;* +
} 
} 	
public 
static 
IEnumerable !
<! "
TResult" )
>) *
OnCaughtException+ <
<< =
TSource= D
,D E
TResultF M
>M N
(N O
thisO S
IEnumerableT _
<_ `
SelectTryResult` o
<o p
TSourcep w
,w x
TResult	y Ä
>
Ä Å
>
Å Ç

enumerable
É ç
,
ç é
Func
è ì
<
ì î
	Exception
î ù
,
ù û
TResult
ü ¶
>
¶ ß
exceptionHandler
® ∏
)
∏ π
{ 	
return 

enumerable 
. 
Select $
($ %
x% &
=>' )
x* +
.+ ,
CaughtException, ;
==< >
null? C
?D E
xF G
.G H
ResultH N
:O P
exceptionHandlerQ a
(a b
xb c
.c d
CaughtExceptiond s
)s t
)t u
;u v
} 	
public 
static 
IEnumerable !
<! "
TResult" )
>) *
OnCaughtException+ <
<< =
TSource= D
,D E
TResultF M
>M N
(N O
thisO S
IEnumerableT _
<_ `
SelectTryResult` o
<o p
TSourcep w
,w x
TResult	y Ä
>
Ä Å
>
Å Ç

enumerable
É ç
,
ç é
Func
è ì
<
ì î
TSource
î õ
,
õ ú
	Exception
ù ¶
,
¶ ß
TResult
® Ø
>
Ø ∞
exceptionHandler
± ¡
)
¡ ¬
{   	
return!! 

enumerable!! 
.!! 
Select!! $
(!!$ %
x!!% &
=>!!' )
x!!* +
.!!+ ,
CaughtException!!, ;
==!!< >
null!!? C
?!!D E
x!!F G
.!!G H
Result!!H N
:!!O P
exceptionHandler!!Q a
(!!a b
x!!b c
.!!c d
Source!!d j
,!!j k
x!!l m
.!!m n
CaughtException!!n }
)!!} ~
)!!~ 
;	!! Ä
}"" 	
public$$ 
class$$ 
SelectTryResult$$ $
<$$$ %
TSource$$% ,
,$$, -
TResult$$. 5
>$$5 6
{%% 	
internal&& 
SelectTryResult&& $
(&&$ %
TSource&&% ,
source&&- 3
,&&3 4
TResult&&5 <
result&&= C
,&&C D
	Exception&&E N
	exception&&O X
)&&X Y
{'' 
Source(( 
=(( 
source(( 
;((  
Result)) 
=)) 
result)) 
;))  
CaughtException** 
=**  !
	exception**" +
;**+ ,
}++ 
public-- 
TSource-- 
Source-- !
{--" #
get--$ '
;--' (
private--) 0
set--1 4
;--4 5
}--6 7
public.. 
TResult.. 
Result.. !
{.." #
get..$ '
;..' (
private..) 0
set..1 4
;..4 5
}..6 7
public// 
	Exception// 
CaughtException// ,
{//- .
get/// 2
;//2 3
private//4 ;
set//< ?
;//? @
}//A B
}00 	
}11 
}22 ı
üC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Infrastructure\ActionResults\InternalServerErrorObjectResult.cs
	namespace 	
Ordering
 
. 
API 
. 
Infrastructure %
.% &
ActionResults& 3
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
} Õ
íC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Infrastructure\AutofacModules\ApplicationModule.cs
	namespace

 	
Ordering


 
.

 
API

 
.

 
Infrastructure

 %
.

% &
AutofacModules

& 4
{ 
public 

class 
ApplicationModule "
: 
Autofac 
. 
Module 
{ 
public 
string #
QueriesConnectionString -
{. /
get0 3
;3 4
}5 6
public 
ApplicationModule  
(  !
string! '
qconstr( /
)/ 0
{ 	#
QueriesConnectionString #
=$ %
qconstr& -
;- .
} 	
	protected 
override 
void 
Load  $
($ %
ContainerBuilder% 5
builder6 =
)= >
{ 	
builder 
. 
Register 
( 
c 
=> !
new" %
OrderQueries& 2
(2 3#
QueriesConnectionString3 J
)J K
)K L
. 
As 
< 
IOrderQueries !
>! "
(" #
)# $
. $
InstancePerLifetimeScope )
() *
)* +
;+ ,
builder 
. 
RegisterType  
<  !
OrderRepository! 0
>0 1
(1 2
)2 3
.   
As   
<   
IOrderRepository   $
>  $ %
(  % &
)  & '
.!! $
InstancePerLifetimeScope!! )
(!!) *
)!!* +
;!!+ ,
builder## 
.## 
RegisterType##  
<##  !
RequestManager##! /
>##/ 0
(##0 1
)##1 2
.$$ 
As$$ 
<$$ 
IRequestManager$$ "
>$$" #
($$# $
)$$$ %
.%% $
InstancePerLifetimeScope%% (
(%%( )
)%%) *
;%%* +
builder'' 
.'' !
RegisterAssemblyTypes'' )
('') *
typeof''* 0
(''0 1%
CreateOrderCommandHandler''1 J
)''J K
.''K L
GetTypeInfo''L W
(''W X
)''X Y
.''Y Z
Assembly''Z b
)''b c
.(( 
AsClosedTypesOf((  
(((  !
typeof((! '
(((' ($
IIntegrationEventHandler((( @
<((@ A
>((A B
)((B C
)((C D
;((D E
})) 	
}** 
}++ ö&
èC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Infrastructure\AutofacModules\MediatorModule.cs
	namespace 	
Ordering
 
. 
API 
. 
Infrastructure %
.% &
AutofacModules& 4
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
CreateOrderCommand1 C
)C D
.D E
GetTypeInfoE P
(P Q
)Q R
.R S
AssemblyS [
)[ \
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
(0 1*
OrderStartedDomainEventHandler1 O
)O P
.P Q
GetTypeInfoQ \
(\ ]
)] ^
.^ _
Assembly_ g
)g h
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
(- .'
CreateOrderCommandValidator. I
)I J
.J K
GetTypeInfoK V
(V W
)W X
.X Y
AssemblyY a
)a b
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
}// ã
îC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Infrastructure\Factories\OrderingDbContextFactory.cs
	namespace 	
Ordering
 
. 
API 
. 
Infrastructure %
.% &
	Factories& /
{ 
public		 

class		 $
OrderingDbContextFactory		 )
:		* +'
IDesignTimeDbContextFactory		, G
<		G H
OrderingContext		H W
>		W X
{

 
public 
OrderingContext 
CreateDbContext .
(. /
string/ 5
[5 6
]6 7
args8 <
)< =
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
<< =
OrderingContext= L
>L M
(M N
)N O
;O P
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
$str	v Ñ
)
Ñ Ö
)
Ö Ü
;
Ü á
return 
new 
OrderingContext &
(& '
optionsBuilder' 5
.5 6
Options6 =
)= >
;> ?
} 	
} 
} ˝
óC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Infrastructure\Filters\AuthorizeCheckOperationFilter.cs
	namespace 	
Ordering
 
. 
API 
. 
Infrastructure %
.% &
Filters& -
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
}'' —)
ìC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Infrastructure\Filters\HttpGlobalExceptionFilter.cs
	namespace 	
Ordering
 
. 
API 
. 
Infrastructure %
.% &
Filters& -
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
(""5 6#
OrderingDomainException""6 M
)""M N
)""N O
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
}KK °
™C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Infrastructure\IntegrationEventMigrations\20210904163949_Initial_Create.cs
	namespace 	
Ordering
 
. 
API 
. 
Infrastructure %
.% &&
IntegrationEventMigrations& @
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
}"" À
∏C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Infrastructure\IntegrationEventMigrations\IntegrationEventLogContextDesignTimeFactory.cs
	namespace 	
Ordering
 
. 
API 
. 
Infrastructure %
.% &&
IntegrationEventMigrations& @
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
} áè
öC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Infrastructure\Migrations\20210912171134_Initial_Create.cs
	namespace 	
Ordering
 
. 
API 
. 
Infrastructure %
.% &

Migrations& 0
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
$str  
)  !
;! "
migrationBuilder 
. 
CreateSequence +
(+ ,
name 
: 
$str 
,  
schema 
: 
$str "
," #
incrementBy 
: 
$num 
)  
;  !
migrationBuilder 
. 
CreateSequence +
(+ ,
name 
: 
$str $
,$ %
incrementBy 
: 
$num 
)  
;  !
migrationBuilder 
. 
CreateSequence +
(+ ,
name 
: 
$str  
,  !
incrementBy 
: 
$num 
)  
;  !
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str "
," #
schema 
: 
$str "
," #
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
,G H
defaultValueI U
:U V
$numW X
)X Y
,Y Z
Name   
=   
table    
.    !
Column  ! '
<  ' (
string  ( .
>  . /
(  / 0
type  0 4
:  4 5
$str  6 E
,  E F
	maxLength  G P
:  P Q
$num  R U
,  U V
nullable  W _
:  _ `
false  a f
)  f g
}!! 
,!! 
constraints"" 
:"" 
table"" "
=>""# %
{## 
table$$ 
.$$ 

PrimaryKey$$ $
($$$ %
$str$$% 4
,$$4 5
x$$6 7
=>$$8 :
x$$; <
.$$< =
Id$$= ?
)$$? @
;$$@ A
}%% 
)%% 
;%% 
migrationBuilder'' 
.'' 
CreateTable'' (
(''( )
name(( 
:(( 
$str(( #
,((# $
schema)) 
:)) 
$str)) "
,))" #
columns** 
:** 
table** 
=>** !
new**" %
{++ 
Id,, 
=,, 
table,, 
.,, 
Column,, %
<,,% &
int,,& )
>,,) *
(,,* +
type,,+ /
:,,/ 0
$str,,1 6
,,,6 7
nullable,,8 @
:,,@ A
false,,B G
,,,G H
defaultValue,,I U
:,,U V
$num,,W X
),,X Y
,,,Y Z
Name-- 
=-- 
table--  
.--  !
Column--! '
<--' (
string--( .
>--. /
(--/ 0
type--0 4
:--4 5
$str--6 E
,--E F
	maxLength--G P
:--P Q
$num--R U
,--U V
nullable--W _
:--_ `
false--a f
)--f g
}.. 
,.. 
constraints// 
:// 
table// "
=>//# %
{00 
table11 
.11 

PrimaryKey11 $
(11$ %
$str11% 5
,115 6
x117 8
=>119 ;
x11< =
.11= >
Id11> @
)11@ A
;11A B
}22 
)22 
;22 
migrationBuilder44 
.44 
CreateTable44 (
(44( )
name55 
:55 
$str55 
,55 
schema66 
:66 
$str66 "
,66" #
columns77 
:77 
table77 
=>77 !
new77" %
{88 
Id99 
=99 
table99 
.99 
Column99 %
<99% &
int99& )
>99) *
(99* +
type99+ /
:99/ 0
$str991 6
,996 7
nullable998 @
:99@ A
false99B G
)99G H
,99H I
Code:: 
=:: 
table::  
.::  !
Column::! '
<::' (
string::( .
>::. /
(::/ 0
type::0 4
:::4 5
$str::6 E
,::E F
nullable::G O
:::O P
false::Q V
)::V W
,::W X
Identity;; 
=;; 
table;; $
.;;$ %
Column;;% +
<;;+ ,
Guid;;, 0
>;;0 1
(;;1 2
type;;2 6
:;;6 7
$str;;8 J
,;;J K
nullable;;L T
:;;T U
false;;V [
);;[ \
,;;\ ]
Name<< 
=<< 
table<<  
.<<  !
Column<<! '
<<<' (
string<<( .
><<. /
(<</ 0
type<<0 4
:<<4 5
$str<<6 E
,<<E F
nullable<<G O
:<<O P
false<<Q V
)<<V W
,<<W X
ItemStatusId==  
===! "
table==# (
.==( )
Column==) /
<==/ 0
int==0 3
>==3 4
(==4 5
type==5 9
:==9 :
$str==; @
,==@ A
nullable==B J
:==J K
false==L Q
)==Q R
,==R S
	CreatedAt>> 
=>> 
table>>  %
.>>% &
Column>>& ,
<>>, -
DateTime>>- 5
>>>5 6
(>>6 7
type>>7 ;
:>>; <
$str>>= H
,>>H I
nullable>>J R
:>>R S
false>>T Y
)>>Y Z
,>>Z [
	UpdatedAt?? 
=?? 
table??  %
.??% &
Column??& ,
<??, -
DateTime??- 5
>??5 6
(??6 7
type??7 ;
:??; <
$str??= H
,??H I
nullable??J R
:??R S
true??T X
)??X Y
}@@ 
,@@ 
constraintsAA 
:AA 
tableAA "
=>AA# %
{BB 
tableCC 
.CC 

PrimaryKeyCC $
(CC$ %
$strCC% /
,CC/ 0
xCC1 2
=>CC3 5
xCC6 7
.CC7 8
IdCC8 :
)CC: ;
;CC; <
tableDD 
.DD 

ForeignKeyDD $
(DD$ %
nameEE 
:EE 
$strEE @
,EE@ A
columnFF 
:FF 
xFF  !
=>FF" $
xFF% &
.FF& '
ItemStatusIdFF' 3
,FF3 4
principalSchemaGG '
:GG' (
$strGG) 3
,GG3 4
principalTableHH &
:HH& '
$strHH( 4
,HH4 5
principalColumnII '
:II' (
$strII) -
,II- .
onDeleteJJ  
:JJ  !
ReferentialActionJJ" 3
.JJ3 4
CascadeJJ4 ;
)JJ; <
;JJ< =
}KK 
)KK 
;KK 
migrationBuilderMM 
.MM 
CreateTableMM (
(MM( )
nameNN 
:NN 
$strNN 
,NN 
schemaOO 
:OO 
$strOO "
,OO" #
columnsPP 
:PP 
tablePP 
=>PP !
newPP" %
{QQ 
IdRR 
=RR 
tableRR 
.RR 
ColumnRR %
<RR% &
intRR& )
>RR) *
(RR* +
typeRR+ /
:RR/ 0
$strRR1 6
,RR6 7
nullableRR8 @
:RR@ A
falseRRB G
)RRG H
,RRH I
BuyerIdSS 
=SS 
tableSS #
.SS# $
ColumnSS$ *
<SS* +
GuidSS+ /
>SS/ 0
(SS0 1
typeSS1 5
:SS5 6
$strSS7 I
,SSI J
nullableSSK S
:SSS T
falseSSU Z
)SSZ [
,SS[ \
ObservationTT 
=TT  !
tableTT" '
.TT' (
ColumnTT( .
<TT. /
stringTT/ 5
>TT5 6
(TT6 7
typeTT7 ;
:TT; <
$strTT= L
,TTL M
nullableTTN V
:TTV W
trueTTX \
)TT\ ]
,TT] ^
OrderStatusIdUU !
=UU" #
tableUU$ )
.UU) *
ColumnUU* 0
<UU0 1
intUU1 4
>UU4 5
(UU5 6
typeUU6 :
:UU: ;
$strUU< A
,UUA B
nullableUUC K
:UUK L
falseUUM R
)UUR S
,UUS T
	CreatedAtVV 
=VV 
tableVV  %
.VV% &
ColumnVV& ,
<VV, -
DateTimeVV- 5
>VV5 6
(VV6 7
typeVV7 ;
:VV; <
$strVV= H
,VVH I
nullableVVJ R
:VVR S
falseVVT Y
)VVY Z
,VVZ [
	UpdatedAtWW 
=WW 
tableWW  %
.WW% &
ColumnWW& ,
<WW, -
DateTimeWW- 5
>WW5 6
(WW6 7
typeWW7 ;
:WW; <
$strWW= H
,WWH I
nullableWWJ R
:WWR S
trueWWT X
)WWX Y
}XX 
,XX 
constraintsYY 
:YY 
tableYY "
=>YY# %
{ZZ 
table[[ 
.[[ 

PrimaryKey[[ $
([[$ %
$str[[% 0
,[[0 1
x[[2 3
=>[[4 6
x[[7 8
.[[8 9
Id[[9 ;
)[[; <
;[[< =
table\\ 
.\\ 

ForeignKey\\ $
(\\$ %
name]] 
:]] 
$str]] C
,]]C D
column^^ 
:^^ 
x^^  !
=>^^" $
x^^% &
.^^& '
OrderStatusId^^' 4
,^^4 5
principalSchema__ '
:__' (
$str__) 3
,__3 4
principalTable`` &
:``& '
$str``( 5
,``5 6
principalColumnaa '
:aa' (
$straa) -
,aa- .
onDeletebb  
:bb  !
ReferentialActionbb" 3
.bb3 4
Cascadebb4 ;
)bb; <
;bb< =
}cc 
)cc 
;cc 
migrationBuilderee 
.ee 
CreateTableee (
(ee( )
nameff 
:ff 
$strff "
,ff" #
schemagg 
:gg 
$strgg "
,gg" #
columnshh 
:hh 
tablehh 
=>hh !
newhh" %
{ii 
Idjj 
=jj 
tablejj 
.jj 
Columnjj %
<jj% &
intjj& )
>jj) *
(jj* +
typejj+ /
:jj/ 0
$strjj1 6
,jj6 7
nullablejj8 @
:jj@ A
falsejjB G
)jjG H
,jjH I
	ProductIdkk 
=kk 
tablekk  %
.kk% &
Columnkk& ,
<kk, -
intkk- 0
>kk0 1
(kk1 2
typekk2 6
:kk6 7
$strkk8 =
,kk= >
nullablekk? G
:kkG H
falsekkI N
)kkN O
,kkO P
OrderIdll 
=ll 
tablell #
.ll# $
Columnll$ *
<ll* +
intll+ .
>ll. /
(ll/ 0
typell0 4
:ll4 5
$strll6 ;
,ll; <
nullablell= E
:llE F
falsellG L
)llL M
,llM N
Amountmm 
=mm 
tablemm "
.mm" #
Columnmm# )
<mm) *
intmm* -
>mm- .
(mm. /
typemm/ 3
:mm3 4
$strmm5 :
,mm: ;
nullablemm< D
:mmD E
falsemmF K
)mmK L
,mmL M
ProductNamenn 
=nn  !
tablenn" '
.nn' (
Columnnn( .
<nn. /
stringnn/ 5
>nn5 6
(nn6 7
typenn7 ;
:nn; <
$strnn= L
,nnL M
nullablennN V
:nnV W
falsennX ]
)nn] ^
,nn^ _
ProductPriceoo  
=oo! "
tableoo# (
.oo( )
Columnoo) /
<oo/ 0
decimaloo0 7
>oo7 8
(oo8 9
typeoo9 =
:oo= >
$stroo? N
,ooN O
nullableooP X
:ooX Y
falseooZ _
)oo_ `
,oo` a
	CreatedAtpp 
=pp 
tablepp  %
.pp% &
Columnpp& ,
<pp, -
DateTimepp- 5
>pp5 6
(pp6 7
typepp7 ;
:pp; <
$strpp= H
,ppH I
nullableppJ R
:ppR S
falseppT Y
)ppY Z
,ppZ [
	UpdatedAtqq 
=qq 
tableqq  %
.qq% &
Columnqq& ,
<qq, -
DateTimeqq- 5
>qq5 6
(qq6 7
typeqq7 ;
:qq; <
$strqq= H
,qqH I
nullableqqJ R
:qqR S
trueqqT X
)qqX Y
}rr 
,rr 
constraintsss 
:ss 
tabless "
=>ss# %
{tt 
tableuu 
.uu 

PrimaryKeyuu $
(uu$ %
$struu% 4
,uu4 5
xuu6 7
=>uu8 :
xuu; <
.uu< =
Iduu= ?
)uu? @
;uu@ A
tablevv 
.vv 

ForeignKeyvv $
(vv$ %
nameww 
:ww 
$strww <
,ww< =
columnxx 
:xx 
xxx  !
=>xx" $
xxx% &
.xx& '
OrderIdxx' .
,xx. /
principalSchemayy '
:yy' (
$stryy) 3
,yy3 4
principalTablezz &
:zz& '
$strzz( 0
,zz0 1
principalColumn{{ '
:{{' (
$str{{) -
,{{- .
onDelete||  
:||  !
ReferentialAction||" 3
.||3 4
Cascade||4 ;
)||; <
;||< =
}}} 
)}} 
;}} 
migrationBuilder 
. 
CreateIndex (
(( )
name
ÄÄ 
:
ÄÄ 
$str
ÄÄ -
,
ÄÄ- .
schema
ÅÅ 
:
ÅÅ 
$str
ÅÅ "
,
ÅÅ" #
table
ÇÇ 
:
ÇÇ 
$str
ÇÇ 
,
ÇÇ 
column
ÉÉ 
:
ÉÉ 
$str
ÉÉ &
)
ÉÉ& '
;
ÉÉ' (
migrationBuilder
ÖÖ 
.
ÖÖ 
CreateIndex
ÖÖ (
(
ÖÖ( )
name
ÜÜ 
:
ÜÜ 
$str
ÜÜ -
,
ÜÜ- .
schema
áá 
:
áá 
$str
áá "
,
áá" #
table
àà 
:
àà 
$str
àà #
,
àà# $
column
ââ 
:
ââ 
$str
ââ !
)
ââ! "
;
ââ" #
migrationBuilder
ãã 
.
ãã 
CreateIndex
ãã (
(
ãã( )
name
åå 
:
åå 
$str
åå /
,
åå/ 0
schema
çç 
:
çç 
$str
çç "
,
çç" #
table
éé 
:
éé 
$str
éé 
,
éé  
column
èè 
:
èè 
$str
èè '
)
èè' (
;
èè( )
}
êê 	
	protected
íí 
override
íí 
void
íí 
Down
íí  $
(
íí$ %
MigrationBuilder
íí% 5
migrationBuilder
íí6 F
)
ííF G
{
ìì 	
migrationBuilder
îî 
.
îî 
	DropTable
îî &
(
îî& '
name
ïï 
:
ïï 
$str
ïï 
,
ïï 
schema
ññ 
:
ññ 
$str
ññ "
)
ññ" #
;
ññ# $
migrationBuilder
òò 
.
òò 
	DropTable
òò &
(
òò& '
name
ôô 
:
ôô 
$str
ôô "
,
ôô" #
schema
öö 
:
öö 
$str
öö "
)
öö" #
;
öö# $
migrationBuilder
úú 
.
úú 
	DropTable
úú &
(
úú& '
name
ùù 
:
ùù 
$str
ùù "
,
ùù" #
schema
ûû 
:
ûû 
$str
ûû "
)
ûû" #
;
ûû# $
migrationBuilder
†† 
.
†† 
	DropTable
†† &
(
††& '
name
°° 
:
°° 
$str
°° 
,
°° 
schema
¢¢ 
:
¢¢ 
$str
¢¢ "
)
¢¢" #
;
¢¢# $
migrationBuilder
§§ 
.
§§ 
	DropTable
§§ &
(
§§& '
name
•• 
:
•• 
$str
•• #
,
••# $
schema
¶¶ 
:
¶¶ 
$str
¶¶ "
)
¶¶" #
;
¶¶# $
migrationBuilder
®® 
.
®® 
DropSequence
®® )
(
®®) *
name
©© 
:
©© 
$str
©© 
,
©©  
schema
™™ 
:
™™ 
$str
™™ "
)
™™" #
;
™™# $
migrationBuilder
¨¨ 
.
¨¨ 
DropSequence
¨¨ )
(
¨¨) *
name
≠≠ 
:
≠≠ 
$str
≠≠ $
)
≠≠$ %
;
≠≠% &
migrationBuilder
ØØ 
.
ØØ 
DropSequence
ØØ )
(
ØØ) *
name
∞∞ 
:
∞∞ 
$str
∞∞  
)
∞∞  !
;
∞∞! "
}
±± 	
}
≤≤ 
}≥≥  O
ÖC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Infrastructure\OrderingContextSeed.cs
	namespace 	
Ordering
 
. 
API 
. 
Infrastructure %
{ 
public 

class 
OrderingContextSeed $
{ 
public 
async 
Task 
	SeedAsync #
(# $
OrderingContext$ 3
context4 ;
,; <
IWebHostEnvironment= P
envQ T
,T U
IOptionsV ^
<^ _
OrderingSettings_ o
>o p
settingsq y
,y z
ILogger	{ Ç
<
Ç É!
OrderingContextSeed
É ñ
>
ñ ó
logger
ò û
)
û ü
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
OrderingContextSeed5 H
)H I
)I J
;J K
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
.""  !
OrderStatus""! ,
."", -
Any""- 0
(""0 1
)""1 2
)""2 3
{## 
context$$ 
.$$  
OrderStatus$$  +
.$$+ ,
AddRange$$, 4
($$4 5"
GetOrderStatusFromFile$$5 K
($$K L
contentRootPath$$L [
,$$[ \
logger$$] c
)$$c d
)$$d e
;$$e f
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
<-- 
OrderStatus-- '
>--' ("
GetOrderStatusFromFile--) ?
(--? @
string--@ F
path--G K
,--K L
ILogger--M T
<--T U
OrderingContextSeed--U h
>--h i
log--j m
)--m n
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
$str//B S
)//S T
;//T U
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
<33) *
OrderStatus33* 5
>335 6
(336 7
)337 8
;338 9
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
$str99- :
}99; <
;99< =

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
(<< 
	Exception<< 
ex<< 
)<< 
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
<??) *
OrderStatus??* 5
>??5 6
(??6 7
)??7 8
;??8 9
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
CreateOrderStatusEE  1
(EE1 2
xEE2 3
,EE3 4
refEE5 8
idEE9 ;
)EE; <
)EE< =
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
privateJJ 
OrderStatusJJ 
CreateOrderStatusJJ -
(JJ- .
stringJJ. 4
valueJJ5 :
,JJ: ;
refJJ< ?
intJJ@ C
idJJD F
)JJF G
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
$strNN$ B
)NNB C
;NNC D
}OO 
returnQQ 
newQQ 
OrderStatusQQ "
(QQ" #
idQQ# %
++QQ% '
,QQ' (
valueQQ) .
.QQ. /
TrimQQ/ 3
(QQ3 4
$charQQ4 7
)QQ7 8
.QQ8 9
TrimQQ9 =
(QQ= >
)QQ> ?
)QQ? @
;QQ@ A
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
privateii 
AsyncRetryPolicyii  
CreatePolicyii! -
(ii- .
ILoggerii. 5
<ii5 6
OrderingContextSeedii6 I
>iiI J
loggeriiK Q
,iiQ R
stringiiS Y
prefixiiZ `
,ii` a
intiib e
retriesiif m
=iin o
$numiip q
)iiq r
{jj 	
returnkk 
Policykk 
.kk 
Handlekk  
<kk  !
SqlExceptionkk! -
>kk- .
(kk. /
)kk/ 0
.kk0 1
WaitAndRetryAsyncll !
(ll! "

retryCountmm 
:mm 
retriesmm  '
,mm' (!
sleepDurationProvidernn )
:nn) *
retrynn+ 0
=>nn1 3
TimeSpannn4 <
.nn< =
FromSecondsnn= H
(nnH I
$numnnI J
)nnJ K
,nnK L
onRetryoo 
:oo 
(oo 
	exceptionoo '
,oo' (
timeSpanoo) 1
,oo1 2
retryoo3 8
,oo8 9
ctxoo: =
)oo= >
=>oo? A
{pp 
loggerqq 
.qq 

LogWarningqq )
(qq) *
	exceptionqq* 3
,qq3 4
$str	qq5 õ
,
qqõ ú
prefix
qqù £
,
qq£ §
	exception
qq• Æ
.
qqÆ Ø
GetType
qqØ ∂
(
qq∂ ∑
)
qq∑ ∏
.
qq∏ π
Name
qqπ Ω
,
qqΩ æ
	exception
qqø »
.
qq» …
Message
qq… –
,
qq– —
retry
qq“ ◊
,
qq◊ ÿ
retries
qqŸ ‡
)
qq‡ ·
;
qq· ‚
}rr 
)ss 
;ss 
}tt 	
}uu 
}vv á
sC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\OrderingSettings.cs
	namespace 	
Ordering
 
. 
API 
{ 
public 

class 
OrderingSettings !
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
}		 ˚G
jC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Program.cs
	namespace 	
Ordering
 
. 
API 
{ 
public 

class 
Program 
{ 
public 
static 
readonly 
string %
	Namespace& /
=0 1
typeof2 8
(8 9
Program9 @
)@ A
.A B
	NamespaceB K
;K L
public 
static 
readonly 
string %
AppName& -
=. /
	Namespace0 9
.9 :
	Substring: C
(C D
	NamespaceD M
.M N
LastIndexOfN Y
(Y Z
$charZ ]
,] ^
	Namespace_ h
.h i
LastIndexOfi t
(t u
$charu x
)x y
-z {
$num| }
)} ~
+	 Ä
$num
Å Ç
)
Ç É
;
É Ñ
public 
static 
int 
Main 
( 
string %
[% &
]& '
args( ,
), -
{ 	
var 
configuration 
= 
GetConfiguration  0
(0 1
)1 2
;2 3
Log 
. 
Logger 
= 
CreateSerilogLogger ,
(, -
configuration- :
): ;
;; <
try 
{   
Log!! 
.!! 
Information!! 
(!!  
$str!!  P
,!!P Q
AppName!!R Y
)!!Y Z
;!!Z [
var"" 
host"" 
="" 
BuildWebHost"" '
(""' (
configuration""( 5
,""5 6
args""7 ;
)""; <
;""< =
Log$$ 
.$$ 
Information$$ 
($$  
$str$$  O
,$$O P
AppName$$Q X
)$$X Y
;$$Y Z
host%% 
.%% 
MigrateDbContext%% %
<%%% &
OrderingContext%%& 5
>%%5 6
(%%6 7
(%%7 8
context%%8 ?
,%%? @
services%%A I
)%%I J
=>%%K M
{&& 
var'' 
env'' 
='' 
services'' &
.''& '

GetService''' 1
<''1 2
IWebHostEnvironment''2 E
>''E F
(''F G
)''G H
;''H I
var(( 
settings((  
=((! "
services((# +
.((+ ,

GetService((, 6
<((6 7
IOptions((7 ?
<((? @
OrderingSettings((@ P
>((P Q
>((Q R
(((R S
)((S T
;((T U
var)) 
logger)) 
=))  
services))! )
.))) *

GetService))* 4
<))4 5
ILogger))5 <
<))< =
OrderingContextSeed))= P
>))P Q
>))Q R
())R S
)))S T
;))T U
new++ 
OrderingContextSeed++ +
(+++ ,
)++, -
.,, 
	SeedAsync,, "
(,," #
context,,# *
,,,* +
env,,, /
,,,/ 0
settings,,1 9
,,,9 :
logger,,; A
),,A B
.-- 
Wait-- 
(-- 
)-- 
;--  
}.. 
).. 
.// 
MigrateDbContext// !
<//! "&
IntegrationEventLogContext//" <
>//< =
(//= >
(//> ?
_//? @
,//@ A
__//B D
)//D E
=>//F H
{//I J
}//K L
)//L M
;//M N
Log11 
.11 
Information11 
(11  
$str11  M
,11M N
AppName11O V
)11V W
;11W X
host22 
.22 
Run22 
(22 
)22 
;22 
return44 
$num44 
;44 
}55 
catch66 
(66 
	Exception66 
ex66 
)66  
{77 
Log88 
.88 
Fatal88 
(88 
ex88 
,88 
$str88 W
,88W X
AppName88Y `
)88` a
;88a b
return99 
$num99 
;99 
}:: 
finally;; 
{<< 
Log== 
.== 
CloseAndFlush== !
(==! "
)==" #
;==# $
}>> 
}?? 	
privateAA 
staticAA 
SerilogAA 
.AA 
ILoggerAA &
CreateSerilogLoggerAA' :
(AA: ;
IConfigurationAA; I
configurationAAJ W
)AAW X
{BB 	
varCC 
seqServerUrlCC 
=CC 
configurationCC ,
[CC, -
$strCC- C
]CCC D
;CCD E
varDD 
logstashUrlDD 
=DD 
configurationDD +
[DD+ ,
$strDD, B
]DDB C
;DDC D
returnEE 
newEE 
LoggerConfigurationEE *
(EE* +
)EE+ ,
.FF 
MinimumLevelFF 
.FF 
VerboseFF %
(FF% &
)FF& '
.GG 
EnrichGG 
.GG 
WithPropertyGG $
(GG$ %
$strGG% 9
,GG9 :
AppNameGG; B
)GGB C
.HH 
EnrichHH 
.HH 
FromLogContextHH &
(HH& '
)HH' (
.II 
WriteToII 
.II 
ConsoleII  
(II  !
)II! "
.JJ 
WriteToJJ 
.JJ 
SeqJJ 
(JJ 
stringJJ #
.JJ# $
IsNullOrWhiteSpaceJJ$ 6
(JJ6 7
seqServerUrlJJ7 C
)JJC D
?JJE F
$strJJG S
:JJT U
seqServerUrlJJV b
)JJb c
.KK 
WriteToKK 
.KK 
HttpKK 
(KK 
stringKK $
.KK$ %
IsNullOrWhiteSpaceKK% 7
(KK7 8
logstashUrlKK8 C
)KKC D
?KKE F
$strKKG ]
:KK^ _
logstashUrlKK` k
)KKk l
.LL 
ReadFromLL 
.LL 
ConfigurationLL '
(LL' (
configurationLL( 5
)LL5 6
.MM 
CreateLoggerMM 
(MM 
)MM 
;MM  
}NN 	
privatePP 
staticPP 
IConfigurationPP %
GetConfigurationPP& 6
(PP6 7
)PP7 8
{QQ 	
varRR 
builderRR 
=RR 
newRR  
ConfigurationBuilderRR 2
(RR2 3
)RR3 4
.SS 
SetBasePathSS 
(SS 
	DirectorySS &
.SS& '
GetCurrentDirectorySS' :
(SS: ;
)SS; <
)SS< =
.TT 
AddJsonFileTT 
(TT 
$strTT /
,TT/ 0
optionalTT1 9
:TT9 :
falseTT; @
,TT@ A
reloadOnChangeTTB P
:TTP Q
trueTTR V
)TTV W
.UU #
AddEnvironmentVariablesUU (
(UU( )
)UU) *
;UU* +
returnWW 
builderWW 
.WW 
BuildWW  
(WW  !
)WW! "
;WW" #
}XX 	
privateZZ 
staticZZ 
IWebHostZZ 
BuildWebHostZZ  ,
(ZZ, -
IConfigurationZZ- ;
configurationZZ< I
,ZZI J
stringZZK Q
[ZZQ R
]ZZR S
argsZZT X
)ZZX Y
=>ZZZ \
WebHost[[ 
.[[  
CreateDefaultBuilder[[ (
([[( )
args[[) -
)[[- .
.\\  
CaptureStartupErrors\\ %
(\\% &
false\\& +
)\\+ ,
.]] 
ConfigureKestrel]] !
(]]! "
options]]" )
=>]]* ,
{^^ 
options__ 
.__ 
Listen__ "
(__" #
	IPAddress__# ,
.__, -
Any__- 0
,__0 1
$num__2 4
,__4 5
listenOptions__6 C
=>__D F
{`` 
listenOptionsaa %
.aa% &
	Protocolsaa& /
=aa0 1
HttpProtocolsaa2 ?
.aa? @
Http1AndHttp2aa@ M
;aaM N
}bb 
)bb 
;bb 
}cc 
)cc 
.dd %
ConfigureAppConfigurationdd *
(dd* +
xdd+ ,
=>dd- /
xdd0 1
.dd1 2
AddConfigurationdd2 B
(ddB C
configurationddC P
)ddP Q
)ddQ R
.ee 

UseStartupee 
<ee 
Startupee #
>ee# $
(ee$ %
)ee% &
.ff 
UseContentRootff 
(ff  
	Directoryff  )
.ff) *
GetCurrentDirectoryff* =
(ff= >
)ff> ?
)ff? @
.gg 

UseSeriloggg 
(gg 
)gg 
.hh 
Buildhh 
(hh 
)hh 
;hh 
}ii 
}jj ÄC
jC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Startup.cs
	namespace 	
Ordering
 
. 
API 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
virtual 
IServiceProvider '
ConfigureServices( 9
(9 :
IServiceCollection: L
servicesM U
)U V
{ 	
services   
.!! 
AddCustomMvc!! 
(!! 
)!! 
."" 
AddHealthChecks""  
(""  !
Configuration""! .
)"". /
.## 
AddCustomDbContext## #
(### $
Configuration##$ 1
)##1 2
.$$ 
AddCustomSwagger$$ !
($$! "
Configuration$$" /
)$$/ 0
.%% !
AddCustomIntegrations%% &
(%%& '
Configuration%%' 4
)%%4 5
.&& "
AddCustomConfiguration&& '
(&&' (
Configuration&&( 5
)&&5 6
.'' 
AddEventBus'' 
('' 
Configuration'' *
)''* +
.(( #
AddCustomAuthentication(( (
(((( )
Configuration(() 6
)((6 7
;((7 8
var** 
	container** 
=** 
new** 
ContainerBuilder**  0
(**0 1
)**1 2
;**2 3
	container++ 
.++ 
Populate++ 
(++ 
services++ '
)++' (
;++( )
	container-- 
.-- 
RegisterModule-- $
(--$ %
new--% (
MediatorModule--) 7
(--7 8
)--8 9
)--9 :
;--: ;
	container.. 
... 
RegisterModule.. $
(..$ %
new..% (
ApplicationModule..) :
(..: ;
Configuration..; H
[..H I
$str..I [
]..[ \
)..\ ]
)..] ^
;..^ _
return00 
new00 "
AutofacServiceProvider00 -
(00- .
	container00. 7
.007 8
Build008 =
(00= >
)00> ?
)00? @
;00@ A
}11 	
public44 
void44 
	Configure44 
(44 
IApplicationBuilder44 1
app442 5
,445 6
IWebHostEnvironment447 J
env44K N
,44N O
ILoggerFactory44P ^
loggerFactory44_ l
)44l m
{55 	
var66 
pathBase66 
=66 
Configuration66 (
[66( )
$str66) 4
]664 5
;665 6
if77 
(77 
!77 
string77 
.77 
IsNullOrEmpty77 %
(77% &
pathBase77& .
)77. /
)77/ 0
{88 
loggerFactory99 
.99 
CreateLogger99 *
<99* +
Startup99+ 2
>992 3
(993 4
)994 5
.995 6
LogDebug996 >
(99> ?
$str99? ]
,99] ^
pathBase99_ g
)99g h
;99h i
app:: 
.:: 
UsePathBase:: 
(::  
pathBase::  (
)::( )
;::) *
};; 
if== 
(== 
env== 
.== 
IsDevelopment== !
(==! "
)==" #
)==# $
{>> $
IdentityModelEventSource?? (
.??( )
ShowPII??) 0
=??1 2
true??3 7
;??7 8
appAA 
.AA 

UseSwaggerAA 
(AA 
)AA  
;AA  !
appBB 
.BB 
UseSwaggerUIBB  
(BB  !
cBB! "
=>BB# %
{CC 
cDD 
.DD 
SwaggerEndpointDD %
(DD% &
$"DD& (
{DD( )
(DD* +
!DD+ ,
stringDD, 2
.DD2 3
IsNullOrEmptyDD3 @
(DD@ A
pathBaseDDA I
)DDI J
?DDK L
pathBaseDDM U
:DDV W
stringDDX ^
.DD^ _
EmptyDD_ d
)DDd e
}DDf g
$strDDg 
"	DD Ä
,
DDÄ Å
$str
DDÇ ì
)
DDì î
;
DDî ï
cEE 
.EE 
OAuthClientIdEE #
(EE# $
ConfigurationEE$ 1
.EE1 2

GetSectionEE2 <
(EE< =
$strEE= I
)EEI J
.EEJ K
GetValueEEK S
<EES T
stringEET Z
>EEZ [
(EE[ \
$strEE\ m
)EEm n
)EEn o
;EEo p
cFF 
.FF 
OAuthAppNameFF "
(FF" #
$strFF# 6
)FF6 7
;FF7 8
cHH 
.HH 
ConfigObjectHH "
.HH" #
OAuth2RedirectUrlHH# 4
=HH5 6
$"HH7 9
$strHH9 N
{HHN O
(HHP Q
!HHQ R
stringHHR X
.HHX Y
IsNullOrEmptyHHY f
(HHf g
pathBaseHHg o
)HHo p
?HHq r
pathBaseHHs {
:HH| }
string	HH~ Ñ
.
HHÑ Ö
Empty
HHÖ ä
)
HHä ã
}
HHå ç
$str
HHç ™
"
HH™ ´
;
HH´ ¨
}II 
)II 
;II 
}KK 
appMM 
.MM 
UseHttpsRedirectionMM #
(MM# $
)MM$ %
;MM% &
appNN 
.NN 

UseRoutingNN 
(NN 
)NN 
;NN 
appOO 
.OO 
UseCorsOO 
(OO 
$strOO $
)OO$ %
;OO% &
ConfigureAuthQQ 
(QQ 
appQQ 
)QQ 
;QQ 
appSS 
.SS 
UseEndpointsSS 
(SS 
	endpointsSS &
=>SS' )
{TT 
	endpointsUU 
.UU %
MapDefaultControllerRouteUU 3
(UU3 4
)UU4 5
;UU5 6
	endpointsVV 
.VV 
MapControllersVV (
(VV( )
)VV) *
;VV* +
	endpointsWW 
.WW 
MapHealthChecksWW )
(WW) *
$strWW* /
,WW/ 0
newWW1 4
HealthCheckOptionsWW5 G
(WWG H
)WWH I
{XX 
	PredicateYY 
=YY 
_YY  !
=>YY" $
trueYY% )
,YY) *
ResponseWriterZZ "
=ZZ# $
UIResponseWriterZZ% 5
.ZZ5 6&
WriteHealthCheckUIResponseZZ6 P
}[[ 
)[[ 
;[[ 
	endpoints\\ 
.\\ 
MapHealthChecks\\ )
(\\) *
$str\\* 5
,\\5 6
new\\7 :
HealthCheckOptions\\; M
(\\M N
)\\N O
{]] 
	Predicate^^ 
=^^ 
r^^  !
=>^^" $
r^^% &
.^^& '
Name^^' +
.^^+ ,
Contains^^, 4
(^^4 5
$str^^5 ;
)^^; <
}__ 
)__ 
;__ 
}`` 
)`` 
;`` 
ConfigureEventBusbb 
(bb 
appbb !
)bb! "
;bb" #
}cc 	
	protectedee 
virtualee 
voidee 
ConfigureAuthee ,
(ee, -
IApplicationBuilderee- @
appeeA D
)eeD E
{ff 	
appgg 
.gg 
UseAuthenticationgg !
(gg! "
)gg" #
;gg# $
apphh 
.hh 
UseAuthorizationhh  
(hh  !
)hh! "
;hh" #
}ii 	
privatekk 
voidkk 
ConfigureEventBuskk &
(kk& '
IApplicationBuilderkk' :
appkk; >
)kk> ?
{ll 	
varmm 
eventBusmm 
=mm 
appmm 
.mm 
ApplicationServicesmm 2
.mm2 3
GetRequiredServicemm3 E
<mmE F
BuildingBlocksmmF T
.mmT U
EventBusmmU ]
.mm] ^
Abstractionsmm^ j
.mmj k
	IEventBusmmk t
>mmt u
(mmu v
)mmv w
;mmw x
}qq 	
}rr 
}ss ã∏
uC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Startup.Extensions.cs
	namespace 	
Ordering
 
. 
API 
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
(//* +
OrderController//+ :
)//: ;
.//; <
Assembly//< D
)//D E
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
$strMM ,
,MM, -
tagsNN 
:NN 
newNN 
stringNN $
[NN$ %
]NN% &
{NN' (
$strNN) 5
}NN6 7
)NN7 8
;NN8 9
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
$strSS 6
,SS6 7
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
<[[! "
OrderingContext[[" 1
>[[1 2
([[2 3
options[[3 :
=>[[; =
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
<vv! "
OrderingContextvv" 1
>vv1 2
(vv2 3
optionsvv3 :
=>vv; =
{ww 
optionsxx 
.xx 
UseInMemoryDatabasexx +
(xx+ ,
databaseNamexx, 8
:xx8 9
$strxx: F
)xxF G
;xxG H
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
ää 7
,
ää7 8
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
åå" A
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
∞∞! ".
 IOrderingIntegrationEventService
∞∞" B
,
∞∞B C-
OrderingIntegrationEventService
∞∞D c
>
∞∞c d
(
∞∞d e
)
∞∞e f
;
∞∞f g
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
OrderingSettings
’’ /
>
’’/ 0
(
’’0 1
configuration
’’1 >
)
’’> ?
;
’’? @
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
}ìì «2
pC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.API\Startup.Tests.cs
	namespace 	
Ordering
 
. 
API 
{ 
public 

class 
StartupTests 
{ 
public 
StartupTests 
( 
IConfiguration *
configuration+ 8
)8 9
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
virtual 
IServiceProvider '
ConfigureServices( 9
(9 :
IServiceCollection: L
servicesM U
)U V
{ 	
services   
.!! 
AddCustomMvc!! 
(!! 
)!! 
."" 
AddHealthChecks""  
(""  !
Configuration""! .
)"". /
.##  
AddInMemoryDbContext## %
(##% &
Configuration##& 3
)##3 4
.$$ !
AddCustomIntegrations$$ &
($$& '
Configuration$$' 4
)$$4 5
.%% "
AddCustomConfiguration%% '
(%%' (
Configuration%%( 5
)%%5 6
.&& 
AddEventBus&& 
(&& 
Configuration&& *
)&&* +
.'' #
AddCustomAuthentication'' (
(''( )
Configuration'') 6
)''6 7
;''7 8
var)) 
	container)) 
=)) 
new)) 
ContainerBuilder))  0
())0 1
)))1 2
;))2 3
	container** 
.** 
Populate** 
(** 
services** '
)**' (
;**( )
	container,, 
.,, 
RegisterModule,, $
(,,$ %
new,,% (
MediatorModule,,) 7
(,,7 8
),,8 9
),,9 :
;,,: ;
	container-- 
.-- 
RegisterModule-- $
(--$ %
new--% (
ApplicationModule--) :
(--: ;
Configuration--; H
[--H I
$str--I [
]--[ \
)--\ ]
)--] ^
;--^ _
return// 
new// "
AutofacServiceProvider// -
(//- .
	container//. 7
.//7 8
Build//8 =
(//= >
)//> ?
)//? @
;//@ A
}00 	
public33 
void33 
	Configure33 
(33 
IApplicationBuilder33 1
app332 5
,335 6
IWebHostEnvironment337 J
env33K N
,33N O
ILoggerFactory33P ^
loggerFactory33_ l
)33l m
{44 	
var55 
pathBase55 
=55 
Configuration55 (
[55( )
$str55) 4
]554 5
;555 6
if66 
(66 
!66 
string66 
.66 
IsNullOrEmpty66 %
(66% &
pathBase66& .
)66. /
)66/ 0
{77 
loggerFactory88 
.88 
CreateLogger88 *
<88* +
Startup88+ 2
>882 3
(883 4
)884 5
.885 6
LogDebug886 >
(88> ?
$str88? ]
,88] ^
pathBase88_ g
)88g h
;88h i
app99 
.99 
UsePathBase99 
(99  
pathBase99  (
)99( )
;99) *
}:: 
app<< 
.<< 
UseHttpsRedirection<< #
(<<# $
)<<$ %
;<<% &
app== 
.== 

UseRouting== 
(== 
)== 
;== 
app>> 
.>> 
UseCors>> 
(>> 
$str>> $
)>>$ %
;>>% &
ConfigureAuth@@ 
(@@ 
app@@ 
)@@ 
;@@ 
appBB 
.BB 
UseEndpointsBB 
(BB 
	endpointsBB &
=>BB' )
{CC 
	endpointsDD 
.DD %
MapDefaultControllerRouteDD 3
(DD3 4
)DD4 5
;DD5 6
	endpointsEE 
.EE 
MapControllersEE (
(EE( )
)EE) *
;EE* +
	endpointsFF 
.FF 
MapHealthChecksFF )
(FF) *
$strFF* /
,FF/ 0
newFF1 4
HealthCheckOptionsFF5 G
(FFG H
)FFH I
{GG 
	PredicateHH 
=HH 
_HH  !
=>HH" $
trueHH% )
,HH) *
ResponseWriterII "
=II# $
UIResponseWriterII% 5
.II5 6&
WriteHealthCheckUIResponseII6 P
}JJ 
)JJ 
;JJ 
	endpointsKK 
.KK 
MapHealthChecksKK )
(KK) *
$strKK* 5
,KK5 6
newKK7 :
HealthCheckOptionsKK; M
(KKM N
)KKN O
{LL 
	PredicateMM 
=MM 
rMM  !
=>MM" $
rMM% &
.MM& '
NameMM' +
.MM+ ,
ContainsMM, 4
(MM4 5
$strMM5 ;
)MM; <
}NN 
)NN 
;NN 
}OO 
)OO 
;OO 
ConfigureEventBusQQ 
(QQ 
appQQ !
)QQ! "
;QQ" #
}RR 	
	protectedTT 
virtualTT 
voidTT 
ConfigureAuthTT ,
(TT, -
IApplicationBuilderTT- @
appTTA D
)TTD E
{UU 	
appVV 
.VV 
UseAuthenticationVV !
(VV! "
)VV" #
;VV# $
appWW 
.WW 
UseAuthorizationWW  
(WW  !
)WW! "
;WW" #
}XX 	
privateZZ 
voidZZ 
ConfigureEventBusZZ &
(ZZ& '
IApplicationBuilderZZ' :
appZZ; >
)ZZ> ?
{[[ 	
var\\ 
eventBus\\ 
=\\ 
app\\ 
.\\ 
ApplicationServices\\ 2
.\\2 3
GetRequiredService\\3 E
<\\E F
BuildingBlocks\\F T
.\\T U
EventBus\\U ]
.\\] ^
Abstractions\\^ j
.\\j k
	IEventBus\\k t
>\\t u
(\\u v
)\\v w
;\\w x
}`` 	
}aa 
}bb 