Prueba de FSM contraseña en FPGA con Quartus y Verilog

📌 Descripción

Este proyecto implementa y prueba una FSM para una contraseña en un FPGA utilizando Quartus y Verilog.
⚙️ Requisitos

Quartus Prime (Intel FPGA)

FPGA compatible (Ejemplo: Cyclone IV, MAX10)

Cable de programación JTAG

📂 Estructura del Proyecto

/gates_project

│── top_psw.v # Módulo principal con compuertas lógicas

│── tb_top_psw.v # Testbench para simulación

│── password.qpf # Archivo del proyecto en Quartus

│── password.qsf # Archivo de configuración del FPGA

│── README.md # Este archivo
