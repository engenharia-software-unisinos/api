ÜA
C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.EventBusRabbitMQ\DefaultRabbitMQPersistentConnection.cs
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
#DefaultRabbitMQPersistentConnection	a 
>
 
logger
 
,
 
int
 

retryCount
 
=
 
$num
  
)
  Ą
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
time	KK} 
.
KK 
TotalSeconds
KK 
:
KK 
$str
KK 
}
KK 
"
KK 
,
KK 
ex
KK 
.
KK 
Message
KK 
)
KK  
;
KK  Ą
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
$str	[[+ 
,
[[ 
_connection
[[ 
.
[[ 
Endpoint
[[ §
.
[[§ ¨
HostName
[[¨ °
)
[[° ą
;
[[ą ˛
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
 
(
 
)
 
;
 
}
 	
}
 
} ąÉ
C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.EventBusRabbitMQ\EventBusRabbitMQ.cs
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
Id	OO~ 
,
OO 
$"
OO 
{
OO 
time
OO 
.
OO 
TotalSeconds
OO 
:
OO 
$str
OO 
}
OO 
"
OO 
,
OO 
ex
OO 
.
OO  
Message
OO  §
)
OO§ ¨
;
OO¨ Š
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
GetGenericTypeName	uuy 
(
uu 
)
uu 
)
uu 
;
uu "
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
 
	eventName
 
=
 
_subsManager
 (
.
( )
GetEventKey
) 4
<
4 5
T
5 6
>
6 7
(
7 8
)
8 9
;
9 :$
DoInternalSubscription
 "
(
" #
	eventName
# ,
)
, -
;
- .
_logger
 
.
 
LogInformation
 "
(
" #
$str
# Y
,
Y Z
	eventName
[ d
,
d e
typeof
f l
(
l m
TH
m o
)
o p
.
p q!
GetGenericTypeNameq 
( 
) 
) 
; 
_subsManager
 
.
 
AddSubscription
 (
<
( )
T
) *
,
* +
TH
, .
>
. /
(
/ 0
)
0 1
;
1 2
StartBasicConsume
 
(
 
)
 
;
  
}
 	
private
 
void
 $
DoInternalSubscription
 +
(
+ ,
string
, 2
	eventName
3 <
)
< =
{
 	
var
 
containsKey
 
=
 
_subsManager
 *
.
* +&
HasSubscriptionsForEvent
+ C
(
C D
	eventName
D M
)
M N
;
N O
if
 
(
 
!
 
containsKey
 
)
 
{
 
if
 
(
 
!
 #
_persistentConnection
 *
.
* +
IsConnected
+ 6
)
6 7
{
 #
_persistentConnection
 )
.
) *

TryConnect
* 4
(
4 5
)
5 6
;
6 7
}
 
_consumerChannel
  
.
  !
	QueueBind
! *
(
* +
queue
+ 0
:
0 1

_queueName
2 <
,
< =
exchange
$ ,
:
, -
BROKER_NAME
. 9
,
9 :

routingKey
$ .
:
. /
	eventName
0 9
)
9 :
;
: ;
}
 
}
 	
public
 
void
 
Unsubscribe
 
<
  
T
  !
,
! "
TH
# %
>
% &
(
& '
)
' (
where
 
T
 
:
 
IntegrationEvent
 &
where
 
TH
 
:
 &
IIntegrationEventHandler
 /
<
/ 0
T
0 1
>
1 2
{
 	
var
 
	eventName
 
=
 
_subsManager
 (
.
( )
GetEventKey
) 4
<
4 5
T
5 6
>
6 7
(
7 8
)
8 9
;
9 :
_logger
 
.
 
LogInformation
 "
(
" #
$str
# I
,
I J
	eventName
K T
)
T U
;
U V
_subsManager
ĄĄ 
.
ĄĄ  
RemoveSubscription
ĄĄ +
<
ĄĄ+ ,
T
ĄĄ, -
,
ĄĄ- .
TH
ĄĄ/ 1
>
ĄĄ1 2
(
ĄĄ2 3
)
ĄĄ3 4
;
ĄĄ4 5
}
ĸĸ 	
public
¤¤ 
void
¤¤  
UnsubscribeDynamic
¤¤ &
<
¤¤& '
TH
¤¤' )
>
¤¤) *
(
¤¤* +
string
¤¤+ 1
	eventName
¤¤2 ;
)
¤¤; <
where
ĨĨ 
TH
ĨĨ 
:
ĨĨ -
IDynamicIntegrationEventHandler
ĨĨ 6
{
ĻĻ 	
_subsManager
§§ 
.
§§ '
RemoveDynamicSubscription
§§ 2
<
§§2 3
TH
§§3 5
>
§§5 6
(
§§6 7
	eventName
§§7 @
)
§§@ A
;
§§A B
}
¨¨ 	
public
ĒĒ 
void
ĒĒ 
Dispose
ĒĒ 
(
ĒĒ 
)
ĒĒ 
{
ĢĢ 	
if
ŦŦ 
(
ŦŦ 
_consumerChannel
ŦŦ  
!=
ŦŦ! #
null
ŦŦ$ (
)
ŦŦ( )
{
­­ 
_consumerChannel
ŽŽ  
.
ŽŽ  !
Dispose
ŽŽ! (
(
ŽŽ( )
)
ŽŽ) *
;
ŽŽ* +
}
¯¯ 
_subsManager
ąą 
.
ąą 
Clear
ąą 
(
ąą 
)
ąą  
;
ąą  !
}
˛˛ 	
private
´´ 
void
´´ 
StartBasicConsume
´´ &
(
´´& '
)
´´' (
{
ĩĩ 	
_logger
ļļ 
.
ļļ 
LogTrace
ļļ 
(
ļļ 
$str
ļļ >
)
ļļ> ?
;
ļļ? @
if
¸¸ 
(
¸¸ 
_consumerChannel
¸¸  
!=
¸¸! #
null
¸¸$ (
)
¸¸( )
{
šš 
var
ēē 
consumer
ēē 
=
ēē 
new
ēē "(
AsyncEventingBasicConsumer
ēē# =
(
ēē= >
_consumerChannel
ēē> N
)
ēēN O
;
ēēO P
consumer
ŧŧ 
.
ŧŧ 
Received
ŧŧ !
+=
ŧŧ" $
Consumer_Received
ŧŧ% 6
;
ŧŧ6 7
_consumerChannel
žž  
.
žž  !
BasicConsume
žž! -
(
žž- .
queue
ŋŋ 
:
ŋŋ 

_queueName
ŋŋ %
,
ŋŋ% &
autoAck
ĀĀ 
:
ĀĀ 
false
ĀĀ "
,
ĀĀ" #
consumer
ÁÁ 
:
ÁÁ 
consumer
ÁÁ &
)
ÁÁ& '
;
ÁÁ' (
}
ÂÂ 
else
ÃÃ 
{
ÄÄ 
_logger
ÅÅ 
.
ÅÅ 
LogError
ÅÅ  
(
ÅÅ  !
$str
ÅÅ! [
)
ÅÅ[ \
;
ÅÅ\ ]
}
ÆÆ 
}
ĮĮ 	
private
ÉÉ 
async
ÉÉ 
Task
ÉÉ 
Consumer_Received
ÉÉ ,
(
ÉÉ, -
object
ÉÉ- 3
sender
ÉÉ4 :
,
ÉÉ: ;#
BasicDeliverEventArgs
ÉÉ< Q
	eventArgs
ÉÉR [
)
ÉÉ[ \
{
ĘĘ 	
var
ËË 
	eventName
ËË 
=
ËË 
	eventArgs
ËË %
.
ËË% &

RoutingKey
ËË& 0
;
ËË0 1
var
ĖĖ 
message
ĖĖ 
=
ĖĖ 
Encoding
ĖĖ "
.
ĖĖ" #
UTF8
ĖĖ# '
.
ĖĖ' (
	GetString
ĖĖ( 1
(
ĖĖ1 2
	eventArgs
ĖĖ2 ;
.
ĖĖ; <
Body
ĖĖ< @
.
ĖĖ@ A
Span
ĖĖA E
)
ĖĖE F
;
ĖĖF G
try
ÎÎ 
{
ĪĪ 
if
ĐĐ 
(
ĐĐ 
message
ĐĐ 
.
ĐĐ 
ToLowerInvariant
ĐĐ ,
(
ĐĐ, -
)
ĐĐ- .
.
ĐĐ. /
Contains
ĐĐ/ 7
(
ĐĐ7 8
$str
ĐĐ8 N
)
ĐĐN O
)
ĐĐO P
{
ŅŅ 
throw
ŌŌ 
new
ŌŌ '
InvalidOperationException
ŌŌ 7
(
ŌŌ7 8
$"
ŌŌ8 :
$str
ŌŌ: V
{
ŌŌV W
message
ŌŌW ^
}
ŌŌ^ _
$str
ŌŌ_ a
"
ŌŌa b
)
ŌŌb c
;
ŌŌc d
}
ĶĶ 
await
ÕÕ 
ProcessEvent
ÕÕ "
(
ÕÕ" #
	eventName
ÕÕ# ,
,
ÕÕ, -
message
ÕÕ. 5
)
ÕÕ5 6
;
ÕÕ6 7
}
ÖÖ 
catch
×× 
(
×× 
	Exception
×× 
ex
×× 
)
××  
{
ØØ 
_logger
ŲŲ 
.
ŲŲ 

LogWarning
ŲŲ "
(
ŲŲ" #
ex
ŲŲ# %
,
ŲŲ% &
$str
ŲŲ' U
,
ŲŲU V
message
ŲŲW ^
)
ŲŲ^ _
;
ŲŲ_ `
}
ÚÚ 
_consumerChannel
ßß 
.
ßß 
BasicAck
ßß %
(
ßß% &
	eventArgs
ßß& /
.
ßß/ 0
DeliveryTag
ßß0 ;
,
ßß; <
multiple
ßß= E
:
ßßE F
false
ßßG L
)
ßßL M
;
ßßM N
}
āā 	
private
ââ 
IModel
ââ #
CreateConsumerChannel
ââ ,
(
ââ, -
)
ââ- .
{
ãã 	
if
ää 
(
ää 
!
ää #
_persistentConnection
ää &
.
ää& '
IsConnected
ää' 2
)
ää2 3
{
åå #
_persistentConnection
ææ %
.
ææ% &

TryConnect
ææ& 0
(
ææ0 1
)
ææ1 2
;
ææ2 3
}
įį 
_logger
éé 
.
éé 
LogTrace
éé 
(
éé 
$str
éé A
)
ééA B
;
ééB C
var
ëë 
channel
ëë 
=
ëë #
_persistentConnection
ëë /
.
ëë/ 0
CreateModel
ëë0 ;
(
ëë; <
)
ëë< =
;
ëë= >
channel
íí 
.
íí 
ExchangeDeclare
íí #
(
íí# $
exchange
íí$ ,
:
íí, -
BROKER_NAME
íí. 9
,
íí9 :
type
îî$ (
:
îî( )
$str
îî* 2
)
îî2 3
;
îî3 4
channel
đđ 
.
đđ 
QueueDeclare
đđ  
(
đđ  !
queue
đđ! &
:
đđ& '

_queueName
đđ( 2
,
đđ2 3
durable
ņņ! (
:
ņņ( )
true
ņņ* .
,
ņņ. /
	exclusive
ōō! *
:
ōō* +
false
ōō, 1
,
ōō1 2

autoDelete
ķķ! +
:
ķķ+ ,
false
ķķ- 2
,
ķķ2 3
	arguments
ôô! *
:
ôô* +
null
ôô, 0
)
ôô0 1
;
ôô1 2
channel
öö 
.
öö 
CallbackException
öö %
+=
öö& (
(
öö) *
sender
öö* 0
,
öö0 1
ea
öö2 4
)
öö4 5
=>
öö6 8
{
÷÷ 
_logger
øø 
.
øø 

LogWarning
øø "
(
øø" #
ea
øø# %
.
øø% &
	Exception
øø& /
,
øø/ 0
$str
øø1 W
)
øøW X
;
øøX Y
_consumerChannel
úú  
.
úú  !
Dispose
úú! (
(
úú( )
)
úú) *
;
úú* +
_consumerChannel
ûû  
=
ûû! "#
CreateConsumerChannel
ûû# 8
(
ûû8 9
)
ûû9 :
;
ûû: ;
StartBasicConsume
üü !
(
üü! "
)
üü" #
;
üü# $
}
ũũ 
;
ũũ 
return
˙˙ 
channel
˙˙ 
;
˙˙ 
}
 	
private
 
async
 
Task
 
ProcessEvent
 '
(
' (
string
( .
	eventName
/ 8
,
8 9
string
: @
message
A H
)
H I
{
 	
_logger
 
.
 
LogTrace
 
(
 
$str
 E
,
E F
	eventName
G P
)
P Q
;
Q R
if
 
(
 
_subsManager
 
.
 &
HasSubscriptionsForEvent
 5
(
5 6
	eventName
6 ?
)
? @
)
@ A
{
 
using
 
(
 
var
 
scope
  
=
! "
_autofac
# +
.
+ , 
BeginLifetimeScope
, >
(
> ? 
AUTOFAC_SCOPE_NAME
? Q
)
Q R
)
R S
{
 
var
 
subscriptions
 %
=
& '
_subsManager
( 4
.
4 5!
GetHandlersForEvent
5 H
(
H I
	eventName
I R
)
R S
;
S T
foreach
 
(
 
var
  
subscription
! -
in
. 0
subscriptions
1 >
)
> ?
{
 
if
 
(
 
subscription
 (
.
( )
	IsDynamic
) 2
)
2 3
{
 
var
 
handler
  '
=
( )
scope
* /
.
/ 0
ResolveOptional
0 ?
(
? @
subscription
@ L
.
L M
HandlerType
M X
)
X Y
as
Z \-
IDynamicIntegrationEventHandler
] |
;
| }
if
 
(
  
handler
  '
==
( *
null
+ /
)
/ 0
continue
1 9
;
9 :
using
 !
dynamic
" )
	eventData
* 3
=
4 5
JsonDocument
6 B
.
B C
Parse
C H
(
H I
message
I P
)
P Q
;
Q R
await
 !
Task
" &
.
& '
Yield
' ,
(
, -
)
- .
;
. /
await
 !
handler
" )
.
) *
Handle
* 0
(
0 1
	eventData
1 :
)
: ;
;
; <
}
 
else
 
{
 
var
 
handler
  '
=
( )
scope
* /
.
/ 0
ResolveOptional
0 ?
(
? @
subscription
@ L
.
L M
HandlerType
M X
)
X Y
;
Y Z
if
 
(
  
handler
  '
==
( *
null
+ /
)
/ 0
continue
1 9
;
9 :
var
 
	eventType
  )
=
* +
_subsManager
, 8
.
8 9 
GetEventTypeByName
9 K
(
K L
	eventName
L U
)
U V
;
V W
var
 
integrationEvent
  0
=
1 2
JsonSerializer
3 A
.
A B
Deserialize
B M
(
M N
message
N U
,
U V
	eventType
W `
,
` a
new
b e#
JsonSerializerOptions
f {
(
{ |
)
| }
{
~ +
PropertyNameCaseInsensitive 
= 
true ĸ
}Ŗ ¤
)¤ Ĩ
;Ĩ Ļ
var
 
concreteType
  ,
=
- .
typeof
/ 5
(
5 6&
IIntegrationEventHandler
6 N
<
N O
>
O P
)
P Q
.
Q R
MakeGenericType
R a
(
a b
	eventType
b k
)
k l
;
l m
await
 !
Task
" &
.
& '
Yield
' ,
(
, -
)
- .
;
. /
await
 !
(
" #
Task
# '
)
' (
concreteType
( 4
.
4 5
	GetMethod
5 >
(
> ?
$str
? G
)
G H
.
H I
Invoke
I O
(
O P
handler
P W
,
W X
new
Y \
object
] c
[
c d
]
d e
{
f g
integrationEvent
h x
}
y z
)
z {
;
{ |
}
 
}
   
}
ĄĄ 
}
ĸĸ 
else
ŖŖ 
{
¤¤ 
_logger
ĨĨ 
.
ĨĨ 

LogWarning
ĨĨ "
(
ĨĨ" #
$str
ĨĨ# T
,
ĨĨT U
	eventName
ĨĨV _
)
ĨĨ_ `
;
ĨĨ` a
}
ĻĻ 
}
§§ 	
}
¨¨ 
}ŠŠ Ę
C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.EventBusRabbitMQ\IRabbitMQPersistentConnection.cs
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