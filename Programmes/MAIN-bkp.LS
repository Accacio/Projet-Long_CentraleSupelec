/PROG  MAIN
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2359;
CREATE		= DATE 16-12-13  TIME 14:45:42;
MODIFIED	= DATE 17-01-17  TIME 11:55:30;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 89;
MEMORY_SIZE	= 2795;
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
   1:  ! Parametrage de la production ;
   2:  R[4]=600    ;
   3:  R[5]=350    ;
   4:  R[6]=2    ;
   5:  R[7]=6    ;
   6:  R[8]=150    ;
   13: R[9]=2    ;
   7:  OVERRIDE=100% ;
   8:  !Init des variables ;
   9:  UTOOL_NUM[GP1]=1 ;
  10:  UFRAME_NUM[GP1]=1 ;
  11:  PAYLOAD[1] ;
  
  13:  R[10]=0    ;
  49:  LBL[4] ;  
  
  12:  R[1]=0   ;
  13:  R[2]=0    ;
  14:  PR[2]=LPOS    ;
  15:  !Approach distance box conv ;
  16:  PR[2]=PR[2]-PR[2]    ;
  17:  !Avoid shock with other box ;
  18:  PR[3]=PR[2]    ;
  19:  !Position Y Z ;
  20:  PR[4]=PR[2]    ;
  21:  !Approach distance box in palette ;
  22:  PR[5]=PR[2]    ;
  23:  !Avoid shock with other box ;
  24:  PR[6]=PR[2]    ;
  25:  PR[2,3]=R[8]    ;
  26:  !SET OUTPUTS ;
  27:  DO[2]=OFF ;
  28:  DO[3]=OFF ;
  29:  DO[5]=OFF ;
  30:  DO[1]=ON ;
  31:  DO[4]=ON ;
  32:  WAIT DI[3]=ON    ;
  33:  WAIT DI[2]=ON    ;
  34:  DO[1]=OFF ;
  35:  DO[4]=OFF ;
  36:  !Init Position Robot ;
  37:J PR[1] 100% CNT10 Offset,PR[5]    ;
  38:  !Rebouclage ;
  39:  LBL[1] ;
  40:  !Calcul de positionnement Y et Z ;
  41:  PR[4,1]=(-1)*R[1]*R[4]    ;
  42:  PR[4,3]=R[2]*R[5]    ;
  43:  PR[5]=PR[4]    ;
  44:  PR[5,3]=PR[5,3]+PR[2,3]    ;
  45:  PR[6]=PR[5]    ;
  46:  PR[6,3]=PR[6,3]+R[5]    ;
  47:  PR[3,3]=PR[2,3]    ;
  48:  IF R[2]>1,JMP LBL[2] ;
  49:  JMP LBL[3] ;
  50:  LBL[2] ;
  51:  PR[3,3]=PR[5,3]-R[5]    ;
  52:  LBL[3] ;
  
  53:  !Get a box and Palette ;
  54:  DO[4]=ON ;
  55:  WAIT DI[2]=ON    ;
  58:  DO[2]=ON ;

  60:  WAIT DI[4]=ON    ;
  62:  CALL DROP_PAL1    ;
  63:  DO[2]=OFF ;

  

  56:  WAIT DI[6]=ON    ;
  57:  DO[4]=OFF ;
  59:  DO[5]=ON ;  
  61:  WAIT DI[1]=ON    ;
  64:  DO[5]=OFF ;

  
  66:  CALL PRISEDEPOSE_CONV    ;
  67:  !Gestion Compteur Y ;
  68:  R[1]=R[1]+1    ;
  69:  !Fin d'une ligne en Y ? ;
  70:  IF R[1]<R[6],JMP LBL[1] ;
  71:  !Gestion Compteur Z ;
  72:  R[2]=R[2]+1    ;
  73:  !RAZ Compteur Y ;
  74:  R[1]=0    ;
  75:  !Fin du plateau en Z ? ;
  76:  IF R[2]<R[7],JMP LBL[1] ;
  77:  DO[3]=ON ;
  78:  WAIT DI[5]=ON    ;
  79:  CALL TAKE_FULL_PALETTE    ;
  85:  WAIT    .20(sec) ;
  80:  CALL DROP_MOVPAL    ;

  81:  DO[3]=OFF ;
  82:  DO[1]=ON ;
  83:  WAIT DI[3]=ON    ;
  80:  CALL PICK_pal1    ;
  72:  R[10]=R[10]+1    ;
  49:  IF R[10]<R[9],JMP LBL[4] ;
  
  
  88:  !Init Position Robot ;
  89:J PR[1] 100% CNT100    ;
/POS
P[1]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 1',
	X =   291.500  mm,	Y =  1359.210  mm,	Z =  1413.350  mm,
	W =   180.000 deg,	P =      .010 deg,	R =      .020 deg
};
P[2]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 1',
	X =   291.500  mm,	Y =  1359.210  mm,	Z =  1413.350  mm,
	W =   180.000 deg,	P =      .010 deg,	R =      .020 deg
};
P[3]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X =   867.910  mm,	Y =  1391.310  mm,	Z =  2062.260  mm,
	W =   180.000 deg,	P =      .010 deg,	R =      .020 deg
};
P[4]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X =  1639.820  mm,	Y =      .720  mm,	Z =  1566.130  mm,
	W =   180.000 deg,	P =      .010 deg,	R =      .020 deg
};
P[5]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0',
	X = -1639.820  mm,	Y =      .040  mm,	Z =  1566.130  mm,
	W =   180.000 deg,	P =      .010 deg,	R =      .020 deg
};
/END
