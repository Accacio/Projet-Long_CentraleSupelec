function f = creation_IHM

close all
clear all

% Création de la figure principal
f = figure('name','Jeu de Morpion avec youBot','NumberTitle','off',...
    'units','normalized','outerposition',[0 0 1 1],'menubar','none');

% Création de la figure que reçoit les paramétres d'utilisateurs
f = creation_parametre_utilisateurs(f);

% Création de la figure que reçoit les paramétres d'entrée
f = creation_parametre_tableau(f);

% f.UserData.joueur_1.name = 'Karol';
% f.UserData.joueur_1.ident = 'X';
% f.UserData.joueur_1.score = 0;
% f.UserData.joueur_2.name = 'teste com nome grande 22';
% f.UserData.joueur_2.ident = 'O';
% f.UserData.joueur_2.score = 0;
% f.UserData.tour.fois = 1;
% f.UserData.matrix_jeu.id1 = zeros(3,3);
% f.UserData.matrix_jeu.id2 = zeros(3,3);


end