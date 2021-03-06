function Jac_tot = Jacobian_tot_youbot(D2,D3,D4,Lend,th1,th2,th3,th4)
%JACOBIAN_TOT_YOUBOT
%    JAC_TOT = JACOBIAN_TOT_YOUBOT(D2,D3,D4,LEND,TH1,TH2,TH3,TH4)

%    This function was generated by the Symbolic Math Toolbox version 6.2.
%    31-May-2017 15:43:16

t2 = conj(Lend);
t3 = th1+th2;
t4 = cos(t3);
t5 = D3.*t4.*5.0e-1;
t6 = th1-th2-th3;
t7 = cos(t6);
t8 = th1+th2+th3+th4;
t9 = cos(t8);
t10 = t2.*t9.*5.0e-1;
t11 = th1-th2;
t12 = cos(t11);
t13 = th1-th2-th3-th4;
t14 = cos(t13);
t15 = th1+th2+th3;
t16 = cos(t15);
t17 = D4.*t16.*5.0e-1;
t18 = D4.*t7.*5.0e-1;
t19 = t2.*t14.*5.0e-1;
t20 = cos(th1);
t21 = sin(th1);
t22 = sin(t3);
t23 = sin(t6);
t24 = D4.*t23.*5.0e-1;
t25 = sin(t8);
t26 = sin(t11);
t27 = D3.*t26.*5.0e-1;
t28 = sin(t13);
t29 = t2.*t28.*5.0e-1;
t30 = sin(t15);
t31 = th2+th3+th4;
t32 = sin(t31);
t33 = th2+th3;
t34 = sin(t33);
Jac_tot = reshape([t5+t10+t17-D4.*t7.*5.0e-1-D3.*t12.*5.0e-1-D2.*t21-t2.*t14.*5.0e-1-t2.*t20.*6.123233995736766e-17,t24+t27+t29-D2.*t20-D3.*t22.*5.0e-1-D4.*t30.*5.0e-1+t2.*t21.*6.123233995736766e-17-t2.*t25.*5.0e-1,0.0,0.0,0.0,1.0,t5+t10+t17+t18+t19+D3.*t12.*5.0e-1,-t24-t27-t29-D3.*t22.*5.0e-1-D4.*t30.*5.0e-1-t2.*t25.*5.0e-1,-D4.*t34-t2.*t32-D3.*sin(th2),-t21,-t20,6.123233995736766e-17,t10+t17+t18+t19,-t24-t29-D4.*t30.*5.0e-1-t2.*t25.*5.0e-1,-D4.*t34-t2.*t32,-t21,-t20,6.123233995736766e-17,t2.*(t9.*8.112963841460669e31+t14.*8.112963841460668e31).*6.162975822039155e-33,t2.*(t25.*8.112963841460669e31+t28.*8.112963841460668e31).*(-6.162975822039155e-33),-t2.*t32,-t21,-t20,6.123233995736766e-17,0.0,0.0,0.0,t21.*(-6.123233995736766e-17)+t25.*5.0e-1-t28.*5.0e-1,t9.*5.0e-1-t14.*5.0e-1-t20.*6.123233995736766e-17,cos(t31)+3.749399456654644e-33],[6, 5]);
