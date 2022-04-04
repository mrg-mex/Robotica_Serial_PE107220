# Evaluación de un de un robot serial en el espacio

## 1.	Objetivo de la práctica

El alumno evaluará la capacidad cinemática de movilidad que tiene un robot 3R en el espacio durante la realización de una tarea mediante el índice de manipulabilidad.

## 2.	Metas
Para la realización de la práctica se deben cumplir las siguientes metas:

•	El alumno programará una simulación de una planeación de trayectorias en el espacio de trabajo del robot 3R en el espacio, en la cual moverá su efector final de un punto a otro dentro de su espacio de trabajo.

•	Para la planeación se programará una solución analítica dentro de la interfase de Simulink. 

•	De la simulación de la trayectoria en el espacio de trabajo del robot el alumno obtendrá las gráficas del comportamiento cinemático de la posición, las velocidades y de los pares obtenidos en cada una de las juntas, además de la gráfica del índice de manipulabilidad (El determinante de la matriz Jacobiana).

## 3.	Antecedentes
Los robots son sistemas mecatrónicos los cuales tienen la capacidad de interactuar con su entorno manipulando materiales y herramientas con el fin de realizar algún tipo de tarea. La capacidad de un robot de realizar una tarea depende de las características de la configuración de su estructura mecánica. Actualmente, se ha propuesto varios criterios para evaluar la capacidad cinemática de un robot de manipular un objeto dentro de su espacio de trabajo en función de su postura. Uno de los criterios más utilizados para estimar la capacidad cinemática de un robot es el índice de manipulabilidad el cual se obtiene del cálculo del determinante de la matriz Jacobiana. 

## 4.	Conocimientos previos 

Los conocimientos necesarios para la realización de la práctica:

•	Conocimientos básicos de Matlab.

•	Conocimientos básicos de Simulink.

## 5.	Materiales y Equipo

Para la realización de la práctica es necesario contar con lo siguiente:

•	Una computadora con Matlab con Simulink y Simscape Multibody.

•	Tener instalado el recurso de Multibody.

•	Archivos para generar la simulación.


## 6.	Preparativos previos y recomendaciones 

•	Descargar el paquete de archivos comprimidos “Robot_RRR_vert2.zip”, y descomprimirlos en una carpeta específica.

## 7.	Desarrollo de la práctica

7.1.	Colocarse en la ventana de “Current Folder” correspondiente a la práctica 4.

[![F-4-1.png](https://i.postimg.cc/N0dvnJ7n/F-4-1.png)](https://postimg.cc/p95ShBSQ)

7.2.	Abrir Simulink y el archivo de archivo de la simulación de la práctica 4

[![F-4-2.png](https://i.postimg.cc/6QnY2yTf/F-4-2.png)](https://postimg.cc/WDpMxpGd)

7.3.	Para implementar las simulaciones es necesario crear una función con el fin de calcular las posturas iniciales y finales del robot al inicio de cada simulación, por lo que hay crear un nuevo Script en un archivo .m, y colocar el siguiente código:
*Nota: el script debe llamarse igual que la función “postura”.

4.	Generar la información de la trayectoria y de las juntas mediante la programación del siguiente script.

```
%%%Programa de solución analítica de un robot 3R en el espacio
 
%Definición de la trayectoria%%%%%%%%
 
%Punto inicial%%%%%%%%%%%%
x_in = 0.25;
y_in = 0.20;
z_in = 0.05;
 
%Punto final%%%%%%%%%%%%%%
x_fin = 0.25;
y_fin = -0.20;
z_fin = 0.15;
 
%Definición de los parámetros de la trayectoria%%%%%%%%%%%%
t_total = 10;
t_in = 0.1;
t_sim = 0:t_in:t_total;
 
%Puntos de la trayectoria%%%%%%%%%%%%%%
xp = x_in+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(x_fin-x_in);
yp = y_in+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(y_fin-y_in);
zp = z_in+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(z_fin-z_in);
 
plot3(xp,yp,zp)
grid on
title('Trayectoria')
xlabel('x')
ylabel('y')
zlabel('z')
 
%%%%%%%parametros del robot
b1 = 0.085;%0z1
L1 = 0.25; %1z2
L2 = 0.2875;%2z3
 
%%Cálculo de la solución analítica
 
 
z1 = [0;0;1];     %Vector de dirección z1
z1_n = 1;       %Norma del vector z1
p0_1 = [0;0;b1];    %Posición del sistema 1 con respecto al sistema 0
 
for i=1:length(t_sim)
    
    p0_P = [xp(i);yp(i);zp(i)]; %Vector de posición del sistema P con respecto a 0
    p1_P =  p0_P-p0_1;  
%Vector de posición del sistema P con respecto a 1
    
    nor_p1_P = norm(p1_P);
%Cálculo de la norma del vector p1_P
    produc_p = dot(z1,p1_P);
    
    ang_phi = acos(dot(z1,p1_P)/(norm(p1_P)*z1_n));
    ang_alfa = acos((L1^2+nor_p1_P^2-L2^2)/(2*L1*nor_p1_P));
    
    theta1_analitic(i) = atan2(yp(i),xp(i));
    theta2_analitic(i) = ang_phi-ang_alfa;
    theta3_analitic(i) = pi-asin(nor_p1_P*sin(ang_alfa)/L2);
end
 
%%Grafica de la postura de las juntas
 
figure
plot(t_sim,theta1_analitic,t_sim,theta2_analitic,t_sim,theta3_analitic)
grid on
title('Posiciones angulares numerico')
xlabel('t')
ylabel('rad/s')
legend({'theta1','theta2','theta3'},'Location','southwest')
 
%%Generación de las señales de salida
 
t = transpose(t_sim);
 
theta1_geo = transpose(-theta1_analitic);
theta2_geo = transpose(-theta2_analitic);
theta3_geo = transpose(theta3_analitic);
 
signal_theta1geo = [t theta1_geo];
signal_theta2geo = [t theta2_geo];
signal_theta3geo = [t theta3_geo];
 
%Cálculo de la inversa cinemática 
 
for i=1:length(t_sim)
    
   theta1_sol = theta1_analitic(i);
   theta2_sol = theta2_analitic(i);
   theta3_sol = theta3_analitic(i);
 
  
J11 = -sin(theta1_sol)*(L2*sin(theta2_sol+theta3_sol)+L1*sin(theta2_sol));
J12 = cos(theta1_sol)*(L2*cos(theta2_sol+theta3_sol)+L1*cos(theta2_sol));
J13 = L2*cos(theta2_sol+theta3_sol)*cos(theta1_sol);
 
J21 = cos(theta1_sol)*(L2*sin(theta2_sol+theta3_sol)+L1*sin(theta2_sol));
J22 = sin(theta1_sol)*(L2*cos(theta2_sol+theta3_sol)+L1*cos(theta2_sol));
J23 = L2*cos(theta2_sol+theta3_sol).*sin(theta1_sol); 
 
J31 = 0;
J32 = -L2*sin(theta2_sol+theta3_sol)-L1*sin(theta2_sol);
J33 = -L2*sin(theta2_sol+theta3_sol);
 
J = [J11,J12,J13;J21,J22,J23;J31,J32,J33];
 
pvx = xpv(i);
pvy = ypv(i);
pvz = zpv(i);
 
pv = [pvx;pvy;pvz];
 
qv = inv(J)*pv;
 
theta1v_n(i)=-qv(1);
theta2v_n(i)=-qv(2);
theta3v_n(i)=qv(3);
 
w(i) = det(J);
 
end
 
figure
plot(t_sim,w)
grid on
title('Manipulabilidad')
xlabel('t')
ylabel('w')
 
figure
plot(t_sim,theta1v_n,t_sim,theta2v_n,t_sim,theta3v_n)
grid on
title('Velocidades angulares numerico')
xlabel('t')
ylabel('rad/s')
legend({'theta1','theta2','theta3'},'Location','southwest')
 
```

Para finalizar es necesario correr el script para generar la información en el espacio de trabajo.

7.5. Modificar la trayectoria para que corresponda a la siguiente ecuación:

[![F-4-3.png](https://i.postimg.cc/xjXVxVpD/F-4-3.png)](https://postimg.cc/w3YrMZd0)


```
%%%%Trayectoria en el espacio %%%%
 
xc = 0.25;
yc = 0.0;
zc = 0.2;
 
A = 0.1;
B = 0.05;
 
ang_gama = pi/3;
ang_beta = pi/6;
ang_alpha = pi/6;
 
thetae_in = 0;
thetae_fin = 2*pi;
 
%Definición de los parámetros de la trayectoria
t_total = 10;
t_in = 0.1;
t_sim = 0:t_in:t_total;
 
%theta_e= thetae_in+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(thetae_fin-thetae_in)


% theta_ev = ((30/t_total^3)*t_sim.^2-(60/t_total^4)*t_sim.^3+(30/t_total^5)*t_sim.^4)*(thetae_fin-thetae_in)


 
xp = xc-B*sin(thetae_in+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(thetae_fin-thetae_in))*(cos(ang_gama)*sin(ang_alpha)-cos(ang_alpha)*sin(ang_beta)*sin(ang_gama))+A*cos(thetae_in+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(thetae_fin-thetae_in))*cos(ang_alpha)*cos(ang_beta);

yp = yc+B*sin(thetae_in+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(thetae_fin-thetae_in))*(cos(ang_gama)*cos(ang_alpha)+sin(ang_alpha)*sin(ang_beta)*sin(ang_gama))+A*cos(thetae_in+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(thetae_fin-thetae_in))*sin(ang_alpha)*cos(ang_beta);

zp = zc-A*cos(thetae_in+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(thetae_fin-thetae_in))*sin(ang_beta)+B*cos(ang_beta)*sin(ang_gama)*sin(thetae_in+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(thetae_fin-thetae_in));
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%Grafica de la trayectoria 
 
plot3(xp,yp,zp)
grid on
title('Trayectoria')
xlabel('x')
ylabel('y')
zlabel('z')
 
```

7.6.	Determinar los parámetros de la trayectoria propuesta en el punto anterior de tal manera que la trayectoria resultante la pueda realizar el robot.


7.7.	Implementar los datos obtenidos en la simulación

[![F-4-4.png](https://i.postimg.cc/Fs0q8rjq/F-4-4.png)](https://postimg.cc/F7sDJQCg)

[![F-4-5.png](https://i.postimg.cc/523r9sKS/F-4-5.png)](https://postimg.cc/Wdd8Xwvd)

7.8.	 Extraer la información de la simulación

La información de la simulación que se debe extraer son las gráficas:

•	Las posturas de sus juntas.

•	De las velocidades en las juntas del robot.

•	Los pares en cada una de las juntas del robot.

•	La gráfica del índice de manipulabilidad del robot.


## 9.	Resultados
Los resultados esperados son los siguientes:

•	Simulación del robot realizando las trayectorias establecidas en cada una de las planeaciones.

[![F-4-6.png](https://i.postimg.cc/JnwZfL36/F-4-6.png)](https://postimg.cc/4K5YcjSV)

•	Graficas de las Y las gráficas de las posturas, velocidades angulares y pares de cada una de las juntas calculada de manera analítica utilizando un método geométrico.

•	Y las gráficas de las posturas, velocidades angulares y pares de cada una de las juntas que muestran en los bloques Dashboard Scope.

•	Comparación del comportamiento cinemático y dinámico de cada una de las simulaciones.
*Las gráficas deben contener título y leyenda sobre los ejes.


## 10.	Conclusiones 

La conclusión de una práctica se establece conforme al objetivo de la práctica y el complimiento de las metas planteadas para su realización.

## Bibliografía 
•	Reporte de robot serial, clase de termas selectos de robótica semestre 2019-2.

•	Documentación de Simscape Multibody de Matlab.

•	Material de apuntes de clase. 


## Material realizado en el Departamento de Ingeniería Mecatrónica, Facultad de Ingeniería, UNAM, CU, mediante el apoyo de la Dirección General de Asuntos del Personal Académico, Dirección de Apoyo a la Docencia, mediante el proyecto PAPIME PE107220 “Fortalecimiento de la enseñanza de la asignatura de robótica mediante la elaboración de material didáctico”



