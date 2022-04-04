# Práctica 2. Simulación de un robot RRR en el plano


## 1. Objetivo de la práctica

“El alumno implementará una simulación de un robot serial RRR en el plano en la cual sintetizará el modelo cinemático la postura generado para su aplicación en herramientas de análisis virtuales.”

## 2. Metas

Para la realización de la práctica se deben cumplir las siguientes metas:

•	El alumno exportará una cadena cinemática diseñada en CAD a un programa de simulación.

•	El alumno analizará mediante una simulación numérica si las dimensiones del robot le permiten realizar una tarea programada.

•	El alumno verificará las relaciones generadas por las juntas y de ser necesario realizará las compensaciones correspondientes.

•	El alumno configurará cada uno de los elementos de la simulación con el fin de simular la tarea programada (una planeación en el espacio de las juntas).

•	El alumno obtendrá la información generada por la simulación con respecto al comportamiento de las juntas del robot, las velocidades y pares presentes durante estas.

## 3. Antecedentes

Actualmente, se plantea que los robots realicen diferentes tipos de tareas programadas, por lo que es necesario realizar un análisis previo para verificar que estos tienen la capacidad de manipular los materiales o herramientas que se requieren. Entre las herramientas más utilizadas para analizar la manera en que los robots realizan una tarea se encuentra el uso de herramientas computacionales las cuales permiten simular a los robots realizado alguna tarea en circunstancias específicas. Para el uso de estas herramientas es necesario tener conocimientos de CAD y de programación. En el caso de esta práctica se plantea el análisis de una cadena cinemática en el plano compuesta por tres eslabones unidos por tres juntas rotacionales R sobre el plano xy del sistema inercial, la cual desplazará y orientará al efector final del robot mediante una planeación en el espacio sus juntas en un periodo de tiempo determinado utilizando un perfil de trayectoria quintico. 

## 4. Conocimientos previos

Los conocimientos necesarios para la realización de la práctica:

•	Conocimientos de ensamble en CAD (Inventor y/o Solidworks).

•	Conocimientos básicos de Matlab.

•	Conocimientos básicos de Simulink.


## 5.	Materiales y Equipo

Para la realización de la práctica es necesario contar con lo siguiente:

•	Una computadora con Matlab con Simulink y Simscape Multibody.

•	Tener instalado el recurso de Multibody. 

•	Programa de CAD Inventor o Solidworks.

•	Habilitar el complemento de Simscape en el servidor de Matlab.

•	Instalar la ruta de la librería del archivo .dll en el CAD. 

•	Archivos de importación de la cadena cinemática. 


## 6.	Preparativos previos y recomendaciones 

•	Descargar el archivo Robot_3R_plano.rar y descomprimir su contenido en una carpeta específica en la cual se crearán los archivos para esta práctica y para la práctica 3.

•	Para habilitar el complemento de Simscape Multibody es necesario inicial Matlab como administrador y en la ventana de comando escribir regmatlabserver y presionar enter.

•	Para habilitar el archivo .dll para la exportación de archivos es necesario introducir en la ventana de comando smlink_linkinv en el caso que se utilice Autodesk Inventor o smlink_linksw en el caso que se utilice Solidworks y presionar enter.


## 7.	Desarrollo de la práctica

1.	Descomprimir el archivo Robot_3R_plano.rar en una carpeta.

[![F-2-1.png](https://i.postimg.cc/htyF5qhF/F-2-1.png)](https://postimg.cc/RWHbWycG)

2.	Utilizar el programa el programa Sim_juntas_1 o Sim_juntas_2 para comprobar la capacidad del robot de adoptar una configuración inicial y una configuración final para la planeación de una tarea de acuerdo con los parámetros programados.

[![F-2-2.png](https://i.postimg.cc/0QSLjMnx/F-2-2.png)](https://postimg.cc/sQVn02b0)

** Estos parámetros pueden variar según el semestre.

3.	Correr el programa con el fin de establecer si el robot es capaz de realizar la tarea, si no hay ningún problema se mostrara el recorrido de los eslabones durante la realización de una tarea. 

[![F-2-3.png](https://i.postimg.cc/2yFMdsgK/F-2-3.png)](https://postimg.cc/7JhKwWH3)

4.	Si la comprobación numérica funcionó, lo siguiente es exportar el archivo de la cadena cinemática al introducir en la ventana de comando smimport(‘Robot_3R_plan.xml’).

[![F-2-4.png](https://i.postimg.cc/vm4RRS64/F-2-4.png)](https://postimg.cc/f3QqmCCs)

5.	De la exportación se generará el diagrama de bloques en Simulink, cual es necesario configurar cada una de las juntas dando doble clic sobre los bloques. La configuración de cada una de las juntas de establecer el movimiento como una entrada y que el par de la junta se calcule de manera automática. 

[![F-2-5.png](https://i.postimg.cc/xjKwSmq3/F-2-5.png)](https://postimg.cc/RqZs7N7W)

En la configuración de sensado se debe habilitar las salidas de velocidad y de par.

[![F-2-6.png](https://i.postimg.cc/NfBWG0Hq/F-2-6.png)](https://postimg.cc/Z0sfV4HV)


6.	Lo siguiente es crear un bloque de reloj (clock) y un bloque de Matlab Function y conectarlos. En el bloque de Matlab Function se debe introducir el siguiente código:


```

function [theta1s,theta2s,theta3s] = fcn(u)
 
T = 10;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theta1in_cal = 2*atan(145535^(1/2)/17 + 384/17);
%theta1_cal = -2*atan(145535^(1/2)/17 + 384/17);
 
theta2in_cal = -2*atan(145535^(1/2)/65);
%theta2in_cal = 2*atan(145535^(1/2)/65);
 
theta3in_cal = pi/2 + 2*atan(145535^(1/2)/65) - 2*atan(145535^(1/2)/17 + 384/17);
%theta3in_cal = pi/2 - 2*atan(145535^(1/2)/65) + 2*atan(145535^(1/2)/17 - 384/17);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
theta1fin_cal = 2*atan(824423^(1/2)/3349 + 1440/3349);
%theta1fin_cal = -2*atan(824423^(1/2)/3349 + 1440/3349);
 
theta2fin_cal = -2*atan(824423^(1/2)/1861);
%theta2fin_cal = 2*atan(824423^(1/2)/1861);
 
theta3fin_cal = 2*atan(824423^(1/2)/1861) - pi - 2*atan(824423^(1/2)/3349 + 1440/3349);
%theta3fin_cal =2*atan(824423^(1/2)/3349 - 1440/3349) - 2*atan(824423^(1/2)/1861) - pi;
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theta1s = -(theta1in_cal+((10/T^3)*u^3-(15/T^4)*u^4+(6/T^5)*u^5)*(theta1fin_cal-theta1in_cal));
theta2s = -(theta2in_cal+((10/T^3)*u^3-(15/T^4)*u^4+(6/T^5)*u^5)*(theta2fin_cal-theta2in_cal));
theta3s = -(theta3in_cal+((10/T^3)*u^3-(15/T^4)*u^4+(6/T^5)*u^5)*(theta3fin_cal-theta3in_cal));
 

```

Nota: los valores presentados corresponden a los resultados calculados de la solución numérica obtenida anteriormente por lo que pueden variar según los parámetros definidos cada semestre. 

7.	Programado el diagrama “Matlab function” es necesario salvarlo para que aparezcan las salidas correspondientes para cada función.

[![F-2-7.png](https://i.postimg.cc/zf6sqSn0/F-2-7.png)](https://postimg.cc/2qdcwW9Z)

8.	Después es necesario utilizar un filtro “Simulink-PS Converter” para cada salida del bloque anterior con la entrada de cada junta correspondiente.

[![F-2-8.png](https://i.postimg.cc/5yMDC4Kz/F-2-8.png)](https://postimg.cc/k6fjrmmM)

Cada uno de estos filtros es necesario configurarlos para que sea un filtro que calcule hasta la segunda derivada de la señal que recibe. 

[![F-2-9.png](https://i.postimg.cc/Pqp7VpBZ/F-2-9.png)](https://postimg.cc/VSw4d6sL)

9.	Para las salidas de los sensores de cada una de las juntas es necesario usar un filtro “PS-Simulink Converter” para cada una de las salidas de las salidas de las juntas. La salida del filtro debe ser conectado a un bloque de “Scope”, todas las señales de un mismo tipo deben ser enviadas a un bloque “Scope” específico, se recomienda utilizar un bloque “Mux” para agrupar las señales. Lo anterior se presenta en la siguiente imagen. 

[![F-2-10.png](https://i.postimg.cc/vHhC4dr1/F-2-10.png)](https://postimg.cc/tY1Bcwmy)

10.	 Para el manejo de información de las señales se debe crear un bloque “Dashboard Scope”, uno para las velocidades y otro para los pares en que calcula la simulación. Se recomienda colocar una etiqueta a cada una de las señales para facilitar su conexión al bloque de Dashboard Scope. 

[![F-2-11.png](https://i.postimg.cc/qv7SnZw1/F-2-11.png)](https://postimg.cc/3dPtQ1PG)

[![F-2-12.png](https://i.postimg.cc/BnwyCcw4/F-2-12.png)](https://postimg.cc/18wJm6Qj)

11.	 Por último, solo se debe iniciar la simulación dando clic en el botón Run o presionando las teclas ctrl y T al mismo tiempo.

12.	Resultados
Los resultados esperados son los siguientes:
•	Simulación del robot realizando la trayectoria (vídeo)

[![F-2-13.png](https://i.postimg.cc/jjpFpqb1/F-2-13.png)](https://postimg.cc/Z9LH3S0P)

•	Y las gráficas de las velocidades angulares y pares de cada una de las juntas que muestran en los bloques Dashboard Scope.

13.	Conclusiones 
La conclusión de una práctica se establece conforme al objetivo de la práctica y el complimiento de las metas planteadas para su realización.


## Material realizado en el Departamento de Ingeniería Mecatrónica, Facultad de Ingeniería, UNAM, CU, mediante el apoyo de la Dirección General de Asuntos del Personal Académico, Dirección de Apoyo a la Docencia, mediante el proyecto PAPIME PE107220 “Fortalecimiento de la enseñanza de la asignatura de robótica mediante la elaboración de material didáctico”
