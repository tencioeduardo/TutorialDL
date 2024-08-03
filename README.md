# Tutorial del curso de Diseño Lógico

## 1. Datos personales
José Eduardo Tencio Solano 2021079387

## 2. Abreviaturas y definiciones
- **FPGA**: Field Programmable Gate Arrays

## 3. Referencias
[0] David Harris y Sarah Harris. *Digital Design and Computer Architecture. RISC-V Edition.* Morgan Kaufmann, 2022. ISBN: 978-0-12-820064-3

[Tutorial](https://github.com/DJosueMM/open_source_fpga_environment/wiki)

## 4. Desarrollo

### 4.1 Parte 1: Instalación de las herramientas
Se descargó el software necesario y las extensiones para Visual Studio Code, a excepción del paso con Zadig, debido a que aún no se cuenta con la FPGA.
### 4.2 Parte 2: 2.	Uso del toolchain para diseño en FPGA
Se clonó el repositorio y se creó uno para almacenar los resultados.

![image](https://github.com/user-attachments/assets/787c0dac-569d-48e8-a93b-5aa2e47b2839)


Se probó la Suite para síntesis y desarrollo de Yosys

![image](https://github.com/user-attachments/assets/2e5f0868-d70b-416c-8d2a-1755268138b3)

Se visualizó los diagramas de tiempo con GTKwave

![image](https://github.com/user-attachments/assets/41490d7d-7fd0-409d-9f56-b4a01c59d5cd)

Correspondiente a la evaluación de lo aprendido:
Navegación.

![image](https://github.com/user-attachments/assets/c35359c0-2f94-43a0-9553-5c1bf211d08f)

Simulación.

![image](https://github.com/user-attachments/assets/ee932ecc-b8dd-4833-b384-2976b91c44ca)

Visualización.

![image](https://github.com/user-attachments/assets/2149c489-45c5-4ffe-a880-bf0f208f4a95)

La parte de la evaluación se hizo hasta este punto, igual que en el punto 1, debido a que aún no tengo la FPGA.

### 4.3 Parte 3:
Al igual que en el punto 2, también se clonó el repositorio y se creó uno propio para subir los resultados.
Enlace con el repositorio:
(https://github.com/tencioeduardo/Tutorial-tercera-parte.git)

Conforme se avanzó con el video tutorial, se ejecutaron los siguientes comandos:
a.	make synth

![image](https://github.com/user-attachments/assets/dd08425d-18f3-427f-8bd8-2a78c448233d)

Inicialmente se tuvo un error al ejecutar ese comando:

![image](https://github.com/user-attachments/assets/98f5ec3a-abca-4604-a71e-6763d33bbfef)

Obteniendo el siguiente mensaje, el cual no supe interpretar ni corregir. Sin embargo, al probar de nuevo un tiempo después sí funcionó.

![image](https://github.com/user-attachments/assets/717e62b0-a4ee-4607-94bf-490925882b2d)

b.	make pnr

![image](https://github.com/user-attachments/assets/908e668d-35e7-47ef-9ba5-f187320f3b80)

c.	make test

![image](https://github.com/user-attachments/assets/2e27d909-c242-4fdd-b5df-30efe8aaf329)

d.	make wv

![image](https://github.com/user-attachments/assets/8160f350-c296-42c3-a41c-1abddf4d620b)

e.	make bitstream

![image](https://github.com/user-attachments/assets/7c504230-9423-42ea-aced-05b107bcdd52)

De igual forma que en los puntos anteriores, no se hizo el make load debido a que aún no poseo la FPGA



