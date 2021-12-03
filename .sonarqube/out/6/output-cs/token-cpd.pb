‹A
üC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.EventBusRabbitMQ\DefaultRabbitMQPersistentConnection.cs
	namespace 	
BuildingBlocks
 
. 
EventBusRabbitMQ )
{ 
public 

class /
#DefaultRabbitMQPersistentConnection 4
: )
IRabbitMQPersistentConnection	 &
{ 
private 
readonly 
IConnectionFactory +
_connectionFactory, >
;> ?
private 
readonly 
ILogger  
<  !/
#DefaultRabbitMQPersistentConnection! D
>D E
_loggerF M
;M N
private 
readonly 
int 
_retryCount (
;( )
IConnection 
_connection 
;  
bool 
	_disposed 
; 
object 
	sync_root 
= 
new 
object %
(% &
)& '
;' (
public /
#DefaultRabbitMQPersistentConnection 2
(2 3
IConnectionFactory3 E
connectionFactoryF W
,W X
ILoggerY `
<` a0
#DefaultRabbitMQPersistentConnection	a Ñ
>
Ñ Ö
logger
Ü å
,
å ç
int
é ë

retryCount
í ú
=
ù û
$num
ü †
)
† °
{ 	
_connectionFactory 
=  
connectionFactory! 2
??3 5
throw6 ;
new< ?!
ArgumentNullException@ U
(U V
nameofV \
(\ ]
connectionFactory] n
)n o
)o p
;p q
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
;O P
_retryCount 
= 

retryCount $
;$ %
} 	
public 
bool 
IsConnected 
{   	
get!! 
{"" 
return## 
_connection## "
!=### %
null##& *
&&##+ -
_connection##. 9
.##9 :
IsOpen##: @
&&##A C
!##D E
	_disposed##E N
;##N O
}$$ 
}%% 	
public'' 
IModel'' 
CreateModel'' !
(''! "
)''" #
{(( 	
if)) 
()) 
!)) 
IsConnected)) 
))) 
{** 
throw++ 
new++ %
InvalidOperationException++ 3
(++3 4
$str++4 r
)++r s
;++s t
},, 
return.. 
_connection.. 
... 
CreateModel.. *
(..* +
)..+ ,
;.., -
}// 	
public11 
void11 
Dispose11 
(11 
)11 
{22 	
if33 
(33 
	_disposed33 
)33 
return33 !
;33! "
	_disposed55 
=55 
true55 
;55 
try77 
{88 
_connection99 
.99 
Dispose99 #
(99# $
)99$ %
;99% &
}:: 
catch;; 
(;; 
IOException;; 
ex;; !
);;! "
{<< 
_logger== 
.== 
LogCritical== #
(==# $
ex==$ &
.==& '
ToString==' /
(==/ 0
)==0 1
)==1 2
;==2 3
}>> 
}?? 	
publicAA 
boolAA 

TryConnectAA 
(AA 
)AA  
{BB 	
_loggerCC 
.CC 
LogInformationCC "
(CC" #
$strCC# I
)CCI J
;CCJ K
lockEE 
(EE 
	sync_rootEE 
)EE 
{FF 
varGG 
policyGG 
=GG 
RetryPolicyGG (
.GG( )
HandleGG) /
<GG/ 0
SocketExceptionGG0 ?
>GG? @
(GG@ A
)GGA B
.HH 
OrHH 
<HH &
BrokerUnreachableExceptionHH 2
>HH2 3
(HH3 4
)HH4 5
.II 
WaitAndRetryII !
(II! "
_retryCountII" -
,II- .
retryAttemptII/ ;
=>II< >
TimeSpanII? G
.IIG H
FromSecondsIIH S
(IIS T
MathIIT X
.IIX Y
PowIIY \
(II\ ]
$numII] ^
,II^ _
retryAttemptII` l
)IIl m
)IIm n
,IIn o
(IIp q
exIIq s
,IIs t
timeIIu y
)IIy z
=>II{ }
{JJ 
_loggerKK 
.KK  

LogWarningKK  *
(KK* +
exKK+ -
,KK- .
$strKK/ x
,KKx y
$"KKz |
{KK| }
time	KK} Å
.
KKÅ Ç
TotalSeconds
KKÇ é
:
KKé è
$str
KKè ë
}
KKë í
"
KKí ì
,
KKì î
ex
KKï ó
.
KKó ò
Message
KKò ü
)
KKü †
;
KK† °
}LL 
)MM 
;MM 
policyOO 
.OO 
ExecuteOO 
(OO 
(OO  
)OO  !
=>OO" $
{PP 
_connectionQQ 
=QQ  !
_connectionFactoryQQ" 4
.RR 
CreateConnectionRR +
(RR+ ,
)RR, -
;RR- .
}SS 
)SS 
;SS 
ifUU 
(UU 
IsConnectedUU 
)UU  
{VV 
_connectionWW 
.WW  
ConnectionShutdownWW  2
+=WW3 5 
OnConnectionShutdownWW6 J
;WWJ K
_connectionXX 
.XX  
CallbackExceptionXX  1
+=XX2 4
OnCallbackExceptionXX5 H
;XXH I
_connectionYY 
.YY  
ConnectionBlockedYY  1
+=YY2 4
OnConnectionBlockedYY5 H
;YYH I
_logger[[ 
.[[ 
LogInformation[[ *
([[* +
$str	[[+ ë
,
[[ë í
_connection
[[ì û
.
[[û ü
Endpoint
[[ü ß
.
[[ß ®
HostName
[[® ∞
)
[[∞ ±
;
[[± ≤
return]] 
true]] 
;]]  
}^^ 
else__ 
{`` 
_loggeraa 
.aa 
LogCriticalaa '
(aa' (
$straa( k
)aak l
;aal m
returncc 
falsecc  
;cc  !
}dd 
}ee 
}ff 	
privatehh 
voidhh 
OnConnectionBlockedhh (
(hh( )
objecthh) /
senderhh0 6
,hh6 7&
ConnectionBlockedEventArgshh8 R
ehhS T
)hhT U
{ii 	
ifjj 
(jj 
	_disposedjj 
)jj 
returnjj !
;jj! "
_loggerll 
.ll 

LogWarningll 
(ll 
$strll [
)ll[ \
;ll\ ]

TryConnectnn 
(nn 
)nn 
;nn 
}oo 	
voidqq 
OnCallbackExceptionqq  
(qq  !
objectqq! '
senderqq( .
,qq. /&
CallbackExceptionEventArgsqq0 J
eqqK L
)qqL M
{rr 	
ifss 
(ss 
	_disposedss 
)ss 
returnss !
;ss! "
_loggeruu 
.uu 

LogWarninguu 
(uu 
$struu _
)uu_ `
;uu` a

TryConnectww 
(ww 
)ww 
;ww 
}xx 	
voidzz  
OnConnectionShutdownzz !
(zz! "
objectzz" (
senderzz) /
,zz/ 0
ShutdownEventArgszz1 B
reasonzzC I
)zzI J
{{{ 	
if|| 
(|| 
	_disposed|| 
)|| 
return|| !
;||! "
_logger~~ 
.~~ 

LogWarning~~ 
(~~ 
$str~~ ^
)~~^ _
;~~_ `

TryConnect
ÄÄ 
(
ÄÄ 
)
ÄÄ 
;
ÄÄ 
}
ÅÅ 	
}
ÇÇ 
}ÉÉ ±…
åC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.EventBusRabbitMQ\EventBusRabbitMQ.cs
	namespace 	
BuildingBlocks
 
. 
EventBusRabbitMQ )
{ 
public 

class 
EventBusRabbitMQ !
:" #
	IEventBus$ -
,- .
IDisposable/ :
{ 
const 
string 
BROKER_NAME  
=! "
$str# 4
;4 5
const 
string 
AUTOFAC_SCOPE_NAME '
=( )
$str* ;
;; <
private 
readonly )
IRabbitMQPersistentConnection 6!
_persistentConnection7 L
;L M
private 
readonly 
ILogger  
<  !
EventBusRabbitMQ! 1
>1 2
_logger3 :
;: ;
private 
readonly )
IEventBusSubscriptionsManager 6
_subsManager7 C
;C D
private 
readonly 
ILifetimeScope '
_autofac( 0
;0 1
private 
readonly 
int 
_retryCount (
;( )
private 
IModel 
_consumerChannel '
;' (
private   
string   

_queueName   !
;  ! "
public"" 
EventBusRabbitMQ"" 
(""  )
IRabbitMQPersistentConnection""  = 
persistentConnection""> R
,""R S
ILogger""T [
<""[ \
EventBusRabbitMQ""\ l
>""l m
logger""n t
,""t u
ILifetimeScope## 
autofac## "
,##" #)
IEventBusSubscriptionsManager##$ A
subsManager##B M
,##M N
string##O U
	queueName##V _
=##` a
null##b f
,##f g
int##h k

retryCount##l v
=##w x
$num##y z
)##z {
{$$ 	!
_persistentConnection%% !
=%%" # 
persistentConnection%%$ 8
??%%9 ;
throw%%< A
new%%B E!
ArgumentNullException%%F [
(%%[ \
nameof%%\ b
(%%b c 
persistentConnection%%c w
)%%w x
)%%x y
;%%y z
_logger&& 
=&& 
logger&& 
??&& 
throw&&  %
new&&& )!
ArgumentNullException&&* ?
(&&? @
nameof&&@ F
(&&F G
logger&&G M
)&&M N
)&&N O
;&&O P
_subsManager'' 
='' 
subsManager'' &
??''' )
new''* -0
$InMemoryEventBusSubscriptionsManager''. R
(''R S
)''S T
;''T U

_queueName(( 
=(( 
	queueName(( "
;((" #
_consumerChannel)) 
=)) !
CreateConsumerChannel)) 4
())4 5
)))5 6
;))6 7
_autofac** 
=** 
autofac** 
;** 
_retryCount++ 
=++ 

retryCount++ $
;++$ %
_subsManager,, 
.,, 
OnEventRemoved,, '
+=,,( *&
SubsManager_OnEventRemoved,,+ E
;,,E F
}-- 	
private// 
void// &
SubsManager_OnEventRemoved// /
(/// 0
object//0 6
sender//7 =
,//= >
string//? E
	eventName//F O
)//O P
{00 	
if11 
(11 
!11 !
_persistentConnection11 &
.11& '
IsConnected11' 2
)112 3
{22 !
_persistentConnection33 %
.33% &

TryConnect33& 0
(330 1
)331 2
;332 3
}44 
using66 
(66 
var66 
channel66 
=66  !
_persistentConnection66! 6
.666 7
CreateModel667 B
(66B C
)66C D
)66D E
{77 
channel88 
.88 
QueueUnbind88 #
(88# $
queue88$ )
:88) *

_queueName88+ 5
,885 6
exchange99 
:99 
BROKER_NAME99 )
,99) *

routingKey:: 
::: 
	eventName::  )
)::) *
;::* +
if<< 
(<< 
_subsManager<<  
.<<  !
IsEmpty<<! (
)<<( )
{== 

_queueName>> 
=>>  
string>>! '
.>>' (
Empty>>( -
;>>- .
_consumerChannel?? $
.??$ %
Close??% *
(??* +
)??+ ,
;??, -
}@@ 
}AA 
}BB 	
publicDD 
voidDD 
PublishDD 
(DD 
IntegrationEventDD ,
@eventDD- 3
)DD3 4
{EE 	
ifFF 
(FF 
!FF !
_persistentConnectionFF &
.FF& '
IsConnectedFF' 2
)FF2 3
{GG !
_persistentConnectionHH %
.HH% &

TryConnectHH& 0
(HH0 1
)HH1 2
;HH2 3
}II 
varKK 
policyKK 
=KK 
RetryPolicyKK $
.KK$ %
HandleKK% +
<KK+ ,&
BrokerUnreachableExceptionKK, F
>KKF G
(KKG H
)KKH I
.LL 
OrLL 
<LL 
SocketExceptionLL #
>LL# $
(LL$ %
)LL% &
.MM 
WaitAndRetryMM 
(MM 
_retryCountMM )
,MM) *
retryAttemptMM+ 7
=>MM8 :
TimeSpanMM; C
.MMC D
FromSecondsMMD O
(MMO P
MathMMP T
.MMT U
PowMMU X
(MMX Y
$numMMY Z
,MMZ [
retryAttemptMM\ h
)MMh i
)MMi j
,MMj k
(MMl m
exMMm o
,MMo p
timeMMq u
)MMu v
=>MMw y
{NN 
_loggerOO 
.OO 

LogWarningOO &
(OO& '
exOO' )
,OO) *
$strOO+ u
,OOu v
@eventOOw }
.OO} ~
Id	OO~ Ä
,
OOÄ Å
$"
OOÇ Ñ
{
OOÑ Ö
time
OOÖ â
.
OOâ ä
TotalSeconds
OOä ñ
:
OOñ ó
$str
OOó ô
}
OOô ö
"
OOö õ
,
OOõ ú
ex
OOù ü
.
OOü †
Message
OO† ß
)
OOß ®
;
OO® ©
}PP 
)PP 
;PP 
varRR 
	eventNameRR 
=RR 
@eventRR "
.RR" #
GetTypeRR# *
(RR* +
)RR+ ,
.RR, -
NameRR- 1
;RR1 2
_loggerTT 
.TT 
LogTraceTT 
(TT 
$strTT b
,TTb c
@eventTTd j
.TTj k
IdTTk m
,TTm n
	eventNameTTo x
)TTx y
;TTy z
usingVV 
(VV 
varVV 
channelVV 
=VV  !
_persistentConnectionVV! 6
.VV6 7
CreateModelVV7 B
(VVB C
)VVC D
)VVD E
{WW 
_loggerXX 
.XX 
LogTraceXX  
(XX  !
$strXX! Z
,XXZ [
@eventXX\ b
.XXb c
IdXXc e
)XXe f
;XXf g
channelZZ 
.ZZ 
ExchangeDeclareZZ '
(ZZ' (
exchangeZZ( 0
:ZZ0 1
BROKER_NAMEZZ2 =
,ZZ= >
typeZZ? C
:ZZC D
$strZZE M
)ZZM N
;ZZN O
var\\ 
body\\ 
=\\ 
JsonSerializer\\ )
.\\) * 
SerializeToUtf8Bytes\\* >
(\\> ?
@event\\? E
,\\E F
@event\\G M
.\\M N
GetType\\N U
(\\U V
)\\V W
,\\W X
new\\Y \!
JsonSerializerOptions\\] r
{]] 
WriteIndented^^ !
=^^" #
true^^$ (
}__ 
)__ 
;__ 
policyaa 
.aa 
Executeaa 
(aa 
(aa  
)aa  !
=>aa" $
{bb 
varcc 

propertiescc "
=cc# $
channelcc% ,
.cc, -!
CreateBasicPropertiescc- B
(ccB C
)ccC D
;ccD E

propertiesdd 
.dd 
DeliveryModedd +
=dd, -
$numdd. /
;dd/ 0
_loggerff 
.ff 
LogTraceff $
(ff$ %
$strff% N
,ffN O
@eventffP V
.ffV W
IdffW Y
)ffY Z
;ffZ [
channelhh 
.hh 
BasicPublishhh (
(hh( )
exchangeii  
:ii  !
BROKER_NAMEii" -
,ii- .

routingKeyjj "
:jj" #
	eventNamejj$ -
,jj- .
	mandatorykk !
:kk! "
truekk# '
,kk' (
basicPropertiesll '
:ll' (

propertiesll) 3
,ll3 4
bodymm 
:mm 
bodymm "
)mm" #
;mm# $
}nn 
)nn 
;nn 
}oo 
}pp 	
publicrr 
voidrr 
SubscribeDynamicrr $
<rr$ %
THrr% '
>rr' (
(rr( )
stringrr) /
	eventNamerr0 9
)rr9 :
wheress 
THss 
:ss +
IDynamicIntegrationEventHandlerss 6
{tt 	
_loggeruu 
.uu 
LogInformationuu "
(uu" #
$struu# a
,uua b
	eventNameuuc l
,uul m
typeofuun t
(uut u
THuuu w
)uuw x
.uux y
GetGenericTypeName	uuy ã
(
uuã å
)
uuå ç
)
uuç é
;
uué è"
DoInternalSubscriptionww "
(ww" #
	eventNameww# ,
)ww, -
;ww- .
_subsManagerxx 
.xx "
AddDynamicSubscriptionxx /
<xx/ 0
THxx0 2
>xx2 3
(xx3 4
	eventNamexx4 =
)xx= >
;xx> ?
StartBasicConsumeyy 
(yy 
)yy 
;yy  
}zz 	
public|| 
void|| 
	Subscribe|| 
<|| 
T|| 
,||  
TH||! #
>||# $
(||$ %
)||% &
where}} 
T}} 
:}} 
IntegrationEvent}} &
where~~ 
TH~~ 
:~~ $
IIntegrationEventHandler~~ /
<~~/ 0
T~~0 1
>~~1 2
{ 	
var
ÄÄ 
	eventName
ÄÄ 
=
ÄÄ 
_subsManager
ÄÄ (
.
ÄÄ( )
GetEventKey
ÄÄ) 4
<
ÄÄ4 5
T
ÄÄ5 6
>
ÄÄ6 7
(
ÄÄ7 8
)
ÄÄ8 9
;
ÄÄ9 :$
DoInternalSubscription
ÅÅ "
(
ÅÅ" #
	eventName
ÅÅ# ,
)
ÅÅ, -
;
ÅÅ- .
_logger
ÉÉ 
.
ÉÉ 
LogInformation
ÉÉ "
(
ÉÉ" #
$str
ÉÉ# Y
,
ÉÉY Z
	eventName
ÉÉ[ d
,
ÉÉd e
typeof
ÉÉf l
(
ÉÉl m
TH
ÉÉm o
)
ÉÉo p
.
ÉÉp q!
GetGenericTypeNameÉÉq É
(ÉÉÉ Ñ
)ÉÉÑ Ö
)ÉÉÖ Ü
;ÉÉÜ á
_subsManager
ÖÖ 
.
ÖÖ 
AddSubscription
ÖÖ (
<
ÖÖ( )
T
ÖÖ) *
,
ÖÖ* +
TH
ÖÖ, .
>
ÖÖ. /
(
ÖÖ/ 0
)
ÖÖ0 1
;
ÖÖ1 2
StartBasicConsume
ÜÜ 
(
ÜÜ 
)
ÜÜ 
;
ÜÜ  
}
áá 	
private
ââ 
void
ââ $
DoInternalSubscription
ââ +
(
ââ+ ,
string
ââ, 2
	eventName
ââ3 <
)
ââ< =
{
ää 	
var
ãã 
containsKey
ãã 
=
ãã 
_subsManager
ãã *
.
ãã* +&
HasSubscriptionsForEvent
ãã+ C
(
ããC D
	eventName
ããD M
)
ããM N
;
ããN O
if
åå 
(
åå 
!
åå 
containsKey
åå 
)
åå 
{
çç 
if
éé 
(
éé 
!
éé #
_persistentConnection
éé *
.
éé* +
IsConnected
éé+ 6
)
éé6 7
{
èè #
_persistentConnection
êê )
.
êê) *

TryConnect
êê* 4
(
êê4 5
)
êê5 6
;
êê6 7
}
ëë 
_consumerChannel
ìì  
.
ìì  !
	QueueBind
ìì! *
(
ìì* +
queue
ìì+ 0
:
ìì0 1

_queueName
ìì2 <
,
ìì< =
exchange
îî$ ,
:
îî, -
BROKER_NAME
îî. 9
,
îî9 :

routingKey
ïï$ .
:
ïï. /
	eventName
ïï0 9
)
ïï9 :
;
ïï: ;
}
ññ 
}
óó 	
public
ôô 
void
ôô 
Unsubscribe
ôô 
<
ôô  
T
ôô  !
,
ôô! "
TH
ôô# %
>
ôô% &
(
ôô& '
)
ôô' (
where
öö 
T
öö 
:
öö 
IntegrationEvent
öö &
where
õõ 
TH
õõ 
:
õõ &
IIntegrationEventHandler
õõ /
<
õõ/ 0
T
õõ0 1
>
õõ1 2
{
úú 	
var
ùù 
	eventName
ùù 
=
ùù 
_subsManager
ùù (
.
ùù( )
GetEventKey
ùù) 4
<
ùù4 5
T
ùù5 6
>
ùù6 7
(
ùù7 8
)
ùù8 9
;
ùù9 :
_logger
üü 
.
üü 
LogInformation
üü "
(
üü" #
$str
üü# I
,
üüI J
	eventName
üüK T
)
üüT U
;
üüU V
_subsManager
°° 
.
°°  
RemoveSubscription
°° +
<
°°+ ,
T
°°, -
,
°°- .
TH
°°/ 1
>
°°1 2
(
°°2 3
)
°°3 4
;
°°4 5
}
¢¢ 	
public
§§ 
void
§§  
UnsubscribeDynamic
§§ &
<
§§& '
TH
§§' )
>
§§) *
(
§§* +
string
§§+ 1
	eventName
§§2 ;
)
§§; <
where
•• 
TH
•• 
:
•• -
IDynamicIntegrationEventHandler
•• 6
{
¶¶ 	
_subsManager
ßß 
.
ßß '
RemoveDynamicSubscription
ßß 2
<
ßß2 3
TH
ßß3 5
>
ßß5 6
(
ßß6 7
	eventName
ßß7 @
)
ßß@ A
;
ßßA B
}
®® 	
public
™™ 
void
™™ 
Dispose
™™ 
(
™™ 
)
™™ 
{
´´ 	
if
¨¨ 
(
¨¨ 
_consumerChannel
¨¨  
!=
¨¨! #
null
¨¨$ (
)
¨¨( )
{
≠≠ 
_consumerChannel
ÆÆ  
.
ÆÆ  !
Dispose
ÆÆ! (
(
ÆÆ( )
)
ÆÆ) *
;
ÆÆ* +
}
ØØ 
_subsManager
±± 
.
±± 
Clear
±± 
(
±± 
)
±±  
;
±±  !
}
≤≤ 	
private
¥¥ 
void
¥¥ 
StartBasicConsume
¥¥ &
(
¥¥& '
)
¥¥' (
{
µµ 	
_logger
∂∂ 
.
∂∂ 
LogTrace
∂∂ 
(
∂∂ 
$str
∂∂ >
)
∂∂> ?
;
∂∂? @
if
∏∏ 
(
∏∏ 
_consumerChannel
∏∏  
!=
∏∏! #
null
∏∏$ (
)
∏∏( )
{
ππ 
var
∫∫ 
consumer
∫∫ 
=
∫∫ 
new
∫∫ "(
AsyncEventingBasicConsumer
∫∫# =
(
∫∫= >
_consumerChannel
∫∫> N
)
∫∫N O
;
∫∫O P
consumer
ºº 
.
ºº 
Received
ºº !
+=
ºº" $
Consumer_Received
ºº% 6
;
ºº6 7
_consumerChannel
ææ  
.
ææ  !
BasicConsume
ææ! -
(
ææ- .
queue
øø 
:
øø 

_queueName
øø %
,
øø% &
autoAck
¿¿ 
:
¿¿ 
false
¿¿ "
,
¿¿" #
consumer
¡¡ 
:
¡¡ 
consumer
¡¡ &
)
¡¡& '
;
¡¡' (
}
¬¬ 
else
√√ 
{
ƒƒ 
_logger
≈≈ 
.
≈≈ 
LogError
≈≈  
(
≈≈  !
$str
≈≈! [
)
≈≈[ \
;
≈≈\ ]
}
∆∆ 
}
«« 	
private
…… 
async
…… 
Task
…… 
Consumer_Received
…… ,
(
……, -
object
……- 3
sender
……4 :
,
……: ;#
BasicDeliverEventArgs
……< Q
	eventArgs
……R [
)
……[ \
{
   	
var
ÀÀ 
	eventName
ÀÀ 
=
ÀÀ 
	eventArgs
ÀÀ %
.
ÀÀ% &

RoutingKey
ÀÀ& 0
;
ÀÀ0 1
var
ÃÃ 
message
ÃÃ 
=
ÃÃ 
Encoding
ÃÃ "
.
ÃÃ" #
UTF8
ÃÃ# '
.
ÃÃ' (
	GetString
ÃÃ( 1
(
ÃÃ1 2
	eventArgs
ÃÃ2 ;
.
ÃÃ; <
Body
ÃÃ< @
.
ÃÃ@ A
Span
ÃÃA E
)
ÃÃE F
;
ÃÃF G
try
ŒŒ 
{
œœ 
if
–– 
(
–– 
message
–– 
.
–– 
ToLowerInvariant
–– ,
(
––, -
)
––- .
.
––. /
Contains
––/ 7
(
––7 8
$str
––8 N
)
––N O
)
––O P
{
—— 
throw
““ 
new
““ '
InvalidOperationException
““ 7
(
““7 8
$"
““8 :
$str
““: V
{
““V W
message
““W ^
}
““^ _
$str
““_ a
"
““a b
)
““b c
;
““c d
}
”” 
await
’’ 
ProcessEvent
’’ "
(
’’" #
	eventName
’’# ,
,
’’, -
message
’’. 5
)
’’5 6
;
’’6 7
}
÷÷ 
catch
◊◊ 
(
◊◊ 
	Exception
◊◊ 
ex
◊◊ 
)
◊◊  
{
ÿÿ 
_logger
ŸŸ 
.
ŸŸ 

LogWarning
ŸŸ "
(
ŸŸ" #
ex
ŸŸ# %
,
ŸŸ% &
$str
ŸŸ' U
,
ŸŸU V
message
ŸŸW ^
)
ŸŸ^ _
;
ŸŸ_ `
}
⁄⁄ 
_consumerChannel
ﬂﬂ 
.
ﬂﬂ 
BasicAck
ﬂﬂ %
(
ﬂﬂ% &
	eventArgs
ﬂﬂ& /
.
ﬂﬂ/ 0
DeliveryTag
ﬂﬂ0 ;
,
ﬂﬂ; <
multiple
ﬂﬂ= E
:
ﬂﬂE F
false
ﬂﬂG L
)
ﬂﬂL M
;
ﬂﬂM N
}
‡‡ 	
private
‚‚ 
IModel
‚‚ #
CreateConsumerChannel
‚‚ ,
(
‚‚, -
)
‚‚- .
{
„„ 	
if
‰‰ 
(
‰‰ 
!
‰‰ #
_persistentConnection
‰‰ &
.
‰‰& '
IsConnected
‰‰' 2
)
‰‰2 3
{
ÂÂ #
_persistentConnection
ÊÊ %
.
ÊÊ% &

TryConnect
ÊÊ& 0
(
ÊÊ0 1
)
ÊÊ1 2
;
ÊÊ2 3
}
ÁÁ 
_logger
ÈÈ 
.
ÈÈ 
LogTrace
ÈÈ 
(
ÈÈ 
$str
ÈÈ A
)
ÈÈA B
;
ÈÈB C
var
ÎÎ 
channel
ÎÎ 
=
ÎÎ #
_persistentConnection
ÎÎ /
.
ÎÎ/ 0
CreateModel
ÎÎ0 ;
(
ÎÎ; <
)
ÎÎ< =
;
ÎÎ= >
channel
ÌÌ 
.
ÌÌ 
ExchangeDeclare
ÌÌ #
(
ÌÌ# $
exchange
ÌÌ$ ,
:
ÌÌ, -
BROKER_NAME
ÌÌ. 9
,
ÌÌ9 :
type
ÓÓ$ (
:
ÓÓ( )
$str
ÓÓ* 2
)
ÓÓ2 3
;
ÓÓ3 4
channel
 
.
 
QueueDeclare
  
(
  !
queue
! &
:
& '

_queueName
( 2
,
2 3
durable
ÒÒ! (
:
ÒÒ( )
true
ÒÒ* .
,
ÒÒ. /
	exclusive
ÚÚ! *
:
ÚÚ* +
false
ÚÚ, 1
,
ÚÚ1 2

autoDelete
ÛÛ! +
:
ÛÛ+ ,
false
ÛÛ- 2
,
ÛÛ2 3
	arguments
ÙÙ! *
:
ÙÙ* +
null
ÙÙ, 0
)
ÙÙ0 1
;
ÙÙ1 2
channel
ˆˆ 
.
ˆˆ 
CallbackException
ˆˆ %
+=
ˆˆ& (
(
ˆˆ) *
sender
ˆˆ* 0
,
ˆˆ0 1
ea
ˆˆ2 4
)
ˆˆ4 5
=>
ˆˆ6 8
{
˜˜ 
_logger
¯¯ 
.
¯¯ 

LogWarning
¯¯ "
(
¯¯" #
ea
¯¯# %
.
¯¯% &
	Exception
¯¯& /
,
¯¯/ 0
$str
¯¯1 W
)
¯¯W X
;
¯¯X Y
_consumerChannel
˙˙  
.
˙˙  !
Dispose
˙˙! (
(
˙˙( )
)
˙˙) *
;
˙˙* +
_consumerChannel
˚˚  
=
˚˚! "#
CreateConsumerChannel
˚˚# 8
(
˚˚8 9
)
˚˚9 :
;
˚˚: ;
StartBasicConsume
¸¸ !
(
¸¸! "
)
¸¸" #
;
¸¸# $
}
˝˝ 
;
˝˝ 
return
ˇˇ 
channel
ˇˇ 
;
ˇˇ 
}
ÄÄ 	
private
ÇÇ 
async
ÇÇ 
Task
ÇÇ 
ProcessEvent
ÇÇ '
(
ÇÇ' (
string
ÇÇ( .
	eventName
ÇÇ/ 8
,
ÇÇ8 9
string
ÇÇ: @
message
ÇÇA H
)
ÇÇH I
{
ÉÉ 	
_logger
ÑÑ 
.
ÑÑ 
LogTrace
ÑÑ 
(
ÑÑ 
$str
ÑÑ E
,
ÑÑE F
	eventName
ÑÑG P
)
ÑÑP Q
;
ÑÑQ R
if
ÜÜ 
(
ÜÜ 
_subsManager
ÜÜ 
.
ÜÜ &
HasSubscriptionsForEvent
ÜÜ 5
(
ÜÜ5 6
	eventName
ÜÜ6 ?
)
ÜÜ? @
)
ÜÜ@ A
{
áá 
using
àà 
(
àà 
var
àà 
scope
àà  
=
àà! "
_autofac
àà# +
.
àà+ , 
BeginLifetimeScope
àà, >
(
àà> ? 
AUTOFAC_SCOPE_NAME
àà? Q
)
ààQ R
)
ààR S
{
ââ 
var
ää 
subscriptions
ää %
=
ää& '
_subsManager
ää( 4
.
ää4 5!
GetHandlersForEvent
ää5 H
(
ääH I
	eventName
ääI R
)
ääR S
;
ääS T
foreach
ãã 
(
ãã 
var
ãã  
subscription
ãã! -
in
ãã. 0
subscriptions
ãã1 >
)
ãã> ?
{
åå 
if
çç 
(
çç 
subscription
çç (
.
çç( )
	IsDynamic
çç) 2
)
çç2 3
{
éé 
var
èè 
handler
èè  '
=
èè( )
scope
èè* /
.
èè/ 0
ResolveOptional
èè0 ?
(
èè? @
subscription
èè@ L
.
èèL M
HandlerType
èèM X
)
èèX Y
as
èèZ \-
IDynamicIntegrationEventHandler
èè] |
;
èè| }
if
êê 
(
êê  
handler
êê  '
==
êê( *
null
êê+ /
)
êê/ 0
continue
êê1 9
;
êê9 :
using
ëë !
dynamic
ëë" )
	eventData
ëë* 3
=
ëë4 5
JsonDocument
ëë6 B
.
ëëB C
Parse
ëëC H
(
ëëH I
message
ëëI P
)
ëëP Q
;
ëëQ R
await
íí !
Task
íí" &
.
íí& '
Yield
íí' ,
(
íí, -
)
íí- .
;
íí. /
await
ìì !
handler
ìì" )
.
ìì) *
Handle
ìì* 0
(
ìì0 1
	eventData
ìì1 :
)
ìì: ;
;
ìì; <
}
îî 
else
ïï 
{
ññ 
var
óó 
handler
óó  '
=
óó( )
scope
óó* /
.
óó/ 0
ResolveOptional
óó0 ?
(
óó? @
subscription
óó@ L
.
óóL M
HandlerType
óóM X
)
óóX Y
;
óóY Z
if
òò 
(
òò  
handler
òò  '
==
òò( *
null
òò+ /
)
òò/ 0
continue
òò1 9
;
òò9 :
var
ôô 
	eventType
ôô  )
=
ôô* +
_subsManager
ôô, 8
.
ôô8 9 
GetEventTypeByName
ôô9 K
(
ôôK L
	eventName
ôôL U
)
ôôU V
;
ôôV W
var
öö 
integrationEvent
öö  0
=
öö1 2
JsonSerializer
öö3 A
.
ööA B
Deserialize
ööB M
(
ööM N
message
ööN U
,
ööU V
	eventType
ööW `
,
öö` a
new
ööb e#
JsonSerializerOptions
ööf {
(
öö{ |
)
öö| }
{
öö~ +
PropertyNameCaseInsensitiveööÄ õ
=ööú ù
trueööû ¢
}öö£ §
)öö§ •
;öö• ¶
var
õõ 
concreteType
õõ  ,
=
õõ- .
typeof
õõ/ 5
(
õõ5 6&
IIntegrationEventHandler
õõ6 N
<
õõN O
>
õõO P
)
õõP Q
.
õõQ R
MakeGenericType
õõR a
(
õõa b
	eventType
õõb k
)
õõk l
;
õõl m
await
ùù !
Task
ùù" &
.
ùù& '
Yield
ùù' ,
(
ùù, -
)
ùù- .
;
ùù. /
await
ûû !
(
ûû" #
Task
ûû# '
)
ûû' (
concreteType
ûû( 4
.
ûû4 5
	GetMethod
ûû5 >
(
ûû> ?
$str
ûû? G
)
ûûG H
.
ûûH I
Invoke
ûûI O
(
ûûO P
handler
ûûP W
,
ûûW X
new
ûûY \
object
ûû] c
[
ûûc d
]
ûûd e
{
ûûf g
integrationEvent
ûûh x
}
ûûy z
)
ûûz {
;
ûû{ |
}
üü 
}
†† 
}
°° 
}
¢¢ 
else
££ 
{
§§ 
_logger
•• 
.
•• 

LogWarning
•• "
(
••" #
$str
••# T
,
••T U
	eventName
••V _
)
••_ `
;
••` a
}
¶¶ 
}
ßß 	
}
®® 
}©©  
ôC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.EventBusRabbitMQ\IRabbitMQPersistentConnection.cs
	namespace 	
BuildingBlocks
 
. 
EventBusRabbitMQ )
{ 
public 

	interface )
IRabbitMQPersistentConnection 2
: 
IDisposable 
{ 
bool		 
IsConnected		 
{		 
get		 
;		 
}		  !
bool 

TryConnect 
( 
) 
; 
IModel 
CreateModel 
( 
) 
; 
} 
} 