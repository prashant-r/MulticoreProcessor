SEGMENT CodeSegment :
Goto:
ADD R1, R7, 9; 
NOT R4, R3;
NOP
NOP
NOP
NOP
NOP
NOP
ADD R4, R4, R3;
NOP
NOP
NOP
NOP
NOP
STR R1, R0, SEVEN ;
NOP
NOP
NOP
NOP
NOP
NOP
LDR R6, R0, SEVEN ;
NOP
NOP
BRn Goto;
SEVEN:	DATA2 4x0007 
NOP 
NOP 
NOP 
NOP 
AND R5, R2, R3; 
AND R1, R1, 7; 
DONE:
BRnzp DONE ;

