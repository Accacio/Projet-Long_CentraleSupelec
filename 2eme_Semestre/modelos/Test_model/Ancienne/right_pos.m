function [frame] = right_pos(pos,d1)

j1 = atan(pos(2)/(pos(1)-d1));
if (pos(1)-d1)< 0
    j1 = j1 + pi;
end

rep_1 = [0 0 1; 0 1 0; -1 0 0];
rot_1 = [cos(j1) -sin(j1) 0; sin(j1) cos(j1) 0; 0 0 1];
rep = rot_1*rep_1;

frame = [rep pos'; 0 0 0 1];
end