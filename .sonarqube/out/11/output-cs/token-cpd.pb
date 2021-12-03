—Z
zC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.Infrastructure\CatalogContext.cs
	namespace 	
Catalog
 
. 
Infrastructure  
{ 
public 

class 
CatalogContext 
:  !
	DbContext" +
,+ ,
IUnitOfWork- 8
{ 
public 
const 
string 
DEFAULT_SCHEMA *
=+ ,
$str- 6
;6 7
public 
DbSet 
< 
Product 
> 
Products &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DbSet 
< 
ProductStatus "
>" #
ProductStatus$ 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private !
IDbContextTransaction %
_currentTransaction& 9
;9 :
public 
CatalogContext 
( 
DbContextOptions .
<. /
CatalogContext/ =
>= >
options? F
)F G
:H I
baseJ N
(N O
optionsO V
)V W
{X Y
}Z [
public !
IDbContextTransaction $!
GetCurrentTransaction% :
(: ;
); <
=>= ?
_currentTransaction@ S
;S T
public 
bool  
HasActiveTransaction (
=>) +
_currentTransaction, ?
!=@ B
nullC G
;G H
public 
CatalogContext 
( 
DbContextOptions .
<. /
CatalogContext/ =
>= >
options? F
,F G
	IMediatorH Q
mediatorR Z
)Z [
:\ ]
base^ b
(b c
optionsc j
)j k
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
;!!U V
System$$ 
.$$ 
Diagnostics$$ 
.$$ 
Debug$$ $
.$$$ %
	WriteLine$$% .
($$. /
$str$$/ H
+$$I J
this$$K O
.$$O P
GetHashCode$$P [
($$[ \
)$$\ ]
)$$] ^
;$$^ _
}%% 	
	protected'' 
override'' 
void'' 
OnModelCreating''  /
(''/ 0
ModelBuilder''0 <
modelBuilder''= I
)''I J
{(( 	
modelBuilder)) 
.)) 
ApplyConfiguration)) +
())+ ,
new)), /*
ProductEntityTypeConfiguration))0 N
())N O
)))O P
)))P Q
;))Q R
modelBuilder** 
.** 
ApplyConfiguration** +
(**+ ,
new**, /0
$ProductStatusEntityTypeConfiguration**0 T
(**T U
)**U V
)**V W
;**W X
}++ 	
public-- 
async-- 
Task-- 
<-- 
bool-- 
>-- 
SaveEntitiesAsync--  1
(--1 2
CancellationToken--2 C
cancellationToken--D U
=--V W
default--X _
(--_ `
CancellationToken--` q
)--q r
)--r s
{.. 	
await// 
	_mediator// 
.// %
DispatchDomainEventsAsync// 5
(//5 6
this//6 :
)//: ;
;//; <
ChangeTracker11 
.11 
Entries11 !
<11! "
Entity11" (
>11( )
(11) *
)11* +
.22 
Where22 
(22  
e22  !
=>22" $
e22% &
.22& '
State22' ,
==22- /
EntityState220 ;
.22; <
Modified22< D
)22D E
.22E F
ToList22F L
(22L M
)22M N
.33 
ForEach33 !
(33! "
e33" #
=>33$ &
{44 
e55 
.55 
Property55 '
(55' (
$str55( 3
)553 4
.554 5
CurrentValue555 A
=55B C
DateTime55D L
.55L M
UtcNow55M S
;55S T
}66 
)66 
;66 
var88 
result88 
=88 
await88 
base88 #
.88# $
SaveChangesAsync88$ 4
(884 5
cancellationToken885 F
)88F G
;88G H
return99 
true99 
;99 
}:: 	
public<< 
async<< 
Task<< 
<<< !
IDbContextTransaction<< /
><</ 0!
BeginTransactionAsync<<1 F
(<<F G
)<<G H
{== 	
if>> 
(>> 
_currentTransaction>> #
!=>>$ &
null>>' +
)>>+ ,
return>>- 3
null>>4 8
;>>8 9
_currentTransaction@@ 
=@@  !
await@@" '
Database@@( 0
.@@0 1!
BeginTransactionAsync@@1 F
(@@F G
IsolationLevel@@G U
.@@U V
ReadCommitted@@V c
)@@c d
;@@d e
returnBB 
_currentTransactionBB &
;BB& '
}CC 	
publicEE 
asyncEE 
TaskEE "
CommitTransactionAsyncEE 0
(EE0 1!
IDbContextTransactionEE1 F
transactionEEG R
)EER S
{FF 	
ifGG 
(GG 
transactionGG 
==GG 
nullGG #
)GG# $
throwGG% *
newGG+ .!
ArgumentNullExceptionGG/ D
(GGD E
nameofGGE K
(GGK L
transactionGGL W
)GGW X
)GGX Y
;GGY Z
ifHH 
(HH 
transactionHH 
!=HH 
_currentTransactionHH 2
)HH2 3
throwHH4 9
newHH: =%
InvalidOperationExceptionHH> W
(HHW X
$"HHX Z
$strHHZ f
{HHf g
transactionHHg r
.HHr s
TransactionId	HHs Ä
}
HHÄ Å
$str
HHÅ ê
"
HHê ë
)
HHë í
;
HHí ì
tryJJ 
{KK 
awaitLL 
SaveChangesAsyncLL &
(LL& '
)LL' (
;LL( )
transactionMM 
.MM 
CommitMM "
(MM" #
)MM# $
;MM$ %
}NN 
catchOO 
{PP 
RollbackTransactionQQ #
(QQ# $
)QQ$ %
;QQ% &
throwRR 
;RR 
}SS 
finallyTT 
{UU 
ifVV 
(VV 
_currentTransactionVV '
!=VV( *
nullVV+ /
)VV/ 0
{WW 
_currentTransactionXX '
.XX' (
DisposeXX( /
(XX/ 0
)XX0 1
;XX1 2
_currentTransactionYY '
=YY( )
nullYY* .
;YY. /
}ZZ 
}[[ 
}\\ 	
public^^ 
void^^ 
RollbackTransaction^^ '
(^^' (
)^^( )
{__ 	
try`` 
{aa 
_currentTransactionbb #
?bb# $
.bb$ %
Rollbackbb% -
(bb- .
)bb. /
;bb/ 0
}cc 
finallydd 
{ee 
ifff 
(ff 
_currentTransactionff '
!=ff( *
nullff+ /
)ff/ 0
{gg 
_currentTransactionhh '
.hh' (
Disposehh( /
(hh/ 0
)hh0 1
;hh1 2
_currentTransactionii '
=ii( )
nullii* .
;ii. /
}jj 
}kk 
}ll 	
}mm 
publicoo 

classoo '
CatalogContextDesignFactoryoo ,
:oo- .'
IDesignTimeDbContextFactoryoo/ J
<ooJ K
CatalogContextooK Y
>ooY Z
{pp 
publicqq 
CatalogContextqq 
CreateDbContextqq -
(qq- .
stringqq. 4
[qq4 5
]qq5 6
argsqq7 ;
)qq; <
{rr 	
varss 
optionsBuilderss 
=ss  
newss! $#
DbContextOptionsBuilderss% <
<ss< =
CatalogContextss= K
>ssK L
(ssL M
)ssM N
.tt 
UseSqlServertt 
(tt 
$strtt 
)	tt Ä
;
ttÄ Å
returnvv 
newvv 
CatalogContextvv %
(vv% &
optionsBuildervv& 4
.vv4 5
Optionsvv5 <
,vv< =
newvv> A

NoMediatorvvB L
(vvL M
)vvM N
)vvN O
;vvO P
}ww 	
classyy 

NoMediatoryy 
:yy 
	IMediatoryy $
{zz 	
public{{ 
Task{{ 
Publish{{ 
<{{  
TNotification{{  -
>{{- .
({{. /
TNotification{{/ <
notification{{= I
,{{I J
CancellationToken{{K \
cancellationToken{{] n
={{o p
default{{q x
({{x y
CancellationToken	{{y ä
)
{{ä ã
)
{{ã å
where
{{ç í
TNotification
{{ì †
:
{{° ¢
INotification
{{£ ∞
{|| 
return}} 
Task}} 
.}} 
CompletedTask}} )
;}}) *
}~~ 
public
ÄÄ 
Task
ÄÄ 
Publish
ÄÄ 
(
ÄÄ  
object
ÄÄ  &
notification
ÄÄ' 3
,
ÄÄ3 4
CancellationToken
ÄÄ5 F
cancellationToken
ÄÄG X
=
ÄÄY Z
default
ÄÄ[ b
)
ÄÄb c
{
ÅÅ 
return
ÇÇ 
Task
ÇÇ 
.
ÇÇ 
CompletedTask
ÇÇ )
;
ÇÇ) *
}
ÉÉ 
public
ÖÖ 
Task
ÖÖ 
<
ÖÖ 
	TResponse
ÖÖ !
>
ÖÖ! "
Send
ÖÖ# '
<
ÖÖ' (
	TResponse
ÖÖ( 1
>
ÖÖ1 2
(
ÖÖ2 3
IRequest
ÖÖ3 ;
<
ÖÖ; <
	TResponse
ÖÖ< E
>
ÖÖE F
request
ÖÖG N
,
ÖÖN O
CancellationToken
ÖÖP a
cancellationToken
ÖÖb s
=
ÖÖt u
default
ÖÖv }
(
ÖÖ} ~ 
CancellationTokenÖÖ~ è
)ÖÖè ê
)ÖÖê ë
{
ÜÜ 
return
áá 
Task
áá 
.
áá 

FromResult
áá &
<
áá& '
	TResponse
áá' 0
>
áá0 1
(
áá1 2
default
áá2 9
(
áá9 :
	TResponse
áá: C
)
ááC D
)
ááD E
;
ááE F
}
àà 
public
ää 
Task
ää 
<
ää 
object
ää 
>
ää 
Send
ää  $
(
ää$ %
object
ää% +
request
ää, 3
,
ää3 4
CancellationToken
ää5 F
cancellationToken
ääG X
=
ääY Z
default
ää[ b
)
ääb c
{
ãã 
return
åå 
Task
åå 
.
åå 

FromResult
åå &
(
åå& '
default
åå' .
(
åå. /
object
åå/ 5
)
åå5 6
)
åå6 7
;
åå7 8
}
çç 
}
éé 	
}
èè 
}êê ª
üC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.Infrastructure\EntityConfigurations\ProductEntityTypeConfiguration.cs
	namespace 	
Catalog
 
. 
Infrastructure  
.  ! 
EntityConfigurations! 5
{ 
public 

class *
ProductEntityTypeConfiguration /
:0 1$
IEntityTypeConfiguration2 J
<J K
ProductK R
>R S
{ 
public		 
void		 
	Configure		 
(		 
EntityTypeBuilder		 /
<		/ 0
Product		0 7
>		7 8
builder		9 @
)		@ A
{

 	
builder 
. 
ToTable 
( 
$str &
,& '
CatalogContext( 6
.6 7
DEFAULT_SCHEMA7 E
)E F
;F G
builder 
. 
HasKey 
( 
p 
=> 
p  !
.! "
Id" $
)$ %
;% &
builder 
. 
Ignore 
( 
p 
=> 
p  !
.! "
DomainEvents" .
). /
;/ 0
builder 
. 
Property 
( 
p 
=> !
p" #
.# $
Id$ &
)& '
;' (
builder 
. 
Property 
( 
p 
=> !
p" #
.# $
Code$ (
)( )
.) *

IsRequired* 4
(4 5
)5 6
;6 7
builder 
. 
Property 
( 
p 
=> !
p" #
.# $
Name$ (
)( )
.) *

IsRequired* 4
(4 5
)5 6
;6 7
builder 
. 
Property 
( 
p 
=> !
p" #
.# $
Description$ /
)/ 0
.0 1
HasDefaultValue1 @
(@ A
nullA E
)E F
;F G
builder 
. 
Property 
( 
p 
=> !
p" #
.# $
Owner$ )
)) *
.* +

IsRequired+ 5
(5 6
)6 7
;7 8
builder 
. 
Property 
( 
p 
=> !
p" #
.# $
Price$ )
)) *
.* +

IsRequired+ 5
(5 6
)6 7
;7 8
builder 
. 
Property 
( 
p 
=> !
p" #
.# $
Amount$ *
)* +
.+ ,

IsRequired, 6
(6 7
)7 8
;8 9
builder 
. 
Ignore 
( 
x 
=> 
x 
. 
ProductStatus ,
), -
. 
Property 
< 
int 
> 
( 
$str 1
)1 2
. !
UsePropertyAccessMode &
(& '
PropertyAccessMode' 9
.9 :
Field: ?
)? @
. 
HasColumnName 
( 
$str 0
)0 1
. 

IsRequired 
( 
) 
; 
builder   
.   
HasOne   
(   
o   
=>   
o    !
.  ! "
ProductStatus  " /
)  / 0
.!! 
WithMany!! 
(!! 
)!! 
."" 
HasForeignKey"" 
("" 
$str"" 1
)""1 2
;""2 3
}$$ 	
}%% 
}&& ä
•C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.Infrastructure\EntityConfigurations\ProductStatusEntityTypeConfiguration.cs
	namespace 	
Catalog
 
. 
Infrastructure  
.  ! 
EntityConfigurations! 5
{ 
public 

class 0
$ProductStatusEntityTypeConfiguration 5
:6 7$
IEntityTypeConfiguration8 P
<P Q
ProductStatusQ ^
>^ _
{ 
public		 
void		 
	Configure		 
(		 
EntityTypeBuilder		 /
<		/ 0
ProductStatus		0 =
>		= >
builder		? F
)		F G
{

 	
builder 
. 
ToTable 
( 
$str ,
,, -
CatalogContext. <
.< =
DEFAULT_SCHEMA= K
)K L
;L M
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
} –
}C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.Infrastructure\MediatorExtension.cs
	namespace 	
Catalog
 
. 
Infrastructure  
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
R S
CatalogContext

T b
ctx

c f
)

f g
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
} ﬁ
äC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\Services\Catalog\Catalog.Infrastructure\Repositories\ProductRepository.cs
	namespace 	
Catalog
 
. 
Infrastructure  
.  !
Repositories! -
{ 
public		 

class		 
ProductRepository		 "
:		# $
IProductRepository		% 7
{

 
private 
readonly 
CatalogContext '
_context( 0
;0 1
public 
IUnitOfWork 

UnitOfWork %
{ 	
get 
{ 
return 
_context 
;  
} 
} 	
public 
ProductRepository  
(  !
CatalogContext! /
context0 7
)7 8
{ 	
_context 
= 
context 
?? !
throw" '
new( +!
ArgumentNullException, A
(A B
nameofB H
(H I
contextI P
)P Q
)Q R
;R S
} 	
public 
Product 
Add 
( 
Product "
item# '
)' (
{ 	
return 
_context 
. 
Products $
.$ %
Add% (
(( )
item) -
)- .
.. /
Entity/ 5
;5 6
} 	
public 
async 
Task 
< 
Product !
>! "
GetAsync# +
(+ ,
int, /
	productId0 9
)9 :
{   	
return!! 
await!! 
_context!! !
.!!! "
Products!!" *
.!!* +
FirstOrDefaultAsync!!+ >
(!!> ?
x!!? @
=>!!A C
x!!D E
.!!E F
Id!!F H
==!!I K
	productId!!L U
)!!U V
;!!V W
}"" 	
public$$ 
void$$ 
Update$$ 
($$ 
Product$$ "
item$$# '
)$$' (
{%% 	
_context&& 
.&& 
Entry&& 
(&& 
item&& 
)&&  
.&&  !
State&&! &
=&&' (
EntityState&&) 4
.&&4 5
Modified&&5 =
;&&= >
}'' 	
public)) 
void)) 
Remove)) 
()) 
Product)) "
product))# *
)))* +
{** 	
_context++ 
.++ 
Products++ 
.++ 
Remove++ $
(++$ %
product++% ,
)++, -
;++- .
},, 	
}-- 
}.. 