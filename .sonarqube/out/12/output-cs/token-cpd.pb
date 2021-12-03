Ö
üC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Infrastructure\EntityConfigurations\OrderEntityTypeConfiguration.cs
	namespace

 	
Ordering


 
.

 
Infrastructure

 !
.

! " 
EntityConfigurations

" 6
{ 
public 

class (
OrderEntityTypeConfiguration -
:. /$
IEntityTypeConfiguration0 H
<H I
OrderI N
>N O
{ 
public 
void 
	Configure 
( 
EntityTypeBuilder /
</ 0
Order0 5
>5 6
builder7 >
)> ?
{ 	
builder 
. 
ToTable 
( 
$str $
,$ %
OrderingContext& 5
.5 6
DEFAULT_SCHEMA6 D
)D E
;E F
builder 
. 
HasKey 
( 
o 
=> 
o  !
.! "
Id" $
)$ %
;% &
builder 
. 
Ignore 
( 
b 
=> 
b  !
.! "
DomainEvents" .
). /
;/ 0
builder 
. 
Property 
( 
o 
=> !
o" #
.# $
BuyerId$ +
)+ ,
., -

IsRequired- 7
(7 8
)8 9
;9 :
builder 
. 
Property 
( 
o 
=> !
o" #
.# $
Observation$ /
)/ 0
.0 1

IsRequired1 ;
(; <
false< A
)A B
;B C
builder 
. 
Property 
( 
x 
=> !
x" #
.# $
Id$ &
)& '
. 
UseHiLo 
( 
$str #
)# $
;$ %
var 

navigation 
= 
builder $
.$ %
Metadata% -
.- .
FindNavigation. <
(< =
nameof= C
(C D
OrderD I
.I J

OrderItemsJ T
)T U
)U V
;V W

navigation 
. !
SetPropertyAccessMode ,
(, -
PropertyAccessMode- ?
.? @
Field@ E
)E F
;F G
builder 
.   
Ignore   
(   
x   
=>   
x   
.   
OrderStatus   *
)  * +
.!! 
Property!! 
<!! 
int!! 
>!! 
(!! 
$str!! /
)!!/ 0
."" !
UsePropertyAccessMode"" &
(""& '
PropertyAccessMode""' 9
.""9 :
Field"": ?
)""? @
.## 
HasColumnName## 
(## 
$str## .
)##. /
.$$ 

IsRequired$$ 
($$ 
)$$ 
;$$ 
builder&& 
.&& 
HasOne&& 
(&& 
o&& 
=>&& 
o&&  !
.&&! "
OrderStatus&&" -
)&&- .
.'' 
WithMany'' 
('' 
)'' 
.(( 
HasForeignKey(( 
((( 
$str(( /
)((/ 0
;((0 1
})) 	
}** 
}++  
£C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Infrastructure\EntityConfigurations\OrderItemEntityTypeConfiguration.cs
	namespace 	
Ordering
 
. 
Infrastructure !
.! " 
EntityConfigurations" 6
{ 
public 

class ,
 OrderItemEntityTypeConfiguration 1
:2 3$
IEntityTypeConfiguration4 L
<L M
	OrderItemM V
>V W
{ 
public		 
void		 
	Configure		 
(		 
EntityTypeBuilder		 /
<		/ 0
	OrderItem		0 9
>		9 :
builder		; B
)		B C
{

 	
builder 
. 
ToTable 
( 
$str (
,( )
OrderingContext* 9
.9 :
DEFAULT_SCHEMA: H
)H I
;I J
builder 
. 
HasKey 
( 
o 
=> 
o  !
.! "
Id" $
)$ %
;% &
builder 
. 
Ignore 
( 
b 
=> 
b  !
.! "
DomainEvents" .
). /
;/ 0
builder 
. 
Property 
( 
x 
=> !
x" #
.# $
Id$ &
)& '
. 
UseHiLo 
( 
$str '
)' (
;( )
builder 
. 
Property 
< 
int  
>  !
(! "
$str" +
)+ ,
., -

IsRequired- 7
(7 8
)8 9
;9 :
builder 
. 
Property 
< 
string !
>! "
(" #
$str# 1
)1 2
. !
UsePropertyAccessMode '
(' (
PropertyAccessMode( :
.: ;
Field; @
)@ A
. 
HasColumnName 
(  
$str  -
)- .
. 

IsRequired 
( 
) 
; 
builder 
. 
Property 
< 
decimal "
>" #
(# $
$str$ 3
)3 4
. !
UsePropertyAccessMode '
(' (
PropertyAccessMode( :
.: ;
Field; @
)@ A
. 
HasColumnName 
(  
$str  .
). /
. 

IsRequired 
( 
) 
; 
builder!! 
."" 
Property"" 
<"" 
int"" 
>"" 
(""  
$str""  )
)"") *
.## !
UsePropertyAccessMode## '
(##' (
PropertyAccessMode##( :
.##: ;
Field##; @
)##@ A
.$$ 
HasColumnName$$ 
($$  
$str$$  (
)$$( )
.%% 

IsRequired%% 
(%% 
)%% 
;%% 
}&& 	
}'' 
}(( Ü
•C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Infrastructure\EntityConfigurations\OrderStatusEntityTypeConfiguration.cs
	namespace 	
Ordering
 
. 
Infrastructure !
.! " 
EntityConfigurations" 6
{ 
public 

class .
"OrderStatusEntityTypeConfiguration 3
:4 5$
IEntityTypeConfiguration6 N
<N O
OrderStatusO Z
>Z [
{ 
public		 
void		 
	Configure		 
(		 
EntityTypeBuilder		 /
<		/ 0
OrderStatus		0 ;
>		; <
builder		= D
)		D E
{

 	
builder 
. 
ToTable 
( 
$str )
,) *
OrderingContext+ :
.: ;
DEFAULT_SCHEMA; I
)I J
;J K
builder 
. 
HasKey 
( 
o 
=> 
o  !
.! "
Id" $
)$ %
;% &
builder 
. 
Property 
( 
o 
=> !
o" #
.# $
Id$ &
)& '
. 
HasDefaultValue  
(  !
$num! "
)" #
. 
ValueGeneratedNever $
($ %
)% &
. 

IsRequired 
( 
) 
; 
builder 
. 
Property 
( 
o 
=> !
o" #
.# $
Name$ (
)( )
. 
HasMaxLength 
( 
$num !
)! "
. 

IsRequired 
( 
) 
; 
} 	
} 
} »
áC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Infrastructure\Idempotency\ClientRequest.cs
	namespace 	
Ordering
 
. 
Infrastructure !
.! "
Idempotency" -
{ 
public 

class 
ClientRequest 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
DateTime		 
Time		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
}

 
} Î
âC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Infrastructure\Idempotency\IRequestManager.cs
	namespace 	
Ordering
 
. 
Infrastructure !
.! "
Idempotency" -
{ 
public 

	interface 
IRequestManager $
{ 
Task 
< 
bool 
> 

ExistAsync 
( 
Guid "
id# %
)% &
;& '
Task

 (
CreateRequestForCommandAsync

 )
<

) *
T

* +
>

+ ,
(

, -
Guid

- 1
id

2 4
)

4 5
;

5 6
} 
} ÿ
àC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Infrastructure\Idempotency\RequestManager.cs
	namespace 	
Ordering
 
. 
Infrastructure !
.! "
Idempotency" -
{ 
public 

class 
RequestManager 
:  !
IRequestManager" 1
{ 
private		 
readonly		 
OrderingContext		 (
_context		) 1
;		1 2
public 
RequestManager 
( 
OrderingContext -
context. 5
)5 6
{ 	
_context 
= 
context 
?? !
throw" '
new( +!
ArgumentNullException, A
(A B
nameofB H
(H I
contextI P
)P Q
)Q R
;R S
} 	
public 
async 
Task 
< 
bool 
> 

ExistAsync  *
(* +
Guid+ /
id0 2
)2 3
{ 	
var 
request 
= 
await 
_context  (
.( )
	FindAsync 
< 
ClientRequest '
>' (
(( )
id) +
)+ ,
;, -
return 
request 
!= 
null "
;" #
} 	
public 
async 
Task (
CreateRequestForCommandAsync 6
<6 7
T7 8
>8 9
(9 :
Guid: >
id? A
)A B
{ 	
var 
exists 
= 
await 

ExistAsync )
() *
id* ,
), -
;- .
var 
request 
= 
exists  
?! "
throw 
new #
OrderingDomainException 1
(1 2
$"2 4
$str4 A
{A B
idB D
}D E
$strE T
"T U
)U V
:W X
new 
ClientRequest !
(! "
)" #
{   
Id!! 
=!! 
id!! 
,!! 
Name"" 
="" 
typeof"" !
(""! "
T""" #
)""# $
.""$ %
Name""% )
,"") *
Time## 
=## 
DateTime## #
.### $
UtcNow##$ *
}$$ 
;$$ 
_context&& 
.&& 
Add&& 
(&& 
request&&  
)&&  !
;&&! "
await(( 
_context(( 
.(( 
SaveChangesAsync(( +
(((+ ,
)((, -
;((- .
})) 	
}** 
}++ ‘
C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Infrastructure\MediatorExtension.cs
	namespace 	
Ordering
 
. 
Infrastructure !
{ 
static 

class 
MediatorExtension "
{		 
public

 
static

 
async

 
Task

  %
DispatchDomainEventsAsync

! :
(

: ;
this

; ?
	IMediator

@ I
mediator

J R
,

R S
OrderingContext

T c
ctx

d g
)

g h
{ 	
var 
domainEntities 
=  
ctx! $
.$ %
ChangeTracker% 2
. 
Entries 
< 
Entity 
>  
(  !
)! "
. 
Where 
( 
x 
=> 
x 
. 
Entity $
.$ %
DomainEvents% 1
!=2 4
null5 9
&&: <
x= >
.> ?
Entity? E
.E F
DomainEventsF R
.R S
AnyS V
(V W
)W X
)X Y
;Y Z
var 
domainEvents 
= 
domainEntities -
. 

SelectMany 
( 
x 
=>  
x! "
." #
Entity# )
.) *
DomainEvents* 6
)6 7
. 
ToList 
( 
) 
; 
domainEntities 
. 
ToList !
(! "
)" #
. 
ForEach 
( 
entity 
=>  "
entity# )
.) *
Entity* 0
.0 1
ClearDomainEvents1 B
(B C
)C D
)D E
;E F
foreach 
( 
var 
domainEvent $
in% '
domainEvents( 4
)4 5
await 
mediator 
. 
Publish &
(& '
domainEvent' 2
)2 3
;3 4
} 	
} 
} ¸]
}C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Infrastructure\OrderingContext.cs
	namespace 	
Ordering
 
. 
Infrastructure !
{ 
public 

class 
OrderingContext  
:! "
	DbContext# ,
,, -
IUnitOfWork. 9
{ 
public 
const 
string 
DEFAULT_SCHEMA *
=+ ,
$str- 7
;7 8
public 
DbSet 
< 
Order 
> 
Orders "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DbSet 
< 
	OrderItem 
> 

OrderItems  *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
DbSet 
< 
OrderStatus  
>  !
OrderStatus" -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private !
IDbContextTransaction %
_currentTransaction& 9
;9 :
public 
OrderingContext 
( 
DbContextOptions /
</ 0
OrderingContext0 ?
>? @
optionsA H
)H I
:J K
baseL P
(P Q
optionsQ X
)X Y
{Z [
}\ ]
public !
IDbContextTransaction $!
GetCurrentTransaction% :
(: ;
); <
=>= ?
_currentTransaction@ S
;S T
public 
bool  
HasActiveTransaction (
=>) +
_currentTransaction, ?
!=@ B
nullC G
;G H
public   
OrderingContext   
(   
DbContextOptions   /
<  / 0
OrderingContext  0 ?
>  ? @
options  A H
,  H I
	IMediator  J S
mediator  T \
)  \ ]
:  ^ _
base  ` d
(  d e
options  e l
)  l m
{!! 	
	_mediator"" 
="" 
mediator""  
??""! #
throw""$ )
new""* -!
ArgumentNullException"". C
(""C D
nameof""D J
(""J K
mediator""K S
)""S T
)""T U
;""U V
System%% 
.%% 
Diagnostics%% 
.%% 
Debug%% $
.%%$ %
	WriteLine%%% .
(%%. /
$str%%/ I
+%%J K
this%%L P
.%%P Q
GetHashCode%%Q \
(%%\ ]
)%%] ^
)%%^ _
;%%_ `
}&& 	
	protected(( 
override(( 
void(( 
OnModelCreating((  /
(((/ 0
ModelBuilder((0 <
modelBuilder((= I
)((I J
{)) 	
modelBuilder** 
.** 
ApplyConfiguration** +
(**+ ,
new**, /(
OrderEntityTypeConfiguration**0 L
(**L M
)**M N
)**N O
;**O P
modelBuilder++ 
.++ 
ApplyConfiguration++ +
(+++ ,
new++, /.
"OrderStatusEntityTypeConfiguration++0 R
(++R S
)++S T
)++T U
;++U V
modelBuilder,, 
.,, 
ApplyConfiguration,, +
(,,+ ,
new,,, /,
 OrderItemEntityTypeConfiguration,,0 P
(,,P Q
),,Q R
),,R S
;,,S T
}-- 	
public// 
async// 
Task// 
<// 
bool// 
>// 
SaveEntitiesAsync//  1
(//1 2
CancellationToken//2 C
cancellationToken//D U
=//V W
default//X _
(//_ `
CancellationToken//` q
)//q r
)//r s
{00 	
await11 
	_mediator11 
.11 %
DispatchDomainEventsAsync11 5
(115 6
this116 :
)11: ;
;11; <
ChangeTracker33 
.33 
Entries33 !
<33! "
Entity33" (
>33( )
(33) *
)33* +
.44 
Where44 
(44  
e44  !
=>44" $
e44% &
.44& '
State44' ,
==44- /
EntityState440 ;
.44; <
Modified44< D
)44D E
.44E F
ToList44F L
(44L M
)44M N
.55 
ForEach55 !
(55! "
e55" #
=>55$ &
{66 
e77 
.77 
Property77 '
(77' (
$str77( 3
)773 4
.774 5
CurrentValue775 A
=77B C
DateTime77D L
.77L M
UtcNow77M S
;77S T
}88 
)88 
;88 
var:: 
result:: 
=:: 
await:: 
base:: #
.::# $
SaveChangesAsync::$ 4
(::4 5
cancellationToken::5 F
)::F G
;::G H
return;; 
true;; 
;;; 
}<< 	
public>> 
async>> 
Task>> 
<>> !
IDbContextTransaction>> /
>>>/ 0!
BeginTransactionAsync>>1 F
(>>F G
)>>G H
{?? 	
if@@ 
(@@ 
_currentTransaction@@ #
!=@@$ &
null@@' +
)@@+ ,
return@@- 3
null@@4 8
;@@8 9
_currentTransactionBB 
=BB  !
awaitBB" '
DatabaseBB( 0
.BB0 1!
BeginTransactionAsyncBB1 F
(BBF G
IsolationLevelBBG U
.BBU V
ReadCommittedBBV c
)BBc d
;BBd e
returnDD 
_currentTransactionDD &
;DD& '
}EE 	
publicGG 
asyncGG 
TaskGG "
CommitTransactionAsyncGG 0
(GG0 1!
IDbContextTransactionGG1 F
transactionGGG R
)GGR S
{HH 	
ifII 
(II 
transactionII 
==II 
nullII #
)II# $
throwII% *
newII+ .!
ArgumentNullExceptionII/ D
(IID E
nameofIIE K
(IIK L
transactionIIL W
)IIW X
)IIX Y
;IIY Z
ifJJ 
(JJ 
transactionJJ 
!=JJ 
_currentTransactionJJ 2
)JJ2 3
throwJJ4 9
newJJ: =%
InvalidOperationExceptionJJ> W
(JJW X
$"JJX Z
$strJJZ f
{JJf g
transactionJJg r
.JJr s
TransactionId	JJs Ä
}
JJÄ Å
$str
JJÅ ê
"
JJê ë
)
JJë í
;
JJí ì
tryLL 
{MM 
awaitNN 
SaveChangesAsyncNN &
(NN& '
)NN' (
;NN( )
transactionOO 
.OO 
CommitOO "
(OO" #
)OO# $
;OO$ %
}PP 
catchQQ 
{RR 
RollbackTransactionSS #
(SS# $
)SS$ %
;SS% &
throwTT 
;TT 
}UU 
finallyVV 
{WW 
ifXX 
(XX 
_currentTransactionXX '
!=XX( *
nullXX+ /
)XX/ 0
{YY 
_currentTransactionZZ '
.ZZ' (
DisposeZZ( /
(ZZ/ 0
)ZZ0 1
;ZZ1 2
_currentTransaction[[ '
=[[( )
null[[* .
;[[. /
}\\ 
}]] 
}^^ 	
public`` 
void`` 
RollbackTransaction`` '
(``' (
)``( )
{aa 	
trybb 
{cc 
_currentTransactiondd #
?dd# $
.dd$ %
Rollbackdd% -
(dd- .
)dd. /
;dd/ 0
}ee 
finallyff 
{gg 
ifhh 
(hh 
_currentTransactionhh '
!=hh( *
nullhh+ /
)hh/ 0
{ii 
_currentTransactionjj '
.jj' (
Disposejj( /
(jj/ 0
)jj0 1
;jj1 2
_currentTransactionkk '
=kk( )
nullkk* .
;kk. /
}ll 
}mm 
}nn 	
}oo 
publicqq 

classqq (
OrderingContextDesignFactoryqq -
:qq. /'
IDesignTimeDbContextFactoryqq0 K
<qqK L
OrderingContextqqL [
>qq[ \
{rr 
publicss 
OrderingContextss 
CreateDbContextss .
(ss. /
stringss/ 5
[ss5 6
]ss6 7
argsss8 <
)ss< =
{tt 	
varuu 
optionsBuilderuu 
=uu  
newuu! $#
DbContextOptionsBuilderuu% <
<uu< =
OrderingContextuu= L
>uuL M
(uuM N
)uuN O
.vv 
UseSqlServervv 
(vv 
$str	vv Ä
)
vvÄ Å
;
vvÅ Ç
returnxx 
newxx 
OrderingContextxx &
(xx& '
optionsBuilderxx' 5
.xx5 6
Optionsxx6 =
,xx= >
newxx? B

NoMediatorxxC M
(xxM N
)xxN O
)xxO P
;xxP Q
}yy 	
class{{ 

NoMediator{{ 
:{{ 
	IMediator{{ $
{|| 	
public}} 
Task}} 
Publish}} 
<}}  
TNotification}}  -
>}}- .
(}}. /
TNotification}}/ <
notification}}= I
,}}I J
CancellationToken}}K \
cancellationToken}}] n
=}}o p
default}}q x
(}}x y
CancellationToken	}}y ä
)
}}ä ã
)
}}ã å
where
}}ç í
TNotification
}}ì †
:
}}° ¢
INotification
}}£ ∞
{~~ 
return 
Task 
. 
CompletedTask )
;) *
}
ÄÄ 
public
ÇÇ 
Task
ÇÇ 
Publish
ÇÇ 
(
ÇÇ  
object
ÇÇ  &
notification
ÇÇ' 3
,
ÇÇ3 4
CancellationToken
ÇÇ5 F
cancellationToken
ÇÇG X
=
ÇÇY Z
default
ÇÇ[ b
)
ÇÇb c
{
ÉÉ 
return
ÑÑ 
Task
ÑÑ 
.
ÑÑ 
CompletedTask
ÑÑ )
;
ÑÑ) *
}
ÖÖ 
public
áá 
Task
áá 
<
áá 
	TResponse
áá !
>
áá! "
Send
áá# '
<
áá' (
	TResponse
áá( 1
>
áá1 2
(
áá2 3
IRequest
áá3 ;
<
áá; <
	TResponse
áá< E
>
ááE F
request
ááG N
,
ááN O
CancellationToken
ááP a
cancellationToken
ááb s
=
áát u
default
ááv }
(
áá} ~ 
CancellationTokenáá~ è
)ááè ê
)ááê ë
{
àà 
return
ââ 
Task
ââ 
.
ââ 

FromResult
ââ &
<
ââ& '
	TResponse
ââ' 0
>
ââ0 1
(
ââ1 2
default
ââ2 9
(
ââ9 :
	TResponse
ââ: C
)
ââC D
)
ââD E
;
ââE F
}
ää 
public
åå 
Task
åå 
<
åå 
object
åå 
>
åå 
Send
åå  $
(
åå$ %
object
åå% +
request
åå, 3
,
åå3 4
CancellationToken
åå5 F
cancellationToken
ååG X
=
ååY Z
default
åå[ b
)
ååb c
{
çç 
return
éé 
Task
éé 
.
éé 

FromResult
éé &
(
éé& '
default
éé' .
(
éé. /
object
éé/ 5
)
éé5 6
)
éé6 7
;
éé7 8
}
èè 
}
êê 	
}
ëë 
}íí ∑
äC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Infrastructure\Repositories\OrderRepository.cs
	namespace 	
Ordering
 
. 
Infrastructure !
.! "
Repositories" .
{ 
public		 

class		 
OrderRepository		  
:		! "
IOrderRepository		# 3
{

 
private 
readonly 
OrderingContext (
_context) 1
;1 2
public 
IUnitOfWork 

UnitOfWork %
{ 	
get 
{ 
return 
_context 
;  
} 
} 	
public 
OrderRepository 
( 
OrderingContext .
context/ 6
)6 7
{ 	
_context 
= 
context 
?? !
throw" '
new( +!
ArgumentNullException, A
(A B
nameofB H
(H I
contextI P
)P Q
)Q R
;R S
} 	
public 
Order 
Add 
( 
Order 
order $
)$ %
{ 	
return 
_context 
. 
Orders "
." #
Add# &
(& '
order' ,
), -
.- .
Entity. 4
;4 5
} 	
public 
async 
Task 
< 
Order 
>  
GetAsync! )
() *
int* -
orderId. 5
)5 6
{ 	
var   
order   
=   
await   
_context   &
.  & '
Orders  ' -
.  - .
FirstOrDefaultAsync  . A
(  A B
x  B C
=>  D F
x  G H
.  H I
Id  I K
==  L N
orderId  O V
)  V W
;  W X
if"" 
("" 
order"" 
!="" 
null"" 
)"" 
{## 
await$$ 
_context$$ 
.$$ 
Entry$$ $
($$$ %
order$$% *
)$$* +
.$$+ ,

Collection$$, 6
($$6 7
x$$7 8
=>$$9 ;
x$$< =
.$$= >

OrderItems$$> H
)$$H I
.$$I J
	LoadAsync$$J S
($$S T
)$$T U
;$$U V
await%% 
_context%% 
.%% 
Entry%% $
(%%$ %
order%%% *
)%%* +
.%%+ ,
	Reference%%, 5
(%%5 6
x%%6 7
=>%%8 :
x%%; <
.%%< =
OrderStatus%%= H
)%%H I
.%%I J
	LoadAsync%%J S
(%%S T
)%%T U
;%%U V
}&& 
return(( 
order(( 
;(( 
})) 	
public++ 
void++ 
Update++ 
(++ 
Order++  
order++! &
)++& '
{,, 	
_context-- 
.-- 
Entry-- 
(-- 
order--  
)--  !
.--! "
State--" '
=--( )
EntityState--* 5
.--5 6
Modified--6 >
;--> ?
}.. 	
}// 
}00 