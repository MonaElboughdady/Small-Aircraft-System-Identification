function c = p68_props
%
%  P68_PROPS  Defines P68 mass and geometry properties.  
%
%  Usage: c = p68_props;
%
%  Description:
%
%    Defines mass and geometry properties for the P.68 nonlinear simulation.
%
%  Inputs:
%    
%    None
%
%  Outputs:
%
%    c = c.c(1) through c.c(9) = inertia constants.
%        c.c vector elements are:
%          c(1) = ((iyy-izz)*izz - ixz^2)/gam    ;    gam=ixx*izz-ixz^2
%          c(2) = (ixx-iyy+izz)*ixz/gam
%          c(3) = izz/gam
%          c(4) = ixz/gam
%          c(5) = (izz-ixx)/iyy
%          c(6) = ixz/iyy
%          c(7) = 1.0/iyy
%          c(8) = (ixx*(ixx-iyy) + ixz^2)/gam
%          c(9) = ixx/gam
%        c.mass  = aircraft mass, slugs.
%        c.xcg   = longitudinal CG location,
%                  distance normalized by the MAC.
%        c.xcgr  = reference longitudinal CG location,
%                  distance normalized by the MAC.
%        c.heng  = angular momentum for rotating mass
%                  of the propulsion system.
%        c.sarea = wing reference area, ft2.
%        c.bspan = wing span, ft.
%        c.cbar  = wing MAC, ft.
%        c.lim   = array of hard limits for the controls.
%        c.ac    = name of the aircraft.
%

%
%    Calls:
%      None
%      
%    Author:  Riccardo Di Bari, Mona Elogbogdady
%
%    History:  
%      26 May 2023 - Created and debugged, EAM.
%
%  Copyright (C) Eugene A. Morelli
%
%  This software and/or technical data carry no warranty 
%  of any kind, either expressed, implied, or statutory. 
%
%  Please email bug reports or suggestions for improvements to:
%
%      e.a.morelli@nasa.gov
%
g=32.174;
%
%  Mass/inertia.
%
c.mass=4416.74/g;     % slug
ixx=9496.0;           % slug-ft2 %Inertia of p-68
iyy=55814.0;          % slug-ft2 %Inertia of p-68
izz=63100.0;          % slug-ft2 %Inertia of p-68
ixz=982.0;            % slug-ft2 %Inertia of p-68
c.heng=160;           % slug-ft2/s 
gam=ixx*izz-ixz*ixz;
c.c=zeros(9,1);
c.c(1)=((iyy-izz)*izz-ixz*ixz)/gam;
c.c(2)=(ixx-iyy+izz)*ixz/gam;
c.c(3)=izz/gam;
c.c(4)=ixz/gam;
c.c(5)=(izz-ixx)/iyy;
c.c(6)=ixz/iyy;
c.c(7)=1.0/iyy;
c.c(8)=(ixx*(ixx-iyy)+ixz*ixz)/gam;
c.c(9)=ixx/gam;
%
%  Geometry.
%
c.sarea=200.21;          % ft2
c.bspan=39.37;           % ft
c.cbar=4.658;         % ft %to update
%
%  CG location.
%
c.xcgr=0.35;          % fraction of cbar %to update
c.xcg=0.25;           % fraction of cbar %to update
%
%  Control hard limits. %to update
%
%  Throttle, fraction of full throttle.
%
c.lim(1,:)=[0,1];
%
%  Stabilator, deg.
%
c.lim(2,:)=[-20,20];
%
%  Aileron, deg.
%
c.lim(3,:)=[-25,25];
%
%  Rudder, deg.
%
c.lim(4,:)=[-25,25];
%
%  Aircraft name.
%
c.ac='p68';
return
