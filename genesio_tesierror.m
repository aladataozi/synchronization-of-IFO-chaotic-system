load('e_h_5.mat')
t=0:10001;
e1=zeros(1,10002);
e2=zeros(1,10002);
e3=zeros(1,10002);
e1=x(1,:)-x(4,:);
e2=x(2,:)-x(5,:);
e3=x(3,:)-x(6,:);

% figure,plot(t,x(1,:),'r','LineWidth',1)
% hold on
% plot(t,x(4,:),'--b','LineWidth',1)
%  xlabel(' time(s)')
%  ylabel(' synchronization state x_1,y_1')
%  xlim([0,200])

% figure,plot(t,x(2,:),'r','LineWidth',1)
% hold on
% plot(t,x(5,:),'--b','LineWidth',1)
%  xlabel(' time(s)')
%  ylabel(' synchronization state x_2,y_2')
%  xlim([0,200])
 
% figure,plot(t,x(3,:),'r','LineWidth',1)
% hold on
% plot(t,x(6,:),'--b','LineWidth',1)
%  xlabel(' time(s)')
%  ylabel(' synchronization state x_3,y_3')
%  xlim([0,200])


% %  figure,plot(t,e1,'LineWidth',1)
% xlabel(' time(s)')
% ylabel(' Synchronization error e_1')
% xlim([0,200])
 

% figure,plot(t,e2,'LineWidth',1)
% xlabel(' time(s)')
% ylabel(' Synchronization error e_2')
% xlim([0,200])
 

figure,plot(t,e3,'LineWidth',1)
xlabel(' time(s)')
ylabel(' Synchronization error e_3')
xlim([0,200])