

#Proyecto 01-shooter

Idea original de Juan Linietsky:
* [Proyecto Github](https://github.com/reduz/godot_workshop)
* [Vídeo de Youtube en español](https://www.youtube.com/watch?v=XEkePR_3BU8) 
* [English Youtube video](https://www.youtube.com/watch?v=9GPIeeJXBLc)

Empezamos con un shooter 2D poque nos parece un juego sencillo para empezar.


#Empezamos

* Creamos directorio para el proyecto llamado `01-shooter`.
* Descargamos unos assets de ejemplo del URL `https://github/reduz/godot_workshop`.
* Creamos un nuevo proyecto Godot `Programa Godot -> New Project`.
* Editamos el proyecto para comenzar a crear el juego.

![project-manager](./images/project-manager.png)

#Player

* Acciones: Creamos los InputMaps en `Scene -> Project Settings -> InputMaps`
    * Asociamos entradas con nombres de acciones que vamos a usar en nuestro juego.

![scene-project-settings-inputmaps](./images/scene-project-settings-inputmaps.png)

* Creamos una **escena** para player.
    * Nodos `Area2D` -> `Sprite`.
    * Atributo textura -> Imagen
* Nodo `Area2d` -> `Script` para mover la nave.
* Hay que poner controles para los límites de la ventana (Viewport).

* Explosión: Dentro de player crearemos la explosión.
    * Añadir nodo `Particle2D`.
    * Texture poner la imagen.
    * Spread 180
    * Linear velocity 100
    * Lifetime 1
    * Explosiven 0.2
    * Timeout 0.5
* Colisiones
    * Añadimos un nodo `CollisionPolygon2D`
    * Creamos una forma poligonal de colisión.
    * Guardamos la escena `player`.
* Sonido
    * Nos descargamos un sonido de explosión de `https://www.freesound.org`.
    * Convertimos el fichero en formato WAV de 16 bits.
    * Guardamos el fichero de sonido en la carpeta `player` del proyecto.
    * Añadimos nodo `SamplePlayer` y lo llamamos `sample`
    * Vamos a `Config -> Sample -> New SampleLibrary`
    * Añadimos en audio conel nombre `explosion`.
    * Incorporamos código en GDScript para activar (play) el sonido cuando
    explote el jugador.

#Enemy

* Creamos una nueva **escena** para `enemy`.
    * Añadimos un nodo raíz del tipo `Area2D`.
    * Añadimos nodo `AnimatedSprite`
        * En `frames` añadimos las imágenes que forman parte de la animación.
    * Añadimos nodo `AnimationPlayer`
        * Nueva
        * Lápiz -> Keys
        * activar Autoplay
* Añadimos un nodo `CollisionShape2D`
    * Shape de tipo circle2D.
* Señales: Crear señal desde `Area2D`
    * Enemy area -> Script

#Level

Creamos un nivel para usar los personajes creados anteriormente.

* Creamos una escena nueva `Node2D` llamada `level1`.
* Instanciamos los objetos que hemos creado: `player` y `enemy`.
* Los enemigos se pueden instanciar/copiar muchas veces para tener más.
* Creamos un `Node2D` llamado `enemies` y ponemos como hijos de este ( acción `reparent`)
a todos los nodos `enemy`. Esto lo hacemos para poder manejar a todos los
enemigos como un ejército.
* Para animar a todo el ejército añadimos nodo `AnimationPlayer` llamada `move_enemies`.
    * Creamos animación llamada `move_down`.
    * Elegimos nodo `enemies` y añadimos un nuevo key en pos=0.
    * Ponemos de tiempo 10 segundos para la animación.
    * En el segundo 10, movemos el ejército y creamos un segundo key final.

#Disparo

Vamos a crear una nueva escena para que sea el disparo del player.
* Creamos nueva escena con nodo base `Area2D` y lo llamaremos shot.
* Añadimos `sprite`.
* Añadimos `CollisionPoligon2D`.
* Le creamos un script al `shot` para que cambie la posición.
* Añadimos nodo `VisibilityNotifier2D`
    * Lo conectamos a  `exit_screen` del script de `shot`.
    * En el código liberamos el recurso (`queue_free`).
* En el enemigo al recibir un disparo debe desaparecer. Ver el código.
* Creamos acción de disparar en `project settings -> InputMaps`.

#TODO

* Poner sonido en las explosiones, y en los disparos.
* Hacer que los marcianos exploten.
* Sumar puntos con cada marciano muerto.
* Cerrar la ventana del juego al terminar.
