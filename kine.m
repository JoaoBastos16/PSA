function F = kine(theta,x,y,z)
wb=110*10^-3;
wp=35*10^-3;
%Up=73*10^-3;
L=164*10^-3 ; %? 
l=448*10^-3;
%sb=0.567
%sp=0.076
%L=0.524
%l=1.244
sb=wb/(3^(1/2)/6);
sp=wp/(3^(1/2)/6);
Up=3^(1/2)*sp/3;

%wb=(3^(1/2)/6)*sb
%wp=(3^(1/2)/6)*sp



a=wb-Up;
b=sp/2-(3^(1/2))/2*wb;
c=wp-1/2*wb;

F=[2*L*(y+a)*cos(theta(1))+2*z*L*sin(theta(1))+x^2+y^2+z^2+a^2+L^2+2*y*a-l^2
-L*(sqrt(3)*(x+b)+y+c)*cos(theta(2))+2*z*L*sin(theta(2))+x^2+y^2+z^2+b^2+c^2+L^2+2*x*b+2*y*c-l^2
L*(sqrt(3)*(x-b)-y-c)*cos(theta(3))+2*z*L*sin(theta(3))+x^2+y^2+z^2+b^2+c^2+L^2-2*x*b+2*y*c-l^2]
