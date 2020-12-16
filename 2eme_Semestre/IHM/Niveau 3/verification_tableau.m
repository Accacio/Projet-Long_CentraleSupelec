%% Fonction vérifie si il déjà existe un gagnant

function winner = verification_tableau(matrix_tab)

% Verification horizontal
lin1 = matrix_tab(1,:);
lin2 = matrix_tab(2,:);
lin3 = matrix_tab(3,:);
hor = or(all(lin1), all(lin2)); %all: is 1 if all elements are nonzero
hor = or(hor, all(lin3));

% Verification vertical
col1 = matrix_tab(:,1);
col2 = matrix_tab(:,2);
col3 = matrix_tab(:,3);
ver = or(all(col1),all(col2));
ver = or(ver,all(col3));

com = or(hor,ver);

% Verification diagonal
diag1 = [matrix_tab(1,1) matrix_tab(2,2) matrix_tab(3,3)];
diag2 = [matrix_tab(3,1) matrix_tab(2,2) matrix_tab(1,3)];
dia = or(all(diag1),all(diag2));


if or(com,dia)
    winner = 1;
else
    winner = 0;
end


end