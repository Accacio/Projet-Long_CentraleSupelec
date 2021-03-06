function Pend = MGD_end(D1,D2,D3,D4,Lend,R1,th1,th2,th3,th4)
%MGD_END
%    PEND = MGD_END(D1,D2,D3,D4,LEND,R1,TH1,TH2,TH3,TH4)

% Objectif: Calcul du mod�le g�ometrique direct simplifi� du robot.
% Entr�es: 	D1 = distance dans l'axe X_0 du rep�re 1 au rep�re 0
%			D2 = distance dans l'axe X_1 du rep�re 2 au rep�re 1
%			D3 = distance dans l'axe X_2 du rep�re 3 au rep�re 2
%			D4 = distance dans l'axe X_3 du rep�re 4 au rep�re 3
%			Lend = taille de l'outil du robot
%			R1 = distance dans l'axe Z_0 du rep�re 1 au rep�re 0
%			th1 = position angulaire de l'axe 1
%			th2 = position angulaire de l'axe 2
%			th3 = position angulaire de l'axe 3
%			th4 = position angulaire de l'axe 4
% Sortie: 	Pend = la position de l'outil du robot

%    This function was generated by the Symbolic Math Toolbox version 6.2.
%    13-Jun-2017 22:42:59

t2 = sin(th1);
t3 = th1-th2;
t4 = th1+th2;
t5 = conj(Lend);
t6 = th1+th2+th3+th4;
t7 = th1-th2-th3-th4;
t8 = cos(th1);
t9 = th1+th2+th3;
t10 = th1-th2-th3;
Pend = [D1+D2.*t8+D3.*(cos(t3).*5.0e-1+cos(t4).*5.0e-1)+D4.*(cos(t9).*5.0e-1+cos(t10).*5.0e-1)+t5.*(t2.*6.123233995736766e-17-sin(t6).*5.0e-1+sin(t7).*5.0e-1);D2.*t2+D3.*(sin(t3).*5.0e-1+sin(t4).*5.0e-1)+D4.*(sin(t9).*5.0e-1+sin(t10).*5.0e-1)-t5.*(t8.*6.123233995736766e-17-cos(t6).*5.0e-1+cos(t7).*5.0e-1);R1+D4.*sin(th2+th3)+D3.*sin(th2)+t5.*(cos(th2+th3+th4)+3.749399456654644e-33)];
