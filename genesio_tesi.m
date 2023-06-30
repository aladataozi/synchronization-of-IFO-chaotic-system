function fractional_chaos
clear all;
close all;
clc;

Dim=6;q=[sqrt(3)/2;0.8;1.1;sqrt(3)/2;0.8;1.1];
h=0.01;FinalTime=100;t=0:h:FinalTime;N=length(t)-1;u=0:h:FinalTime+h;
x_0=[0.1 0.2 0.3 0.4 0.5 0.6];

x0=[x_0]';
x(:,1)=x0;
a=zeros(Dim,N);b=zeros(Dim,N+1);
T1=(h.^q./q)./gamma(q);
T2=(h.^q)./gamma(q+2);
for n=1:N
    for m=1:Dim
        a(m,N+1-n)=(n+1)^(q(m)+1)+(n-1)^(q(m)+1)-2*n^(q(m)+1);
        b(m,N+1-n)=(n+1)^q(m)-n^q(m);
        a0(m,n+1)=n^(q(m)+1)-(n-q(m))*(n+1)^q(m);
    end
end
b(:,N+1)=1;a0(:,1)=q;
%a=repmat(aj,Dim,1);
%b=repmat(bj,Dim,1);
for n=0:N    
     OUT1(:,n+1)=fx(x(:,n+1));
    if(n==0)   sum2=a0(:,n+1).*fx(x0);
    else       sum2=sum(a(:,N+1-n:end).*OUT1(:,2:n+1),2)+a0(:,n+1).*fx(x0); end
    sum1=sum(b(:,N+1-n:end).*OUT1(:,1:n+1),2);
    xp=x0+T1.*sum1;
    x(:,n+2)=x0+T2.*fx(xp)+T2.*sum2;
    if(mod(n,100)==0) disp([x(:,n+2)' n/N]); end 
end




% plot(x(1,500:end),x(2,500:end))
% xlabel('x_1'),ylabel('x_2')
% figure,plot(x(1,500:end),x(3,500:end))
% xlabel('x_1'),ylabel('x_3')
% figure,plot(x(2,500:end),x(3,500:end))
% xlabel('x_2'),ylabel('x_3')
% figure,plot3(x(1,500:end),x(2,500:end),x(3,500:end))
% xlabel('x_1'),ylabel('x_2'),zlabel('x_3')
% figure,plot(x(2,100:end),x(3,100:end))
% xlabel('x_1'),ylabel('x_2')
% 
% figure,plot(u,x(1,1:end))
% xlabel('u'),ylabel('x1')
% figure,plot(u,x(2,1:end))
% xlabel('u'),ylabel('x2')
% figure,plot(u,x(3,1:end))
% xlabel('u'),ylabel('x3')
 save e_h_5.mat x



function OUT=fx(X)
x1=X(1);
x2=X(2);
x3=X(3);
x4=X(4);
x5=X(5);
x6=X(6);


DX1=[x2;
    x3;
    -6*x1-2.92*x2-1.2*x3+x1^2;
    x5-90*(x4-x1);
   x6-30*(x5-x2);
    -6*x4-2.92*x5-1.2*x6+x4^2-7.88*(x6-x3);];



OUT=[DX1(:)];