%% Fonction qui g�re la continuation du jeu quand un match a �t� fini

% Callbakc functions: callback_push_oui(hObject,eventdata,f),
% callback_push_non(hObject,eventdata,f)

function creation_continuation_jeu(f,string)

%% Figure pour annoncer que match a fini
f.UserData.figure.continuation = figure('name','LE MATCH A FINI',...
    'NumberTitle','off','Position',[550 350 270 120],'menubar','none');

%% Text
f.UserData.object.text.cont = uicontrol('Parent',f.UserData.figure.continuation,...
    'Style','text','String',string,...
    'FontSize',11,'units','normalized','Position',[.05 .45 .9 .45]);

%% Push button
f.UserData.object.push.cont_oui = uicontrol('Parent',f.UserData.figure.continuation,...
    'Style','push','units','normalized','String','Oui',...
    'Position',[.20 .17 .25 .25],'FontSize',12,...
    'Callback',{@callback_push_oui,f});

f.UserData.object.push.cont_non = uicontrol('Parent',f.UserData.figure.continuation,...
    'Style','push','units','normalized','String','Non',...
    'Position',[.55 .17 .25 .25],'FontSize',12,...
    'Callback',{@callback_push_non,f});
         
end