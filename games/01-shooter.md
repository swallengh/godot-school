

#Proyecto 01-shooter

Idea original de Juan Linietsky:
* [Proyecto Github](https://github.com/reduz/godot_workshop)
* [Vídeo Youtube](https://www.youtube.com/watch?v=XEkePR_3BU8) 

Empezamos con un shooter 2D poque nos parece un juego sencillo para empezar.

#Empezamos

* Creamos directorio para el proyecto llamado `shooter-game1`.
* Descargamos unos assets de ejemplo del URL `https://github/reduz/godot_workshop`.
* Creamos un nuevo proyecto Godot `godot -> New Project`.
* Editamos el proyecto para comenzar a crear el juego.

#Player

##Acciones

* Creamos los InputMaps en `Scene -> Project Settings -> InputMaps`

##Escena Player
* Creamos una escena para e player.
    * Nodos Area2D -> Sprite.
    * Atributo textura -> Imagen
* Nodo Area2d -> Script para mover la nave.
* Hay que poner controles para los límites de la ventana (Viewport).

##Explosión

Dentro de player crearemos la explosión.
* Añadir nodo `Particle2D`.
* Texture poner la imagen.
* Spread 180
* Linear velocity 100
* Lifetime 1
* Explosiven 0.2
* Timeout 0.5

##Colisiones

* Añadimos un nodo `CollisionPolygon2D`
* Creamos una forma poligonal de colisión.
* Guardamos la escena `player`.

#Enemy

##Escena del enemigo

Creamos una nueva escena `enemy`.
* Añadimos un nodo raíz del tipo `Area2D`.
* Añadimos nodo `AnimatedSprite`
    * En `frames` añadimos las imágenes que forman parte de la animación.
* Añadimos nodo `AnimationPlayer`
    * Nueva
    * Lápiz -> Keys
    * activar Autoplay
* Añadimos un nodo `CollisionPolygon2D`
    * Shape de tipo circle2D.

##Señales
* Crear señal desde `Area2D`
    * Enemy area -> Script

