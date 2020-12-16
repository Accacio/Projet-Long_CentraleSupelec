function res = pvect(x)

% opérateur matriciel produit vectoriel, x vecteur dim 3

res = [0 -x(3) x(2); x(3) 0 -x(1); -x(2) x(1) 0];