±
†C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.EventBus\Abstractions\IDynamicIntegrationEventHandler.cs
	namespace 	
BuildingBlocks
 
. 
EventBus !
.! "
Abstractions" .
{ 
public 

	interface +
IDynamicIntegrationEventHandler 4
{ 
Task 
Handle 
( 
dynamic 
	eventData %
)% &
;& '
} 
}		 ˙	
äC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.EventBus\Abstractions\IEventBus.cs
	namespace 	
BuildingBlocks
 
. 
EventBus !
.! "
Abstractions" .
{ 
public 

	interface 
	IEventBus 
{ 
void 
Publish 
( 
IntegrationEvent %
@event& ,
), -
;- .
void		 
	Subscribe		 
<		 
T		 
,		 
TH		 
>		 
(		 
)		 
where

 
T

 
:

 
IntegrationEvent

 &
where 
TH 
: $
IIntegrationEventHandler /
</ 0
T0 1
>1 2
;2 3
void 
Unsubscribe 
< 
T 
, 
TH 
> 
(  
)  !
where 
TH 
: $
IIntegrationEventHandler /
</ 0
T0 1
>1 2
where 
T 
: 
IntegrationEvent &
;& '
} 
} ˙
ôC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.EventBus\Abstractions\IIntegrationEventHandler.cs
	namespace 	
BuildingBlocks
 
. 
EventBus !
.! "
Abstractions" .
{ 
public 

	interface $
IIntegrationEventHandler -
<- .
in. 0
TIntegrationEvent1 B
>B C
:D E$
IIntegrationEventHandlerF ^
where 
TIntegrationEvent 
:  !
IntegrationEvent" 2
{ 
Task		 
Handle		 
(		 
TIntegrationEvent		 %
@event		& ,
)		, -
;		- .
}

 
public 

	interface $
IIntegrationEventHandler -
{ 
} 
} Ã
ãC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.EventBus\Events\IntegrationEvent.cs
	namespace 	
BuildingBlocks
 
. 
EventBus !
.! "
Events" (
{ 
public 

record 
IntegrationEvent "
{ 
public 
IntegrationEvent 
(  
)  !
{		 	
Id

 
=

 
Guid

 
.

 
NewGuid

 
(

 
)

 
;

  
CreationDate 
= 
DateTime #
.# $
UtcNow$ *
;* +
} 	
[ 	
JsonConstructor	 
] 
public 
IntegrationEvent 
(  
Guid  $
id% '
,' (
DateTime) 1

createDate2 <
)< =
{ 	
Id 
= 
id 
; 
CreationDate 
= 

createDate %
;% &
} 	
[ 	
JsonInclude	 
] 
public 
Guid 
Id 
{ 
get 
; 
private %
init& *
;* +
}, -
[ 	
JsonInclude	 
] 
public 
DateTime 
CreationDate $
{% &
get' *
;* +
private, 3
init4 8
;8 9
}: ;
} 
} ù
îC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.EventBus\Extensions\GenericTypeExtensions.cs
	namespace 	
BuildingBlocks
 
. 
EventBus !
.! "

Extensions" ,
{ 
public 

static 
class !
GenericTypeExtensions -
{ 
public 
static 
string 
GetGenericTypeName /
(/ 0
this0 4
Type5 9
type: >
)> ?
{		 	
var

 
typeName

 
=

 
string

 !
.

! "
Empty

" '
;

' (
if 
( 
type 
. 
IsGenericType "
)" #
{ 
var 
genericTypes  
=! "
string# )
.) *
Join* .
(. /
$str/ 2
,2 3
type4 8
.8 9
GetGenericArguments9 L
(L M
)M N
.N O
SelectO U
(U V
tV W
=>X Z
t[ \
.\ ]
Name] a
)a b
.b c
ToArrayc j
(j k
)k l
)l m
;m n
typeName 
= 
$" 
{ 
type "
." #
Name# '
.' (
Remove( .
(. /
type/ 3
.3 4
Name4 8
.8 9
IndexOf9 @
(@ A
$charA D
)D E
)E F
}F G
$strG H
{H I
genericTypesI U
}U V
$strV W
"W X
;X Y
} 
else 
{ 
typeName 
= 
type 
.  
Name  $
;$ %
} 
return 
typeName 
; 
} 	
public 
static 
string 
GetGenericTypeName /
(/ 0
this0 4
object5 ;
@object< C
)C D
{ 	
return 
@object 
. 
GetType "
(" #
)# $
.$ %
GetGenericTypeName% 7
(7 8
)8 9
;9 :
} 	
} 
} ‹
ëC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.EventBus\IEventBusSubscriptionsManager.cs
	namespace 	
BuildingBlocks
 
. 
EventBus !
{ 
public		 

	interface		 )
IEventBusSubscriptionsManager		 2
{

 
bool 
IsEmpty 
{ 
get 
; 
} 
event 
EventHandler 
< 
string !
>! "
OnEventRemoved# 1
;1 2
void "
AddDynamicSubscription #
<# $
TH$ &
>& '
(' (
string( .
	eventName/ 8
)8 9
where 
TH 
: +
IDynamicIntegrationEventHandler 5
;5 6
void 
AddSubscription 
< 
T 
, 
TH  "
>" #
(# $
)$ %
where 
T 
: 
IntegrationEvent %
where 
TH 
: $
IIntegrationEventHandler .
<. /
T/ 0
>0 1
;1 2
void 
RemoveSubscription 
<  
T  !
,! "
TH# %
>% &
(& '
)' (
where 
TH 
: $
IIntegrationEventHandler 0
<0 1
T1 2
>2 3
where 
T 
: 
IntegrationEvent '
;' (
void %
RemoveDynamicSubscription &
<& '
TH' )
>) *
(* +
string+ 1
	eventName2 ;
); <
where 
TH 
: +
IDynamicIntegrationEventHandler 6
;6 7
bool $
HasSubscriptionsForEvent %
<% &
T& '
>' (
(( )
)) *
where+ 0
T1 2
:3 4
IntegrationEvent5 E
;E F
bool $
HasSubscriptionsForEvent %
(% &
string& ,
	eventName- 6
)6 7
;7 8
Type 
GetEventTypeByName 
(  
string  &
	eventName' 0
)0 1
;1 2
void 
Clear 
( 
) 
; 
IEnumerable 
< 
SubscriptionInfo $
>$ %
GetHandlersForEvent& 9
<9 :
T: ;
>; <
(< =
)= >
where? D
TE F
:G H
IntegrationEventI Y
;Y Z
IEnumerable 
< 
SubscriptionInfo $
>$ %
GetHandlersForEvent& 9
(9 :
string: @
	eventNameA J
)J K
;K L
string   
GetEventKey   
<   
T   
>   
(   
)   
;    
}!! 
}"" •r
òC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.EventBus\InMemoryEventBusSubscriptionsManager.cs
	namespace		 	
BuildingBlocks		
 
.		 
EventBus		 !
{

 
public 

partial 
class 0
$InMemoryEventBusSubscriptionsManager =
:> ?)
IEventBusSubscriptionsManager@ ]
{ 
private 
readonly 

Dictionary #
<# $
string$ *
,* +
List, 0
<0 1
SubscriptionInfo1 A
>A B
>B C
	_handlersD M
;M N
private 
readonly 
List 
< 
Type "
>" #
_eventTypes$ /
;/ 0
public 
event 
EventHandler !
<! "
string" (
>( )
OnEventRemoved* 8
;8 9
public 0
$InMemoryEventBusSubscriptionsManager 3
(3 4
)4 5
{ 	
	_handlers 
= 
new 

Dictionary &
<& '
string' -
,- .
List/ 3
<3 4
SubscriptionInfo4 D
>D E
>E F
(F G
)G H
;H I
_eventTypes 
= 
new 
List "
<" #
Type# '
>' (
(( )
)) *
;* +
} 	
public 
bool 
IsEmpty 
=> 
!  
	_handlers  )
.) *
Keys* .
.. /
Any/ 2
(2 3
)3 4
;4 5
public 
void 
Clear 
( 
) 
=> 
	_handlers (
.( )
Clear) .
(. /
)/ 0
;0 1
public 
void "
AddDynamicSubscription *
<* +
TH+ -
>- .
(. /
string/ 5
	eventName6 ?
)? @
where 
TH 
: +
IDynamicIntegrationEventHandler 6
{ 	
DoAddSubscription   
(   
typeof   $
(  $ %
TH  % '
)  ' (
,  ( )
	eventName  * 3
,  3 4
	isDynamic  5 >
:  > ?
true  @ D
)  D E
;  E F
}!! 	
public## 
void## 
AddSubscription## #
<### $
T##$ %
,##% &
TH##' )
>##) *
(##* +
)##+ ,
where$$ 
T$$ 
:$$ 
IntegrationEvent$$ &
where%% 
TH%% 
:%% $
IIntegrationEventHandler%% /
<%%/ 0
T%%0 1
>%%1 2
{&& 	
var'' 
	eventName'' 
='' 
GetEventKey'' '
<''' (
T''( )
>'') *
(''* +
)''+ ,
;'', -
DoAddSubscription)) 
()) 
typeof)) $
())$ %
TH))% '
)))' (
,))( )
	eventName))* 3
,))3 4
	isDynamic))5 >
:))> ?
false))@ E
)))E F
;))F G
if++ 
(++ 
!++ 
_eventTypes++ 
.++ 
Contains++ %
(++% &
typeof++& ,
(++, -
T++- .
)++. /
)++/ 0
)++0 1
{,, 
_eventTypes-- 
.-- 
Add-- 
(--  
typeof--  &
(--& '
T--' (
)--( )
)--) *
;--* +
}.. 
}// 	
private11 
void11 
DoAddSubscription11 &
(11& '
Type11' +
handlerType11, 7
,117 8
string119 ?
	eventName11@ I
,11I J
bool11K O
	isDynamic11P Y
)11Y Z
{22 	
if33 
(33 
!33 $
HasSubscriptionsForEvent33 )
(33) *
	eventName33* 3
)333 4
)334 5
{44 
	_handlers55 
.55 
Add55 
(55 
	eventName55 '
,55' (
new55) ,
List55- 1
<551 2
SubscriptionInfo552 B
>55B C
(55C D
)55D E
)55E F
;55F G
}66 
if88 
(88 
	_handlers88 
[88 
	eventName88 #
]88# $
.88$ %
Any88% (
(88( )
s88) *
=>88+ -
s88. /
.88/ 0
HandlerType880 ;
==88< >
handlerType88? J
)88J K
)88K L
{99 
throw:: 
new:: 
ArgumentException:: +
(::+ ,
$";; 
$str;; #
{;;# $
handlerType;;$ /
.;;/ 0
Name;;0 4
};;4 5
$str;;5 N
{;;N O
	eventName;;O X
};;X Y
$str;;Y Z
";;Z [
,;;[ \
nameof;;] c
(;;c d
handlerType;;d o
);;o p
);;p q
;;;q r
}<< 
if>> 
(>> 
	isDynamic>> 
)>> 
{?? 
	_handlers@@ 
[@@ 
	eventName@@ #
]@@# $
.@@$ %
Add@@% (
(@@( )
SubscriptionInfo@@) 9
.@@9 :
Dynamic@@: A
(@@A B
handlerType@@B M
)@@M N
)@@N O
;@@O P
}AA 
elseBB 
{CC 
	_handlersDD 
[DD 
	eventNameDD #
]DD# $
.DD$ %
AddDD% (
(DD( )
SubscriptionInfoDD) 9
.DD9 :
TypedDD: ?
(DD? @
handlerTypeDD@ K
)DDK L
)DDL M
;DDM N
}EE 
}FF 	
publicII 
voidII %
RemoveDynamicSubscriptionII -
<II- .
THII. 0
>II0 1
(II1 2
stringII2 8
	eventNameII9 B
)IIB C
whereJJ 
THJJ 
:JJ +
IDynamicIntegrationEventHandlerJJ 6
{KK 	
varLL 
handlerToRemoveLL 
=LL  !+
FindDynamicSubscriptionToRemoveLL" A
<LLA B
THLLB D
>LLD E
(LLE F
	eventNameLLF O
)LLO P
;LLP Q
DoRemoveHandlerMM 
(MM 
	eventNameMM %
,MM% &
handlerToRemoveMM' 6
)MM6 7
;MM7 8
}NN 	
publicQQ 
voidQQ 
RemoveSubscriptionQQ &
<QQ& '
TQQ' (
,QQ( )
THQQ* ,
>QQ, -
(QQ- .
)QQ. /
whereRR 
THRR 
:RR $
IIntegrationEventHandlerRR /
<RR/ 0
TRR0 1
>RR1 2
whereSS 
TSS 
:SS 
IntegrationEventSS &
{TT 	
varUU 
handlerToRemoveUU 
=UU  !$
FindSubscriptionToRemoveUU" :
<UU: ;
TUU; <
,UU< =
THUU> @
>UU@ A
(UUA B
)UUB C
;UUC D
varVV 
	eventNameVV 
=VV 
GetEventKeyVV '
<VV' (
TVV( )
>VV) *
(VV* +
)VV+ ,
;VV, -
DoRemoveHandlerWW 
(WW 
	eventNameWW %
,WW% &
handlerToRemoveWW' 6
)WW6 7
;WW7 8
}XX 	
private[[ 
void[[ 
DoRemoveHandler[[ $
([[$ %
string[[% +
	eventName[[, 5
,[[5 6
SubscriptionInfo[[7 G
subsToRemove[[H T
)[[T U
{\\ 	
if]] 
(]] 
subsToRemove]] 
!=]] 
null]]  $
)]]$ %
{^^ 
	_handlers__ 
[__ 
	eventName__ #
]__# $
.__$ %
Remove__% +
(__+ ,
subsToRemove__, 8
)__8 9
;__9 :
if`` 
(`` 
!`` 
	_handlers`` 
[`` 
	eventName`` (
]``( )
.``) *
Any``* -
(``- .
)``. /
)``/ 0
{aa 
	_handlersbb 
.bb 
Removebb $
(bb$ %
	eventNamebb% .
)bb. /
;bb/ 0
varcc 
	eventTypecc !
=cc" #
_eventTypescc$ /
.cc/ 0
SingleOrDefaultcc0 ?
(cc? @
ecc@ A
=>ccB D
eccE F
.ccF G
NameccG K
==ccL N
	eventNameccO X
)ccX Y
;ccY Z
ifdd 
(dd 
	eventTypedd !
!=dd" $
nulldd% )
)dd) *
{ee 
_eventTypesff #
.ff# $
Removeff$ *
(ff* +
	eventTypeff+ 4
)ff4 5
;ff5 6
}gg 
RaiseOnEventRemovedhh '
(hh' (
	eventNamehh( 1
)hh1 2
;hh2 3
}ii 
}kk 
}ll 	
publicnn 
IEnumerablenn 
<nn 
SubscriptionInfonn +
>nn+ ,
GetHandlersForEventnn- @
<nn@ A
TnnA B
>nnB C
(nnC D
)nnD E
wherennF K
TnnL M
:nnN O
IntegrationEventnnP `
{oo 	
varpp 
keypp 
=pp 
GetEventKeypp !
<pp! "
Tpp" #
>pp# $
(pp$ %
)pp% &
;pp& '
returnqq 
GetHandlersForEventqq &
(qq& '
keyqq' *
)qq* +
;qq+ ,
}rr 	
publicss 
IEnumerabless 
<ss 
SubscriptionInfoss +
>ss+ ,
GetHandlersForEventss- @
(ss@ A
stringssA G
	eventNamessH Q
)ssQ R
=>ssS U
	_handlersssV _
[ss_ `
	eventNamess` i
]ssi j
;ssj k
privateuu 
voiduu 
RaiseOnEventRemoveduu (
(uu( )
stringuu) /
	eventNameuu0 9
)uu9 :
{vv 	
varww 
handlerww 
=ww 
OnEventRemovedww (
;ww( )
handlerxx 
?xx 
.xx 
Invokexx 
(xx 
thisxx  
,xx  !
	eventNamexx" +
)xx+ ,
;xx, -
}yy 	
private|| 
SubscriptionInfo||  +
FindDynamicSubscriptionToRemove||! @
<||@ A
TH||A C
>||C D
(||D E
string||E K
	eventName||L U
)||U V
where}} 
TH}} 
:}} +
IDynamicIntegrationEventHandler}} 6
{~~ 	
return &
DoFindSubscriptionToRemove -
(- .
	eventName. 7
,7 8
typeof9 ?
(? @
TH@ B
)B C
)C D
;D E
}
ÄÄ 	
private
ÉÉ 
SubscriptionInfo
ÉÉ  &
FindSubscriptionToRemove
ÉÉ! 9
<
ÉÉ9 :
T
ÉÉ: ;
,
ÉÉ; <
TH
ÉÉ= ?
>
ÉÉ? @
(
ÉÉ@ A
)
ÉÉA B
where
ÑÑ 
T
ÑÑ 
:
ÑÑ 
IntegrationEvent
ÑÑ '
where
ÖÖ 
TH
ÖÖ 
:
ÖÖ &
IIntegrationEventHandler
ÖÖ 0
<
ÖÖ0 1
T
ÖÖ1 2
>
ÖÖ2 3
{
ÜÜ 	
var
áá 
	eventName
áá 
=
áá 
GetEventKey
áá '
<
áá' (
T
áá( )
>
áá) *
(
áá* +
)
áá+ ,
;
áá, -
return
àà (
DoFindSubscriptionToRemove
àà -
(
àà- .
	eventName
àà. 7
,
àà7 8
typeof
àà9 ?
(
àà? @
TH
àà@ B
)
ààB C
)
ààC D
;
ààD E
}
ââ 	
private
ãã 
SubscriptionInfo
ãã  (
DoFindSubscriptionToRemove
ãã! ;
(
ãã; <
string
ãã< B
	eventName
ããC L
,
ããL M
Type
ããN R
handlerType
ããS ^
)
ãã^ _
{
åå 	
if
çç 
(
çç 
!
çç &
HasSubscriptionsForEvent
çç )
(
çç) *
	eventName
çç* 3
)
çç3 4
)
çç4 5
{
éé 
return
èè 
null
èè 
;
èè 
}
êê 
return
íí 
	_handlers
íí 
[
íí 
	eventName
íí &
]
íí& '
.
íí' (
SingleOrDefault
íí( 7
(
íí7 8
s
íí8 9
=>
íí: <
s
íí= >
.
íí> ?
HandlerType
íí? J
==
ííK M
handlerType
ííN Y
)
ííY Z
;
ííZ [
}
îî 	
public
ññ 
bool
ññ &
HasSubscriptionsForEvent
ññ ,
<
ññ, -
T
ññ- .
>
ññ. /
(
ññ/ 0
)
ññ0 1
where
ññ2 7
T
ññ8 9
:
ññ: ;
IntegrationEvent
ññ< L
{
óó 	
var
òò 
key
òò 
=
òò 
GetEventKey
òò !
<
òò! "
T
òò" #
>
òò# $
(
òò$ %
)
òò% &
;
òò& '
return
ôô &
HasSubscriptionsForEvent
ôô +
(
ôô+ ,
key
ôô, /
)
ôô/ 0
;
ôô0 1
}
öö 	
public
õõ 
bool
õõ &
HasSubscriptionsForEvent
õõ ,
(
õõ, -
string
õõ- 3
	eventName
õõ4 =
)
õõ= >
=>
õõ? A
	_handlers
õõB K
.
õõK L
ContainsKey
õõL W
(
õõW X
	eventName
õõX a
)
õõa b
;
õõb c
public
ùù 
Type
ùù  
GetEventTypeByName
ùù &
(
ùù& '
string
ùù' -
	eventName
ùù. 7
)
ùù7 8
=>
ùù9 ;
_eventTypes
ùù< G
.
ùùG H
SingleOrDefault
ùùH W
(
ùùW X
t
ùùX Y
=>
ùùZ \
t
ùù] ^
.
ùù^ _
Name
ùù_ c
==
ùùd f
	eventName
ùùg p
)
ùùp q
;
ùùq r
public
üü 
string
üü 
GetEventKey
üü !
<
üü! "
T
üü" #
>
üü# $
(
üü$ %
)
üü% &
{
†† 	
return
°° 
typeof
°° 
(
°° 
T
°° 
)
°° 
.
°° 
Name
°° !
;
°°! "
}
¢¢ 	
}
££ 
}§§ ›
ÑC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.EventBus\SubscriptionInfo.cs
	namespace 	
BuildingBlocks
 
. 
EventBus !
{ 
public 

partial 
class 0
$InMemoryEventBusSubscriptionsManager =
:> ?)
IEventBusSubscriptionsManager@ ]
{ 
public 
class 
SubscriptionInfo %
{ 	
public		 
bool		 
	IsDynamic		 !
{		" #
get		$ '
;		' (
}		) *
public

 
Type

 
HandlerType

 #
{

$ %
get

& )
;

) *
}

+ ,
private 
SubscriptionInfo $
($ %
bool% )
	isDynamic* 3
,3 4
Type5 9
handlerType: E
)E F
{ 
	IsDynamic 
= 
	isDynamic %
;% &
HandlerType 
= 
handlerType )
;) *
} 
public 
static 
SubscriptionInfo *
Dynamic+ 2
(2 3
Type3 7
handlerType8 C
)C D
{ 
return 
new 
SubscriptionInfo +
(+ ,
true, 0
,0 1
handlerType2 =
)= >
;> ?
} 
public 
static 
SubscriptionInfo *
Typed+ 0
(0 1
Type1 5
handlerType6 A
)A B
{ 
return 
new 
SubscriptionInfo +
(+ ,
false, 1
,1 2
handlerType3 >
)> ?
;? @
} 
} 	
} 
} 