%% Fonction qui gére la continuation d'un nouveau match

% Fonction qui sont appelées: reset_jeu(f)

function callback_push_oui(hObject,eventdata,f)

%% Getting
% Get the strucuture of current match
nom_str = ['match' num2str(f.UserData.match)];
match = f.UserData.(nom_str);

%% Update the score
% Se le match a été nul, il ne vas pas ajouter le score
if match.matchnul == 1
    match.matchnul = 0;
    
% Il ajoute un point pour le vanqueur
elseif f.UserData.tour.fois == 1
    f.UserData.joueur_1.score = f.UserData.joueur_1.score + 1;
    set(f.UserData.object.text.score.sc1,'String',num2str(f.UserData.joueur_1.score))
else
    f.UserData.joueur_2.score = f.UserData.joueur_2.score + 1;
    set(f.UserData.object.text.score.sc2,'String',num2str(f.UserData.joueur_2.score))
end

% Update the match
f.UserData.match = f.UserData.match + 1;
str = ['match' num2str(f.UserData.match)];
f.UserData.(str).matchnul = 0;
f.UserData.(str).matrix_jeu.id1 = zeros(3,3);
f.UserData.(str).matrix_jeu.id2 = zeros(3,3);

% Reset of grid
reset_jeu(f);

% Begining of new match
f.UserData.tour.fois = 1;
tex_joueur = ['Il est la tour de ',f.UserData.joueur_1.name];
set(f.UserData.object.text.tour,'String',tex_joueur)

% Fermeture de la figure de continuation
delete(f.UserData.figure.continuation)

% Update figure
delete(f.UserData.object.plot)

% Figure du plot de la position d'effectuer
f.UserData.object.plot = figure('name','Trajectoire d"effectuer','NumberTitle','off',...
             'units','normalized',...
             'Position',[.42 .37 .5 .5]);

end