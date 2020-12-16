/PROG  _PRISE_DEPOSE2
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 998;
CREATE		= DATE 17-01-04  TIME 15:14:52;
MODIFIED	= DATE 17-01-04  TIME 15:14:52;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 15;
MEMORY_SIZE	= 1310;
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
   6:J P[1] 100% FINE    ;
   7:  ! Pickup ('carton') From ('Convoy ;
   8:  WAIT   1.00(sec) ;
   9:L P[2] 4000mm/sec CNT50 Offset,PR[8]    ;
  10:L P[3] 4000mm/sec FINE Offset,PR[8]    ;
  11:J P[4] 100% FINE Offset,PR[7]    ;
  12:  ! Drop ('carton') From ('UT: 1  ( ;
  13:  WAIT    .50(sec) ;
  14:J P[5] 100% CNT50 Offset,PR[8]    ;
  15:L P[6] 4000mm/sec FINE Offset,PR[5]    ;
/POS
P[1]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X =    34.020  mm,	Y =  1363.550  mm,	Z =  1411.530  mm,
	W =   180.000 deg,	P =      .010 deg,	R =      .020 deg
};
P[2]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X =  -484.260  mm,	Y =  1330.120  mm,	Z =  1867.480  mm,
	W =  -179.990 deg,	P =     0.000 deg,	R =      .020 deg
};
P[3]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X = -1639.780  mm,	Y =   523.550  mm,	Z =  1567.480  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg
};
P[4]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X = -1639.780  mm,	Y =   523.550  mm,	Z =  1567.480  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg
};
P[5]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X =  -484.260  mm,	Y =  1330.120  mm,	Z =  1867.480  mm,
	W =  -179.990 deg,	P =     0.000 deg,	R =      .020 deg
};
P[6]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X =    34.020  mm,	Y =  1363.550  mm,	Z =  1411.530  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg
};
/END
