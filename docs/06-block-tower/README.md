
#Proyecto `block-tower`

Este es un juego 2D, con física, donde la mecánica del juego consiste en
soltar bloques para formar una torre.

Esquema de trabajo:
1. Idea
2. Assets
3. Crear personajes: blocks y platforms
4. Lo unimos todos
5. Volver al paso 1

#1. La idea

Vamos a crear un minijuego 2D, con física.
La mecánica del juego consiste en soltar bloques para formar una torre.

* Creamos directorio para el proyecto llamado `06-block-tower`.
* Creamos un nuevo proyecto Godot `Programa Godot -> New Project -> game-06-block-tower`.
* Editamos el proyecto para comenzar a crear el juego.

#2. Assets

Descargamos unos `assets` para empezar:
* Los sonidos se han descargado de [FreeSound](https://www.freesound.org)
   * Convertimos el fichero en formato WAV de 16 bits.
* Los iconos se han descargado de [www.game-icons.net](www.game-icons.net)
* Los gráficos son iconos descargados de la web anterior y los modificamos
para que tengan el tamaño de 64x64.
    * En el directorio `blocks` ponemos imágenes de los bloques.
    * En el directorio `hand` ponemos imagen de una mano.

#3. Creando las partes

##3.1 La mano (hand)

El jugador mueve la mano y al pulsar el botón se deja caer un bloque.
Vamos a crear la mano.

Creamos una **escena** para contener a `hand` con la siguiente estructura de nodos.
* Como nodo principal/raíz `hand`de tipo `Node2D`.
* Dentro creamos un nodo hijo `sprite` de tipo `Sprite`.
    * En el atributo textura asociamos el fichero de la imagen.
* Guardamos la escena `hand` como `res://hand/hand.xml`

Para darle comportamiento a `hand`, vamos a crear un **script** en el nodo raíz.
* Seleccionamos nodo raíz, botón derecho, agragar script.
* Consultar script [hand.gd](./../../games/06-block-tower/hand/hand.gd).

##3.1. Bloque cuadrado (Square)

Vamos a crear un bloque de forma cuadrada.

Creamos una **escena** para contener a `square` con la siguiente estructura de nodos.
* Como nodo principal/raíz `square`de tipo `RigidBody2D`, puesto que queremos
que este objeto esté regulado por el motor de física.
* Creamos subnodos hijos:
    * `sprite` nodo de tipo `Sprite`
        * Atributo texture = imagen `blocks/wooden-crate.png`
    * `shape` nodo de tipo `CollisionShape2D` -> Rectangular.
* Guardamos la escena `square` como `res://blocks/square.xml`

##3.2. Plataformas

`pendiente`

#4. Lo unimos todo

`pendiente`
