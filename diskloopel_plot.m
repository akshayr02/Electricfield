clear all
close all
format long

R=10;
M=100;
L=100;

rP=0;
phiP=0;
zP=25;

% Let sigma/4*pi*epsilon_0=1
[Ex,Ey,Ez]=diskloopel(R,L,M,rP,phiP,zP)
Er=sqrt(Ex^2+Ey^2+Ez^2)
Er_expec=2*pi*(1-zP/(zP^2+R^2)^(1/2))

% Checking convergence for a point close to the disk
% Defining variables
rP=10;
phiP=0;
zP=0.1;

M_array=[10,100,1000,10000,20000];
L_array=[10,100,1000,10000,20000];
M_results=[0,0,0,0,0];
L_results=[0,0,0,0,0];

% For loop to find the values of the electric field for different
% parameters
i=0;
for i=1:5
    [Ex1,Ey1,Ez1]=diskloopel(R,1000,M_array(i),rP,phiP,zP);
    [Ex2,Ey2,Ez2]=diskloopel(R,L_array(i),1000,rP,phiP,zP);
    M_results(i)=sqrt(Ex1^2+Ey1^2+Ez1^2);
    L_results(i)=sqrt(Ex2^2+Ey2^2+Ez2^2);
end

% Plotting the results 
nexttile
loglog(M_array,M_results)
title('Varying M for Close to Disk')

nexttile
loglog(L_array,L_results)
title('Varying L for Close to Disk')
figure;


% Checking convergence for a point far from the disk
% Defining variables
rP=10;
phiP=0;
zP=25;

M_array=[10,100,1000,10000];
L_array=[10,100,1000,10000];
M_results=[0,0,0,0];
L_results=[0,0,0,0];

% For loop to find the values of the electric field for different
% parameters
i=0;
for i=1:4
    [Ex1,Ey1,Ez1]=diskloopel(R,L,M_array(i),rP,phiP,zP);
    [Ex2,Ey2,Ez2]=diskloopel(R,L_array(i),M,rP,phiP,zP);
    M_results(i)=sqrt(Ex1^2+Ey1^2+Ez1^2);
    L_results(i)=sqrt(Ex2^2+Ey2^2+Ez2^2);
end

% Plotting the results 
nexttile
loglog(M_array,M_results)
title('Varying M for Far Away From Disk')

nexttile
loglog(L_array,L_results)
title('Varying L for Far Away From Disk')
figure;

%Plotting for circular symmetry
R=10;
M=100;
L=100;

s=0.05;
rP=0:2:20;
phiP=(0:s:1)*2*pi;
zP=25;
[RP,PHIP,ZP]=meshgrid(rP,phiP,zP);
XP=RP.*cos(PHIP);
YP=RP.*sin(PHIP);
[Ex,Ey,Ez]=diskloopel(R,M,L,RP,PHIP,ZP);
% scale=0.75;
% quiver3(XP,YP,ZP,Ex,Ey,Ez,scale)
quiver3(XP,YP,ZP,Ex,Ey,Ez)
title('Electric Field from a Disk')
view(0,90)








