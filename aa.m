%LMI求解
clear all
a1=0.95;a2=0.96;a3=97;%阶次
A0=[-2.6,2,0;
   2,-1.55,1.15;
     0.075,0,-0.65];%系统矩阵
%  B0=[2,0,0;  
%    0,2,0;
%    0,0,2;];
In=eye(3);I2=eye(2);
P1=sdpvar(1,1);
P2=sdpvar(1,1);
P3=sdpvar(1,1);
H=sdpvar(3,3);
%Q=sdpvar(3,3,'diagonal');
M=[0,0,0,0,0,0,P1*sin(a1*pi/2),P1*cos(a1*pi/2),0,0,0,0;
   0,0,0,0,0,0,-P1*cos(a1*pi/2),P1*sin(a1*pi/2),0,0,0,0;
   0,0,0,0,0,0,0,0,P2*sin(a2*pi/2),P2*cos(a2*pi/2),0,0;
   0,0,0,0,0,0,0,0,-P2*cos(a2*pi/2),P2*sin(a2*pi/2),0,0;
   0,0,0,0,0,0,0,0,0,0,P3*sin(a3*pi/2),P3*cos(a3*pi/2);
   0,0,0,0,0,0,0,0,0,0,-P3*cos(a3*pi/2),P3*sin(a3*pi/2);
   P1*sin(a1*pi/2),-P1*cos(a1*pi/2),0,0,0,0,0,0,0,0,0,0;
   P1*cos(a1*pi/2),P1*sin(a1*pi/2),0,0,0,0,0,0,0,0,0,0;
   0,0,P2*sin(a2*pi/2),-P2*cos(a2*pi/2),0,0,0,0,0,0,0,0;
   0,0,P2*cos(a2*pi/2),P2*sin(a2*pi/2),0,0,0,0,0,0,0,0;
   0,0,0,0,P3*sin(a3*pi/2),-P3*cos(a3*pi/2),0,0,0,0,0,0;
   0,0,0,0,P3*cos(a3*pi/2),P3*sin(a3*pi/2),0,0,0,0,0,0;
     ];
 
 FAI=M+((kron([In;-A0],I2))*(kron(H,I2))*(kron([In In],I2)))+((kron([In;-A0],I2))*(kron(H,I2))*(kron([In In],I2)))';
 K=(P1>0)+(P3>0)+(P2>0)+(FAI<0);
 %K=[P1>0,P3>0,P2>0,FAI<0];
 %abs=sdpsettings('solver','lmirank');
 solvesdp(K);
 H=double(H)
 P1=double(P1)
 P2=double(P2)
 P3=double(P3)
 
%  L=Q*inv(H)