%-----------------------------------------
% TP Youbot M1 ISMH
% M. Makarov
% mars 2016
%-----------------------------------------

% Partie 2 (cinématique)

clear all
close all
clc

% ----- Paramètres géométriques en (m) ----- 
dB = 0;
rB = 0;
r1 = 0.147;
d2 = 0.033;
d3 = 0.155;
d4 = 0.135;
lend = 0.218;

% ----- Configurations articulaires pour Pi et Pf ----- 
% *** DEBUT DE ZONE A COMPLETER ***
th_KUKA_1 = [0 -pi/2 -pi/3 +pi/2 0].';  % début trajectoire
th_KUKA_2 = [pi/2 0 +pi/6 -pi/2 0]';    % fin trajectoire
% *** FIN DE ZONE A COMPLETER ***

th_KUKA_list = {th_KUKA_1,th_KUKA_2};

% ----- Vérifications avec le MGD et la jacobienne dans les deux
% ----- configurations :

for i = 1:2                 % pour chacune des deux configurations...
    th_KUKA = th_KUKA_list{i}; % on charge les coordonnées articulaires en mémoire
    
    % ----- Changement de variable entre la convention constructeur et la
    % ----- convention DHM
    
    % *** DEBUT DE ZONE A COMPLETER ***
    offset = [0 +pi/2 0 -pi/2 0].'; % th_DHM = -th_KUKA + offset
    th_DHM = -th_KUKA + offset;
    % *** FIN DE ZONE A COMPLETER ***
    
    % ----- Utilisation de la fonction mattransfo(alpha, d, theta, r) pour la
    % ----- construction de matrices homogènes
    
    % *** DEBUT DE ZONE A COMPLETER ***
    T01 = mattransfo(0, 0, th_DHM(1), r1);
    T12 = mattransfo(+pi/2, d2, th_DHM(2), 0);
    T23 = mattransfo(0, d3, th_DHM(3), 0);
    T34 = mattransfo(0, d4, th_DHM(4), 0);
    T45 = mattransfo(-pi/2, 0, th_DHM(5), 0);
    
    T02 = T01*T12;
    T03 = T02*T23;
    T04 = T03*T34;
    T05 = T04*T45;
    % *** FIN DE ZONE A COMPLETER ***
    
    % ----- On définit de plus les matrices de passage entre le RB et R0, et entre R5
    % et Rend
    
    % si le repère de base était décalé par rapport à R0 (cas avec base mobile)
    % ici cette matrice n'a pas d'effet, RB et R0 sont confondus
    TB0 = [eye(3) [dB 0 rB]'; 0 0 0 1];
    
    % Rend est placé à l'extrêmité de la pince considérée comme fixe
    % la transformation est une translation de lend selon z5
    T5end = [eye(3) [0 0 lend]'; 0 0 0 1];
    T0end = T05*T5end
    
    T0end_list{i} = T0end; % on stocke le MGD dans chacune des deux configurations
    
    % ----- Vérification de la jacobienne à Pi et Pf
    
    % *** DEBUT DE ZONE A COMPLETER ***
    th1 = th_KUKA(1);
    th2 = th_KUKA(2);
    th3 = th_KUKA(3);
    th4 = th_KUKA(4);
    
    Jac_tot{i} = Jacobian_tot_youbot(d2,d3,d4,lend,th1,th2,th3,th4) % calcul de la jacobienne
    % *** FIN DE ZONE A COMPLETER ***
    
    % ----- Visualisation
    
    O1 = T01(1:3,4);
    O2 = T02(1:3,4);
    O3 = T03(1:3,4);
    O4 = T04(1:3,4);
    O5 = T05(1:3,4);
    Pend = T0end(1:3,4);
    Rxend = T0end(1:3,1);
    Ryend = T0end(1:3,2);
    Rzend = T0end(1:3,3);
    Pend_x = Pend + 0.2*Rxend;
    Pend_y = Pend + 0.2*Ryend;
    Pend_z = Pend + 0.2*Rzend;
    
    figure(20)
    plot3(0,0,0,'r.','markersize',20); grid on; hold on
    axis([-0.7 0.7 -0.7 0.7 0 +1])
    plot3(O1(1),O1(2),O1(3),'b.','markersize',20)
    plot3(O2(1),O2(2),O2(3),'b.','markersize',20)
    plot3(O3(1),O3(2),O3(3),'b.','markersize',20)
    plot3(O4(1),O4(2),O4(3),'b.','markersize',20)
    plot3(O5(1),O5(2),O5(3),'b.','markersize',20)
    plot3(Pend(1),Pend(2),Pend(3),'m.','markersize',20)
    plot3([0 O1(1) O2(1) O3(1) O4(1) O5(1) Pend(1)],[0 O1(2) O2(2) O3(2) O4(2) O5(2) Pend(2)],[0 O1(3) O2(3) O3(3) O4(3) O5(3) Pend(3)],'b');
    % plot3([Pend(1) Pend_x(1)],[Pend(2) Pend_x(2)],[Pend(3) Pend_x(3)],'g')
    % plot3([Pend(1) Pend_y(1)],[Pend(2) Pend_y(2)],[Pend(3) Pend_y(3)],'c')
    % plot3([Pend(1) Pend_z(1)],[Pend(2) Pend_z(2)],[Pend(3) Pend_z(3)],'r')
    arrow3(Pend',Pend_x','g')
    arrow3(Pend',Pend_y','c')
    arrow3(Pend',Pend_z','r')
    xlabel('xB'); ylabel('yB'); zlabel('zB')
    title('xend : vert, yend : cyan, zend : rouge')
end


%% ----- Génération de trajectoire (mouvement en ligne droite) - PARTIE E

% ----- Définition des vitesse et accélérations maximales
amax = 2; % (m/s²)
vmax = 0.5; % (m/s)

% ----- Récupération du MGD dans les confiurations initiale et finale
Ti = T0end_list{1};
Tf = T0end_list{2};

Pi = Ti(1:3,4); % coordonnées x y z de Pi
Pf = Tf(1:3,4); % coordonnées x y z de Pf

% ----- Calcul de la distance cartésienne à parcourir et vérification de la
% ----- possibilité d'une trajectoire trapézoïdale en vitesse

% *** DEBUT DE ZONE A COMPLETER ***
D = norm(Pf-Pi,2)
vmax^2/amax
% *** FIN DE ZONE A COMPLETER ***

Tech = 1e-3; % période d'échantillonnage choisie

% ----- Calcul de la loi trapézoïdale en vitesse

% *** DEBUT DE ZONE A COMPLETER ***
Ts = vmax/amax;
T = D/vmax + Ts;
t = 0:Tech:T;
st = zeros(1,length(t));
st(t<Ts) = amax/2*t(t<Ts).^2;
st((t>=Ts)&(t<T-Ts)) = vmax*t((t>=Ts)&(t<T-Ts))-vmax^2/(2*amax)*ones(1,length(t((t>=Ts)&(t<T-Ts))));
st(t>=T-Ts) = -amax/2*(t(t>=T-Ts)-T).^2+vmax*T-vmax^2/amax;

vt = zeros(1,length(t));
vt(t<Ts) = amax*t(t<Ts);
vt((t>=Ts)&(t<T-Ts)) = vmax*ones(1,length(t((t>=Ts)&(t<T-Ts))));
vt(t>=T-Ts) = -amax*(t(t>=T-Ts)-T);
% *** FIN DE ZONE A COMPLETER ***

Pt = zeros(3,length(st));
Vt = zeros(3,length(st));
for j = 1:3
    Pt(j,:) = Pi(j)+(Pf(j)-Pi(j))*st/D;
    Vt(j,:) = (Pf(j)-Pi(j))*vt/D;
end

% ----- Visualisation de la trajectoire

% ----- Commande cinématique pour le suivi de trajectoire 
% **** (ouvrir le fichier pour l'étudier d'abord, lancer les simulations 
% lorsque les parties suivantes ont été complétées) ****

% sim('youbot_cinematique_BFpos') % *** A DECOMMENTER POUR LA PARTIE F

