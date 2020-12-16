function reset_jeu(f)

% Reset the push buttons of grid
set(f.UserData.object.push.tableau.gr11,'String','')
set(f.UserData.object.push.tableau.gr12,'String','')
set(f.UserData.object.push.tableau.gr13,'String','')
set(f.UserData.object.push.tableau.gr21,'String','')
set(f.UserData.object.push.tableau.gr22,'String','')
set(f.UserData.object.push.tableau.gr23,'String','')
set(f.UserData.object.push.tableau.gr31,'String','')
set(f.UserData.object.push.tableau.gr32,'String','')
set(f.UserData.object.push.tableau.gr33,'String','')

% Reset of the matrix
f.UserData.matrix_jeu.id1 = zeros(3,3);
f.UserData.matrix_jeu.id2 = zeros(3,3);

% Initialization du jeur pour la prochaine tour
f.UserData.tour.fois = 1;
f.UserData.tour.matchnul = 0;

end