/PROG  TESTE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1729;
CREATE		= DATE 16-12-13  TIME 14:45:42;
MODIFIED	= DATE 17-01-04  TIME 15:10:24;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 54;
MEMORY_SIZE	= 2161;
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
   2:  R[4:Taille Piece Y]=600    ;
   3:  R[5:Taille Piece Z]=350    ;
   4:  R[6:Nbr piece Y]=2    ;
   5:  R[7:Nbr Piece Z]=6    ;
   6:  R[8:Degagement Prise]=150    ;
   7:  R[9:Approche Depose]=150    ;
   8:  OVERRIDE=100% ;
   9:  !Init des variables ;
  10:  UTOOL_NUM[GP1]=1 ;
  11:  UFRAME_NUM[GP1]=1 ;
  12:  PAYLOAD[1] ;
  13:  R[1:Compteur Y]=0    ;
  14:  R[2:Compteur Z]=0    ;
  15:  R[3:Compteur cote]=0    ;
  16:  PR[5]=LPOS    ;
  17:  PR[5]=PR[5]-PR[5]    ;
  18:  PR[6]=PR[5]    ;
  19:  PR[7]=PR[5]    ;
  20:  PR[8]=PR[5]    ;
  21:  PR[5,3]=R[8:Degagement Prise]    ;
  22:  PR[6,3]=R[9:Approche Depose]    ;
  23:  !Init Position Robot ;
  24:J PR[1:Init Pos] 100% CNT10 Offset,PR[5]    ;
  25:  !Rebouclage ;
  26:  LBL[1] ;
  27:  !Calcul de positionnement Y et Z ;
  28:  PR[7,1]=1*R[1:Compteur Y]*R[4:Taille Piece Y]    ;
  29:  PR[7,3]=R[2:Compteur Z]*R[5:Taille Piece Z]    ;
  30:  PR[8]=PR[7]    ;
  31:  PR[8,3]=PR[8,3]+R[9:Approche Depose]    ;
  32:  !Prise d'une caisse ;
  33:  DO[3]=OFF ;
  34:  WAIT DI[2]=ON    ;
  35:  DO[3]=ON ;
  36:  WAIT DI[1]=ON    ;
  37:  WAIT DI[1]=ON    ;
  38:  IF R[3:Compteur cote]=0,CALL _PRISE_DEPOSE1 ;
  39:  IF R[3:Compteur cote]=1,CALL _PRISE_DEPOSE2 ;
  40:  !Gestion Compteur Y ;
  41:  R[1:Compteur Y]=R[1:Compteur Y]+1    ;
  42:  !Fin d'une ligne en Y ? ;
  43:  IF R[1:Compteur Y]<R[6:Nbr piece Y],JMP LBL[1] ;
  44:  !Gestion Compteur Z ;
  45:  R[2:Compteur Z]=R[2:Compteur Z]+1    ;
  46:  !RAZ Compteur Y ;
  47:  R[1:Compteur Y]=0    ;
  48:  !Fin du plateau en Z ? ;
  49:  IF R[2:Compteur Z]<R[7:Nbr Piece Z],JMP LBL[1] ;
  50:  R[3:Compteur cote]=R[3:Compteur cote]+1    ;
  51:  R[2:Compteur Z]=0    ;
  52:  IF R[3:Compteur cote]<2,JMP LBL[1] ;
  53:  !Init Position Robot ;
  54:J PR[1:Init Pos] 100% CNT100    ;
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
