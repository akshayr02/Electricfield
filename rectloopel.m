function [Ex,Ey,Ez]=rectloopel(A,B,M,L,xP,yP,zP)
%A=20
%B=20

%Defining variables:
Delta_x=A/M;
Delta_y=B/L;

xQ=0;
yQ=0;
DeltaEx=0;
Ex=0;
DeltaEy=0;
Ey=0;
DeltaEz=0;
Ez=0;

for x=1:M
    xQ=-Delta_x+x*Delta_x;
    for y=1:L
        yQ=-Delta_y+y*Delta_y;
    
        DeltaEx=Delta_x*Delta_y*(xP-xQ)./((xP-xQ).^2+(yP-yQ).^2+zP.^2).^(3/2);
        Ex=Ex+DeltaEx;
    
        DeltaEy=Delta_x*Delta_y*(yP-yQ)./((xP-xQ).^2+(yP-yQ).^2+zP.^2).^(3/2);
        Ey=Ey+DeltaEy;
    
        DeltaEz=Delta_x*Delta_y*zP./((xP-xQ).^2+(yP-yQ).^2+zP.^2).^(3/2);
        Ez=Ez+DeltaEz;
    end
end

end
