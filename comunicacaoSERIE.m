


%%
clear all, clc, close all
casa1="D4"
Letra=extractBetween(casa1,1,1)
Numero=extractBetween(casa1,2,2)
Letra=char(Letra)
Numero=double(Numero)
Letra=double(lower(Letra))-double('a')+1
A1_x=150
A1_y=80
A8_x=135
A8_y=-82
h1_x=-15
h1_y=98

Delta_x_numero=(A8_x-A1_x)/7;
Delta_y_numero=(A8_y-A1_y)/7;
Delta_x_Letra=(h1_x-A1_x)/7;
Delta_y_Letra=(h1_y-A1_y)/7;
 yIni=A1_y+(Delta_y_numero)*(Numero-1)+(Delta_y_Letra)*(Letra-1)
 xIni=A1_x+(Delta_x_numero)*(Numero-1)+(Delta_x_Letra)*(Letra-1)
Letra_final=18-Letra
yFinal=A1_y+(Delta_y_numero)*(Numero-1)+(Delta_y_Letra)*(Letra_final-1)
 xFinal=A1_x+(Delta_x_numero)*(Numero-1)+(Delta_x_Letra)*(Letra_final-1)
porta = "COM4";
s = serialport(porta,115200)
configureTerminator(s,"CR")
%s.Timeout=3
%flush(s)
readline(s)
readline(s)
writeline(s,"UIM0"); answer=readline(s)
i=false
while i==false
 if i==false
    writeline(s,"UIM0"); answer1=readline(s)
 
if answer1==" "
    answer1="  ";
end
 if strlength(answer1)<2
      writeline(s,"UIM0"); answer1=readline(s)
if answer1==" "
    answer1="  ";
end
 else
        if extractBetween(answer1,2,2)=="U"
            i=true;
        end
 end
 end
end


%for i=1:20
 %   readline(s)
  %  pause(0.5)
%end
%flush(s)
writeline(s,"M17"); readline(s) 
pause(2)
writeline(s,"M17.1");readline(s)
pause(2)
%writeline(s,"M90");readline(s)
writeline(s,"M24 P1");readline(s)
writeline(s,"G1 Z0");readline(s)
pause(2)
writeline(s,"G1 X0 Y0");readline(s)
pause(2)
writeline(s,"G1 Z30");readline(s)
pause(2)
writeline(s,"G1 X"+xIni+ " Y"+yIni);readline(s)
pause(2)
writeline(s,"G1 Z-20");readline(s)
pause(2)
writeline(s,"G1 Z30");readline(s)
pause(2)
writeline(s,"G1 X"+xFinal+ "Y"+yFinal);readline(s)
pause(2)
writeline(s,"G1 Z-20");readline(s)
pause(2)
writeline(s,"G1 Z30");readline(s)
pause(2)
writeline(s,"G1 X0 Y0");readline(s)
pause(2)
%writeline(s,"G1 Z0");readline(s)
%pause(2)
writeline(s,"M18"); readline(s)
flush(s)
pause(2)
writeline(s,"UIM0"); answer=readline(s)
%flush(s)
%writeline(s,"UIM0"); answer=readline(s)
 %answer=readline(s)
x=hex2dec(extractBetween(answer,52,59))/1000 %mm
y=hex2dec(extractBetween(answer,60,67))/1000 %mm
z=hex2dec(extractBetween(answer,68,75))/1000 %mm
q1=hex2dec(extractBetween(answer,180,187));
if q1>2.1475e+9
    q1=(q1-2^32)/1000
else
q1=q1/1000
end
q2=hex2dec(extractBetween(answer,188,195));
if q2>2.1475e+9
    q2=(q2-2^32)/1000
else
q2=q2/1000
end
 
q3=hex2dec(extractBetween(answer,196,203));
if q3>2.1475e+9
    q3=(q3-2^32)/1000
else
q3=q3/1000
end
writeline(s,"M18");readline(s)
flush(s)

