function res = preprodvect(a)

% pré-produit verctoriel (forme matricielle)
x = a(1);
y = a(2);
z = a(3);
res = [0 -z y; z 0 -x; -y x 0];