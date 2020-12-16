%% Fonction Callback du push button d'envoye des paramètres du tableau

% Dans cette interface il va prendre pos_origin et tai_carre
% Paramètres d'entree
% pos_origin: vector (3x1) de la position d'origine de #
% tai_carre: taille de chaque carre du #

% Sortie: f.UserData.couple.tableau
%         f.UserData.tableau

% Fonctions qui sont appeles: tableau = def_tableau(pos_origin,tai_carre); 
% coupletab = dessin_tableau(tableau);

function callback_push_tableau(hObject,eventdata,f)

%% Getting paramètres du tableau
pos_origin = zeros(3,1);
pos_origin(1) = str2double(get(f.UserData.object.edit.Xcentre,'String'));
pos_origin(2) = str2double(get(f.UserData.object.edit.Ycentre,'String'));
pos_origin(3) = str2double(get(f.UserData.object.edit.Zcentre,'String'));

tai_carre = str2double(get(f.UserData.object.edit.taille,'String'));
tai_carre = tai_carre/1000;

%% Verification qui tous les champs sont remplis
% Identificateurs 
number_pos = ~isnan(pos_origin);
number_tai = ~isnan(tai_carre);

% Il ne va pas obeir ça condition juste quand number_pos et number_tai sont
% number
if ~and(all(number_pos),number_tai)
    msg_remplit = msgbox('ATTENTION: Il faut remplir tous les champs','ATTENTION');
else
    
%% Définition du tableau a partir des paramètres
    tableau = def_tableau(pos_origin,tai_carre);
    f.UserData.tableau = tableau;
    
    % Calcul du dessin de la grille
    if get(f.UserData.object.check.dessin,'Value')
        msg_dessin = msgbox('Il va prendre un peu de temps pour calculer et dessiner le tableau.','ATTENTION');
        coupletab = dessin_tableau(tableau);
        f.UserData.tableau = def_tableau(pos_origin,tai_carre);
        f.UserData.couple.tableau = coupletab;
        warning('Il a fini le calcul du tableau. Vous pouvez accéder f.UserData.couple.tableau')
    end
    
    % Fermeture de la fenêtre utilisateur
    delete(f.UserData.figure.entre)
end


end