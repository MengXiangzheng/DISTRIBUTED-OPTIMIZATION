%general constraint
clc
clear
StartFor3DOF
% TTT=0.001 ;
% ASD=0.13;
% for t=0:TTT:300
% xi1hat=xi1-xi1pianzhi;
% xi2hat=xi2-xi2pianzhi;
% xi3hat=xi3-xi3pianzhi;
% xi4hat=xi4-xi4pianzhi;
% xi5hat=xi5-xi5pianzhi;
% xi6hat=xi6-xi6pianzhi;
% 
%     xi12=xi1hat+ ASD^(-1)*xi1d;
%     xi22=xi2hat+ASD^(-1)*xi2d;
%     xi32=xi3hat+ASD^(-1)*xi3d;
%     xi42=xi4hat+ASD^(-1)*xi4d;
%     xi52=xi5hat+ASD^(-1)*xi5d;
%     xi62=xi6hat+ASD^(-1)*xi6d;
% 
%     % xi12=xi1hat;
%     % xi22=xi2hat;
%     % xi32=xi3hat;
%     % xi42=xi4hat;
%     % xi52=xi5hat;
%     % xi62=xi6hat;
% 
%   p11=8-4*sign(xi12(1)-r11);
%     p12=8-4*sign(xi12(2)-r12);
%    p13=8-4*sign(xi12(3)-r13);
% 
%     p21=10-5*sign(xi22(1)-r21);
%     p22=10-5*sign(xi22(2)-r22);
%     p23=1-0.5*sign(xi22(3)-r23);
%     p31=10;
%     p32=10;
%     p33=10;
%     p41=4-2*sign(xi42(1)-r41);
%     p42=4-2*sign(xi42(2)-r42);
%     p43=4-2*sign(xi42(3)-r43);
%     p51=2-sign(xi52(1)-r51);
%     p52=2-sign(xi52(2)-r52);
%     p53=2-sign(xi52(3)-r53);
%     p61=8-4*sign(xi62(1)-r61);
%     p62=8-4*sign(xi62(2)-r62);
%     p63=8-4*sign(xi62(3)-r63);
% 
%     f1f=[((xi12(1) - r11))*(p11);((xi12(2) - r12))*(p12);((xi12(3) - r13))*(p13)];
%     f2f=[((xi22(1) - r21))*(p21);((xi22(2) - r22))*(p22);((xi22(3) - r23))*(p23)];
%     f3f=[((xi32(1) - r31))*(p31);((xi32(2) - r32))*(p32);((xi32(3) - r33))*(p33)];
%     f4f=[((xi42(1) - r41))*(p41);((xi42(2) - r42))*(p42);((xi42(3) - r43))*(p43)];
%     f5f=[((xi52(1) - r51))*(p51);((xi52(2) - r52))*(p52);((xi52(3) - r53))*(p53)];
%     f6f=[((xi62(1) - r61))*(p61);((xi62(2) - r62))*(p62);((xi62(3) - r63))*(p63)];
% 
%     f1=((xi12(1) - r11))^2*(p11)+((xi12(2) - r12))*(p12)+((xi12(3) - r13))^2*(p13);
%     f2=((xi22(1) - r21))^2*(p21)+((xi22(2) - r22))*(p22)+((xi22(3) - r23))^2*(p23);
%     f3=((xi32(1) - r31))^2*(p31)+((xi32(2) - r32))*(p32)+((xi32(3) - r33))^2*(p33);
%     f4=((xi42(1) - r41))^2*(p41)+((xi42(2) - r42))*(p42)+((xi42(3) - r43))^2*(p43);
%     f5=((xi52(1) - r51))^2*(p51)+((xi52(2) - r52))*(p52)+((xi52(3) - r53))^2*(p53);
%     f6=((xi62(1) - r61))^2*(p61)+((xi62(2) - r62))*(p62)+((xi62(3) - r63))^2*(p63);
% 
% 
% ff=norm(xi1hat-xoptimal)+norm(xi2hat-xoptimal)+norm(xi3hat-xoptimal)+norm(xi4hat-xoptimal)+norm(xi5hat-xoptimal)+norm(xi6hat-xoptimal);
% f =ff/f0
% %unbalanced
% wi12d=p*(3*xi1hat-xi4hat-xi2hat-xi3hat);
% wi22d=p*(2*xi2hat-xi1hat-xi6hat);
% wi32d=p*(xi3hat-xi2hat);
% wi42d=p*(2*xi4hat-xi5hat-xi1hat);
% wi52d=p*(3*xi5hat-xi6hat-xi2hat-xi4hat);
% wi62d=p*(2*xi6hat-xi1hat-xi2hat);
% 
% beta1d=-p*(3*beta1-beta2-beta4-beta3);
% beta2d=-p*(2*beta2-beta1-beta6);
% beta3d=-p*(beta3-beta2);
% beta4d=-p*(2*beta4-beta1-beta5);
% beta5d=-p*(3*beta5-beta2-beta4-beta6);
% beta6d=-p*(2*beta6-beta2-beta1);
% 
% beta1=beta1d*TTT+beta1;
% beta2=beta2d*TTT+beta2;
% beta3=beta3d*TTT+beta3;
% beta4=beta4d*TTT+beta4;
% beta5=beta5d*TTT+beta5;
% beta6=beta6d*TTT+beta6;
% 
% %%
% %inequalizty
% %x^2 + y^2 / (y +1)^2 <1;
% g2=xi22(1)^2 + xi22(2)^2 / (xi22(2) +1)^2 -1;
% g3=xi32(1)^2 + xi32(2)^2 / (xi32(2) +1)^2 -1;
% g4=xi42(1)^2 + xi42(2)^2 / (xi42(2) +1)^2 -1;
% g5=xi52(1)^2 + xi52(2)^2 / (xi52(2) +1)^2 -1;
% g6=xi62(1)^2 + xi62(2)^2 / (xi62(2) +1)^2 -1;
% 
% %gradient of inequalizty
% ng2=[2*xi22(1);(2*xi22(2))/(xi22(2) + 1)^3; 0];
% ng3=[2*xi32(1);(2*xi32(2))/(xi32(2) + 1)^3; 0];
% ng4=[2*xi42(1);(2*xi42(2))/(xi42(2) + 1)^3; 0];
% ng5=[2*xi52(1);(2*xi52(2))/(xi52(2) + 1)^3; 0];
% ng6=[2*xi62(1);(2*xi62(2))/(xi62(2) + 1)^3; 0];
% 
% 
% %gradient of equality
% na2=[0;0;xi22(3)-0];
% na4=[0;0;xi42(3)-0];
% na6=[0;0;xi62(3)-0];
% %%
% %%
% x1=xi1hat+c31*(-beta1(1)^(-1)*f1f-p*wi12-p*wi12d );
% % x1(2)=min(x1(2),cc);
% % x1(2)=max(x1(2),-cc);
% % x1(1)=min(x1(1),cc);
% % x1(1)=max(x1(1),-cc);
% % x1(3)=min(x1(3),cc);
% % x1(3)=max(x1(3),-cc);
% 
% 
% 
% x2=xi2hat+c32*(-beta2(2)^(-1)*f2f-p*wi22-p*wi22d-gm2*ng2-mu2-gg*c42*na2);
% % x2(2)=min(x2(2),cc);
% % x2(2)=max(x2(2),cc);
% % x2(1)=min(x2(1),cc);
% % x2(1)=max(x2(1),-cc);
% % x2(3)=min(x2(3),cc);
% % x2(3)=max(x2(3),-cc);
% 
% x3=xi3hat+c33*(-beta3(3)^(-1)*f3f-p*wi32-p*wi32d-gm3*ng3);
% x3(2)=max(x3(2),-cc);
% x3(2)=min(x3(2),cc);
% x3(1)=max(x3(1),-cc);
% x3(1)=min(x3(1),cc);
% % x3(3)=max(x3(3),-cc);
% % x3(3)=min(x3(3),cc);
% 
% 
% x4=xi4hat-c34*(beta4(4)^(-1)*f4f+p*wi42+p*wi42d-gm4*ng4-mu4-gg*c44*na4);
% % x4(2)=max(x4(2),-cc);
% % x4(2)=min(x4(2),cc);
% % x4(1)=max(x4(1),-cc);
% % x4(1)=min(x4(1),cc);
% % x4(3)=max(x4(3),-cc);
% % x4(3)=min(x4(3),cc);
% 
% 
% x5=xi5hat+c35*(-beta5(5)^(-1)*f5f-p*wi52-p*wi52d-gm5*ng5);
% x5(2)=max(x5(2),-cc);
% x5(2)=min(x5(2),cc);
% x5(1)=max(x5(1),-cc);
% x5(1)=min(x5(1),cc);
% % x5(3)=max(x5(3),-cc);
% % x5(3)=min(x5(3),cc);
% 
% x6=xi6hat+c36*(-beta6(6)^(-1)*f6f-p*wi62-p*wi62d-mu6-gg*c46*na6);
% x6(2)=max(x6(2),-cc);
% x6(2)=min(x6(2),cc);
% x6(1)=max(x6(1),-cc);
% x6(1)=min(x6(1),cc);
% % x6(3)=max(x6(3),-cc);
% % x6(3)=min(x6(3),cc);
% 
% %for inequality 
% gm2d=gg1*(-gm2+max(gm2+g2-ng2'*(xi2d+xi2hat-x2),0));
% gm3d=gg1*(-gm3+max(gm3+g3-ng3'*(xi3d+xi3hat-x3),0));
% gm4d=gg1*(-gm4+max(gm4+g4-ng4'*(xi4d+xi4hat-x4),0));
% gm5d=gg1*(-gm5+max(gm5+g5-ng5'*(xi5d+xi5hat-x5),0));
% gm6d=gg1*(-gm6+max(gm6+g6-ng6'*(xi6d+xi6hat-x6),0));
% 
% mu2d=gg*na2*c42;
% mu4d=gg*na4*c44;
% mu6d=gg*na6*c46; 
% 
% 
% % c4=1;
% % 
% c41d=c4*norm(xi1d+xi1hat-x1)^(2);
% c42d=c4*norm(xi2d+xi2hat-x2)^(2);
% c43d=c4*norm(xi3d+xi3hat-x3)^(2);
% c44d=c4*norm(xi4d+xi4hat-x4)^(2);
% c45d=c4*norm(xi5d+xi5hat-x5)^(2);
% c46d=c4*norm(xi6d+xi6hat-x6)^(2);
% 
% MIN=300;
% c41=min(c41d*TTT+c41,MIN);
% c42=min(c42d*TTT+c42,MIN);
% c43=min(c43d*TTT+c43,MIN);
% c44=min(c44d*TTT+c44,MIN);
% c45=min(c45d*TTT+c45,MIN);
% c46=min(c46d*TTT+c46,MIN);
% 
% % c41=8;
% % c42=8;
% % c43=8;
% % c44=8;
% % c45=8;
% % c46=8;
% 
% 
% gm2=gm2d*TTT+gm2;
% gm3=gm3d*TTT+gm3;
% gm4=gm4d*TTT+gm4;
% gm5=gm5d*TTT+gm5;
% gm6=gm6d*TTT+gm6;
% 
% mu2=mu2d*TTT+mu2;
% mu4=mu4d*TTT+mu4;
% mu6=mu6d*TTT+mu6;
% 
% 
% 
% xi1dd=-(ASD)*xi1d-ASD*c41*( xi12-x1);%sum of xi1 is actually tracking the sum of  final gradient + xi
% xi2dd=-(ASD)*xi2d-c42*( xi22-x2);
% xi3dd=-(ASD)*xi3d-c43*( xi32-x3);
% xi4dd=-(ASD)*xi4d-c44*( xi42-x4);
% xi5dd=-(ASD)*xi5d-c45*( xi52-x5);
% xi6dd=-(ASD)*xi6d-c46*( xi62-x6);
% 
% 
% % c41=C41(i);
% % c42=C42(i);
% % c43=C43(i);
% % c44=C44(i);
% % c45=C45(i);
% % c46=C46(i);
% 
% % xi1d=-(xi1hat-x1);%sum of xi1 is actually tracking the sum of  final gradient + xi
% % xi2d=-(xi2hat-x2);
% % xi3d=-(xi3hat-x3);
% % xi4d=-(xi4hat-x4);
% % xi5d=-(xi5hat-x5);
% % xi6d=-(xi6hat-x6);
% 
% 
% wi12=wi12d*TTT+wi12;
% wi22=wi22d*TTT+wi22;
% wi32=wi32d*TTT+wi32;
% wi42=wi42d*TTT+wi42;
% wi52=wi52d*TTT+wi52;
% wi62=wi62d*TTT+wi62;
% 
% 
% xi1d=xi1dd*TTT*TTTT+xi1d;
% xi2d=xi2dd*TTT*TTTT+xi2d;
% xi3d=xi3dd*TTT*TTTT+xi3d;
% xi4d=xi4dd*TTT*TTTT+xi4d;
% xi5d=xi5dd*TTT*TTTT+xi5d;
% xi6d=xi6dd*TTT*TTTT+xi6d;
% 
% 
% xi1=xi1d*TTT+xi1;
% xi2=xi2d*TTT+xi2;
% xi3=xi3d*TTT+xi3;
% xi4=xi4d*TTT+xi4;
% xi5=xi5d*TTT+xi5;
% xi6=xi6d*TTT+xi6;
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% xi11d=xi1d(1);
% xi12d=xi1d(2);
% 
% 
% 
% 
% i=i+1;
% T(i)=t;
% 
% X13(i)=xi1(3);
% X23(i)=xi2(3);
% X33(i)=xi3(3);
% X43(i)=xi4(3);
% X53(i)=xi5(3);
% X63(i)=xi6(3);
% 
% F(i)=f;
% 
% end



figure('Name','residual term')
% plot(T,F,'LineWidth',1);
% hold on
% set(gca,'FontSize',18)
% xlabel('time(s)','interpreter','latex','FontSize', 30);ylabel('$x_{i,3}$(m)','interpreter','latex','FontSize', 30);%�������ʾ�����ǩ
% set(gca,'LooseInset', max(get(gca,'TightInset'), 0.02))


%general constraint
% clc
% clear
StartFor3DOF
TTT=0.01 ;

for t=0:TTT:300
xi1hat=xi1-xi1pianzhi;
xi2hat=xi2-xi2pianzhi;
xi3hat=xi3-xi3pianzhi;
xi4hat=xi4-xi4pianzhi;
xi5hat=xi5-xi5pianzhi;
xi6hat=xi6-xi6pianzhi;
    % 
    % xi12=xi1hat+xi1d;
    % xi22=xi2hat+xi2d;
    % xi32=xi3hat+xi3d;
    % xi42=xi4hat+xi4d;
    % xi52=xi5hat+xi5d;
    % xi62=xi6hat+xi6d;

    xi12=xi1hat;
    xi22=xi2hat;
    xi32=xi3hat;
    xi42=xi4hat;
    xi52=xi5hat;
    xi62=xi6hat;

  p11=8-4*sign(xi12(1)-r11);
    p12=8-4*sign(xi12(2)-r12);
   p13=8-4*sign(xi12(3)-r13);
   
    p21=10-5*sign(xi22(1)-r21);
    p22=10-5*sign(xi22(2)-r22);
    p23=1-0.5*sign(xi22(3)-r23);
    p31=10;
    p32=10;
    p33=10;
    p41=4-2*sign(xi42(1)-r41);
    p42=4-2*sign(xi42(2)-r42);
    p43=4-2*sign(xi42(3)-r43);
    p51=2-sign(xi52(1)-r51);
    p52=2-sign(xi52(2)-r52);
    p53=2-sign(xi52(3)-r53);
    p61=8-4*sign(xi62(1)-r61);
    p62=8-4*sign(xi62(2)-r62);
    p63=8-4*sign(xi62(3)-r63);
    
    f1f=[((xi12(1) - r11))*(p11);((xi12(2) - r12))*(p12);((xi12(3) - r13))*(p13)];
    f2f=[((xi22(1) - r21))*(p21);((xi22(2) - r22))*(p22);((xi22(3) - r23))*(p23)];
    f3f=[((xi32(1) - r31))*(p31);((xi32(2) - r32))*(p32);((xi32(3) - r33))*(p33)];
    f4f=[((xi42(1) - r41))*(p41);((xi42(2) - r42))*(p42);((xi42(3) - r43))*(p43)];
    f5f=[((xi52(1) - r51))*(p51);((xi52(2) - r52))*(p52);((xi52(3) - r53))*(p53)];
    f6f=[((xi62(1) - r61))*(p61);((xi62(2) - r62))*(p62);((xi62(3) - r63))*(p63)];
    
    f1=((xi12(1) - r11))^2*(p11)+((xi12(2) - r12))*(p12)+((xi12(3) - r13))^2*(p13);
    f2=((xi22(1) - r21))^2*(p21)+((xi22(2) - r22))*(p22)+((xi22(3) - r23))^2*(p23);
    f3=((xi32(1) - r31))^2*(p31)+((xi32(2) - r32))*(p32)+((xi32(3) - r33))^2*(p33);
    f4=((xi42(1) - r41))^2*(p41)+((xi42(2) - r42))*(p42)+((xi42(3) - r43))^2*(p43);
    f5=((xi52(1) - r51))^2*(p51)+((xi52(2) - r52))*(p52)+((xi52(3) - r53))^2*(p53);
    f6=((xi62(1) - r61))^2*(p61)+((xi62(2) - r62))*(p62)+((xi62(3) - r63))^2*(p63);


ff=norm(xi1hat-xoptimal)+norm(xi2hat-xoptimal)+norm(xi3hat-xoptimal)+norm(xi4hat-xoptimal)+norm(xi5hat-xoptimal)+norm(xi6hat-xoptimal);
f =ff/f0
%unbalanced
wi12d=p*(3*xi1hat-xi4hat-xi2hat-xi3hat);
wi22d=p*(2*xi2hat-xi1hat-xi6hat);
wi32d=p*(xi3hat-xi2hat);
wi42d=p*(2*xi4hat-xi5hat-xi1hat);
wi52d=p*(3*xi5hat-xi6hat-xi2hat-xi4hat);
wi62d=p*(2*xi6hat-xi1hat-xi2hat);

beta1d=-p*(3*beta1-beta2-beta4-beta3);
beta2d=-p*(2*beta2-beta1-beta6);
beta3d=-p*(beta3-beta2);
beta4d=-p*(2*beta4-beta1-beta5);
beta5d=-p*(3*beta5-beta2-beta4-beta6);
beta6d=-p*(2*beta6-beta2-beta1);

beta1=beta1d*TTT+beta1;
beta2=beta2d*TTT+beta2;
beta3=beta3d*TTT+beta3;
beta4=beta4d*TTT+beta4;
beta5=beta5d*TTT+beta5;
beta6=beta6d*TTT+beta6;

%%
%inequalizty
%x^2 + y^2 / (y +1)^2 <1;
g2=xi22(1)^2 + xi22(2)^2 / (xi22(2) +1)^2 -1;
g3=xi32(1)^2 + xi32(2)^2 / (xi32(2) +1)^2 -1;
g4=xi42(1)^2 + xi42(2)^2 / (xi42(2) +1)^2 -1;
g5=xi52(1)^2 + xi52(2)^2 / (xi52(2) +1)^2 -1;
g6=xi62(1)^2 + xi62(2)^2 / (xi62(2) +1)^2 -1;

%gradient of inequalizty
ng2=[2*xi22(1);(2*xi22(2))/(xi22(2) + 1)^3; 0];
ng3=[2*xi32(1);(2*xi32(2))/(xi32(2) + 1)^3; 0];
ng4=[2*xi42(1);(2*xi42(2))/(xi42(2) + 1)^3; 0];
ng5=[2*xi52(1);(2*xi52(2))/(xi52(2) + 1)^3; 0];
ng6=[2*xi62(1);(2*xi62(2))/(xi62(2) + 1)^3; 0];


%gradient of equality
na2=[0;0;xi22(3)-0];
na4=[0;0;xi42(3)-0];
na6=[0;0;xi62(3)-0];
%%
%%
x1=xi1hat+c31*(-beta1(1)^(-1)*f1f-p*wi12-p*wi12d );
% x1(2)=min(x1(2),cc);
% x1(2)=max(x1(2),-cc);
% x1(1)=min(x1(1),cc);
% x1(1)=max(x1(1),-cc);
% x1(3)=min(x1(3),cc);
% x1(3)=max(x1(3),-cc);



x2=xi2hat+c32*(-beta2(2)^(-1)*f2f-p*wi22-p*wi22d-gm2*ng2-mu2-gg*c42*na2);
% x2(2)=min(x2(2),cc);
% x2(2)=max(x2(2),cc);
% x2(1)=min(x2(1),cc);
% x2(1)=max(x2(1),-cc);
% x2(3)=min(x2(3),cc);
% x2(3)=max(x2(3),-cc);

x3=xi3hat+c33*(-beta3(3)^(-1)*f3f-p*wi32-p*wi32d-gm3*ng3);
x3(2)=max(x3(2),-cc);
x3(2)=min(x3(2),cc);
x3(1)=max(x3(1),-cc);
x3(1)=min(x3(1),cc);
% x3(3)=max(x3(3),-cc);
% x3(3)=min(x3(3),cc);


x4=xi4hat-c34*(beta4(4)^(-1)*f4f+p*wi42+p*wi42d-gm4*ng4-mu4-gg*c44*na4);
% x4(2)=max(x4(2),-cc);
% x4(2)=min(x4(2),cc);
% x4(1)=max(x4(1),-cc);
% x4(1)=min(x4(1),cc);
% x4(3)=max(x4(3),-cc);
% x4(3)=min(x4(3),cc);


x5=xi5hat+c35*(-beta5(5)^(-1)*f5f-p*wi52-p*wi52d-gm5*ng5);
x5(2)=max(x5(2),-cc);
x5(2)=min(x5(2),cc);
x5(1)=max(x5(1),-cc);
x5(1)=min(x5(1),cc);
% x5(3)=max(x5(3),-cc);
% x5(3)=min(x5(3),cc);

x6=xi6hat+c36*(-beta6(6)^(-1)*f6f-p*wi62-p*wi62d-mu6-gg*c46*na6);
x6(2)=max(x6(2),-cc);
x6(2)=min(x6(2),cc);
x6(1)=max(x6(1),-cc);
x6(1)=min(x6(1),cc);
% x6(3)=max(x6(3),-cc);
% x6(3)=min(x6(3),cc);

%for inequality 
gm2d=gg1*(-gm2+max(gm2+g2-ng2'*(xi2d+xi2hat-x2),0));
gm3d=gg1*(-gm3+max(gm3+g3-ng3'*(xi3d+xi3hat-x3),0));
gm4d=gg1*(-gm4+max(gm4+g4-ng4'*(xi4d+xi4hat-x4),0));
gm5d=gg1*(-gm5+max(gm5+g5-ng5'*(xi5d+xi5hat-x5),0));
gm6d=gg1*(-gm6+max(gm6+g6-ng6'*(xi6d+xi6hat-x6),0));

mu2d=gg*na2*c42;
mu4d=gg*na4*c44;
mu6d=gg*na6*c46; 


% c4=1;
% 
% c41d=c4*norm(xi1d+xi1hat-x1)^(2);
% c42d=c4*norm(xi2d+xi2hat-x2)^(2);
% c43d=c4*norm(xi3d+xi3hat-x3)^(2);
% c44d=c4*norm(xi4d+xi4hat-x4)^(2);
% c45d=c4*norm(xi5d+xi5hat-x5)^(2);
% c46d=c4*norm(xi6d+xi6hat-x6)^(2);
% 
% MIN=300;
% c41=min(c41d*TTT+c41,MIN);
% c42=min(c42d*TTT+c42,MIN);
% c43=min(c43d*TTT+c43,MIN);
% c44=min(c44d*TTT+c44,MIN);
% c45=min(c45d*TTT+c45,MIN);
% c46=min(c46d*TTT+c46,MIN);

% c41=8;
% c42=8;
% c43=8;
% c44=8;
% c45=8;
% c46=8;


gm2=gm2d*TTT+gm2;
gm3=gm3d*TTT+gm3;
gm4=gm4d*TTT+gm4;
gm5=gm5d*TTT+gm5;
gm6=gm6d*TTT+gm6;

mu2=mu2d*TTT+mu2;
mu4=mu4d*TTT+mu4;
mu6=mu6d*TTT+mu6;

% ASD=3*max(t,0.01)^(-1);
% ASD=1;
% xi1dd=-(ASD)*xi1d-c41*( xi12-x1);%sum of xi1 is actually tracking the sum of  final gradient + xi
% xi2dd=-(ASD)*xi2d-c42*( xi22-x2);
% xi3dd=-(ASD)*xi3d-c43*( xi32-x3);
% xi4dd=-(ASD)*xi4d-c44*( xi42-x4);
% xi5dd=-(ASD)*xi5d-c45*( xi52-x5);
% xi6dd=-(ASD)*xi6d-c46*( xi62-x6);


% c41=C41(i);
% c42=C42(i);
% c43=C43(i);
% c44=C44(i);
% c45=C45(i);
% c46=C46(i);

xi1d=-(xi1hat-x1);%sum of xi1 is actually tracking the sum of  final gradient + xi
xi2d=-(xi2hat-x2);
xi3d=-(xi3hat-x3);
xi4d=-(xi4hat-x4);
xi5d=-(xi5hat-x5);
xi6d=-(xi6hat-x6);


wi12=wi12d*TTT+wi12;
wi22=wi22d*TTT+wi22;
wi32=wi32d*TTT+wi32;
wi42=wi42d*TTT+wi42;
wi52=wi52d*TTT+wi52;
wi62=wi62d*TTT+wi62;


% xi1d=xi1dd*TTT*TTTT+xi1d;
% xi2d=xi2dd*TTT*TTTT+xi2d;
% xi3d=xi3dd*TTT*TTTT+xi3d;
% xi4d=xi4dd*TTT*TTTT+xi4d;
% xi5d=xi5dd*TTT*TTTT+xi5d;
% xi6d=xi6dd*TTT*TTTT+xi6d;


xi1=xi1d*TTT+xi1;
xi2=xi2d*TTT+xi2;
xi3=xi3d*TTT+xi3;
xi4=xi4d*TTT+xi4;
xi5=xi5d*TTT+xi5;
xi6=xi6d*TTT+xi6;











xi11d=xi1d(1);
xi12d=xi1d(2);




i=i+1;
T(i)=t;

X13(i)=xi1(3);
X23(i)=xi2(3);
X33(i)=xi3(3);
X43(i)=xi4(3);
X53(i)=xi5(3);
X63(i)=xi6(3);

F(i)=f;

end



% fcost=f1+f2+f3+f4+f5+f6

% fcostglobalmin=900;
% for b1=0:0.01:4
%     for b2=0:0.01:4
%         b=[b1;b2];
%   f1=(r1(1:2, :)-b)'*[p11 0; 0 p12]*(r1(1:2, :)-b);
%   f2=(r2(1:2, :)-b)'*[p21 0; 0 p22]*(r2(1:2, :)-b);
%   f3=(r3(1:2, :)-b)'*[p31 0; 0 p32]*(r3(1:2, :)-b);
%   f4=(r4(1:2, :)-b)'*[p41 0; 0 p42]*(r4(1:2, :)-b);
%   f5=(r5(1:2, :)-b)'*[p51 0; 0 p52]*(r5(1:2, :)-b);
%   f6=(r6(1:2, :)-b)'*[p61 0; 0 p62]*(r6(1:2, :)-b);
% 
% fcostglobal=f1+f2+f3+f4+f5+f6;
% if(fcostglobal<fcostglobalmin)
%     bmin=[b1;b2];
%     fcostglobalmin=fcostglobal;
% end
%     end
% end
% fcostglobalmin %0.27 0.08


% figure('Name',' q1q2t ')
% plot(X11,X12,'LineWidth',2);
% hold on
% plot(X21,X22,'LineWidth',2);
% hold on
% plot(X31,X32,'LineWidth',2);
% hold on
% plot(X41,X42,'LineWidth',2);
% hold on
% plot(X51,X52,'LineWidth',2);
% hold on
% plot(X61,X62,'LineWidth',2);
% hold on
% plot((X11+X21+X31+X41+X51+X61)/6,(X12+X22+X32+X42+X52+X62)/6,'LineWidth',2);
% hold on
% legend('$i$=1','$i$=2','$i$=3','$i$=4','$i$=5','$i$=6','formation center','interpreter','latex','FontSize', 20)
% h =plot([xi1pianzhi(1)+z1hat(1), xi2pianzhi(1)+z2hat(1), xi3pianzhi(1)+z3hat(1), xi4pianzhi(1)+z4hat(1), xi5pianzhi(1)+z5hat(1), xi6pianzhi(1)+z6hat(1), xi1pianzhi(1)+z6hat(1)], ...
%      [xi1pianzhi(2)+z1hat(2), xi2pianzhi(2)+z2hat(2), xi3pianzhi(2)+z3hat(2), xi4pianzhi(2)+z4hat(2), xi5pianzhi(2)+z5hat(2), xi6pianzhi(2)+z6hat(2), xi1pianzhi(2)+z1hat(2)], 'k', 'LineWidth', 0.3);
% set(h,'HandleVisibility','off'); 
%  xlabel('${x_{i,1}}$(m)','interpreter','latex','FontSize', 40);ylabel('${x_{i,2}}$(m)','interpreter','latex','FontSize', 40);
%  set(gca, 'FontSize', 40);
%  hold off;
% 
% 
% figure('Name',' C4 ')
% plot(T,C41,'LineWidth',1);
% hold on
% plot(T,C42,'LineWidth',1);
% hold on
% plot(T,C43,'LineWidth',1);
% hold on
% plot(T,C44,'LineWidth',1);
% hold on
% plot(T,C45,'LineWidth',1);
% hold on
% plot(T,C46,'LineWidth',1);
% hold on
% set(gca,'FontSize',18)
% legend('$i$=1','$i$=2','$i$=3','$i$=4','$i$=5','$i$=6','interpreter','latex','FontSize', 14)
% zlabel('time(s)','interpreter','latex','FontSize', 50);xlabel('time(s)','interpreter','latex','FontSize', 30);ylabel('$\alpha_{zi}$','interpreter','latex','FontSize', 50);
% set(gca,'LooseInset', max(get(gca,'TightInset'), 0.00))
% ylim([0 5])
% xlim([0 50])
% 
% 
% 
% figure('Name','x_i,1')
% plot(T,X11,'LineWidth',1);
% hold on
% plot(T,X21,'LineWidth',1);
% hold on
% plot(T,X31,'LineWidth',1);
% hold on
% plot(T,X41,'LineWidth',1);
% hold on
% plot(T,X51,'LineWidth',1);
% hold on
% plot(T,X61,'LineWidth',1);
% hold on
% set(gca,'FontSize',18)
% legend('$i$=1','$i$=2','$i$=3','$i$=4','$i$=5','$i$=6','interpreter','latex','FontSize', 14)
% xlabel('time(s)','interpreter','latex','FontSize', 30);ylabel('$x_{i,1}$(m)','interpreter','latex','FontSize', 30);%�������ʾ�����ǩ
% set(gca,'LooseInset', max(get(gca,'TightInset'), 0.02))
% xlim([0 50])
% ylim([-2 5])
% 
% figure('Name','x_i,2')
% plot(T,X12,'LineWidth',1);
% hold on
% plot(T,X22,'LineWidth',1);
% hold on
% plot(T,X32,'LineWidth',1);
% hold on
% plot(T,X42,'LineWidth',1);
% hold on
% plot(T,X52,'LineWidth',1);
% hold on
% plot(T,X62,'LineWidth',1);
% hold on
% set(gca,'FontSize',18)
% legend('$i$=1','$i$=2','$i$=3','$i$=4','$i$=5','$i$=6','interpreter','latex','FontSize', 14)
% xlabel('time(s)','interpreter','latex','FontSize', 30);ylabel('$x_{i,2}$(m)','interpreter','latex','FontSize', 30);%�������ʾ�����ǩ
% set(gca,'LooseInset', max(get(gca,'TightInset'), 0.02))
% xlim([0 50])
% ylim([-1.5 3.5])

% figure('Name','x_i,3')
% plot(T,X13,'LineWidth',1);
% hold on
% plot(T,X23,'LineWidth',1);
% hold on
% plot(T,X33,'LineWidth',1);
% hold on
% plot(T,X43,'LineWidth',1);
% hold on
% plot(T,X53,'LineWidth',1);
% hold on
% plot(T,X63,'LineWidth',1);
% hold on
% set(gca,'FontSize',18)
% legend('$i$=1','$i$=2','$i$=3','$i$=4','$i$=5','$i$=6','interpreter','latex','FontSize', 14)
% xlabel('time(s)','interpreter','latex','FontSize', 30);ylabel('$x_{i,3}$(m)','interpreter','latex','FontSize', 30);%�������ʾ�����ǩ
% set(gca,'LooseInset', max(get(gca,'TightInset'), 0.02))
% xlim([0 50])


plot(T,F,'LineWidth',1);
hold on
set(gca,'FontSize',18)
% legend('Second-order algorithm (4.13)','First-order algorithm (3.6)','interpreter','latex','FontSize', 14)
xlabel('time(s)','interpreter','latex','FontSize', 30);
ylabel('Relative error $\frac{\|x-x^*\|}{\|x-x(0)\|)}$','interpreter','latex','FontSize', 30);%�������ʾ�����ǩ
set(gca,'LooseInset', max(get(gca,'TightInset'), 0.02))
set(gca,'YScale','log'); 
xlim([0 300])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure('Name','x_i,1d')
% plot(T,X11d,'LineWidth',1);
% hold on
% plot(T,X21d,'LineWidth',1);
% hold on
% plot(T,X31d,'LineWidth',1);
% hold on
% plot(T,X41d,'LineWidth',1);
% hold on
% plot(T,X51d,'LineWidth',1);
% hold on
% plot(T,X61d,'LineWidth',1);
% hold on
% set(gca,'FontSize',18)
% legend('$i$=1','$i$=2','$i$=3','$i$=4','$i$=5','$i$=6','interpreter','latex','FontSize', 14)
% xlabel('time(s)','interpreter','latex','FontSize', 30);ylabel('$\dot x_{i,1}$(m/s)','interpreter','latex','FontSize', 30);%�������ʾ�����ǩ
% set(gca,'LooseInset', max(get(gca,'TightInset'), 0.02))
% xlim([0 50])
% % ylim([-2 5])
% 
% figure('Name','x_i,2d')
% plot(T,X12d,'LineWidth',1);
% hold on
% plot(T,X22d,'LineWidth',1);
% hold on
% plot(T,X32d,'LineWidth',1);
% hold on
% plot(T,X42d,'LineWidth',1);
% hold on
% plot(T,X52d,'LineWidth',1);
% hold on
% plot(T,X62d,'LineWidth',1);
% hold on
% set(gca,'FontSize',18)
% legend('$i$=1','$i$=2','$i$=3','$i$=4','$i$=5','$i$=6','interpreter','latex','FontSize', 14)
% xlabel('time(s)','interpreter','latex','FontSize', 30);ylabel('$\dot x_{i,2}$(m/s)','interpreter','latex','FontSize', 30);%�������ʾ�����ǩ
% set(gca,'LooseInset', max(get(gca,'TightInset'), 0.02))
% xlim([0 50])
% % ylim([-1.5 3.5])
% 
% figure('Name','x_i,3d')
% plot(T,X13d,'LineWidth',1);
% hold on
% plot(T,X23d,'LineWidth',1);
% hold on
% plot(T,X33d,'LineWidth',1);
% hold on
% plot(T,X43d,'LineWidth',1);
% hold on
% plot(T,X53d,'LineWidth',1);
% hold on
% plot(T,X63d,'LineWidth',1);
% hold on
% set(gca,'FontSize',18)
% legend('$i$=1','$i$=2','$i$=3','$i$=4','$i$=5','$i$=6','interpreter','latex','FontSize', 14)
% xlabel('time(s)','interpreter','latex','FontSize', 30);ylabel('$\dot x_{i,3}$(m/s)','interpreter','latex','FontSize', 30);%�������ʾ�����ǩ
% set(gca,'LooseInset', max(get(gca,'TightInset'), 0.02))
% xlim([0 50])

    