%function geometry
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Set-up the geometry and discretization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all

nHalfCylinder = 3;
radiusCylinder = .25;
ySpace = 1.5*radiusCylinder;
xSpace = 1.5*radiusCylinder;

N  = 10;
nElmCyl = 20;

%Discretize the inlet and the outlet

xin1 = 0;
yin1 = 0;

xin2 = xin1;
yin2 = yin1 + ySpace + 2*radiusCylinder;

deltax = (xin2-xin1)/N;
deltay = (yin2-yin1)/N;

xe(1) = xin1;
ye(1) = yin1;

for i=2:N+1
    xe(i) = xe(i-1)+deltax;
    ye(i) = ye(i-1)+deltay;
end

for i=1:N
    xm(i) = .5*(xe(i)+xe(i+1));
    ym(i) = .5*(ye(i)+ye(i+1));
end


xout1 = xin1 + nHalfCylinder*2*radiusCylinder+(nHalfCylinder+1)*xSpace;
yout1 = 0;

xout2 = xout1;
yout2 = yin2;

xe(N+2) = xout1;
ye(N+2) = yout1;

for i=2:N+1
    xe(N+1+i) = xe(N+i)+deltax;
    ye(N+1+i) = ye(N+i)+deltay;
end

for i=1:N
    xm(N+i) = .5*(xe(N+i+1)+xe(N+i+2));
    ym(N+i) = .5*(ye(N+i+1)+ye(N+i+2));
end


%Discretize the cylinder

xCenter = .5*(xout1-xin1);
yCenter = .5*(yout2-yout1);

deltat = (2*pi)/nElmCyl;
te(1) = 0;
xeCyl(1) = xCenter + radiusCylinder*cos(te(1));
yeCyl(1) = yCenter + radiusCylinder*sin(te(1));
se(1) = 0;

for i=2:nElmCyl+1
    te(i) = te(i-1)+deltat;
    xeCyl(i) = xCenter + radiusCylinder*cos(te(i));
    yeCyl(i) = yCenter + radiusCylinder*sin(te(i));
    se(i) = se(i-1)+radiusCylinder*abs(deltat);
end



%%%%%PLOT

figure(1)
hold on
plot(xe,ye,'o'); 
plot(xm,ym,'x');
plot(xeCyl,yeCyl,'-*');


xlabel('x','fontsize',13);
ylabel('y','fontsize',13);
set(gca,'fontsize',15)
axis equal
axis([0 3 0 .875])
box on


