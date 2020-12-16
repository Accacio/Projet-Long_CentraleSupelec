%% Fonction que va delivre le commande pour faire le dessin du "X"

% Paramétres d'entree
% tableau: structure avec l'informations du tableau
% Xcoordenne: coordenne en ligne et colonne lequel le "X" sera dessiné

% Example 
% pos_origin = [0.2;0.2;0]; % (m)
% tai_carre= 0.03; % (m)
% tableau = def_tableau(pos_origin,tai_carre);
% Xcoordenne = [3,1]; % ligne 3 et colonne 1

% Fonctions qui sont appeles: [couple,tr] =
% traj_to_couple(pos_init,pos_inter,pos_fin,type_traj,th_DHM_manuel),

% On considere que dans le début du déssin, l'effectuer est sur le milieu 
% du carre 

function [coupleX,X_pos_end] = dessin_X(f,Xcoordenne,id_plot)

%% Tableau

tableau = f.UserData.tableau;

Xpos = zeros(3,1);

Xpos(1) = tableau.pos(Xcoordenne(1,1),Xcoordenne(1,2),1);
Xpos(2) = tableau.pos(Xcoordenne(1,1),Xcoordenne(1,2),2);
Xpos(3) = tableau.pos(Xcoordenne(1,1),Xcoordenne(1,2),3);

% "X" occupe 80% de l'espace
prop = 0.8;

%% Arriver jusqu'à début de ligne 1
% Point initial
aller_lig1_point1 = zeros(3,1);
aller_lig1_point1 = Xpos;
aller_lig1_point1(3) = aller_lig1_point1(3) + tableau.taille_carre; % Au début, l'effectuer n'est pas en contact avec le tableau

% Point final
aller_lig1_point2 = zeros(3,1);
aller_lig1_point2(1) = Xpos(1) - prop*tableau.taille_carre/2;
aller_lig1_point2(2) = Xpos(2) + prop*tableau.taille_carre/2;
aller_lig1_point2(3) = Xpos(3);

% Couple
[coupleX.aller1,X_pos_end.aller1] = traj_to_couple(aller_lig1_point1,aller_lig1_point2,aller_lig1_point2,'l',0);

% Figure 3D
if id_plot
    figure(f.UserData.object.plot);
    hold on; axis equal; view(3); 
    plot3(X_pos_end.aller1(:,1),X_pos_end.aller1(:,2),X_pos_end.aller1(:,3),'y'); 
    u = X_pos_end.aller1(end,1) - X_pos_end.aller1(1,1);
    v = X_pos_end.aller1(end,2) - X_pos_end.aller1(1,2);
    w = X_pos_end.aller1(end,3) - X_pos_end.aller1(1,3);
    quiver3(X_pos_end.aller1(1,1),X_pos_end.aller1(1,2),X_pos_end.aller1(1,3),u,v,w,'y');
    hold off
end

%% Dessin ligne 1
% Point initial
lig1_point1 = aller_lig1_point2;

% Point final
lig1_point2 = zeros(3,1);
lig1_point2(1) = Xpos(1) + prop*tableau.taille_carre/2;
lig1_point2(2) = Xpos(2) - prop*tableau.taille_carre/2;
lig1_point2(3) = Xpos(3);

% Couple
[coupleX.lig1,X_pos_end.lig1] = traj_to_couple(lig1_point1,lig1_point2,lig1_point2,'l',0);

% Figure 3D
if id_plot
    hold on; view(3); 
    plot3(X_pos_end.lig1(:,1),X_pos_end.lig1(:,2),X_pos_end.lig1(:,3),'r'); 
    hold off
end

%% Arriver jusqu'à début de la ligne 2
% Point initial
aller_lig2_point1 = zeros(3,1);
aller_lig2_point1 = lig1_point2;

% Point final
aller_lig2_point3 = zeros(3,1);
aller_lig2_point3(1) = Xpos(1) + prop*tableau.taille_carre/2;
aller_lig2_point3(2) = Xpos(2) + prop*tableau.taille_carre/2;
aller_lig2_point3(3) = Xpos(3);

% Point intermediaire
aller_lig2_point2 = zeros(3,1);
aller_lig2_point2(1) = aller_lig2_point3(1);
aller_lig2_point2(2) = (aller_lig2_point3(2)+aller_lig2_point1(2))/2;
aller_lig2_point2(3) = Xpos(3) + (aller_lig2_point3(2)-aller_lig2_point1(2))/2;

% Couple
[coupleX.aller2,X_pos_end.aller2] = traj_to_couple(aller_lig2_point1,aller_lig2_point2,aller_lig2_point3,'a',0);

% Figure 3D
if id_plot
    hold on; view(3); 
    plot3(X_pos_end.aller2(:,1),X_pos_end.aller2(:,2),X_pos_end.aller2(:,3),'y'); 
    u = X_pos_end.aller2(4,1) - X_pos_end.aller2(1,1);
    v = X_pos_end.aller2(4,2) - X_pos_end.aller2(1,2);
    w = X_pos_end.aller2(4,3) - X_pos_end.aller2(1,3);
    quiver3(X_pos_end.aller2(1,1),X_pos_end.aller2(1,2),X_pos_end.aller2(1,3),u,v,w,'y');
    hold off
end

%% Dessin ligne 2
% Point initial
lig2_point1 = aller_lig2_point3;

% Point final
lig2_point2 = zeros(3,1);
lig2_point2(1) = Xpos(1) - prop*tableau.taille_carre/2;
lig2_point2(2) = Xpos(2) - prop*tableau.taille_carre/2;
lig2_point2(3) = Xpos(3);

% Couple
[coupleX.lig2,X_pos_end.lig2] = traj_to_couple(lig2_point1,lig2_point2,lig2_point2,'l',0);

% Figure 3D
if id_plot
    hold on; view(3); 
    plot3(X_pos_end.lig2(:,1),X_pos_end.lig2(:,2),X_pos_end.lig2(:,3),'r'); 
    hold off
end

%% Arriver jusqu'au centre du carre
% Point initial
aller_fin_point1 = lig2_point2;

% Point final
aller_fin_point2 = Xpos;
aller_fin_point2(3) = aller_fin_point2(3) + tableau.taille_carre;

% Couple
[coupleX.allerfin,X_pos_end.allerfin] = traj_to_couple(aller_fin_point1,aller_fin_point2,aller_fin_point2,'l',0);

% Figure 3D
if id_plot
    hold on; view(3); 
    plot3(X_pos_end.allerfin(:,1),X_pos_end.allerfin(:,2),X_pos_end.allerfin(:,3),'y'); 
    u = X_pos_end.allerfin(end,1) - X_pos_end.allerfin(1,1);
    v = X_pos_end.allerfin(end,2) - X_pos_end.allerfin(1,2);
    w = X_pos_end.allerfin(end,3) - X_pos_end.allerfin(1,3);
    quiver3(X_pos_end.allerfin(1,1),X_pos_end.allerfin(1,2),X_pos_end.allerfin(1,3),u,v,w,'y');
    hold off
end

end