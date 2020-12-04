# Proyecto-Final-Seminario-Arqui

# Procesador MIPS de 32 bits
03 de diciembre de 2020
## Introducción
Por la década de 1980, John Hennessy y sus compañeros en Standford desarrollaron la arquitectura de MIPS. Alrededor de 1990 la arquitectura MIPS creció y se formó en dos arquitecturas básicas: MIPS32 para arquitecturas de 32 bits y MIPS64 para arquitecturas de 64 bits. Los predecesores de MIPS son usados por Silicon Graphics, Nintendo, Sony Play Station, Cisco, entre otros.


## Elementos y características
Se le llama a MIPS una arquitectura de 32 bits ya que opera con datos de 32 bits. La arquitectura MIPS usa 32 registros generales de 32 bits de largo cada uno, llamados también set de registros, esto porque a menor cantidad de registros, más rápido se puede acceder a ellos. Un contador de programa (PC), y dos registros de propósito especial, llamados HI y LO (alto y bajo). 

El set de instrucciones de MIPS soporta tres tipos de formato, uno usa tres registros operandos, tales como suma y resta (add, sub), que es el tipo R. Otro, utiliza dos registros operandos y un inmediato de 16 bits, como lo son las instrucciones cargar palabra (lw) o suma inmediata (addi), llamado tipo I. El tercero tiene un inmediato de 26 bits y ningún registro y es el tipo J.

## Set de instrucciones
En el set de instrucciones de Arquitectura MIPS de 32 bits se encuentran los tres tipos de instrucciones, a continuación, se definen a más detalle:
### Instrucciones tipo R. 
Llamada R por ser tipo registro, usa dos registros como fuentes y uno como destino. La instrucción de 32 bits contiene seis casillas: op, rs, rt, rd, shamt y funct. La primera y la última con seis bits y las demás con cinco. Como se ve en la siguiente tabla, la operación que se ejecuta se define por las dos casillas con 6 bits: op (opcode o código de operación) y funct (o función). Todas las instrucciones tipo R llevarán un opcode de 0. Shamt se mantiene en 0 al menos de que se ejecuten operaciones con switch. Las casillas restantes son las que definen los registros, rs y rt son los registros fuentes y rd es el destino. 

                            Tipo R
      op	   rs	    rt	     rd	     shamt     Funct
    6 bits	 5 bits	  5 bits   5 bits   5 bits    6 bits

## Instrucciones tipo I.


## Instrucciones tipo J.



Desarrollo de implementación de los elementos
