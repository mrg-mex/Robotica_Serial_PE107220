%%Cálculo de la postura del robot

%Definición del tiempo de la simulación 
t_total = 10; %seg

tsim = 0:0.1:t_total;

%Parámetros del robot
L1 = 0.12;  %m
L2 = 0.12;  %m
L3 = 0.06;  %m
x0 = 0.055;  %m
y0 = 0.0;   %m

%Posición y orientación inical

xp_inicial = 0.05;  %m
yp_inicial = 0.1;  %m
thetap_inicial = pi/2; %rad

%Posición y orientación final
xp_final = 0.15;  %m
yp_final = 0.10;  %m
thetap_final = -pi; %rad

%%%%%%%%%%%%Posición en la trayectoria 

x_tray = xp_inicial+((10/t_total^3)*tsim.^3-(15/t_total^4)*tsim.^4+(6/t_total^5)*tsim.^5)*(xp_final-xp_inicial);
y_tray = yp_inicial+((10/t_total^3)*tsim.^3-(15/t_total^4)*tsim.^4+(6/t_total^5)*tsim.^5)*(yp_final-yp_inicial);

plot(x_tray,y_tray)
%%%%%%%Requerimeintos de la orientación del robot

Theta_tray = thetap_inicial+((10/t_total^3)*tsim.^3-(15/t_total^4)*tsim.^4+(6/t_total^5)*tsim.^5)*(thetap_final-thetap_inicial);
figure
plot(tsim,Theta_tray)
%%%%%Establecimiento de la condición para los eslabones L1 y L2

x3_tray = x_tray-L3*cos(Theta_tray);
y3_tray = y_tray-L3*sin(Theta_tray);

figure
plot(x3_tray,y3_tray)
grid on

