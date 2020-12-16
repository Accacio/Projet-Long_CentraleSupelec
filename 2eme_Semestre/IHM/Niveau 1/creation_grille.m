%% Fonction d'insertion des boutons dans l'interface

% Callbakc functions: vector_calcule = callback_push_grille(hObject,eventdata,f), 
% callback_push_reset(hObject,eventdata,f)


function f = creation_grille(f)

%% Figure du plot de la position d'effectuer
f.UserData.object.plot = figure('name','Trajectoire d"effectuer','NumberTitle','off',...
             'units','normalized',...
             'Position',[.42 .37 .5 .5]);
% R�glage         
figure(f.UserData.object.plot);
view(3)
xlabel('Position X (m)')
ylabel('Position Y (m)')
zlabel('Position Z (m)')
         
% C'est juste pour initialiser la structure 
% f.UserData.object.push.tableau = 'initialization';

%% Push

% Push button (1,1)
init_struct = uicontrol('Parent',f,...
    'Style','push','units','normalized',...
    'Position',[.35 .2 .1 .185],'Tag','1,1',...
    'Callback',{@callback_push_grille,f});
% Allocation
f.UserData.object.push.tableau.gr11 = init_struct;

% Push button (1,2)
f.UserData.object.push.tableau.gr12 = uicontrol('Parent',f,...
    'Style','push','units','normalized',...
    'Position',[.47 .2 .1 .185],'Tag','1,2',...
    'Callback',{@callback_push_grille,f});

% Push button (1,3)
f.UserData.object.push.tableau.gr13 = uicontrol('Parent',f,...
    'Style','push','units','normalized',...
    'Position',[.59 .2 .1 .185],'Tag','1,3',...
    'Callback',{@callback_push_grille,f});

% Push button (2,1)
f.UserData.object.push.tableau.gr21 = uicontrol('Parent',f,...
    'Style','push','units','normalized',...
    'Position',[.35 .42 .1 .185],'Tag','2,1',...
    'Callback',{@callback_push_grille,f});

% Push button (2,2)
f.UserData.object.push.tableau.gr22 = uicontrol('Parent',f,...
    'Style','push','units','normalized',...
    'Position',[.47 .42 .1 .185],'Tag','2,2',...
    'Callback',{@callback_push_grille,f});

% Push button (2,3)
f.UserData.object.push.tableau.gr23 = uicontrol('Parent',f,...
    'Style','push','units','normalized',...
    'Position',[.59 .42 .1 .185],'Tag','2,3',...
    'Callback',{@callback_push_grille,f});

% Push button (3,1)
f.UserData.object.push.tableau.gr31 = uicontrol('Parent',f,...
    'Style','push','units','normalized',...
    'Position',[.35 .64 .1 .185],'Tag','3,1',...
    'Callback',{@callback_push_grille,f});

% Push button (3,2)
f.UserData.object.push.tableau.gr32 = uicontrol('Parent',f,...
    'Style','push','units','normalized',...
    'Position',[.47 .64 .1 .185],'Tag','3,2',...
    'Callback',{@callback_push_grille,f});

% Push button (3,3)
f.UserData.object.push.tableau.gr33 = uicontrol('Parent',f,...
    'Style','push','units','normalized',...
    'Position',[.59 .64 .1 .185],'Tag','3,3',...
    'Callback',{@callback_push_grille,f});

%% SCORE

%% Panel
f.UserData.object.pan.score = uipanel('Parent',f,...
    'Title','SCORE','FontWeight','bold',...
    'FontSize',18,'units','normalized','Position',[.035 .50 .25 .33]);

%% Jouer 1
name1 = f.UserData.joueur_1.name;
ident1 = f.UserData.joueur_1.ident;
score1 = f.UserData.joueur_1.score;

%% Text
f.UserData.object.text.score.ident1 = uicontrol('Parent',f.UserData.object.pan.score,...
    'Style','text','String',ident1,'ForegroundColor','r',...
    'FontSize',23,'units','normalized','Position',[.05 .66 .15 .2]);

f.UserData.object.text.score.name1 = uicontrol('Parent',f.UserData.object.pan.score,...
    'Style','text','String',name1,'HorizontalAlignment','Left',...
    'FontSize',15,'units','normalized','Position',[.23 .62 .62 .2]);

f.UserData.object.text.score.sc1 = uicontrol('Parent',f.UserData.object.pan.score,...
    'Style','text','String',num2str(score1),...
    'FontSize',18,'units','normalized','Position',[.85 .64 .1 .2]);

%% Jouer 2
name2 = f.UserData.joueur_2.name;
ident2 = f.UserData.joueur_2.ident;
score2 = f.UserData.joueur_2.score;

%% Text
f.UserData.object.text.score.ident2 = uicontrol('Parent',f.UserData.object.pan.score,...
    'Style','text','String',ident2,'ForegroundColor','b',...
    'FontSize',23,'units','normalized','Position',[.05 .28 .15 .2]);

f.UserData.object.text.score.name2 = uicontrol('Parent',f.UserData.object.pan.score,...
    'Style','text','String',name2,'HorizontalAlignment','Left',...
    'FontSize',15,'units','normalized','Position',[.23 .24 .7 .2]);

f.UserData.object.text.score.sc2 = uicontrol('Parent',f.UserData.object.pan.score,...
    'Style','text','String',num2str(score2),...
    'FontSize',18,'units','normalized','Position',[.85 .26 .1 .2]);

% Text of tableau
tex_joueur = ['Il est la tour de ',f.UserData.joueur_1.name];
f.UserData.object.text.tour = uicontrol('Parent',f,...
    'Style','text','String',tex_joueur,'HorizontalAlignment','Center',...
    'FontSize',20,'units','normalized','Position',[.25 .85 .55 .05]);

%% Push
f.UserData.object.push.reset = uicontrol('Parent',f,...
    'Style','push','units','normalized',...
    'String','Reset','FontSize',15,...
    'Position',[.11 .38 .1 .08],'Tag','3,3',...
    'Callback',{@callback_push_reset,f});

end