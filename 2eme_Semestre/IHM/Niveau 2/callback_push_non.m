%% Fonction qui gere la finalization du jeu

function callback_push_non(hObject,eventdata,f)

delete(f.UserData.figure.continuation)
delete(f)

end
