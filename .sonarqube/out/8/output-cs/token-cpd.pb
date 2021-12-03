Ç
çC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.IntegrationEventLog\EventStateEnum.cs
	namespace 	
BuildingBlocks
 
. 
IntegrationEventLog ,
{ 
public 

enum 
EventStateEnum 
{ 
NotPublished 
= 
$num 
, 

InProgress 
= 
$num 
, 
	Published 
= 
$num 
, 
PublishedFailed 
= 
$num 
}		 
}

 ú
ôC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.IntegrationEventLog\IntegrationEventLogContext.cs
	namespace		 	
BuildingBlocks		
 
.		 
IntegrationEventLog		 ,
{

 
public 

class &
IntegrationEventLogContext +
:, -
	DbContext. 7
{ 
public &
IntegrationEventLogContext )
() *
DbContextOptions* :
<: ;&
IntegrationEventLogContext; U
>U V
optionsW ^
)^ _
:` a
baseb f
(f g
optionsg n
)n o
{ 	
} 	
public 
DbSet 
< $
IntegrationEventLogEntry -
>- . 
IntegrationEventLogs/ C
{D E
getF I
;I J
setK N
;N O
}P Q
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
builder= D
)D E
{ 	
builder 
. 
Entity 
< $
IntegrationEventLogEntry 3
>3 4
(4 5-
!ConfigureIntegrationEventLogEntry5 V
)V W
;W X
} 	
void -
!ConfigureIntegrationEventLogEntry .
(. /
EntityTypeBuilder/ @
<@ A$
IntegrationEventLogEntryA Y
>Y Z
builder[ b
)b c
{ 	
builder 
. 
ToTable 
( 
$str 1
)1 2
;2 3
builder 
. 
HasKey 
( 
e 
=> 
e  !
.! "
EventId" )
)) *
;* +
builder 
. 
Property 
( 
e 
=> !
e" #
.# $
EventId$ +
)+ ,
. 

IsRequired 
( 
) 
; 
builder!! 
.!! 
Property!! 
(!! 
e!! 
=>!! !
e!!" #
.!!# $
Content!!$ +
)!!+ ,
."" 

IsRequired"" 
("" 
)"" 
;"" 
builder$$ 
.$$ 
Property$$ 
($$ 
e$$ 
=>$$ !
e$$" #
.$$# $
CreationTime$$$ 0
)$$0 1
.%% 

IsRequired%% 
(%% 
)%% 
;%% 
builder'' 
.'' 
Property'' 
('' 
e'' 
=>'' !
e''" #
.''# $
State''$ )
)'') *
.(( 

IsRequired(( 
((( 
)(( 
;(( 
builder** 
.** 
Property** 
(** 
e** 
=>** !
e**" #
.**# $
	TimesSent**$ -
)**- .
.++ 

IsRequired++ 
(++ 
)++ 
;++ 
builder-- 
.-- 
Property-- 
(-- 
e-- 
=>-- !
e--" #
.--# $
EventTypeName--$ 1
)--1 2
... 

IsRequired.. 
(.. 
).. 
;.. 
}00 	
}11 
}22 ¿"
óC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.IntegrationEventLog\IntegrationEventLogEntry.cs
	namespace 	
BuildingBlocks
 
. 
IntegrationEventLog ,
{ 
public		 

class		 $
IntegrationEventLogEntry		 )
{

 
private $
IntegrationEventLogEntry (
(( )
)) *
{+ ,
}- .
public $
IntegrationEventLogEntry '
(' (
IntegrationEvent( 8
@event9 ?
,? @
GuidA E
transactionIdF S
)S T
{ 	
EventId 
= 
@event 
. 
Id 
;  
CreationTime 
= 
@event !
.! "
CreationDate" .
;. /
EventTypeName 
= 
@event "
." #
GetType# *
(* +
)+ ,
., -
FullName- 5
;5 6
Content 
= 
JsonSerializer $
.$ %
	Serialize% .
(. /
@event/ 5
,5 6
@event7 =
.= >
GetType> E
(E F
)F G
,G H
newI L!
JsonSerializerOptionsM b
{ 
WriteIndented 
= 
true  $
} 
) 
; 
State 
= 
EventStateEnum "
." #
NotPublished# /
;/ 0
	TimesSent 
= 
$num 
; 
TransactionId 
= 
transactionId )
.) *
ToString* 2
(2 3
)3 4
;4 5
} 	
public 
Guid 
EventId 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public 
string 
EventTypeName #
{$ %
get& )
;) *
private+ 2
set3 6
;6 7
}8 9
[ 	
	NotMapped	 
] 
public 
string 
EventTypeShortName (
=>) +
EventTypeName, 9
.9 :
Split: ?
(? @
$char@ C
)C D
?D E
.E F
LastF J
(J K
)K L
;L M
[ 	
	NotMapped	 
] 
public 
IntegrationEvent 
IntegrationEvent  0
{1 2
get3 6
;6 7
private8 ?
set@ C
;C D
}E F
public 
EventStateEnum 
State #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public   
int   
	TimesSent   
{   
get   "
;  " #
set  $ '
;  ' (
}  ) *
public!! 
DateTime!! 
CreationTime!! $
{!!% &
get!!' *
;!!* +
private!!, 3
set!!4 7
;!!7 8
}!!9 :
public"" 
string"" 
Content"" 
{"" 
get""  #
;""# $
private""% ,
set""- 0
;""0 1
}""2 3
public## 
string## 
TransactionId## #
{##$ %
get##& )
;##) *
private##+ 2
set##3 6
;##6 7
}##8 9
public%% $
IntegrationEventLogEntry%% '"
DeserializeJsonContent%%( >
(%%> ?
Type%%? C
type%%D H
)%%H I
{&& 	
IntegrationEvent'' 
='' 
JsonSerializer'' -
.''- .
Deserialize''. 9
(''9 :
Content'': A
,''A B
type''C G
,''G H
new''I L!
JsonSerializerOptions''M b
(''b c
)''c d
{''e f(
PropertyNameCaseInsensitive	''g Ç
=
''É Ñ
true
''Ö â
}
''ä ã
)
''ã å
as
''ç è
IntegrationEvent
''ê †
;
''† °
return(( 
this(( 
;(( 
})) 	
}** 
}++ –

£C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.IntegrationEventLog\Services\IIntegrationEventLogService.cs
	namespace 	
BuildingBlocks
 
. 
IntegrationEventLog ,
., -
Services- 5
{		 
public

 

	interface

 '
IIntegrationEventLogService

 0
{ 
Task 
< 
IEnumerable 
< $
IntegrationEventLogEntry 1
>1 2
>2 32
&RetrieveEventLogsPendingToPublishAsync4 Z
(Z [
Guid[ _
transactionId` m
)m n
;n o
Task 
SaveEventAsync 
( 
IntegrationEvent ,
@event- 3
,3 4!
IDbContextTransaction5 J
transactionK V
)V W
;W X
Task %
MarkEventAsPublishedAsync &
(& '
Guid' +
eventId, 3
)3 4
;4 5
Task &
MarkEventAsInProgressAsync '
(' (
Guid( ,
eventId- 4
)4 5
;5 6
Task "
MarkEventAsFailedAsync #
(# $
Guid$ (
eventId) 0
)0 1
;1 2
} 
} ¥K
¢C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.IntegrationEventLog\Services\IntegrationEventLogService.cs
	namespace 	
BuildingBlocks
 
. 
IntegrationEventLog ,
., -
Services- 5
{ 
public 

class &
IntegrationEventLogService +
:, -'
IIntegrationEventLogService. I
,I J
IDisposableK V
{ 
private 
readonly &
IntegrationEventLogContext 3'
_integrationEventLogContext4 O
;O P
private 
readonly 
DbConnection %
_dbConnection& 3
;3 4
private 
readonly 
List 
< 
Type "
>" #
_eventTypes$ /
;/ 0
private 
volatile 
bool 
disposedValue +
;+ ,
public &
IntegrationEventLogService )
() *
DbConnection* 6
dbConnection7 C
)C D
{ 	
_dbConnection 
= 
dbConnection (
??) +
throw, 1
new2 5!
ArgumentNullException6 K
(K L
nameofL R
(R S
dbConnectionS _
)_ `
)` a
;a b'
_integrationEventLogContext '
=( )
new* -&
IntegrationEventLogContext. H
(H I
new #
DbContextOptionsBuilder +
<+ ,&
IntegrationEventLogContext, F
>F G
(G H
)H I
. 
UseSqlServer !
(! "
_dbConnection" /
)/ 0
. 
Options 
) 
; 
_eventTypes 
= 
Assembly "
." #
Load# '
(' (
Assembly( 0
.0 1
GetEntryAssembly1 A
(A B
)B C
.C D
FullNameD L
)L M
. 
GetTypes 
( 
) 
. 
Where 
( 
t 
=> 
t 
. 
Name "
." #
EndsWith# +
(+ ,
nameof, 2
(2 3
IntegrationEvent3 C
)C D
)D E
)E F
. 
ToList 
( 
) 
; 
}   	
public"" 
async"" 
Task"" 
<"" 
IEnumerable"" %
<""% &$
IntegrationEventLogEntry""& >
>""> ?
>""? @2
&RetrieveEventLogsPendingToPublishAsync""A g
(""g h
Guid""h l
transactionId""m z
)""z {
{## 	
var$$ 
tid$$ 
=$$ 
transactionId$$ #
.$$# $
ToString$$$ ,
($$, -
)$$- .
;$$. /
var&& 
result&& 
=&& 
await&& '
_integrationEventLogContext&& :
.&&: ; 
IntegrationEventLogs&&; O
.'' 
Where'' 
('' 
e'' 
=>'' 
e'' 
.'' 
TransactionId'' +
=='', .
tid''/ 2
&&''3 5
e''6 7
.''7 8
State''8 =
==''> @
EventStateEnum''A O
.''O P
NotPublished''P \
)''\ ]
.''] ^
ToListAsync''^ i
(''i j
)''j k
;''k l
if)) 
()) 
result)) 
!=)) 
null)) 
&&)) !
result))" (
.))( )
Any))) ,
()), -
)))- .
&&))/ 1
_eventTypes))2 =
.))= >
Any))> A
())A B
)))B C
)))C D
{** 
return++ 
result++ 
.++ 
OrderBy++ %
(++% &
o++& '
=>++( *
o+++ ,
.++, -
CreationTime++- 9
)++9 :
.-- 
Select-- 
(-- 
e-- 
=>--  
e--! "
.--" #"
DeserializeJsonContent--# 9
(--9 :
_eventTypes--: E
.--E F
Find--F J
(--J K
t--K L
=>--M O
t--P Q
.--Q R
Name--R V
==--W Y
e--Z [
.--[ \
EventTypeShortName--\ n
)--n o
)--o p
)--p q
;--q r
}.. 
return00 
new00 
List00 
<00 $
IntegrationEventLogEntry00 4
>004 5
(005 6
)006 7
;007 8
}11 	
public33 
Task33 
SaveEventAsync33 "
(33" #
IntegrationEvent33# 3
@event334 :
,33: ;!
IDbContextTransaction33< Q
transaction33R ]
)33] ^
{44 	
if55 
(55 
transaction55 
==55 
null55 #
)55# $
throw55% *
new55+ .!
ArgumentNullException55/ D
(55D E
nameof55E K
(55K L
transaction55L W
)55W X
)55X Y
;55Y Z
var77 
eventLogEntry77 
=77 
new77  #$
IntegrationEventLogEntry77$ <
(77< =
@event77= C
,77C D
transaction77E P
.77P Q
TransactionId77Q ^
)77^ _
;77_ `'
_integrationEventLogContext99 '
.99' (
Database99( 0
.990 1
UseTransaction991 ?
(99? @
transaction99@ K
.99K L
GetDbTransaction99L \
(99\ ]
)99] ^
)99^ _
;99_ `'
_integrationEventLogContext:: '
.::' ( 
IntegrationEventLogs::( <
.::< =
Add::= @
(::@ A
eventLogEntry::A N
)::N O
;::O P
return<< '
_integrationEventLogContext<< .
.<<. /
SaveChangesAsync<</ ?
(<<? @
)<<@ A
;<<A B
}== 	
public?? 
Task?? %
MarkEventAsPublishedAsync?? -
(??- .
Guid??. 2
eventId??3 :
)??: ;
{@@ 	
returnAA 
UpdateEventStatusAA $
(AA$ %
eventIdAA% ,
,AA, -
EventStateEnumAA. <
.AA< =
	PublishedAA= F
)AAF G
;AAG H
}BB 	
publicDD 
TaskDD &
MarkEventAsInProgressAsyncDD .
(DD. /
GuidDD/ 3
eventIdDD4 ;
)DD; <
{EE 	
returnFF 
UpdateEventStatusFF $
(FF$ %
eventIdFF% ,
,FF, -
EventStateEnumFF. <
.FF< =

InProgressFF= G
)FFG H
;FFH I
}GG 	
publicII 
TaskII "
MarkEventAsFailedAsyncII *
(II* +
GuidII+ /
eventIdII0 7
)II7 8
{JJ 	
returnKK 
UpdateEventStatusKK $
(KK$ %
eventIdKK% ,
,KK, -
EventStateEnumKK. <
.KK< =
PublishedFailedKK= L
)KKL M
;KKM N
}LL 	
privateNN 
TaskNN 
UpdateEventStatusNN &
(NN& '
GuidNN' +
eventIdNN, 3
,NN3 4
EventStateEnumNN5 C
statusNND J
)NNJ K
{OO 	
varPP 
eventLogEntryPP 
=PP '
_integrationEventLogContextPP  ;
.PP; < 
IntegrationEventLogsPP< P
.PPP Q
SinglePPQ W
(PPW X
iePPX Z
=>PP[ ]
iePP^ `
.PP` a
EventIdPPa h
==PPi k
eventIdPPl s
)PPs t
;PPt u
eventLogEntryQQ 
.QQ 
StateQQ 
=QQ  !
statusQQ" (
;QQ( )
ifSS 
(SS 
statusSS 
==SS 
EventStateEnumSS (
.SS( )

InProgressSS) 3
)SS3 4
eventLogEntryTT 
.TT 
	TimesSentTT '
++TT' )
;TT) *'
_integrationEventLogContextVV '
.VV' ( 
IntegrationEventLogsVV( <
.VV< =
UpdateVV= C
(VVC D
eventLogEntryVVD Q
)VVQ R
;VVR S
returnXX '
_integrationEventLogContextXX .
.XX. /
SaveChangesAsyncXX/ ?
(XX? @
)XX@ A
;XXA B
}YY 	
	protected[[ 
virtual[[ 
void[[ 
Dispose[[ &
([[& '
bool[[' +
	disposing[[, 5
)[[5 6
{\\ 	
if]] 
(]] 
!]] 
disposedValue]] 
)]] 
{^^ 
if__ 
(__ 
	disposing__ 
)__ 
{`` '
_integrationEventLogContextaa /
?aa/ 0
.aa0 1
Disposeaa1 8
(aa8 9
)aa9 :
;aa: ;
}bb 
disposedValueee 
=ee 
trueee  $
;ee$ %
}ff 
}gg 	
publicii 
voidii 
Disposeii 
(ii 
)ii 
{jj 	
Disposekk 
(kk 
	disposingkk 
:kk 
truekk #
)kk# $
;kk$ %
GCll 
.ll 
SuppressFinalizell 
(ll  
thisll  $
)ll$ %
;ll% &
}mm 	
}nn 
}oo ô
ùC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\EventBus\BuildingBlocks.IntegrationEventLog\Utilities\ResilientTransaction.cs
	namespace 	
BuildingBlocks
 
. 
IntegrationEventLog ,
., -
	Utilities- 6
{		 
public

 

class

  
ResilientTransaction

 %
{ 
private 
	DbContext 
_context "
;" #
private  
ResilientTransaction $
($ %
	DbContext% .
context/ 6
)6 7
=>8 :
_context 
= 
context 
?? !
throw" '
new( +!
ArgumentNullException, A
(A B
nameofB H
(H I
contextI P
)P Q
)Q R
;R S
public 
static  
ResilientTransaction *
New+ .
(. /
	DbContext/ 8
context9 @
)@ A
=>B D
new  
ResilientTransaction $
($ %
context% ,
), -
;- .
public 
async 
Task 
ExecuteAsync &
(& '
Func' +
<+ ,
Task, 0
>0 1
action2 8
)8 9
{ 	
var 
strategy 
= 
_context #
.# $
Database$ ,
., -#
CreateExecutionStrategy- D
(D E
)E F
;F G
await 
strategy 
. 
ExecuteAsync '
(' (
async( -
(. /
)/ 0
=>1 3
{ 
using 
( 
var 
transaction &
=' (
_context) 1
.1 2
Database2 :
.: ;
BeginTransaction; K
(K L
)L M
)M N
{ 
await 
action  
(  !
)! "
;" #
transaction 
.  
Commit  &
(& '
)' (
;( )
} 
} 
) 
; 
}   	
}!! 
}"" 