%% FROM FICHIER JACOBIEN
% modèle dynamique Youbot
% février 2017
% MM

clear 
clc
close all

% géométrie

% ----- Paramètres géométriques en (m)
d1 = 0.024; % ok
r1 = 0.147; % ok
d2 = 0.033; % ok
d3 = 0.155; % ok
d4 = 0.135; % ok
lend = 0.218; %0.1136; %(base gripper)

% ----- Configuration bras tendu (convention constructeur)
th_KUKA = [0 0 0 0 0].'; %***************************************************
% th_KUKA = [0 pi/2 0 0 0].';
% th_KUKA = [0 -pi/2 0 0 0].';
% th_KUKA = [0 0 pi/2 0 0].';
% th_KUKA = [0 0 -pi/2 0 0].';

% ----- Convention DHM
offset = [0 +pi/2 0 -pi/2 0].'; % th_DHM = -th_KUKA + offset
th_DHM = -th_KUKA + offset;

T01 = mattransfo(0, d1, th_DHM(1), r1);
T12 = mattransfo(+pi/2, d2, th_DHM(2), 0);
T23 = mattransfo(0, d3, th_DHM(3), 0);
T34 = mattransfo(0, d4, th_DHM(4), 0);
T45 = mattransfo(-pi/2, 0, th_DHM(5), 0);

T02 = T01*T12;
T03 = T02*T23;
T04 = T03*T34;
T05 = T04*T45;
T5end = [eye(3) [0 0 lend]'; 0 0 0 1];
T0end = T05*T5end;

% % ----- Visualisation

O1 = T01(1:3,4);
O2 = T02(1:3,4);
O3 = T03(1:3,4);
O4 = T04(1:3,4);
O5 = T05(1:3,4);
Pend = T0end(1:3,4);
Rxend = T0end(1:3,1);
Ryend = T0end(1:3,2);
Rzend = T0end(1:3,3);
Pend_x = Pend + 0.5*Rxend;
Pend_y = Pend + 0.5*Ryend;
Pend_z = Pend + 0.2*Rzend;

figure(1)
plot3(0,0,0,'r.','markersize',20); grid on; hold on
axis([-0.7 0.7 -0.7 0.7 0 +1])
plot3(O1(1),O1(2),O1(3),'b.','markersize',20)
plot3(O2(1),O2(2),O2(3),'b.','markersize',20)
plot3(O3(1),O3(2),O3(3),'b.','markersize',20)
plot3(O4(1),O4(2),O4(3),'b.','markersize',20)
plot3(O5(1),O5(2),O5(3),'b.','markersize',20)
plot3(Pend(1),Pend(2),Pend(3),'g.','markersize',20)
plot3([0 O1(1) O2(1) O3(1) O4(1) O5(1) Pend(1)],[0 O1(2) O2(2) O3(2) O4(2) O5(2) Pend(2)],[0 O1(3) O2(3) O3(3) O4(3) O5(3) Pend(3)],'b'); 
arrow3(Pend',Pend_x','r')
arrow3(Pend',Pend_y','g')
arrow3(Pend',Pend_z','c')
xlabel('xB'); ylabel('yB'); zlabel('zB')
title('xend : vert, yend : cyan, zend : rouge')
%% Comparaison avec les repères donnés par KUKA et calcul des inerties

% coordonnées de proche en proche des orgines des repères KUKA
TK01 = [rottransfo(0,0,pi) [0.024 0 0.115]'; 0 0 0 1];
TK12 = [rottransfo(-pi/2,0,pi/2) [0.033 0 0]'; 0 0 0 1];
TK23 = [rottransfo(-pi/2,0,0) [0.155 0 0]'; 0 0 0 1];
TK34 = [rottransfo(0,0,0) [0 0.135 0]'; 0 0 0 1];
TK45 = [rottransfo(0,0,-pi/2) [0 0.1136 0]'; 0 0 0 1];
TK5gr = [rottransfo(pi,0,0) [0 0 0]'; 0 0 0 1];

% coordonnées absolues
TK02 = TK01*TK12;
TK03 = TK02*TK23;
TK04 = TK03*TK34;
TK05 = TK04*TK45;
TK0gr = TK05*TK5gr;
% TK0end = TK0gr*[eye(3) [0 0 0.05716]'; 0 0 0 1]; % non utile pour la suite

OK1 = TK01(1:3,4);
OK2 = TK02(1:3,4);
OK3 = TK03(1:3,4);
OK4 = TK04(1:3,4);
OK5 = TK05(1:3,4);
OKgr = TK0gr(1:3,4);
% OKend = TK0end(1:3,4); % non utile pour la suite

% *********** Comparaison avec coordonnées des origines des repères DHM
disp('Coord OK (X Y Z)')
disp([OK1' ; OK2'; OK3'; OK5'; OKgr'])
disp('Coord O_DHM (X Y Z)')
disp([O1' ; O2'; O3'; O5'; Pend'])

% Coordonnées des centres de gravité dans les repères KUKA et repères
% d'inertie dans ceux des axes de KUKA
OGK1 = 1e-3*[15.16 3.59 31.05]';
OGK2 = 1e-3*[113.97 15 -19.03]';
OGK3 = 1e-3*[0.13 104.41 20.22]';
OGK4 = 1e-3*[0.15 53.53 -24.64]';
OGK5 = 1e-3*[0 1.2 -16.48]';
OGKgr = 1e-3*[0 0 28.9]';

TK1G = [rottransfo(pi, 20*pi/180, 0) OGK1; 0 0 0 1];
TK2G = [rottransfo(-pi/2,0,-pi/2) OGK2; 0 0 0 1];
TK3G = [rottransfo(0,0,pi/2) OGK3; 0 0 0 1];
TK4G = [rottransfo(0,pi,40*pi/180) OGK4; 0 0 0 1];
TK5G = [rottransfo(0,pi/2,0) OGK5; 0 0 0 1];
TKGrG = [rottransfo(pi,0,pi/2) OGKgr; 0 0 0 1];

% Expression dans les repères DHM : matrices de passage
T1G = T01\TK01*TK1G;
T2G = T02\TK02*TK2G;
T3G = T03\TK03*TK3G;
T4G = T04\TK04*TK4G;
T5G = T05\TK05*TK5G;
TGrG = T0end\TK0gr*TKGrG;

% masses des segments
M1 = 1.390;
M2 = 1.3180;
M3 = 0.821;
M4 = 0.769;
M5 = 0.687;
Mgr = 0.199+0.01*2;

% Matrices d'inertie des segments dans repères inertiels de KUKA
arm1XXi = 0.0029525; arm1YYi = 0.0060091; arm1ZZi = 0.0058821;
arm2XXi = 0.0031145; arm2YYi = 0.0005843; arm2ZZi = 0.0031631;
arm3XXi = 0.00172767; arm3YYi = 0.00041967; arm3ZZi = 0.0018468;
arm4XXi = 0.0006764; arm4YYi = 0.0010573; arm4ZZi = 0.0006610;
arm5XXi = 0.0001934; arm5YYi = 0.0001602; arm5ZZi = 0.0000689;
grXXi = 0.0002324; grYYi = 0.0003629; grZZi = 0.0002067;

MKI1 = diag([arm1XXi arm1YYi arm1ZZi]);
MKI2 = diag([arm2XXi arm2YYi arm2ZZi]);
MKI3 = diag([arm3XXi arm3YYi arm3ZZi]);
MKI4 = diag([arm4XXi arm4YYi arm4ZZi]);
MKI5 = diag([arm5XXi arm5YYi arm5ZZi]);
MKIgr = diag([grXXi grYYi grZZi]);

% Matrices d'inertie des segments dans repères DHM
MI1 = inerttransfo(MKI1, T1G,M1);
MI2 = inerttransfo(MKI2, T2G,M2);
MI3 = inerttransfo(MKI3, T3G,M3);
MI4 = inerttransfo(MKI4, T4G,M4);
MI5 = inerttransfo(MKI5, T5G,M5);
MIgr = inerttransfo(MKIgr, TGrG,Mgr);

% cas du gripper : ajout du gripper à l'axe 5 
% --> remplacer MI5 par MI5mod
% --> utiliser T5grG pour position de Ggripper dans R5
T5grG = T05\TK0gr*TKGrG;
MI5gr = inerttransfo(MKIgr, T5grG,Mgr);
MI5mod = MI5+MI5gr;

MI5 = MI5mod;
M5 = M5+Mgr;

% inerties des actionneurs
% attention, ces inerties ne tiennent pas compte des contrôleurs embarqués
Im1 = 13.5e-6;
Im2 = 13.5e-6;
Im3 = 13.5e-6;
Im4 = 9.25e-6;
Im5 = 3.5e-6;

Rred1 = 156;
Rred2 = 156;
Rred3 = 100;
Rred4 = 71;
Rred5 = 71;

Ir1 = 0.409;
Ir2 = 0.409;
Ir3 = 0.071;
Ir4 = 0.07;
Ir5 = 0.07 ;

%% Liste des paramètres du modèle dynamique

% affectation des paramètres dynamiques
% XX = {0,XXR2,XXR3,XXR4,XXR5}
% XY = {0,XY2,XY3,XY4,XY5}
% XZ = {0,XZR2,XZR3,XZ4,XZ5}
% YY = {0,0,0,0,0}
% YZ = {0,YZ2,YZ3,YZ4,YZ5}
% ZZ = {ZZR1,ZZR2,ZZR3,ZZR4,ZZ5}
% MX = {0,MXR2,MXR3,MX4,MX5}
% MY = {0,MY2,MY3,MYR4,MY5}
% MZ = {0,0,0,0,0}
% M = {0,0,0,0,0}
% IA = {0,0,IA3,IA4,IA5}
% FV = {FV1,FV2,FV3,FV4,FV5}
% FS = {FS1,FS2,FS3,FS4,FS5}

GZ = -9.81;

for i = 1:5 % i = n° d'axe
    eval(num2str(['XX',num2str(i),'=MI',num2str(i),'(1,1);']));
    eval(num2str(['YY',num2str(i),'=MI',num2str(i),'(2,2);']));
    eval(num2str(['ZZ',num2str(i),'=MI',num2str(i),'(3,3);']));
    
    eval(num2str(['XY',num2str(i),'=MI',num2str(i),'(1,2);']));
    eval(num2str(['XZ',num2str(i),'=MI',num2str(i),'(1,3);']));
    eval(num2str(['YZ',num2str(i),'=MI',num2str(i),'(2,3);'])); 
    
    eval(num2str(['MX',num2str(i),'=M',num2str(i),'*T',num2str(i),'G(1,4);']));
    eval(num2str(['MY',num2str(i),'=M',num2str(i),'*T',num2str(i),'G(2,4);']));
    eval(num2str(['MZ',num2str(i),'=M',num2str(i),'*T',num2str(i),'G(3,4);']));
    
    eval(num2str(['IA',num2str(i),'=Im',num2str(i),'*Rred',num2str(i),'^2+Ir',num2str(i),';']));
    eval(num2str(['FV',num2str(i),'=0.1;']));
    eval(num2str(['FS',num2str(i),'=0;']));
end

% regroupements de paramètres

XXR5 = XX5 - YY5;
MR4 = M4 + M5;
XXR4 = XX4 - YY4 + YY5;
ZZR4 = YY5 + ZZ4;
MYR4 = MY4 + MZ5;
YYR3 = d4^2*MR4 + YY3 + YY4;
MZR3 = MZ3 + MZ4;
MR3 = M3 + MR4;
XXR3 = XX3 + YY4 - YYR3;
XZR3 = -MZ4*d4 + XZ3;
ZZR3 = d4^2*MR4 + ZZ3;
MXR3 = MR4*d4 + MX3;
YYR2 = d3^2*MR3 + YY2 + YYR3;
MZR2 = MZ2 + MZR3;
MR2 = M2 + MR3;
XXR2 = XX2 - YYR2 + YYR3;
XZR2 = -MZR3*d3 + XZ2;
ZZR2 = IA2 + d3^2*MR3 + ZZ2;
MXR2 = MR3*d3 + MX2;
YYR1 = d2^2*MR2 + YY1;
MR1 = M1 + MR2;
ZZR1 = IA1 + d2^2*MR2 + YYR2 + ZZ1;

% génération des vecteurs de paramètres et des noms de paramètres
nom_param = {'GZ','XXR2','XXR3','XXR4','XXR5','XY2','XY3','XY4','XY5','XZR2','XZR3','XZ4','XZ5','YZ2','YZ3','YZ4','YZ5','ZZR1','ZZR2','ZZR3','ZZR4','ZZ5',...
    'MXR2','MXR3','MX4','MX5','MY2','MY3','MYR4','MY5','IA3','IA4','IA5','FV1','FV2','FV3','FV4','FV5','FS1','FS2','FS3','FS4','FS5',...
    'd1','r1','d2','d3','d4','lend'};

nb_param = length(nom_param);

param = struct(num2str(nom_param{1}),eval(nom_param{1}));
for k = 2:nb_param
     param.(nom_param{k})=eval(nom_param{k});
end

%% export d'un vecteur de param pour simulink
par_vect = cell2mat(struct2cell(param));

nb_param = length(nom_param);

for k = 1:nb_param
    variable = nom_param{k};
    valeur = param.(nom_param{k});
    eval([variable '= valeur;']);
end

%% test du MDI dans différentes configs

th_KUKA = [0 0 0 0 0].';
% th_KUKA = [0 pi/2 0 0 0].';
% th_KUKA = [0 -pi/2 0 0 0].';
% th_KUKA = [0 0 pi/2 0 0].';
% th_KUKA = [0 0 -pi/2 0 0].';

offset = [0 +pi/2 0 -pi/2 0].'; % th_DHM = -th_KUKA + offset
th_DHM = -th_KUKA + offset;

couple = MDI_kuka(th_DHM,zeros(5,1), zeros(5,1), param, nom_param); % couple arti

%% réglage PID

Fv = 0.1;
Amax = [1.2 1.2 0.4 0.2 0.2];
w = [10 10 10 10 10];

% Kp = w.^2
% Kd = 2*1*w

Kp = 3*w.^2;
Kd = 3*w;
Ki = w.^3;

% save('PIDgains','Kp','Kd','couple1','couple2','couple3')

%% réglage PID - espace operationnel

% Kpx = 10*3*w.^2
% Kdx = 10*3*w
% Kix = 10*w.^3

%% ----- Calculs symboliques

% ----- Définition des variables symboliques
syms th1 th2 th3 th4 th5    % angles articulaires convention KUKA
syms D1 R1 D2 D3 D4 Lend       % paramètres géométriques

th_KUKA = [th1 th2 th3 th4 th5].';

% ----- Convention DHM
offset = [0 +pi/2 0 -pi/2 0].'; % th_DHM = -th_KUKA + offset
th_DHM1 = -th_KUKA + offset;

T01 = mattransfo(0, D1, th_KUKA(1), R1);
T12 = mattransfo(+pi/2, D2, th_KUKA(2), 0);
T23 = mattransfo(0, D3, th_KUKA(3), 0);
T34 = mattransfo(0, D4, th_KUKA(4), 0);
T45 = mattransfo(-pi/2, 0, th_KUKA(5), 0);
% T01 = mattransfo(0, D1, th_DHM1(1), R1);
% T12 = mattransfo(+pi/2, D2, th_DHM1(2), 0);
% T23 = mattransfo(0, D3, th_DHM1(3), 0);
% T34 = mattransfo(0, D4, th_DHM1(4), 0);
% T45 = mattransfo(-pi/2, 0, th_DHM1(5), 0);

T02 = T01*T12;
T03 = T02*T23;
T04 = T03*T34;
T05 = T04*T45;
T5end = [eye(3) [0 0 Lend]'; 0 0 0 1];
T0end = simplify(T05*T5end);

% ----- Extraction des positions des origines des repères
O1 = simplify(T01(1:3,4));
O2 = simplify(T02(1:3,4));
O3 = simplify(T03(1:3,4));
O4 = simplify(T04(1:3,4));
O5 = simplify(T05(1:3,4));
Pend = simplify(T0end(1:3,4));

% ----- Extraction des vecteurs zi dans RB
z1 = simplify(T01(1:3,3));
z2 = simplify(T02(1:3,3));
z3 = simplify(T03(1:3,3));
z4 = simplify(T04(1:3,3));
z5 = simplify(T05(1:3,3));
zend = simplify(T0end(1:3,3));

% ----- Création des fonctions donnant les coordonnées de Pend (fonction
% "MGD_end") ou la matrice homogène complète (fonction "MGD_T0end")

matlabFunction(Pend, 'File', 'MGD_end');
matlabFunction(T0end, 'File', 'MGD_T0end');

% ----- Affichage dans la fenêtre de commande des coordonnées de Pend et 
% des coordonnées des vecteurs zj dans RB
clc
vpa(Pend,2)

vpa(z1,2)
vpa(z2,2)
vpa(z3,2)
vpa(z4,2)
vpa(z5,2)
vpa(zend,2)

%% ----- Calcul du jacobien "géométrique" sous forme symbolique

% ----- Calcul de Jv par dérivation des coordonnées de Pend
Jv0 = jacobian(Pend, [th1; th2; th3; th4; th5]);

% ----- Affichage de Jv dans la fenêtre de commande
Jv = simplify(Jv0);    

clc
vpa(Jv,2)

% ----- Création de la fonction permettant le calcul de Jv
matlabFunction(Jv, 'File', 'Jacobian_youbot'); 

% ----- Calcul de Jomega à partir des coordonnées des vecteurs zj dans RB
% *** DEBUT DE ZONE A COMPLETER ***
Jomega = [z1 z2 z3 z4 z5];
% *** DEBUT DE ZONE A COMPLETER ***

Jac_tot = simplify([Jv; Jomega]);

% ----- Affichage de J dans la fenêtre de commande
clc
vpa(Jac_tot,2)

% ----- Création de la fonction permettant le calcul de J (complète)
matlabFunction(Jac_tot, 'File', 'Jacobian_tot_youbot');

%% ----- Exemple de simulation pour la commande du angulaire par couple calculé
%
% th_DHM = % définir la position angulaire initial dans la configuration DHM
% sim('dynmodel_KUKA_CTIjoint')
% 
% % Extration des position angulaire des axes
% j1 = squeeze(pos_arti(1,:,:));
% j2 = squeeze(pos_arti(2,:,:));
% j3 = squeeze(pos_arti(3,:,:));
% j4 = squeeze(pos_arti(4,:,:));
% j5 = squeeze(pos_arti(5,:,:));
% figure; plot(t,j1); ylim([-3.2,3.2])
% hold on;
% plot(t,j2); plot(t,j3); plot(t,j4); plot(t,j5);
% hold off; 
% title('Position articulaire des 5 articulations')
% xlabel('time(s)')
% ylabel('Position angulaire (rad)')
% legend('articulation 1','articulation 2','articulation 3','articulation 4','articulation 5')
% 
% % Extration des efforts de commande
% figure; plot(t,control(:,1));
% hold on;
% plot(t,control(:,2)); plot(t,control(:,3)); plot(t,control(:,4)); plot(t,control(:,5));
% hold off; 
% title('Action de commande dans chaque articulation')
% xlabel('time(s)')
% ylabel('Couple (Nm)')
% legend('articulation 1','articulation 2','articulation 3','articulation 4','articulation 5')

%%  ----- Exemple de simulation pour la commande du angulaire par couple calculé
%
% th_DHM = % définir la position angulaire initial dans la configuration DHM
% sim('dynmodel_KUKA_PIDjoint_2014')
% 
% % Extration des position angulaire des axes
% j1 = squeeze(pos_arti(1,:,:));
% j2 = squeeze(pos_arti(2,:,:));
% j3 = squeeze(pos_arti(3,:,:));
% j4 = squeeze(pos_arti(4,:,:));
% j5 = squeeze(pos_arti(5,:,:));
% figure; plot(t,j1); ylim([-3.2,3.2])
% hold on;
% plot(t,j2); plot(t,j3); plot(t,j4); plot(t,j5);
% hold off; 
% title('Pos articulaire - 5 junctions')
% xlabel('time(s)')
% ylabel('Position angulaire (rad)')
% legend('articulation 1','articulation 2','articulation 3','articulation 4','articulation 5')
% 
% % Extration des efforts de commande
% c1 = squeeze(control(1,:,:));
% c2 = squeeze(control(2,:,:));
% c3 = squeeze(control(3,:,:));
% c4 = squeeze(control(4,:,:));
% c5 = squeeze(control(5,:,:));
% figure; plot(t,c1);
% hold on;
% plot(t,c2); plot(t,c3); plot(t,c4); plot(t,c5);
% hold off; 
% title('Action de commande dans chaque articulation')
% xlabel('time(s)')
% ylabel('Couple (Nm)')
% legend('articulation 1','articulation 2','articulation 3','articulation 4','articulation 5')

%% ----- Simulation

% sim('dynmodel_KUKA_PID_task_pos_atual')
% 
% j1 = squeeze(pos_arti.signals.values(1,:,:));
% j2 = squeeze(pos_arti.signals.values(2,:,:));
% j3 = squeeze(pos_arti.signals.values(3,:,:));
% j4 = squeeze(pos_arti.signals.values(4,:,:));
% j5 = squeeze(pos_arti.signals.values(5,:,:));
% t = pos_arti.time;
% 
% figure; plot(t,j1); ylim([-3.2,3.2])
% hold on;
% plot(t,j2); plot(t,j3); plot(t,j4); plot(t,j5);
% hold off; 
% title('Position angulaire des 5 articulations')
% xlabel('time(s)')
% ylabel('Position angulaire (rad)')
% legend('j1','j2','j3','j4','j5')
% 
% figure; 
% plot(pos_end.time, pos_end.signals.values(:,1));
% hold on
% plot(pos_end.time, pos_end.signals.values(:,2),'g');
% plot(pos_end.time, pos_end.signals.values(:,3),'y');
% hold off
% legend('Axe X','Axe Y', 'Axe Z')
% xlabel('Temps (s)')
% ylabel('Position (m)')
% title('Position cartésienne de l"outil')
% 
% figure; plot(t,control(:,1));
% hold on;
% plot(t,control(:,2)); plot(t,control(:,3)); plot(t,control(:,4)); plot(t,control(:,5));
% hold off; 
% title('Action de commande dans chaque articulation')
% xlabel('time(s)')
% ylabel('Couple (Nm)')
% legend('articulation 1','articulation 2','articulation 3','articulation 4','articulation 5')


%% ----- Robot trajectory

% figure()
% sim('dynmodel_KUKA_PID_task_pos_atual')
% j1 = squeeze(pos_arti.signals.values(1,:,:));
% j2 = squeeze(pos_arti.signals.values(2,:,:));
% j3 = squeeze(pos_arti.signals.values(3,:,:));
% j4 = squeeze(pos_arti.signals.values(4,:,:));
% j5 = squeeze(pos_arti.signals.values(5,:,:));
% plot3(0,0,0,'r.','markersize',20); grid on; hold on
% axis([-0.7 0.7 -0.7 0.7 0 +1])
% 
% for i = 1:101
%     T01 = mattransfo(0, d1, j1(100*(i-1)+1), r1);
%     T12 = mattransfo(+pi/2, d2, j2(100*(i-1)+1), 0);
%     T23 = mattransfo(0, d3, j3(100*(i-1)+1), 0);
%     T34 = mattransfo(0, d4, j4(100*(i-1)+1), 0);
%     T45 = mattransfo(-pi/2, 0, j5(100*(i-1)+1), 0);
% 
%     T02 = T01*T12;
%     T03 = T02*T23;
%     T04 = T03*T34;
%     T05 = T04*T45;
%     T5end = [eye(3) [0 0 lend]'; 0 0 0 1];
%     T0end = T05*T5end;
% 
%     O1 = T01(1:3,4);
%     O2 = T02(1:3,4);
%     O3 = T03(1:3,4);
%     O4 = T04(1:3,4);
%     O5 = T05(1:3,4);
%     Pend = T0end(1:3,4);
%     Rxend = T0end(1:3,1);
%     Ryend = T0end(1:3,2);
%     Rzend = T0end(1:3,3);
%     Pend_x = Pend + 0.5*Rxend;
%     Pend_y = Pend + 0.5*Ryend;
%     Pend_z = Pend + 0.2*Rzend;
%     
%     plot3(O1(1),O1(2),O1(3),'b.','markersize',20)
%     plot3(O2(1),O2(2),O2(3),'b.','markersize',20)
%     plot3(O3(1),O3(2),O3(3),'b.','markersize',20)
%     plot3(O4(1),O4(2),O4(3),'b.','markersize',24)
%     plot3(O5(1),O5(2),O5(3),'b.','markersize',20)
%     plot3(Pend(1),Pend(2),Pend(3),'g.','markersize',20)
%     plot3([0 O1(1) O2(1) O3(1) O4(1) O5(1) Pend(1)],[0 O1(2) O2(2) O3(2) O4(2) O5(2) Pend(2)],[0 O1(3) O2(3) O3(3) O4(3) O5(3) Pend(3)],'b'); 
%     arrow3(Pend',Pend_x','r')
%     arrow3(Pend',Pend_y','g')
%     arrow3(Pend',Pend_z','c')
% end
% 
% xlabel('xB'); ylabel('yB'); zlabel('zB')
% title('xend : vert, yend : cyan, zend : rouge')

% %% Trajectory generation

% initP = MGD_end(d1,d2,d3,d4,lend,r1,th_DHM(1),th_DHM(2),th_DHM(3),th_DHM(4));
% finalP = [0.447; 0; 0.365];
% p3 = [0.397; 0.05; 0.365];
% type = 'l';
% T = 5;
% t = 0.001;
% trajectory = traj(initP,p3,finalP,type,T,t,0);
% sim('integration')



