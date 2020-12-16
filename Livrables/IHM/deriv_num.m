function [V] = deriv_num(P,T)
V = P(2:end)-P(1:end-1);
V(end+1) = V(end);
V = V/T;
end