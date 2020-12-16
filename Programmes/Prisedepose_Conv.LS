/PROG  PRISEDEPOSE_CONV
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1148;
CREATE		= DATE 17-01-18  TIME 12:01:08;
MODIFIED	= DATE 17-01-18  TIME 12:01:08;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 19;
MEMORY_SIZE	= 1444;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/MN
   1:  !FANUC America Corp. ;
   2:  !ROBOGUIDE Generated This TPP ;
   3:  !Run SimPRO.cf to setup frame and ;
   4:  UTOOL_NUM[GP1]=1 ;
   5:  UFRAME_NUM[GP1]=1 ;
   6:L P[1] 4000mm/sec FINE Offset,PR[2]    ;
   7:L P[2] 4000mm/sec FINE    ;
   8:  ! Pickup ('carton') From ('Convoy ;
   9:  WAIT   1.00(sec) ;
  10:  PAYLOAD[2] ;
  11:L P[3] 4000mm/sec FINE Offset,PR[3]    ;
  12:L P[4] 4000mm/sec FINE Offset,PR[6]    ;
  13:L P[5] 4000mm/sec FINE Offset,PR[5]    ;
  14:L P[6] 4000mm/sec FINE Offset,PR[4]    ;
  15:  ! Drop ('carton') From ('UT: 1  ( ;
  16:  WAIT    .50(sec) ;
  17:  PAYLOAD[1] ;
  18:L P[7] 4000mm/sec FINE Offset,PR[6]    ;
  19:L P[8] 4000mm/sec FINE Offset,PR[3]    ;
/POS
P[1]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X =  -635.760  mm,	Y =   978.880  mm,	Z =  2014.350  mm,
	W =  -180.000 deg,	P =     0.000 deg,	R =     0.000 deg
};
P[2]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X =  -635.760  mm,	Y =   978.880  mm,	Z =  2014.350  mm,
	W =  -180.000 deg,	P =     0.000 deg,	R =     0.000 deg
};
P[3]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X =  -635.760  mm,	Y =   978.880  mm,	Z =  2014.350  mm,
	W =  -180.000 deg,	P =     0.000 deg,	R =     0.000 deg
};
P[4]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X =   615.020  mm,	Y =   979.850  mm,	Z =  1567.480  mm,
	W =  -180.000 deg,	P =     0.000 deg,	R =     0.000 deg
};
P[5]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X =   615.020  mm,	Y =   979.850  mm,	Z =  1567.480  mm,
	W =  -180.000 deg,	P =     0.000 deg,	R =     0.000 deg
};
P[6]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X =   615.020  mm,	Y =   979.850  mm,	Z =  1567.480  mm,
	W =  -180.000 deg,	P =     0.000 deg,	R =     0.000 deg
};
P[7]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X =   615.020  mm,	Y =   979.850  mm,	Z =  1567.480  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg
};
P[8]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X =  -635.760  mm,	Y =   978.880  mm,	Z =  2014.350  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg
};
/END
