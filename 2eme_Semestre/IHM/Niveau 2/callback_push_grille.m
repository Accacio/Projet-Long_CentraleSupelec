%% Fonction qui gére chaque mouvement du jeu

% Fonctions qui sont appeles: winner = verification_tableau(matrix_tab),
% [couple,trajectory] = deplacement_grile(case_init,case_fin,f,id_plot),
% [coupleX,X_pos_end] = dessin_X(f,Xcoordenne,id_plot),
% [coupleO,O_pos_end] = dessin_O(f,Ocoordenne,id_plot),
% creation_continuation_jeu(f,string)

function callback_push_grille(hObject,eventdata,f)

%% Getting 
% Get the strucuture of current match
nom_str = ['match' num2str(f.UserData.match)];
match = f.UserData.(nom_str);

% The matrix representing the table
pos = str2num(get(hObject,'Tag'));

if or(match.matrix_jeu.id1(pos(1),pos(2)),match.matrix_jeu.id2(pos(1),pos(2))) == 1
    h = msgbox('Choisissez autre case, s"il vous plait','Error','error');
else

    % Identifier of plot
    id_plot = 1;
    
%% S'il est la tour du jouer 1
    if f.UserData.tour.fois==1        
        % Update the matrix representing the table
        match.matrix_jeu.id1(pos(1),pos(2)) = 1;
        
        % Getting the final position
        pos_fin = f.UserData.tableau.pos(pos(1),pos(2),:);
        
        % Verification if he is the winner
        winner = verification_tableau(match.matrix_jeu.id1);
        % Verification if there is a tie
        mat_complete = match.matrix_jeu.id1 + match.matrix_jeu.id2;
        egal = all(all(mat_complete));
        
%% Calculus de la trajectorie

        % Calcul of displacement
        f.UserData.tour.case_fin = [pos(1),pos(2)];
        [couple_dep,pos_dep] = deplacement_grile(f.UserData.tour.case_init,f.UserData.tour.case_fin,f,id_plot);
       
        % Get the color of joueur
        if f.UserData.joueur_1.ident=='X'
            
            % Calcul of identifier
            
            [couple_symbole,pos_symbole] = dessin_X(f,[pos(1) pos(2)],id_plot);
            
            
            % Allocation
            nom_str_mouv = ['mouvement' num2str(sum(sum(mat_complete)))];
            match.couple.(nom_str_mouv) = couple_symbole;
            match.couple.(nom_str_mouv).deplacement = couple_dep;
            match.trajectoire.(nom_str_mouv) = pos_symbole;
            match.trajectoire.(nom_str_mouv).deplacement = pos_dep;
            
            color = 'r';
        else
            % Calcul of identifier
            [couple_symbole,pos_symbole] = dessin_O(f,[pos(1) pos(2)],id_plot);
            
            % Allocation
            nom_str_mouv = ['mouvement' num2str(sum(sum(mat_complete)))];
            match.couple.(nom_str_mouv) = couple_symbole;
            match.couple.(nom_str_mouv).deplacement = couple_dep;
            match.trajectoire.(nom_str_mouv) = pos_symbole;
            match.trajectoire.(nom_str_mouv).deplacement = pos_dep;
            
            color = 'b';
        end
        
%% Setting
        % Set the string of push button
        set(hObject,'String',f.UserData.joueur_1.ident,...
            'ForegroundColor',color,'FontSize',50)
        
        if winner
            text_joueur = ['Félicitations! ',...
                f.UserData.joueur_1.name,' est le gagnant. Vous voulez jouer à nouveau?'];
            creation_continuation_jeu(f,text_joueur)
        elseif egal
            text_joueur = ['Le match a été nul.Vous voulez jouer à nouveau?'];
            match.tour.matchnul = 1;
            creation_continuation_jeu(f,text_joueur)
        else

            % Set the warning for next player
            text_joueur = ['Il est la tour de ',f.UserData.joueur_2.name];
            set(f.UserData.object.text.tour,'String',text_joueur)            

            % Update the player currently
            f.UserData.tour.fois = 2;
        end

%% S'il est la tour du jouer 2
    else

        % Update the matrix representing the table
        match.matrix_jeu.id2(pos(1),pos(2)) = 1;
        
        % Getting the final position
        pos_fin = f.UserData.tableau.pos(pos(1),pos(2),:);
        
        % Verification if he is the winner
        winner = verification_tableau(match.matrix_jeu.id2);
        % Verification if there is a tie
        mat_complete = match.matrix_jeu.id1 + match.matrix_jeu.id2;
        egal = all(all(mat_complete));

%% Calculus de la trajectorie

        % Calcul of displacement
        f.UserData.tour.case_fin = [pos(1),pos(2)];
        [couple_dep,pos_dep] = deplacement_grile(f.UserData.tour.case_init,f.UserData.tour.case_fin,f,id_plot);
        
        % Get the color of joueur
        if f.UserData.joueur_2.ident=='X'
            
            % Calcul of identifier
            [couple_symbole,pos_symbole] = dessin_X(f,[pos(1) pos(2)],id_plot);
            
            nom_str_mouv = ['mouvement' num2str(sum(sum(mat_complete)))];
            match.couple.(nom_str_mouv) = couple_symbole;
            match.couple.(nom_str_mouv).deplacement = couple_dep;
            match.trajectoire.(nom_str_mouv) = pos_symbole;
            match.trajectoire.(nom_str_mouv).deplacement = pos_dep;
            
            color = 'r';
            
        else
            % Calcul of identifier
            [couple_symbole,pos_symbole] = dessin_O(f,[pos(1) pos(2)],id_plot);
            
            nom_str_mouv = ['mouvement' num2str(sum(sum(mat_complete)))];
            match.couple.(nom_str_mouv) = couple_symbole;
            match.couple.(nom_str_mouv).deplacement = couple_dep;
            match.trajectoire.(nom_str_mouv) = pos_symbole;
            match.trajectoire.(nom_str_mouv).deplacement = pos_dep;
            
            color = 'b';
        end
        
%% Setting
        % Set the string of push button
        set(hObject,'String',f.UserData.joueur_2.ident,...
            'ForegroundColor',color,'FontSize',50)

        if winner
            text_joueur = ['Félicitations! ',...
            f.UserData.joueur_2.name,'  est le gagnant. Vous voulez jouer à nouveau?'];
            creation_continuation_jeu(f,text_joueur);
        elseif egal
            text_joueur = ['Le match a été nul.Vous voulez jouer à nouveau?'];
            match.tour.matchnul = 1;
            creation_continuation_jeu(f,text_joueur)
        else

            % Set the warning for next player
            text_joueur = ['Il est la tour de ',f.UserData.joueur_1.name];
            set(f.UserData.object.text.tour,'String',text_joueur)

            % Update the player currently
            f.UserData.tour.fois = 1;
        end
    end
   
    % Update final parameters
    f.UserData.tour.case_init = f.UserData.tour.case_fin;
    
    % Calcul of couple 
    %couple_dep = deplacement_grile(case_init,case_fin,tableau);
    
    % CONTINUAR DAQUI
    f.UserData.pos_init = [pos(1),pos(2)];

end
f.UserData.(nom_str) = match;
end