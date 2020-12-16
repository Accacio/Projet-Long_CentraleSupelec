/PROG  _PRISE_DEPOSE1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1059;
CREATE		= DATE 17-01-04  TIME 15:14:44;
MODIFIED	= DATE 17-01-04  TIME 15:14:46;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 16;
MEMORY_SIZE	= 1367;
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
   9:J P[2] 100% CNT10 Offset,PR[5]    ;
  10:L P[3] 4000mm/sec CNT100 Offset,PR[8]    ;
  11:L P[4] 4000mm/sec FINE Offset,PR[8]    ;
  12:L P[5] 4000mm/sec FINE Offset,PR[7]    ;
  13:  ! Drop ('carton') From ('UT: 1  ( ;
  14:  WAIT    .50(sec) ;
  15:J P[6] 100% CNT100 Offset,PR[8]    ;
  16:L P[7] 4000mm/sec FINE Offset,PR[5]    ;
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
	X =    34.020  mm,	Y =  1363.550  mm,	Z =  1411.530  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =      .020 deg
};
P[3]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X = -1144.510  mm,	Y =  1174.300  mm,	Z =  1867.480  mm,
	W =   180.000 deg,	P =      .010 deg,	R =    -1.000 deg
};
P[4]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X = -1639.780  mm,	Y =  -443.000  mm,	Z =  1567.480  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg
};
P[5]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X = -1639.780  mm,	Y =  -443.000  mm,	Z =  1567.480  mm,
	W =  -180.000 deg,	P =     0.000 deg,	R =     0.000 deg
};
P[6]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X = -1144.510  mm,	Y =  1174.300  mm,	Z =  1567.480  mm,
	W =  -180.000 deg,	P =      .010 deg,	R =      .020 deg
};
P[7]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X =    34.020  mm,	Y =  1363.550  mm,	Z =  1411.530  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg
};
/END
