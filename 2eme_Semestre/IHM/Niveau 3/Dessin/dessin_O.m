%% Fonction que va delivre le commande pour faire le dessin du "O"

% Paramétres d'entree
% tableau: structure avec l'informations du tableau
% Ocoordenne: coordenne en ligne et colonne lequel le "O" sera dessiné

% Example 
% pos_origin = [0.2;0.2;0]; % (m)
% tai_carre= 0.03; % (m)
% tableau = def_tableau(pos_origin,tai_carre);
% Ocoordenne = [3,2]; % ligne 3 et colonne 2

% Fonctions qui sont appeles: [couple,tr] =
% traj_to_couple(pos_init,pos_inter,pos_fin,type_traj,th_DHM_manuel),

%   (3,1)  |  (3,2)  |  (3,3)
%  ________|_________|________
%   (2,1)  |  (2,2)  |  (2,3) 
%  ________|_________|________
%   (1,1)  |  (1,2)  |  (1,3)
%          |         |

function [coupleO,O_pos_end] = dessin_O(f,Ocoordenne,id_plot)

%% Tableau
tableau = f.UserData.tableau;

Opos = zeros(3,1);

Opos(1) = tableau.pos(Ocoordenne(1,1),Ocoordenne(1,2),1);
Opos(2) = tableau.pos(Ocoordenne(1,1),Ocoordenne(1,2),2);
Opos(3) = tableau.pos(Ocoordenne(1,1),Ocoordenne(1,2),3);

% "O" occupe 80% de l'espace
prop = 0.8;

%% Arriver jusqu'au début de circon 1
% Point initial
aller_circ1_point1 = Opos;
aller_circ1_point1(3) = aller_circ1_point1(3) + tableau.taille_carre;

% Point final
aller_circ1_point2 = zeros(3,1);
aller_circ1_point2(1) = Opos(1);
aller_circ1_point2(2) = Opos(2) + prop*tableau.taille_carre/2;
aller_circ1_point2(3) = Opos(3);

% Couple
[coupleO.aller1,O_pos_end.aller1] = traj_to_couple(aller_circ1_point1,aller_circ1_point2,aller_circ1_point2,'l',0);

% Figure 3D
if id_plot
    figure(f.UserData.object.plot);
    hold on; axis equal; view(3); 
    plot3(O_pos_end.aller1(:,1),O_pos_end.aller1(:,2),O_pos_end.aller1(:,3),'y'); 
    u = O_pos_end.aller1(end,1) - O_pos_end.aller1(1,1);
    v = O_pos_end.aller1(end,2) - O_pos_end.aller1(1,2);
    w = O_pos_end.aller1(end,3) - O_pos_end.aller1(1,3);
    quiver3(O_pos_end.aller1(1,1),O_pos_end.aller1(1,2),O_pos_end.aller1(1,3),u,v,w,'y');
    hold off
end

%% Dessin circon 1
% Point initial
circ1_point1 = aller_circ1_point2;

% Point intermédiaire
circ1_point2 = zeros(3,1);
circ1_point2(1) = Opos(1) + prop*tableau.taille_carre/2;
circ1_point2(2) = Opos(2);
circ1_point2(3) = Opos(3);

% Point final
circ1_point3 = zeros(3,1);
circ1_point3(1) = Opos(1);
circ1_point3(2) = Opos(2) - prop*tableau.taille_carre/2;
circ1_point3(3) = Opos(3);

% Couple
[coupleO.circ,O_pos_end.circ] = traj_to_couple(circ1_point1,circ1_point2,circ1_point3,'c',0);

% Figure 3D
if id_plot
    hold on; axis equal; view(3); 
    plot3(O_pos_end.circ(:,1),O_pos_end.circ(:,2),O_pos_end.circ(:,3),'b'); 
    hold off
end

%% Arriver jusqu'au centre du carre
% Point initial
aller_fin_point1 = circ1_point1;

% Point final
aller_fin_point2 = Opos;
aller_fin_point2(3) = aller_fin_point2(3) + tableau.taille_carre;

% Couple
[coupleO.aller2,O_pos_end.aller2] = traj_to_couple(aller_fin_point1,aller_fin_point2,aller_fin_point2,'l',0);

% Figure 3D
if id_plot
    hold on; axis equal; view(3); 
    plot3(O_pos_end.aller2(:,1),O_pos_end.aller2(:,2),O_pos_end.aller2(:,3),'y'); 
    u = O_pos_end.aller2(end,1) - O_pos_end.aller2(1,1);
    v = O_pos_end.aller2(end,2) - O_pos_end.aller2(1,2);
    w = O_pos_end.aller2(end,3) - O_pos_end.aller2(1,3);
    quiver3(O_pos_end.aller2(1,1),O_pos_end.aller2(1,2),O_pos_end.aller2(1,3),u,v,w,'y');
    hold off
end

end