



#Proyecto 05-car-running

Coche de carreras en scroll horizontal.

Esquema de trabajo:
1. Idea
2. Assets
3. Crear personajes: player, platform, level
4. Lo unimos todos
5. Volver al paso 1

#1. La idea

Vamos a crear un minijuego de un coche de carreras 2D con scroll horizontal.

* Creamos directorio para el proyecto llamado `05-race-running`.
* Creamos un nuevo proyecto Godot `Programa Godot -> New Project`.
* Editamos el proyecto para comenzar a crear el juego.

#2. Assets

Descargamos unos `assets` para empezar:
* Los gráficos los descargamos de `OpenGameArt`.
* Los sonidos se han descargado de [FreeSound](https://www.freesound.org)
   * Convertimos el fichero en formato WAV de 16 bits.
* Los iconos se han descargado de [www.game-icons.net](www.game-icons.net)

#3. Creando los personajes

##3.1 El coche (Player)

Vamos a crear el personaje del jugador, que es nuestro coche.

* Creamos una **escena** para contener a `player` con la siguiente estructura de nodos.

**Nodo raíz**

* Como nodo principal/raíz `player`de tipo `Node2D`.
* Dentro creamos un nodo hijo `sprite`de tipo `Sprite`.
    * En el atributo textura asociamos el fichero de la imagen.
* Nodo hijo `shape`de tipo `CollisionPolygon2D`.
    * Creamos una forma poligonal de colisión.
* Guardamos la escena `player` como `res://player/player.xml`

**Scripting**

* Para darle un comportamiento a `player`, creamos un **script** en el nodo raíz.
    * Este script nos permitirá controlar el comprtamiento del coche.
    * Consultar script [player.gd](./../../games/05-car-runningplayer/player.gd).

##3.2. Plataformas

#4. Lo unimos todo

Creamos un nivel para usar los personajes creados anteriormente.

* Creamos una escena nueva `level1` y la guardamos en `res://level/level1.xml`
* Creamos nodo raíz `level1` de tipo `Node2D`.
* Instanciamos los objetos que hemos creado: `player` y `platform`.
* Las plataformas se pueden instanciar/copiar muchas veces para tener más.
* Creamos un `Node2D` llamado `platforms` y ponemos como hijos de este ( acción `reparent`)
a todos los nodos `platform`. Esto lo hacemos para poder manejar a todas las plataformas como
un conjunto.


#TODO

* Añadir sonidos y música
* Hacer que el coche explote.
* Sumar puntos con cada avance.
* Cerrar la ventana del juego al terminar.
