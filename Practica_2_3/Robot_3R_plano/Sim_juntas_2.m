%Resolución de la configuración inical de un robot

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

%Posición y orientación inical
xp_final = 0.15;  %m
yp_final = 0.10;  %m
thetap_final = -pi; %rad

%Determinación de la coordenada x3 y y3 en la configuración inicial

x3_inicial = xp_inicial-L3*cos(thetap_inicial);
y3_inicial = yp_inicial-L3*sin(thetap_inicial);

%Determinación de la coordenada x3 y y3 en la configuración inicial

x3_final = xp_final-L3*cos(thetap_final);
y3_final = xp_final-L3*sin(thetap_final);

%Cálculo de la postura inicial

%Definición de las variables
syms theta1_in theta2_in theta1_fin theta2_fin

%Cálculo de la postura inicial
[theta1_in,theta2_in] = solve(x0+L1*cos(theta1_in)+L2*cos(theta1_in+theta2_in)==x3_inicial,y0+L1*sin(theta1_in)+L2*sin(theta1_in+theta2_in)==y3_inicial,[theta1_in,theta2_in]);

%Cálculo de la postura final
[theta1_fin,theta2_fin] = solve(x0+L1*cos(theta1_fin)+L2*cos(theta1_fin+theta2_fin)==x3_final,y0+L1*sin(theta1_fin)+L2*sin(theta1_fin+theta2_fin)==y3_final,[theta1_fin,theta2_fin]);


%%%%%%Simulación numerica %%%%%%%%%%

%Duración del tiempo de simulación 

T = 10; %seg tiempor total de la tarea
muestreo = 20;
intiempo = 10/muestreo;

%segmento del tiempo
%t = 0:intiempo:tfinal;

%Cálculo del ángulo theta3 solución 1
theta3in_1 = thetap_inicial-theta1_in(1)-theta2_in(1);
theta3fin_1 = thetap_final-theta1_fin(1)-theta2_fin(1);

%Cálculo del ángulo theta3 solución 1
theta3in_2 = thetap_inicial-theta1_in(2)-theta2_in(2);
theta3fin_2 = thetap_final-theta1_fin(2)-theta2_fin(2);


%Simulación 2

for i = 1:1:muestreo+1
    
t = intiempo*(i-1); %Se toma en cuenta 0 como inicio de la acción

theta1sim2 = theta1_in(2)+((10/T^3)*t^3-(15/T^4)*t^4+(6/T^5)*t^5)*(theta1_fin(2)-theta1_in(2));
theta2sim2 = theta2_in(2)+((10/T^3)*t^3-(15/T^4)*t^4+(6/T^5)*t^5)*(theta2_fin(2)-theta2_in(2));
theta3sim2 = theta3in_2+((10/T^3)*t^3-(15/T^4)*t^4+(6/T^5)*t^5)*(theta3fin_2-theta3in_2);
    
x1L2 = [0 x0+L1*cos(theta1sim2)];
y1L2 = [0 y0+L1*sin(theta1sim2)];

x2L2 = [x0+L1*cos(theta1sim2) x0+L1*cos(theta1sim2)+L2*cos(theta1sim2+theta2sim2)];
y2L2 = [y0+L1*sin(theta1sim2) y0+L1*sin(theta1sim2)+L2*sin(theta1sim2+theta2sim2)];

x3L2 = [x0+L1*cos(theta1sim2)+L2*cos(theta1sim2+theta2sim2) x1+L1*cos(theta1sim2)+L2*cos(theta1sim2+theta2sim2)+L3*cos(theta1sim2+theta2sim2+theta3sim2)];
y3L2 = [y0+L1*sin(theta1sim2)+L2*sin(theta1sim2+theta2sim2) y0+L1*sin(theta1sim2)+L2*sin(theta1sim2+theta2sim2)+L3*sin(theta1sim2+theta2sim2+theta3sim2)];

%plot(xp_inicial,yp_inicial,'k*');
%plot(xp_final,yp_final,'k*');
%figure
line(x1L2,y1L2,'Color','red','LineStyle','-')
line(x2L2,y2L2,'Color','green','LineStyle','-')
line(x3L2,y3L2,'Color','blue','LineStyle','-')

F(i) = getframe;

end

movie(F)

