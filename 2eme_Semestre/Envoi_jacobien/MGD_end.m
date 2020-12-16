function Pend = MGD_end(D1,D2,D3,D4,Lend,R1,th1,th2,th3,th4)
%MGD_END
%    PEND = MGD_END(D1,D2,D3,D4,LEND,R1,TH1,TH2,TH3,TH4)

%    This function was generated by the Symbolic Math Toolbox version 6.2.
%    26-Apr-2017 15:41:47

t2 = conj(Lend);
t3 = th1+th2;
t4 = th1-th2-th3;
t5 = sin(th1);
t6 = th1+th2+th3+th4;
t7 = th1-th2;
t8 = th1-th2-th3-th4;
t9 = th1+th2+th3;
t10 = cos(th1);
Pend = [D1+D2.*t10-t2.*t5.*6.123233995736766e-17+D3.*sin(t3).*5.0e-1-D4.*sin(t4).*5.0e-1-D3.*sin(t7).*5.0e-1+D4.*sin(t9).*5.0e-1+t2.*sin(t6).*5.0e-1-t2.*sin(t8).*5.0e-1;-D2.*t5-t2.*t10.*6.123233995736766e-17+D3.*cos(t3).*5.0e-1-D4.*cos(t4).*5.0e-1-D3.*cos(t7).*5.0e-1+D4.*cos(t9).*5.0e-1+t2.*cos(t6).*5.0e-1-t2.*cos(t8).*5.0e-1;R1+t2.*3.749399456654644e-33+D4.*cos(th2+th3)+D3.*cos(th2)+t2.*cos(th2+th3+th4)];
