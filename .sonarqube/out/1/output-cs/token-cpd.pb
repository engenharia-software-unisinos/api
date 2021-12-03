Ë
ƒC:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\Identity\BuildingBlocks.Identity\IdentityService.cs
	namespace 	
BuildingBlocks
 
. 
Identity !
{ 
public 

class 
IdentityService  
:! "
IIdentityService# 3
{ 
private		  
IHttpContextAccessor		 $
_context		% -
;		- .
public 
IdentityService 
(  
IHttpContextAccessor 3
context4 ;
); <
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
public 
Guid 
GetUserIdentity #
(# $
)$ %
{ 	
return 
Guid 
. 
Parse 
( 
_context &
.& '
HttpContext' 2
.2 3
User3 7
.7 8
	FindFirst8 A
(A B

ClaimTypesB L
.L M
NameIdentifierM [
)[ \
.\ ]
Value] b
)b c
;c d
} 	
public 
string 
GetUserName !
(! "
)" #
{ 	
return 
_context 
. 
HttpContext '
.' (
User( ,
., -
Identity- 5
.5 6
Name6 :
;: ;
} 	
} 
} ”
„C:\Projects\eng-software-unisinos\Unisinos.EngSoftware.EShop\src\BuildingBlocks\Identity\BuildingBlocks.Identity\IIdentityService.cs
	namespace 	
BuildingBlocks
 
. 
Identity !
{ 
public 

	interface 
IIdentityService %
{ 
Guid 
GetUserIdentity 
( 
) 
; 
string 
GetUserName 
( 
) 
; 
}		 
}

 