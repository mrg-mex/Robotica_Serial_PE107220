# Robotica Serial - PE107220: Practica Paralelos
## Objetivo de la Practica
El alumno implementará una simulación de un **Robot Paralelo Delta Plano 3RRR** en la que sintetiará el **modelo cinemático** de la postura generado para su aplicación en herramientas de **análisis visuales**.

***
## Metas de la Práctica
 - El alumno exportará una **cadena cinemática diseñada en CAD** a un programa de simulación.
 - El alumno analizará mediante una **simulación numérica** si las dimensiones del robot le permiten realizar una tarea programada.
 - El alumno configurará cada uno de los **elementos de la simulación** con el fin de simular la tarea programada.
 - El alumno **obtendrá la información generada por la simulación** con respecto al comportamiento de las juntas del robot, las velocidades y pares presentes durante estas.

***
## Conocimientos Previos
Los conocimientos necesarios para la realización de la práctica:
 - Conocimientos de ensamble en **CAD (Inventor y/o SolidWorks)**.
 - Conocimientos básicos de **MATLAB/Simulink**.
 - Conocimientos básicos de **Simscape Multibody**.

***
## Materiales y Equipo
Para la correcta ejecución de esta práctica se requiere el siguiente software instalado: 
 - Computadora/Laptop con [MATLAB/Simulink](https://la.mathworks.com/?s_tid=gn_logo) **version 2019a o superior**.
 - [Simscape Multibody](https://la.mathworks.com/products/simscape-multibody.html) compatible con la **versión de MATLAB instalada**.
 - Programa CAD:
    - Autodesk Inventor **2019 o superiror**.
    - SolidWorks **2020 SP5 o superior**.
 - Complemento de Simscape para tu software CAD: [Simscape Multibody Link](https://la.mathworks.com/help/physmod/smlink/index.html?s_tid=CRUX_lftnav)

***
## Estructura de la Simulación
La composición de esta practica se conforma de la siguiente manera:
- Archivos correspondientes al **modelo CAD** (Archivos STEP)
- **Ensamble principal** del Robot Paralelo (Ensamble de SolidWorks)
- **Archivos de exportación** para Simscape Multibody (Archivos .xml)
- Archivos de **configuración del CAD exportado** (Archivo DataFile.m)
- Arhcivo de **Simulación en Simulink** (Archivo .slx)
***