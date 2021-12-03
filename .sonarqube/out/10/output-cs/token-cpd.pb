≥
ïC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Domain\AggregatesModel\OrderAggregate\IOrderRepository.cs
	namespace 	
Ordering
 
. 
Domain 
. 
AggregatesModel )
.) *
OrderAggregate* 8
{ 
public 

	interface 
IOrderRepository %
:& '
IRepository( 3
<3 4
Order4 9
>9 :
{ 
Order 
Add 
( 
Order 
order 
) 
; 
void		 
Update		 
(		 
Order		 
order		 
)		  
;		  !
Task

 
<

 
Order

 
>

 
GetAsync

 
(

 
int

  
orderId

! (
)

( )
;

) *
} 
} Â=
äC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Domain\AggregatesModel\OrderAggregate\Order.cs
	namespace 	
Ordering
 
. 
Domain 
. 
AggregatesModel )
.) *
OrderAggregate* 8
{ 
public		 

class		 
Order		 
:		 
Entity		 
,		  
IAggregateRoot		! /
{

 
public 
static 
Order 
NewDraft $
($ %
)% &
{ 	
var 
order 
= 
new 
Order !
(! "
)" #
;# $
order 
. 
_isDraft 
= 
true !
;! "
return 
order 
; 
} 	
public 
Guid 
BuyerId 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public 
string 
Observation !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 
OrderStatus 
OrderStatus &
{' (
get) ,
;, -
private. 5
set6 9
;9 :
}; <
private 
int 
_orderStatusId "
;" #
private 
readonly 
List 
< 
	OrderItem '
>' (
_orderItems) 4
;4 5
public 
IReadOnlyCollection "
<" #
	OrderItem# ,
>, -

OrderItems. 8
=>9 ;
_orderItems< G
.G H

AsReadOnlyH R
(R S
)S T
;T U
private 
bool 
_isDraft 
; 
	protected 
Order 
( 
) 
{ 
this  
.  !
_orderItems! ,
=- .
new/ 2
List3 7
<7 8
	OrderItem8 A
>A B
(B C
)C D
;D E
}F G
public 
Order 
( 
Guid 
buyerId !
,! "
string# )
observation* 5
)5 6
:7 8
this9 =
(= >
)> ?
{ 	
this   
.   
BuyerId   
=   
buyerId   "
!=  # %
Guid  & *
.  * +
Empty  + 0
?  1 2
buyerId  3 :
:  ; <
throw  = B
new  C F!
ArgumentNullException  G \
(  \ ]
nameof  ] c
(  c d
buyerId  d k
)  k l
)  l m
;  m n
this!! 
.!! 
Observation!! 
=!! 
observation!! *
;!!* +
this"" 
."" 
_orderStatusId"" 
=""  !
OrderStatus""" -
.""- .
Pending"". 5
.""5 6
Id""6 8
;""8 9&
AddOrderStartedDomainEvent$$ &
($$& '
)$$' (
;$$( )
}%% 	
public'' 
void'' 
AddOrderItem''  
(''  !
int''! $
	productId''% .
,''. /
string''0 6
productName''7 B
,''B C
decimal''D K
productPrice''L X
,''X Y
int''Z ]
amount''^ d
=''e f
$num''g h
)''h i
{(( 	
var)) 
existingOrderItem)) !
=))" #
this))$ (
.))( )
_orderItems))) 4
.))4 5
Where))5 :
()): ;
x)); <
=>))= ?
x))@ A
.))A B
	ProductId))B K
==))L N
	productId))O X
)))X Y
.))Y Z
SingleOrDefault))Z i
())i j
)))j k
;))k l
if++ 
(++ 
existingOrderItem++ !
!=++" $
null++% )
)++) *
{,, 
if-- 
(-- 
existingOrderItem-- %
.--% &
	GetAmount--& /
(--/ 0
)--0 1
>--2 3
existingOrderItem--4 E
.--E F
	GetAmount--F O
(--O P
)--P Q
---R S
amount--T Z
)--Z [
{.. 
existingOrderItem// %
.//% &
	AddAmount//& /
(/// 0
amount//0 6
)//6 7
;//7 80
$AddUpdatedOrderItemAmountDomainEvent00 8
(008 9
existingOrderItem009 J
)00J K
;00K L
}11 
else22 
{33 
_orderItems44 
.44  
Remove44  &
(44& '
existingOrderItem44' 8
)448 9
;449 :*
AddRemovedOrderItemDomainEvent55 2
(552 3
existingOrderItem553 D
)55D E
;55E F
}66 
}77 
else88 
{99 
var:: 
	orderItem:: 
=:: 
new::  #
	OrderItem::$ -
(::- .
	productId::. 7
,::7 8
productName::9 D
,::D E
productPrice::F R
,::R S
amount::T Z
)::Z [
;::[ \
this;; 
.;; 
_orderItems;;  
.;;  !
Add;;! $
(;;$ %
	orderItem;;% .
);;. /
;;;/ 0(
AddAddedOrderItemDomainEvent== ,
(==, -
	orderItem==- 6
)==6 7
;==7 8
}>> 
}?? 	
publicAA 
decimalAA 
GetTotalPriceAA $
(AA$ %
)AA% &
{BB 	
returnCC 
_orderItemsCC 
.CC 
SumCC "
(CC" #
xCC# $
=>CC% '
xCC( )
.CC) *
CalculatePriceCC* 8
(CC8 9
)CC9 :
)CC: ;
;CC; <
}DD 	
privateFF 
voidFF &
AddOrderStartedDomainEventFF /
(FF/ 0
)FF0 1
{GG 	
thisHH 
.HH 
AddDomainEventHH 
(HH  
newHH  ##
OrderStartedDomainEventHH$ ;
(HH; <
thisHH< @
)HH@ A
)HHA B
;HHB C
}II 	
privateKK 
voidKK (
AddAddedOrderItemDomainEventKK 1
(KK1 2
	OrderItemKK2 ;
	orderItemKK< E
)KKE F
{LL 	
thisMM 
.MM 
AddDomainEventMM 
(MM  
newMM  #%
AddedOrderItemDomainEventMM$ =
(MM= >
thisMM> B
.MMB C
IdMMC E
,MME F
	orderItemMMG P
)MMP Q
)MMQ R
;MMR S
}NN 	
privatePP 
voidPP 0
$AddUpdatedOrderItemAmountDomainEventPP 9
(PP9 :
	OrderItemPP: C
	orderItemPPD M
)PPM N
{QQ 	
thisRR 
.RR 
AddDomainEventRR 
(RR  
newRR  #0
$AddUpdatedOrderItemAmountDomainEventRR$ H
(RRH I
thisRRI M
.RRM N
IdRRN P
,RRP Q
	orderItemRRR [
)RR[ \
)RR\ ]
;RR] ^
}SS 	
privateUU 
voidUU *
AddRemovedOrderItemDomainEventUU 3
(UU3 4
	OrderItemUU4 =
	orderItemUU> G
)UUG H
{VV 	
thisWW 
.WW 
AddDomainEventWW 
(WW  
newWW  #'
RemovedOrderItemDomainEventWW$ ?
(WW? @
thisWW@ D
.WWD E
IdWWE G
,WWG H
	orderItemWWI R
)WWR S
)WWS T
;WWT U
}XX 	
}YY 
}ZZ ∂!
éC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Domain\AggregatesModel\OrderAggregate\OrderItem.cs
	namespace 	
Ordering
 
. 
Domain 
. 
AggregatesModel )
.) *
OrderAggregate* 8
{ 
public 

class 
	OrderItem 
: 
Entity #
{ 
private		 
string		 
_productName		 #
;		# $
private

 
decimal

 
_productPrice

 %
;

% &
private 
int 
_amount 
; 
public 
int 
	ProductId 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
	protected 
	OrderItem 
( 
) 
{ 
}  !
public 
	OrderItem 
( 
int 
	productId &
,& '
string( .
productName/ :
,: ;
decimal< C
productPriceD P
,P Q
intR U
amountV \
)\ ]
{ 	
this 
. 
	ProductId 
= 
	productId &
>' (
$num) *
?+ ,
	productId- 6
:7 8
throw9 >
new? B
ArgumentExceptionC T
(T U
nameofU [
([ \
	productId\ e
)e f
)f g
;g h
this 
. 
_productName 
= 
!  !
string! '
.' (
IsNullOrEmpty( 5
(5 6
productName6 A
)A B
?C D
productNameE P
:Q R
throwS X
newY \!
ArgumentNullException] r
(r s
nameofs y
(y z
productName	z Ö
)
Ö Ü
)
Ü á
;
á à
this 
. 
_productPrice 
=  
productPrice! -
>. /
$num0 1
?2 3
productPrice4 @
:A B
throwC H
newI L
ArgumentExceptionM ^
(^ _
nameof_ e
(e f
productPricef r
)r s
)s t
;t u
this 
. 
_amount 
= 
amount !
>" #
$num$ %
?& '
amount( .
:/ 0
throw1 6
new7 :
ArgumentException; L
(L M
nameofM S
(S T
amountT Z
)Z [
)[ \
;\ ]
} 	
public 
decimal 
CalculatePrice %
(% &
)& '
{ 	
return 
this 
. 
_amount 
*  !
_productPrice" /
;/ 0
} 	
public 
string 
GetProductName $
($ %
)% &
{ 	
return 
_productName 
;  
} 	
public   
decimal   
GetProductPrice   &
(  & '
)  ' (
{!! 	
return"" 
_productPrice""  
;""  !
}## 	
public%% 
int%% 
	GetAmount%% 
(%% 
)%% 
{&& 	
return'' 
_amount'' 
;'' 
}(( 	
public** 
void** 
	AddAmount** 
(** 
int** !
amount**" (
)**( )
{++ 	
if,, 
(,, 
amount,, 
==,, 
$num,, 
||,, 
this,, #
.,,# $
_amount,,$ +
<,,, -
amount,,. 4
),,4 5
throw,,6 ;
new,,< ?#
OrderingDomainException,,@ W
(,,W X
$str,,X h
),,h i
;,,i j
this-- 
.-- 
_amount-- 
+=-- 
amount-- "
;--" #
}.. 	
}// 
}00 √'
êC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Domain\AggregatesModel\OrderAggregate\OrderStatus.cs
	namespace 	
Ordering
 
. 
Domain 
. 
AggregatesModel )
.) *
OrderAggregate* 8
{ 
public		 

class		 
OrderStatus		 
:		 
Enumeration		 *
{

 
public 
static 
OrderStatus !
Pending" )
=* +
new, /
OrderStatus0 ;
(; <
$num< =
,= >
nameof? E
(E F
PendingF M
)M N
.N O
ToLowerInvariantO _
(_ `
)` a
)a b
;b c
public 
static 
OrderStatus !
	Purchased" +
=, -
new. 1
OrderStatus2 =
(= >
$num> ?
,? @
nameofA G
(G H
	PurchasedH Q
)Q R
.R S
ToLowerInvariantS c
(c d
)d e
)e f
;f g
public 
static 
OrderStatus !
Canceled" *
=+ ,
new- 0
OrderStatus1 <
(< =
$num= >
,> ?
nameof@ F
(F G
CanceledG O
)O P
.P Q
ToLowerInvariantQ a
(a b
)b c
)c d
;d e
public 
OrderStatus 
( 
int 
id !
,! "
string# )
name* .
). /
:0 1
base2 6
(6 7
id7 9
,9 :
name; ?
)? @
{A B
}C D
public 
static 
IEnumerable !
<! "
OrderStatus" -
>- .
List/ 3
(3 4
)4 5
=>6 8
new 
[ 
] 
{ 
Pending 
, 
	Purchased &
,& '
Canceled( 0
}1 2
;2 3
public 
static 
OrderStatus !
FromName" *
(* +
string+ 1
name2 6
)6 7
{ 	
var 
state 
= 
List 
( 
) 
. 
SingleOrDefault .
(. /
s/ 0
=>1 3
string4 :
.: ;
Equals; A
(A B
sB C
.C D
NameD H
,H I
nameJ N
,N O
StringComparisonP `
.` a$
CurrentCultureIgnoreCasea y
)y z
)z {
;{ |
if 
( 
state 
== 
null 
) 
{ 
throw 
new #
OrderingDomainException 1
(1 2
$"2 4
$str4 H
{H I
nameofI O
(O P
OrderStatusP [
)[ \
}\ ]
$str] _
{_ `
String` f
.f g
Joing k
(k l
$strl o
,o p
Listq u
(u v
)v w
.w x
Selectx ~
(~ 
s	 Ä
=>
Å É
s
Ñ Ö
.
Ö Ü
Name
Ü ä
)
ä ã
)
ã å
}
å ç
"
ç é
)
é è
;
è ê
} 
return 
state 
; 
} 	
public   
static   
OrderStatus   !
From  " &
(  & '
int  ' *
id  + -
)  - .
{!! 	
var"" 
state"" 
="" 
List"" 
("" 
)"" 
."" 
SingleOrDefault"" .
("". /
s""/ 0
=>""1 3
s""4 5
.""5 6
Id""6 8
==""9 ;
id""< >
)""> ?
;""? @
if$$ 
($$ 
state$$ 
==$$ 
null$$ 
)$$ 
{%% 
throw&& 
new&& #
OrderingDomainException&& 1
(&&1 2
$"&&2 4
$str&&4 H
{&&H I
nameof&&I O
(&&O P
OrderStatus&&P [
)&&[ \
}&&\ ]
$str&&] _
{&&_ `
String&&` f
.&&f g
Join&&g k
(&&k l
$str&&l o
,&&o p
List&&q u
(&&u v
)&&v w
.&&w x
Select&&x ~
(&&~ 
s	&& Ä
=>
&&Å É
s
&&Ñ Ö
.
&&Ö Ü
Name
&&Ü ä
)
&&ä ã
)
&&ã å
}
&&å ç
"
&&ç é
)
&&é è
;
&&è ê
}'' 
return)) 
state)) 
;)) 
}** 	
}++ 
},, Ü
ÜC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Domain\Events\AddedOrderItemDomainEvent.cs
	namespace 	
Ordering
 
. 
Domain 
. 
Events  
{ 
public 

class %
AddedOrderItemDomainEvent *
:+ ,
INotification- :
{ 
public %
AddedOrderItemDomainEvent (
(( )
int) ,
orderId- 4
,4 5
	OrderItem6 ?
item@ D
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
 
	OrderItem 
= 
item 
; 
} 	
public 
int 
OrderId 
{ 
get  
;  !
}" #
public 
	OrderItem 
	OrderItem "
{# $
get% (
;( )
}* +
} 
} ß
ëC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Domain\Events\AddUpdatedOrderItemAmountDomainEvent.cs
	namespace 	
Ordering
 
. 
Domain 
. 
Events  
{ 
public 

class 0
$AddUpdatedOrderItemAmountDomainEvent 5
:6 7
INotification8 E
{ 
public 0
$AddUpdatedOrderItemAmountDomainEvent 3
(3 4
int4 7
orderId8 ?
,? @
	OrderItemA J
itemK O
)O P
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
 
	OrderItem 
= 
item 
; 
} 	
public 
int 
OrderId 
{ 
get  
;  !
}" #
public 
	OrderItem 
	OrderItem "
{# $
get% (
;( )
}* +
} 
} ˝
ÑC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Domain\Events\OrderStartedDomainEvent.cs
	namespace 	
Ordering
 
. 
Domain 
. 
Events  
{ 
public 

class #
OrderStartedDomainEvent (
:) *
INotification+ 8
{ 
public #
OrderStartedDomainEvent &
(& '
Order' ,
order- 2
)2 3
{		 	
Order

 
=

 
order

 
;

 
} 	
public 
Order 
Order 
{ 
get  
;  !
}" #
} 
} å
àC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Domain\Events\RemovedOrderItemDomainEvent.cs
	namespace 	
Ordering
 
. 
Domain 
. 
Events  
{ 
public 

class '
RemovedOrderItemDomainEvent ,
:- .
INotification/ <
{ 
public '
RemovedOrderItemDomainEvent *
(* +
int+ .
orderId/ 6
,6 7
	OrderItem8 A
itemB F
)F G
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
 
	OrderItem 
= 
item 
; 
} 	
public 
int 
OrderId 
{ 
get  
;  !
}" #
public 
	OrderItem 
	OrderItem "
{# $
get% (
;( )
}* +
} 
} 
àC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Ordering\Ordering.Domain\Exceptions\OrderingDomainException.cs
	namespace 	
Ordering
 
. 
Domain 
. 

Exceptions $
{ 
public 

class #
OrderingDomainException (
:) *
	Exception+ 4
{ 
public #
OrderingDomainException &
(& '
)' (
{ 	
}
 
public

 #
OrderingDomainException

 &
(

& '
string

' -
message

. 5
)

5 6
: 
base 
( 
message 
) 
{ 	
}
 
public #
OrderingDomainException &
(& '
string' -
message. 5
,5 6
	Exception7 @
innerExceptionA O
)O P
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