clear all;clc;close all
for i=1:3
%syms tf tf2 tf3 tf4 tf5 th_o th_f th_d_o th_d_f th_dd_o th_dd_f
tf=10;
%th_o=pi/6;th_f=-pi/6;th_d_o=0;th_d_f=0;th_dd_o=0;th_dd_f=0
th_o=0;th_f=-0.2453;

th_d_o=0;th_d_f=0;th_dd_o=0;th_dd_f=0
tf2=tf*tf;tf3=tf2*tf;tf4=tf3*tf;tf5=tf4*tf;



A=[1 0 0 0 0 0;1 tf tf2 tf3 tf4 tf5;
    0 1 0 0 0 0;0 1 2*tf 3*tf2 4*tf3 5*tf4;
    0 0 2 0 0 0;0 0 2 6*tf 12*tf2 20*tf3]
 b=[th_o;th_f;th_d_o;th_d_f;th_dd_o;th_dd_f]
 x=A\b
 delt=tf/10
 for i=1:11
     t(i)=(i-1)*delt
     th(i)=x(1)+x(2)*t(i)+x(3)*t(i)^2+x(4)*t(i)^3+x(5)*t(i)^4+x(6)*t(i)^5;
     th_d(i)=x(2)+2*x(3)*t(i)+3*x(4)*t(i)^2+4*x(5)*t(i)^3+5*x(6)*t(i)^4;
     th_dd(i)=2*x(3)+6*x(4)*t(i)+12*x(5)*t(i)^2+20*x(6)*t(i)^3;
 end
 
 plot(t,th,t,th_d,t,th_dd); grid on
 xlabel('time (sec)')
 ylabel('angle (rad) , rate (r/s), and acceleration (r/s^2)')
 %pretty(simplify(x))
end
