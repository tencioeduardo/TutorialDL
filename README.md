# Guía para la construcción del entorno de desarrollo open source de la FPGA Tang Nano 9k



## Instalación de Visual Studio Code

Se utilizará vscode como editor de texto y para albergar todo el proceso de diseño, puebas e implementación física en la FPGA. Este se puede descargar en el siguiente enlace: [https://code.visualstudio.com/?ref=learn.lushaylabs.com](https://code.visualstudio.com/)

## Instalación de la extensión de Lushay Code

Al entrar a `vscode` se puede encontrar el apartado de extensiones en la columna izquierda como se muestra en la siguiente imagen: 

![image](https://github.com/DJosueMM/open_source_fpga_environment/assets/81501061/79e61e72-a827-4524-901f-9d4885579684)

Al entrar a las extensiones, en el cuadro de busqueda se ingresa `Lushay Code` y se presiona el botón de instalar como se muestra en la siguiente imagen:

![image](https://github.com/DJosueMM/open_source_fpga_environment/assets/81501061/09cbabf7-c5e2-4d54-afe1-2bf6fd92153b)

## Instalación de otras extensiones necesarias:

Al igual como se realizó con `Lushay Code` se deben instalar las siguientes extensiones: `Verilog-HDL/SystemVerilog` y `WaveTrace`. Estas se pueden descargar directamente en los siguientes enlaces: [https://marketplace.visualstudio.com/items?itemName=mshr-h.VerilogHDL
](https://marketplace.visualstudio.com/items?itemName=mshr-h.VerilogHDL) y https://marketplace.visualstudio.com/items?itemName=wavetrace.wavetrace&ref=learn.lushaylabs.com

## Instalación del OSS-Cad-Suite de YosysHQ

Para la instalación de las herramientas necesarias en todo el proceso de diseño, pruebas e implemetación se debe descargar el paquete `OSS-Cad-Suite` en el siguiente enlace, se guarda en la ubicación que desee (esta ubicación se necesitará más adelante)
 - Windows: https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2023-02-10/oss-cad-suite-windows-x64-20230210.exe
 - Para otros sistemas operativos: https://github.com/YosysHQ/oss-cad-suite-build/releases/tag/2023-02-10

En el caso de Windows, al abrir el archivo que se descargó es posible que se tenga la siguiente advertencia:

![image](https://github.com/DJosueMM/open_source_fpga_environment/assets/81501061/2d0b9cde-dacb-492c-9e4c-e345ffae0d47)

Se debe presionar "Más Información" y presionar "Ejecutar de todas formas" esto extraerá los archivos en un carpeta llamada `oss-cad-suite` en la misma ubicación:

![image](https://github.com/DJosueMM/open_source_fpga_environment/assets/81501061/1912a6b0-4456-4505-aa0f-7f6ffd1ad383)

![image](https://github.com/DJosueMM/open_source_fpga_environment/assets/81501061/b98360c3-8f59-4b69-b145-55583405efad)

## Configuración de la extensión Lushay Code

Se debe abrir vscode y en la parte inferior derecha presionar `FPGA Toolchain`:

![image](https://github.com/DJosueMM/open_source_fpga_environment/assets/81501061/b2637e91-6d59-418a-93b6-c539bbe86150)

se mostrará un error y la opción de "Setup Now", al presionarla solamente se debe seleccionar la carpeta `bin` que se encuentra dentro de la carpeta `oss-cad-suite` que se extrajo.

Otra manera de hacerlo es abrir la extension `Lushay Code` y entrar a la configuración:

![image](https://github.com/DJosueMM/open_source_fpga_environment/assets/81501061/4cf5da3f-2eb2-4b3a-83fe-7027d2aeec33)

![image](https://github.com/DJosueMM/open_source_fpga_environment/assets/81501061/6507ecf2-ee39-4054-b985-2dd4da61f5b0)

Una vez ahí se copia la ruta de la carpeta `bin` que se encuentra dentro de la carpeta `oss-cad-suite` en el lugar que la haya guardado, esta preferiblemente no debe tener espacios ni caracteres especiales

![image](https://github.com/DJosueMM/open_source_fpga_environment/assets/81501061/45d7ba05-c810-4754-b08e-f4b2ba9ee29d)

Y esa ruta se pega en el apartado de OSS Cad Suite en la configuración de la extensión

![image](https://github.com/DJosueMM/open_source_fpga_environment/assets/81501061/e4f9123f-43c1-4325-b11c-97d4d493566b)


# Configuración del Driver USB de Windows 

Es necesario modificar el driver USB de Windows para poder programar la FPGA con `openFPGALoader`, para esto se necesita instalar el siguiente programa https://zadig.akeo.ie/

Al instalarlo y abrirlo se despliega la ventana del programa, después de conectar la FPGA al USB de la computadora se debe entrar a "Options" y presionar "List All Devices"

![image](https://github.com/DJosueMM/open_source_fpga_environment/assets/81501061/85d18255-bb6e-47f6-8d67-3f7e984f2c5b)

Luego se selecciona `JTAG Debugger (Interface 0)`

![image](https://github.com/DJosueMM/open_source_fpga_environment/assets/81501061/2928a4d8-e7e8-4674-9c74-79e14b96c281)

Se presiona "Replace Driver" y se debe esperar hasta que se complete la acción

![image](https://github.com/DJosueMM/open_source_fpga_environment/assets/81501061/6ef1fe2f-d0d9-4731-a443-82e645a95f80)


# Referencias
Esta guía está basada en el siguiente documento https://learn.lushaylabs.com/getting-setup-with-the-tang-nano-9k/


