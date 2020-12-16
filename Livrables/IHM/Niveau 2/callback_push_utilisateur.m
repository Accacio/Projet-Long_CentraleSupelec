%% Allocation of users datas

% Sortie: f.UserData.joueur_1, f.UserData.joueur_2, f.UserData.tour,
% f.UserData.match

% Fonctions qui sont appeles: f = creation_grille(f);

% Au fin de la fonction: création du tableau avec les boutons

function callback_push_utilisateur(hObject,eventdata,f)

%% Utilisateur 1

% Getting parameters of objects
name1 = get(f.UserData.object.edit.name1,'String');
id = get(f.UserData.object.button.group1,'SelectedObject');
ident1 = get(id,'String');

% Allocation in struct f.UserData
f.UserData.joueur_1.name = name1;
f.UserData.joueur_1.ident = ident1;
f.UserData.joueur_1.score = 0; 

%% Utilisateur 2

% Getting parameters of objects
name2 = get(f.UserData.object.edit.name2,'String');
id = get(f.UserData.object.button.group2,'SelectedObject');
ident2 = get(id,'String');

% Allocation in struct f.UserData
f.UserData.joueur_2.name = name2;
f.UserData.joueur_2.ident = ident2;
f.UserData.joueur_2.score = 0; 

%% Initialization du jeu
f.UserData.tour.fois = 1;
f.UserData.tour.case_init = [2,2];
f.UserData.tour.case_fin = [2,2];
f.UserData.match = 1;
f.UserData.match1.matchnul = 0;
f.UserData.match1.matrix_jeu.id1 = zeros(3,3);
f.UserData.match1.matrix_jeu.id2 = zeros(3,3);

%% Creation du tableau 
f = creation_grille(f);

%% Fermeture de la fenêtre utilisateur
delete(f.UserData.figure.utilisateur)


end