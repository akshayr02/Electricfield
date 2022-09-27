function [Ex,Ey,Ez]=diskloopel(R,L,M,rP,phiP,zP)
% R=10;

% Defining variables:
Delta_phi=2*pi/M;
Delta_r=R/L;

phiQ=0;
rQ=0;
DeltaEx=0;
Ex=0;
DeltaEy=0;
Ey=0;
DeltaEz=0;
Ez=0;

% For loop for the integral:
for r=1:L
    rQ=-Delta_r+r*Delta_r;
    for m=1:M
        phiQ=-Delta_phi+m*Delta_phi;
    
        DeltaEx=Delta_phi*Delta_r*rQ.*(rP.*cos(phiP)-rQ.*cos(phiQ))./(zP.^2+rQ.^2+rP.^2-2*rQ.*rP.*cos(phiQ-phiP)).^(3/2);
        Ex=Ex+DeltaEx;
    
        DeltaEy=Delta_phi*Delta_r*rQ.*(rP.*sin(phiP)-rQ.*sin(phiQ))./(zP.^2+rQ.^2+rP.^2-2*rQ.*rP.*cos(phiQ-phiP)).^(3/2);
        Ey=Ey+DeltaEy;
    
        DeltaEz=Delta_phi*Delta_r*rQ.*zP./(zP.^2+rQ.^2+rP.^2-2*rQ.*rP.*cos(phiQ-phiP)).^(3/2);
        Ez=Ez+DeltaEz;
    end
end

end
