/PROG  CHGT_REPERE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1613;
CREATE		= DATE 11-09-27  TIME 15:03:58;
MODIFIED	= DATE 11-09-27  TIME 17:05:32;
FILE_NAME	= DENT_DE_;
VERSION		= 0;
LINE_COUNT	= 47;
MEMORY_SIZE	= 2053;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL
/APPL
/MN
   1:  PR[1]=LPOS-LPOS    ;
   2:  R[1]=0    ;
   3:  R[2]=0    ;
   4:   ;
   5:  PR[1]=UFRAME[1] ;
   6:  PR[2]=UFRAME[2] ;
   7:J P[1] 100% FINE    ;
   8:  LBL[1] ;
   9:  IF R[1]=0,JMP LBL[2] ;
  10:  IF R[1]=1,JMP LBL[4] ;
  11:  IF R[1]=2,JMP LBL[8] ;
  12:  LBL[2] ;
  13:  UFRAME[1]=PR[1] ;
  14:J P[11] 100% FINE    ;
  15:  JMP LBL[10] ;
  16:   ;
  17:  LBL[4] ;
  18:J P[11] 100% FINE    ;
  19:  UFRAME[1]=PR[2] ;
  20:  JMP LBL[10] ;
  21:   ;
  22:  LBL[8] ;
  23:  UFRAME[1]=PR[1] ;
  24:J P[11] 100% FINE    ;
  25:  R[1]=0    ;
  26:  R[2]=R[2]+1    ;
  27:   ;
  28:  IF R[2]>=2,JMP LBL[100] ;
  29:   ;
  30:  LBL[10] ;
  31:  UFRAME_NUM=1 ;
  32:  UTOOL_NUM=1 ;
  33:J P[2] 100% FINE    ;
  34:L P[3] 2000mm/sec FINE    ;
  35:J P[4] 100% FINE    ;
  36:J P[5] 100% FINE    ;
  37:J P[6] 100% FINE    ;
  38:J P[7] 100% FINE    ;
  39:J P[8] 100% FINE    ;
  40:J P[9] 100% FINE    ;
  41:L P[10] 2000mm/sec FINE    ;
  42:J P[2] 100% FINE    ;
  43:  R[1]=R[1]+1    ;
  44:  JMP LBL[1] ;
  45:  LBL[100] ;
  46:  UFRAME[1]=PR[1] ;
  47:J P[1] 100% FINE    ;
/POS
P[1]{
   GP1:
	UF : 1, UT : 1,	
	J1=     -.001 deg,	J2=      .000 deg,	J3=     -.000 deg,
	J4=     0.000 deg,	J5=     0.000 deg,	J6=     -.002 deg
};
P[2]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -120.000  mm,	Y =  -100.000  mm,	Z =    -2.557  mm,
	W =   179.700 deg,	P =     -.170 deg,	R =    88.648 deg
};
P[3]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -100.000  mm,	Y =  -200.000  mm,	Z =    -2.557  mm,
	W =   179.700 deg,	P =     -.170 deg,	R =    88.648 deg
};
P[4]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -100.000  mm,	Y =  -150.000  mm,	Z =    -2.557  mm,
	W =   179.700 deg,	P =     -.170 deg,	R =    88.648 deg
};
P[5]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   -70.000  mm,	Y =  -200.000  mm,	Z =    -2.557  mm,
	W =   179.700 deg,	P =     -.170 deg,	R =    88.648 deg
};
P[6]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   -70.000  mm,	Y =  -150.000  mm,	Z =    -2.557  mm,
	W =   179.700 deg,	P =     -.170 deg,	R =    88.648 deg
};
P[7]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   -40.000  mm,	Y =  -200.000  mm,	Z =    -2.557  mm,
	W =   179.700 deg,	P =     -.170 deg,	R =    88.648 deg
};
P[8]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   -40.000  mm,	Y =  -150.000  mm,	Z =    -2.557  mm,
	W =   179.700 deg,	P =     -.170 deg,	R =    88.648 deg
};
P[9]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =  -200.000  mm,	Z =    -2.557  mm,
	W =   179.700 deg,	P =     -.170 deg,	R =    88.648 deg
};
P[10]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =  -100.000  mm,	Z =    -2.557  mm,
	W =   179.700 deg,	P =     -.170 deg,	R =    88.648 deg
};
P[11]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   337.340  mm,	Y =  -246.114  mm,	Z =   496.700  mm,
	W =   158.767 deg,	P =   -36.122 deg,	R =    67.785 deg
};
/END
