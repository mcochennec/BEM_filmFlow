%function [Gxx,Gxy,Gyx,Gyy...
       ...,Px,Py...
       ...,Txxx,Tyxx,Txxy,Tyxy...
       ...,Tyyy,Tyyx,Txyy,Txyyxy]...
       ...
       ...= greenFunction (X0,Y0,X,Y,period)
       
   

% wave number

wn = 2*pi/period;


% Compute single layer 
DX = X-X0;
DY = Y-Y0;

CHY = cosh(wn*DY);
SHY = sinh(wn*DY);
CX  =  cos(wn*DX);
SX  =  sin(wn*DX);

D = CHY-CX;

A  = 0.5*log(2.0*D);
AX = 0.5*wn*SX /D;
AY = 0.5*wn*SHY/D;

Gxx = -A-DY*AY;   
Gxy =  DY*AX;
Gyx =  Gxy;
Gyy = -A+DY*AY;
  
% Compute double layer
D2  = D*D;
AYY = 0.5*wn*wn*(1.0-CX*CHY)/D2;
AXY =-0.5*wn*wn*SX*SHY /D2;
T1 = -2.0*(2.0*AX+DY*AXY);
T2 = -2.0*(AY+DY*AYY);
T3 =  2.0*DY*AXY;
T4 = -2.0*(AY-DY*AYY);

Px = 2.0*AX;
Py = 2.0*AY;

Txxx = T1;
Txxy = T2;
Tyxx = T2;
Tyxy = T3;

Txyx = T2;
Txyy = T3;
Tyyx = T3;
Tyyy = T4;