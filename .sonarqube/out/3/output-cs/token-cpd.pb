?5
zC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\SeedWork\BuildingBlocks.SeedWork\Entity.cs
	namespace 	
BuldingBlocks
 
. 
SeedWork  
{ 
public 

abstract 
class 
Entity  
{ 
int		 
?		 
_requestedHashCode		 
;		  
int

 
_Id

 
;

 
public 
virtual 
int 
Id 
{ 	
get 
{ 
return 
_Id 
; 
} 
	protected 
set 
{ 
_Id 
= 
value 
; 
} 
} 	
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
	protected) 2
set3 6
;6 7
}8 9
public 
DateTime 
? 
	UpdatedAt "
{# $
get% (
;( )
	protected* 3
set4 7
;7 8
}9 :
private 
List 
< 
INotification "
>" #
_domainEvents$ 1
;1 2
public 
IReadOnlyCollection "
<" #
INotification# 0
>0 1
DomainEvents2 >
=>? A
_domainEventsB O
?O P
.P Q

AsReadOnlyQ [
([ \
)\ ]
;] ^
	protected 
Entity 
( 
) 
{ 	
	CreatedAt 
= 
DateTime  
.  !
UtcNow! '
;' (
} 	
public   
void   
AddDomainEvent   "
(  " #
INotification  # 0
	eventItem  1 :
)  : ;
{!! 	
_domainEvents"" 
="" 
_domainEvents"" )
??""* ,
new""- 0
List""1 5
<""5 6
INotification""6 C
>""C D
(""D E
)""E F
;""F G
_domainEvents## 
.## 
Add## 
(## 
	eventItem## '
)##' (
;##( )
}$$ 	
public&& 
void&& 
RemoveDomainEvent&& %
(&&% &
INotification&&& 3
	eventItem&&4 =
)&&= >
{'' 	
_domainEvents(( 
?(( 
.(( 
Remove(( !
(((! "
	eventItem((" +
)((+ ,
;((, -
})) 	
public++ 
void++ 
ClearDomainEvents++ %
(++% &
)++& '
{,, 	
_domainEvents-- 
?-- 
.-- 
Clear--  
(--  !
)--! "
;--" #
}.. 	
public00 
bool00 
IsTransient00 
(00  
)00  !
{11 	
return22 
this22 
.22 
Id22 
==22 
default22 %
(22% &
Int3222& +
)22+ ,
;22, -
}33 	
public55 
override55 
bool55 
Equals55 #
(55# $
object55$ *
obj55+ .
)55. /
{66 	
if77 
(77 
obj77 
==77 
null77 
||77 
!77  
(77  !
obj77! $
is77% '
Entity77( .
)77. /
)77/ 0
return88 
false88 
;88 
if:: 
(:: 
Object:: 
.:: 
ReferenceEquals:: &
(::& '
this::' +
,::+ ,
obj::- 0
)::0 1
)::1 2
return;; 
true;; 
;;; 
if== 
(== 
this== 
.== 
GetType== 
(== 
)== 
!=== !
obj==" %
.==% &
GetType==& -
(==- .
)==. /
)==/ 0
return>> 
false>> 
;>> 
Entity@@ 
item@@ 
=@@ 
(@@ 
Entity@@ !
)@@! "
obj@@" %
;@@% &
ifBB 
(BB 
itemBB 
.BB 
IsTransientBB  
(BB  !
)BB! "
||BB# %
thisBB& *
.BB* +
IsTransientBB+ 6
(BB6 7
)BB7 8
)BB8 9
returnCC 
falseCC 
;CC 
elseDD 
returnEE 
itemEE 
.EE 
IdEE 
==EE !
thisEE" &
.EE& '
IdEE' )
;EE) *
}FF 	
publicHH 
overrideHH 
intHH 
GetHashCodeHH '
(HH' (
)HH( )
{II 	
ifJJ 
(JJ 
!JJ 
IsTransientJJ 
(JJ 
)JJ 
)JJ 
{KK 
ifLL 
(LL 
!LL 
_requestedHashCodeLL '
.LL' (
HasValueLL( 0
)LL0 1
_requestedHashCodeMM &
=MM' (
thisMM) -
.MM- .
IdMM. 0
.MM0 1
GetHashCodeMM1 <
(MM< =
)MM= >
^MM? @
$numMMA C
;MMC D
returnOO 
_requestedHashCodeOO )
.OO) *
ValueOO* /
;OO/ 0
}PP 
elseQQ 
returnRR 
baseRR 
.RR 
GetHashCodeRR '
(RR' (
)RR( )
;RR) *
}TT 	
publicUU 
staticUU 
boolUU 
operatorUU #
==UU$ &
(UU& '
EntityUU' -
leftUU. 2
,UU2 3
EntityUU4 :
rightUU; @
)UU@ A
{VV 	
ifWW 
(WW 
ObjectWW 
.WW 
EqualsWW 
(WW 
leftWW "
,WW" #
nullWW$ (
)WW( )
)WW) *
returnXX 
(XX 
ObjectXX 
.XX 
EqualsXX %
(XX% &
rightXX& +
,XX+ ,
nullXX- 1
)XX1 2
)XX2 3
?XX4 5
trueXX6 :
:XX; <
falseXX= B
;XXB C
elseYY 
returnZZ 
leftZZ 
.ZZ 
EqualsZZ "
(ZZ" #
rightZZ# (
)ZZ( )
;ZZ) *
}[[ 	
public]] 
static]] 
bool]] 
operator]] #
!=]]$ &
(]]& '
Entity]]' -
left]]. 2
,]]2 3
Entity]]4 :
right]]; @
)]]@ A
{^^ 	
return__ 
!__ 
(__ 
left__ 
==__ 
right__ "
)__" #
;__# $
}`` 	
}aa 
}bb ?9
C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\SeedWork\BuildingBlocks.SeedWork\Enumeration.cs
	namespace 	
BuldingBlocks
 
. 
SeedWork  
{ 
public 

abstract 
class 
Enumeration %
:& '
IComparable( 3
{		 
public

 
string

 
Name
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
  !
private

" )
set

* -
;

- .
}

/ 0
public 
int 
Id 
{ 
get 
; 
private $
set% (
;( )
}* +
	protected 
Enumeration 
( 
int !
id" $
,$ %
string& ,
name- 1
)1 2
=>3 5
(6 7
Id7 9
,9 :
Name; ?
)? @
=A B
(C D
idD F
,F G
nameH L
)L M
;M N
public 
override 
string 
ToString '
(' (
)( )
=>* ,
Name- 1
;1 2
public 
static 
IEnumerable !
<! "
T" #
># $
GetAll% +
<+ ,
T, -
>- .
(. /
)/ 0
where1 6
T7 8
:9 :
Enumeration; F
=>G I
typeof 
( 
T 
) 
. 
	GetFields 
(  
BindingFlags  ,
., -
Public- 3
|4 5
BindingFlags  ,
., -
Static- 3
|4 5
BindingFlags  ,
., -
DeclaredOnly- 9
)9 :
. 
Select 
( 
f 
=> !
f" #
.# $
GetValue$ ,
(, -
null- 1
)1 2
)2 3
. 
Cast 
< 
T 
> 
( 
) 
;  
public 
override 
bool 
Equals #
(# $
object$ *
obj+ .
). /
{ 	
if 
( 
obj 
is 
not 
Enumeration &

otherValue' 1
)1 2
{ 
return 
false 
; 
} 
var   
typeMatches   
=   
GetType   %
(  % &
)  & '
.  ' (
Equals  ( .
(  . /
obj  / 2
.  2 3
GetType  3 :
(  : ;
)  ; <
)  < =
;  = >
var!! 
valueMatches!! 
=!! 
Id!! !
.!!! "
Equals!!" (
(!!( )

otherValue!!) 3
.!!3 4
Id!!4 6
)!!6 7
;!!7 8
return## 
typeMatches## 
&&## !
valueMatches##" .
;##. /
}$$ 	
public&& 
override&& 
int&& 
GetHashCode&& '
(&&' (
)&&( )
=>&&* ,
Id&&- /
.&&/ 0
GetHashCode&&0 ;
(&&; <
)&&< =
;&&= >
public(( 
static(( 
int(( 
AbsoluteDifference(( ,
(((, -
Enumeration((- 8

firstValue((9 C
,((C D
Enumeration((E P
secondValue((Q \
)((\ ]
{)) 	
var** 
absoluteDifference** "
=**# $
Math**% )
.**) *
Abs*** -
(**- .

firstValue**. 8
.**8 9
Id**9 ;
-**< =
secondValue**> I
.**I J
Id**J L
)**L M
;**M N
return++ 
absoluteDifference++ %
;++% &
},, 	
public.. 
static.. 
T.. 
	FromValue.. !
<..! "
T.." #
>..# $
(..$ %
int..% (
value..) .
)... /
where..0 5
T..6 7
:..8 9
Enumeration..: E
{// 	
var00 
matchingItem00 
=00 
Parse00 $
<00$ %
T00% &
,00& '
int00( +
>00+ ,
(00, -
value00- 2
,002 3
$str004 ;
,00; <
item00= A
=>00B D
item00E I
.00I J
Id00J L
==00M O
value00P U
)00U V
;00V W
return11 
matchingItem11 
;11  
}22 	
public44 
static44 
T44 
FromDisplayName44 '
<44' (
T44( )
>44) *
(44* +
string44+ 1
displayName442 =
)44= >
where44? D
T44E F
:44G H
Enumeration44I T
{55 	
var66 
matchingItem66 
=66 
Parse66 $
<66$ %
T66% &
,66& '
string66( .
>66. /
(66/ 0
displayName660 ;
,66; <
$str66= K
,66K L
item66M Q
=>66R T
item66U Y
.66Y Z
Name66Z ^
==66_ a
displayName66b m
)66m n
;66n o
return77 
matchingItem77 
;77  
}88 	
private:: 
static:: 
T:: 
Parse:: 
<:: 
T::  
,::  !
K::" #
>::# $
(::$ %
K::% &
value::' ,
,::, -
string::. 4
description::5 @
,::@ A
Func::B F
<::F G
T::G H
,::H I
bool::J N
>::N O
	predicate::P Y
)::Y Z
where::[ `
T::a b
:::c d
Enumeration::e p
{;; 	
var<< 
matchingItem<< 
=<< 
GetAll<< %
<<<% &
T<<& '
><<' (
(<<( )
)<<) *
.<<* +
FirstOrDefault<<+ 9
(<<9 :
	predicate<<: C
)<<C D
;<<D E
if>> 
(>> 
matchingItem>> 
==>> 
null>>  $
)>>$ %
throw?? 
new?? %
InvalidOperationException?? 3
(??3 4
$"??4 6
$str??6 7
{??7 8
value??8 =
}??= >
$str??> O
{??O P
description??P [
}??[ \
$str??\ `
{??` a
typeof??a g
(??g h
T??h i
)??i j
}??j k
"??k l
)??l m
;??m n
returnAA 
matchingItemAA 
;AA  
}BB 	
publicDD 
intDD 
	CompareToDD 
(DD 
objectDD #
otherDD$ )
)DD) *
=>DD+ -
IdDD. 0
.DD0 1
	CompareToDD1 :
(DD: ;
(DD; <
(DD< =
EnumerationDD= H
)DDH I
otherDDI N
)DDN O
.DDO P
IdDDP R
)DDR S
;DDS T
}EE 
}FF ?
?C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\SeedWork\BuildingBlocks.SeedWork\IAggregateRoot.cs
	namespace 	
BuldingBlocks
 
. 
SeedWork  
{ 
public 

	interface 
IAggregateRoot #
{$ %
}& '
} ?
C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\SeedWork\BuildingBlocks.SeedWork\IRepository.cs
	namespace 	
BuldingBlocks
 
. 
SeedWork  
{ 
public 

	interface 
IRepository  
<  !
T! "
>" #
where$ )
T* +
:, -
IAggregateRoot. <
{ 
IUnitOfWork 

UnitOfWork 
{  
get! $
;$ %
}& '
} 
} ?
C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\SeedWork\BuildingBlocks.SeedWork\IUnitOfWork.cs
	namespace 	
BuldingBlocks
 
. 
SeedWork  
{ 
public 

	interface 
IUnitOfWork  
:! "
IDisposable# .
{ 
Task		 
<		 
int		 
>		 
SaveChangesAsync		 "
(		" #
CancellationToken		# 4
cancellationToken		5 F
=		G H
default		I P
(		P Q
CancellationToken		Q b
)		b c
)		c d
;		d e
Task

 
<

 
bool

 
>

 
SaveEntitiesAsync

 $
(

$ %
CancellationToken

% 6
cancellationToken

7 H
=

I J
default

K R
(

R S
CancellationToken

S d
)

d e
)

e f
;

f g
} 
} ?
C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\SeedWork\BuildingBlocks.SeedWork\ValueObject.cs
	namespace 	
BuldingBlocks
 
. 
SeedWork  
{ 
public 

abstract 
class 
ValueObject %
{ 
	protected		 
static		 
bool		 
EqualOperator		 +
(		+ ,
ValueObject		, 7
left		8 <
,		< =
ValueObject		> I
right		J O
)		O P
{

 	
if 
( 
ReferenceEquals 
(  
left  $
,$ %
null& *
)* +
^, -
ReferenceEquals. =
(= >
right> C
,C D
nullE I
)I J
)J K
{ 
return 
false 
; 
} 
return 
ReferenceEquals "
(" #
left# '
,' (
null) -
)- .
||/ 1
left2 6
.6 7
Equals7 =
(= >
right> C
)C D
;D E
} 	
	protected 
static 
bool 
NotEqualOperator .
(. /
ValueObject/ :
left; ?
,? @
ValueObjectA L
rightM R
)R S
{ 	
return 
! 
( 
EqualOperator "
(" #
left# '
,' (
right) .
). /
)/ 0
;0 1
} 	
	protected 
abstract 
IEnumerable &
<& '
object' -
>- .!
GetEqualityComponents/ D
(D E
)E F
;F G
public 
override 
bool 
Equals #
(# $
object$ *
obj+ .
). /
{ 	
if 
( 
obj 
== 
null 
|| 
obj "
." #
GetType# *
(* +
)+ ,
!=- /
GetType0 7
(7 8
)8 9
)9 :
{ 
return 
false 
; 
} 
var   
other   
=   
(   
ValueObject   $
)  $ %
obj  % (
;  ( )
return"" 
this"" 
."" !
GetEqualityComponents"" -
(""- .
)"". /
.""/ 0
SequenceEqual""0 =
(""= >
other""> C
.""C D!
GetEqualityComponents""D Y
(""Y Z
)""Z [
)""[ \
;""\ ]
}## 	
public%% 
override%% 
int%% 
GetHashCode%% '
(%%' (
)%%( )
{&& 	
return'' !
GetEqualityComponents'' (
(''( )
)'') *
.(( 
Select(( 
((( 
x(( 
=>(( 
x(( 
!=(( 
null(( #
?(($ %
x((& '
.((' (
GetHashCode((( 3
(((3 4
)((4 5
:((6 7
$num((8 9
)((9 :
.)) 
	Aggregate)) 
()) 
()) 
x)) 
,)) 
y)) 
))) 
=>)) !
x))" #
^))$ %
y))& '
)))' (
;))( )
}** 	
public,, 
ValueObject,, 
GetCopy,, "
(,," #
),,# $
{-- 	
return.. 
this.. 
... 
MemberwiseClone.. '
(..' (
)..( )
as..* ,
ValueObject..- 8
;..8 9
}// 	
}00 
}11 