function callback_button_group2(hObject,eventdata,f)

% Prendre les objects du group 1
obj = get(f.UserData.object.button.group1,'Children');

str_obs(1) = get(obj(1),'String');
str_obs(2) = get(obj(2),'String');

% Prendre l'object selectionne
oselect_1 = get(f.UserData.object.button.group1,'SelectedObject');
str_sel = get(oselect_1,'String');

% Prendre l'object different de l'object initiel
compar = (str_obs==str_sel); 
new_obj = obj(~compar);

% Envoyer le neaveau object
set(f.UserData.object.button.group1,'SelectedObject',new_obj)
end