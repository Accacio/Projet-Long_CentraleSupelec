function T0end = MGD_T0end(D1,D2,D3,D4,Lend,R1,th1,th2,th3,th4,th5)
%MGD_T0END
%    T0END = MGD_T0END(D1,D2,D3,D4,LEND,R1,TH1,TH2,TH3,TH4,TH5)

%    This function was generated by the Symbolic Math Toolbox version 6.2.
%    26-Apr-2017 16:38:18

t2 = th1+th2+th3+th4+th5;
t3 = th1-th5;
t4 = th1-th2-th3-th4+th5;
t5 = th1+th2+th3+th4-th5;
t6 = th1-th2-th3-th4-th5;
t7 = th1+th5;
t8 = th1+th2+th3+th4;
t9 = sin(t8);
t10 = conj(Lend);
t11 = th1-th2-th3-th4;
t12 = sin(t11);
t13 = sin(th1);
t14 = sin(t2);
t15 = t14.*2.5e-1;
t16 = sin(t3);
t17 = t16.*(1.0./2.0);
t18 = sin(t4);
t19 = t18.*2.5e-1;
t20 = sin(t5);
t21 = sin(t6);
t22 = sin(t7);
t23 = t22.*(1.0./2.0);
t24 = cos(t2);
t25 = t24.*2.5e-1;
t26 = cos(t3);
t27 = cos(t4);
t28 = t27.*2.5e-1;
t29 = cos(t5);
t30 = t29.*2.5e-1;
t31 = cos(t6);
t32 = t31.*2.5e-1;
t33 = cos(t7);
t34 = t33.*(1.0./2.0);
t35 = cos(th1);
t36 = th1+th2;
t37 = th1-th2-th3;
t38 = cos(t8);
t39 = th1-th2;
t40 = cos(t11);
t41 = th1+th2+th3;
t42 = th2+th3+th4+th5;
t43 = th2+th3+th4-th5;
t44 = th2+th3+th4;
t45 = cos(t44);
T0end = reshape([t25-t26.*(1.0./2.0)+t28+t30+t32+t34,-t15+t17-t19-t20.*2.5e-1-t21.*2.5e-1-t23,sin(t42).*(-5.0e-1)-sin(t43).*5.0e-1+sin(th5).*6.123233995736766e-17,0.0,t15+t17+t19-t20.*2.5e-1-t21.*2.5e-1+t23,t25+t26.*(1.0./2.0)+t28-t30-t32+t34,cos(t42).*5.0e-1-cos(t43).*5.0e-1-cos(th5).*6.123233995736766e-17,0.0,t9.*5.0e-1-t12.*5.0e-1-t13.*6.123233995736766e-17,t35.*(-6.123233995736766e-17)+t38.*5.0e-1-t40.*5.0e-1,t45+3.749399456654644e-33,0.0,D1+D2.*t35+t9.*t10.*5.0e-1-t10.*t12.*5.0e-1-t10.*t13.*6.123233995736766e-17+D3.*sin(t36).*5.0e-1-D4.*sin(t37).*5.0e-1-D3.*sin(t39).*5.0e-1+D4.*sin(t41).*5.0e-1,-D2.*t13-t10.*t35.*6.123233995736766e-17+t10.*t38.*5.0e-1-t10.*t40.*5.0e-1+D3.*cos(t36).*5.0e-1-D4.*cos(t37).*5.0e-1-D3.*cos(t39).*5.0e-1+D4.*cos(t41).*5.0e-1,R1+t10.*3.749399456654644e-33+t10.*t45+D4.*cos(th2+th3)+D3.*cos(th2),1.0],[4, 4]);
