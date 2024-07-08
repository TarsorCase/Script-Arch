
 <h1 align="center"> Modelo de Base de Datos simple</h1>
 <div align="center">
<p align="center">
   <img title="blackeye-im" src="https://github.com/TarsorCase/ExamenFinalBD/raw/master/Photos/base-de-datos.png" width="260" height="260" style="display: inline-block;">
</p>
</div>

<p align="center">
<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png" alt="linea" />
  <h3 align="center">🎓 Propuesta</h3>
El objetivo de este proyecto es desarrollar un modelo de base de datos simple en C++ 
para gestionar eventos y fechas de manera eficiente. Este modelo está diseñado para s
er utilizado en aplicaciones que requieren una manera estructurada y eficiente de alm
acenar y acceder a eventos asociados con fechas específicas.
</p> 
<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png" alt="linea" />
  <h3 align="center">📖 Tabla Base de datos</h3>
  
| Caracteristicas    | Consistencia      | Escalabilidad      | Flexibilidad   | Complejidad         | Rendimiento                | Soporte SQL               | Transacciones   |
|--------------------|-------------------|--------------------|----------------|---------------------|----------------------------|---------------------------|-----------------|
| RDBMS              | Alta              | Vertical           | Media          | Alta                | Medio                      | Si                        | Complejas       |
| NoSQL              | Eventual          | Horizontal         | Alta           | Media               | Alto                       | No (generalmente)         | Simples         |
| En Memoria         | Alta (en algunos) | Horizontal         | Baja           | Baja                | Muy Alto                   | No                        | Limitadas       |
| Orientada a Grafos | Alta              | Horizontal         | Media          | Alta                | Alto                       | No                        | Complejas       |
| Timeseries         | Alta              | Horizontal         | Media          | Media               | Alto                       | A veces (con extensiones) | Simples         |


Estas son las tecnologias mas conocidas en el sector de las bases de datos, podemos ver su comparacion en diferentes caracteristicas y como se adecuan a cada caso de uso.

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png" alt="linea" />

<h3 align="center">🔎 Justificación </h3>
<p align="center">✨ Las bases de datos ✨</p>
<div style="padding: 10px; border: 2px solid #ccc; border-radius: 10px; background-color: #f9f9f9; margin: 20px;">
  <h4>📚 Requerimiento Especificos</h4>
  <p>Como el uso que se le piensa dar es especifico y no es cubierto por las bases de datos existentes. La creacion de un nueva forma de base de datos es necesaria, para que cumpla con los requerimientos del usuario. El uso de comandos especificos todos puestos desde terminal y con salidas de tipo stdin y stdout son una clara indicacion de un uso de C o c++ para el lenguaje de programacion a utilizar. Por otro lado al ser operaciones concretas sin niguna necesidad de otras funcionalidades se opto por crear la base de datos desde cero.</p>
</div>
<div style="padding: 10px; border: 2px solid #ccc; border-radius: 10px; background-color: #f9f9f9; margin: 20px;">
  <h4>📊 Rendimiento Optimo</h4>
  <p>Como previamente descrito al ser las funcionalidades concretas el uso de una base de datos customizada mejora el la eficiencia y redimiento al momento de leer y escribir datos ya que no ocupamos herramientas extras o un flujo de trabajo no correspondiente a lo especificado. Esto mejorar en gran medida el apogeo de parte del personal y su uso se clarifica con una interfaz intuitiva en terminal</p>
</div>
<div style="padding: 10px; border: 2px solid #ccc; border-radius: 10px; background-color: #f9f9f9; margin: 20px;">
  <h4>⚙️ Escalabilidad y Flexibilidad</h4>
  <p>Al hablar de escalabilidad y teniendo en cuenta que la base de datos fue escrita en su totalidad en C++ se puede asegurar un escalabilidad vertical, ya que se puede optimizar las structuras de datos y los algoritmos para manejar mas datos a la medida que el hardware incrementa. Sin embargo la escalabilidad horizontal es mas compleja ya que requiere la habilidad de distribuir y sicronizar la informacion atravez de multiples nodos. 

Hablando de flexibilidad al momento de crear la base de datos mi equipo y yo no preocupamos arduamente en cerciorarnos que se puedan añadir nuevos tipos de datos y cambiar el formato del mismo, para que se adapte de forma rapida a nuevos requerimientos.</p>
</div>

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png" alt="linea" />

<h3 align="center">🐢 Estructura Repositorio</h3>

 <div align="center">
<p align="center">
   <img title="blackeye-im" src="https://github.com/TarsorCase/ExamenFinalBD/raw/master/Photos/Estructura.png" width="300" height="560" style="display: inline-block;">
</p>
</div>

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png" alt="linea" />

<h3 align="center">➤ Funciones para los eventos</h3>
<details>
<summary>Agregar evento ---> Add <-fecha-> <-evento-></summary>
 <div align="center">
<p align="center">
   <img title="blackeye-im" src="https://github.com/TarsorCase/ExamenFinalBD/raw/master/Photos/Fuctions/AddDateEvent.png" width="150" height="260" style="display: inline-block;">
</p>
</div>
</details>

<details>
<summary>Eliminar evento ---> Del <-fecha-> <-evento-></summary>
 <div align="center">
<p align="center">
   <img title="blackeye-im" src="https://github.com/TarsorCase/ExamenFinalBD/raw/master/Photos/Fuctions/DelDateEvent.png" width="300" height="300" style="display: inline-block;">
</p>
</div>
</details>

<details>
<summary>Eliminar fecha ---> DelDate <-fecha-></summary>
 <div align="center">
<p align="center">
   <img title="blackeye-im" src="https://github.com/TarsorCase/ExamenFinalBD/raw/master/Photos/Fuctions/DelDate.png" width="430" height="430" style="display: inline-block;">
</p>
</div>
</details>

<details>
<summary>Imprimir eventos ---> Print <-fecha-></summary>
 <div align="center">
<p align="center">
   <img title="blackeye-im" src="https://github.com/TarsorCase/ExamenFinalBD/raw/master/Photos/Fuctions/PrintFuction.png" width="550" height="500" style="display: inline-block;">
</p>
</div>
</details>

<details>
<summary>Buscar fecha ---> FindDate <-fecha-></summary>
 <div align="center">
<p align="center">
   <img title="blackeye-im" src="https://github.com/TarsorCase/ExamenFinalBD/raw/master/Photos/Fuctions/Find.png" width="350" height="350" style="display: inline-block;">
</p>
</div>
</details>

<details>
<summary>Ayuda ---> Help</summary>
 <div align="center">
<p align="center">
   <img title="blackeye-im" src="https://github.com/TarsorCase/ExamenFinalBD/raw/master/Photos/Fuctions/Help.png" width="250" height="500" style="display: inline-block;">
</p>
</div>
</details>




<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png" alt="linea" />

<h3 align="center">➤ Funciones de utilidad</h3>

<details>
<summary>Clasificar datos de la fecha ---> ClassNum</summary>
 <div align="center">
<p align="center">
   <img title="blackeye-im" src="https://github.com/TarsorCase/ExamenFinalBD/raw/master/Photos/Fuctions/ClassNum.png" width="650" height="600" style="display: inline-block;">
</p>
</div>
</details>

<details>
<summary>Validar numeros ---> ValidacionNum</summary>
 <div align="center">
<p align="center">
   <img title="blackeye-im" src="https://github.com/TarsorCase/ExamenFinalBD/raw/master/Photos/Fuctions/ValidacionNum.drawio.png" width="250" height="300" style="display: inline-block;">
</p>
</div>
</details>

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png" alt="linea" />


<h3 align="center">🌲Diagrama de flujo </h3>
 <div align="center">
<p align="center">
   <img title="blackeye-im" src="https://github.com/TarsorCase/ExamenFinalBD/raw/master/Photos/BD.png" width="700" height="700" style="display: inline-block;">
</p>
</div>
Aqui podemos ver la estructura primitiva del programa como mediante sentencias logramos filtrar las entradas
y almacenar los eventos en la fecha deseade
<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png" alt="linea" />
<h3 align="center">🥪 Como usarlo</h3>

```
git clone https://github.com/TarsorCase/ExamenFinalBD.git
```
```
cd ExamenFinalBD/
```
```
cd CodigoFuente/
```
```
g++ main.cpp utils.cpp events.cpp -o Programm
```
```
./Programm
```

![](https://github.com/TarsorCase/ExamenFinalBD/blob/master/Photos/HelpCommand.png)

Antes que nada ponemos ``` Help ``` , para ser recibidos con un manual el cual detalla cada opcion que el programa ofrece, denotando el comando a poner en cada ejemplo.


![](https://github.com/TarsorCase/ExamenFinalBD/blob/master/Photos/AddCommand.png)

Por ejemplo decidimos añadir con el comando ``` Add ``` un evento llamado ``` Tropper ``` el cual se va llevar acabo el ```2024-8-6``` con un enter añadimos este evento en nuestra base de datos.

![](https://github.com/TarsorCase/ExamenFinalBD/blob/master/Photos/MultipleAdd.png)

Ocupamos ``` Add ``` varias veces para poder guardar varios eventos en la misma fecha ```2024-8-6```.

![](https://github.com/TarsorCase/ExamenFinalBD/blob/master/Photos/Print.png)

Al finalizar de añadir lo eventos que queremos usamos ``` Print ``` para poder imprimir en la temrinal todas las fechas con sus eventos correspondientes, en este caso solo se muestra una linea con fecha ```2024-8-6```, ya que loe eventos que previamente ingresamos tienen la misma fecha. Sin embargo si hubieran tenido diferentes fechas se mostrarian en orden uno abajo de otro con sus eventos alado para cada fecha.

![](https://github.com/TarsorCase/ExamenFinalBD/blob/master/Photos/DelCommand.png)

Ahora hacemos uso del comando ``` Del ``` para eliminar un evento llamado ``` Tropper ``` el cual se va llevar acabo el ```2024-8-6``` con un enter eliminamos este evento de nuestra base de datos y nos aparece el mensaje ``` Deleted successfully ```.


![](https://github.com/TarsorCase/ExamenFinalBD/blob/master/Photos/DelAll.png)

Si deseamos optimizar este proceso hacemos uso del comando ``` Del ``` y la fecha ```2024-8-6``` ya que con esta combinacion eliminamos todos los eventos de de esta fecha y nos aparece el mensaje ``` Deleted 2 events ``` ya que si hacemos recuerdo quedaaban dos eventos en esa fecha.

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png" alt="linea" />


<h3 align="center">🔎 Contribution Guidelines </h3>

</p>

**Las contribuciones** directas al proyecto son de un equipo de trabajo del que formamos parte, pero es importante reconocer la orientación y enseñanza del profesor para lograr el proyecto. 
Siéntanse libres de subir un pull request si desean contribuir.

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png" alt="linea" />

<h3 align="center">🔎 Herramientas Utilizadas </h3>

<div align="center">
<p align="center">
  <a href=" " target="_blank" rel="noreferrer">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Windows_logo_-_2012.svg/768px-Windows_logo_-_2012.svg.png" alt="window" width="40" height="40"/>
  </a>
  <a href="https://git-scm.com/" target="_blank" rel="noreferrer">
    <img src="https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png" alt="git" width="40" height="40"/>
  </a>
  <a href="https://code.visualstudio.com/" target="_blank" rel="noreferrer">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/2048px-Visual_Studio_Code_1.35_icon.svg.png" alt="vsc" width="40" height="40"/>
  </a>
  <a href="https://code.visualstudio.com/" target="_blank" rel="noreferrer">
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" alt="vsc" width="40" height="40"/>
  </a>
  <a href="https://code.visualstudio.com/" target="_blank" rel="noreferrer">
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/cplusplus/cplusplus-line.svg" alt="vsc" width="40" height="40"/>
  </a>
</p>
 </div>


<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png" alt="linea" />
<h3 align="center">👤Creditos </h3>


<div align="center">
<p align="center">
  <a href="https://github.com/TarsorCase" target="_blank" rel="noreferrer">
    <img src="https://github.com/TarsorCase/ExamenFinalBD/blob/master/Photos/TarsorCase.jpg" alt="vsc" width="170" height="170"/>
  </a>
  <a href="https://github.com/NicoleLozadaLeon" target="_blank" rel="noreferrer">
    <img src="https://github.com/TarsorCase/ExamenFinalBD/blob/master/Photos/142690531.png" alt="vsc" width="170" height="170"/>
  </a>
</p>
</div>

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/colored.png" alt="linea" />
