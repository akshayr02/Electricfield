clear all
close all
format long

A=20;
B=20;
M=5000;
L=5000;

xP=A/2;
yP=B/2;
zP=0.01;

% Let sigma/4*pi*epsilon_0=1
[Ex,Ey,Ez]=rectloopel(A,B,M,L,xP,yP,zP)
Er=sqrt(Ex^2+Ey^2+Ez^2)
Er_expec=2*pi

%Plotting close to plane
xP=A/2;
yP=B/2;
zP=0.01;

M_array=[10,100,1000,10000];
L_array=[10,100,1000,10000];
M_results=[0,0,0,0];
L_results=[0,0,0,0];

i=0;
for i=1:4
    [Ex1,Ey1,Ez1]=rectloopel(A,B,M_array(i),L,xP,yP,zP);
    [Ex2,Ey2,Ez2]=rectloopel(A,B,M,L_array(i),xP,yP,zP);
    M_results(i)=sqrt(Ex1^2+Ey1^2+Ez1^2);
    L_results(i)=sqrt(Ex2^2+Ey2^2+Ez2^2);
end
nexttile
loglog(M_array,M_results)
title('Varying M for Close to Plane')

nexttile
loglog(L_array,L_results)
title('Varying L for Close to Plane')
figure;


%Plotting far away from plane
xP=A/2;
yP=B/2;
zP=100;

M_array=[10,100,1000,10000];
L_array=[10,100,1000,10000];
M_results=[0,0,0,0];
L_results=[0,0,0,0];

i=0;
for i=1:4
    [Ex1,Ey1,Ez1]=rectloopel(A,B,M_array(i),L,xP,yP,zP);
    [Ex2,Ey2,Ez2]=rectloopel(A,B,M,L_array(i),xP,yP,zP);
    M_results(i)=sqrt(Ex1^2+Ey1^2+Ez1^2);
    L_results(i)=sqrt(Ex2^2+Ey2^2+Ez2^2);
end

nexttile
loglog(M_array,M_results)
title('Varying M for Far Away From Plane')

nexttile
loglog(L_array,L_results)
title('Varying L for Far Away From Plane')
figure;

%Plotting for edges of the rectangle
A=20;
B=20;
M=100;
L=100;

xP=-10:2:30;
yP=-10:2:30;
zP=0.1;
[XP,YP,ZP]=meshgrid(xP,yP,zP);
[Ex,Ey,Ez]=rectloopel(A,B,M,L,XP,YP,ZP);
% scale=0.75;
% quiver3(XP,YP,ZP,Ex,Ey,Ez,scale)
quiver3(XP,YP,ZP,Ex,Ey,Ez)
title('Electric field from Plane')
view(0,90)






