
![logo](../../games/03-tilesmap/icon.png)

#03-tilesmap

Vamos a crear una versión didáctica de un juego con un mapa 2D.

#Créditos

* Inspirado en [dynadungeos](https://github.com/akien-mga/dynadungeons)
* [CREDITOS](./CREDITS.txt)
* Otros proyectos inspiradores:
    * [Pokemon Clone](https://github.com/MarianoGnu/Pokemon-Tutorials)
    * [TD-Godot-Games](https://github.com/TutorialDoctor/TD-Godot-Games)

Esquema de trabajo:

1. Idea
2. Assets
3. Crear mundo/personajes/objetos
4. Lo unimos todos
5. Añadir Scripts
6. Volver al paso 1

#Idea

* La idea es empezar creando un simple mapa de tiles 2D, con un jugador que
se mueva por el mapa e interactúe con algún objeto. Elementos:
    * Mapa/tiles (Suelos, paredes, hierba, etc.)
    * Player
    * Objeto (Por ejemplo una caja o un tesoro)
* Creamos una carpeta `03-tilesmap` y dentro creamos un nuevo proyecto Godot.

#Assets

* Vamos a usar los diseños (Imágenes) del proyecto [dynadungeos](https://github.com/akien-mga/dynadungeons)
	* Fichero `sprites\tileset.png`
	* Ficheros `sprites\human-orange\*.png`
	* Ficheros `sprites\goblin-brown\*.png`
* Los copiamos en un directorio `sprites` dentro de nuestro proyecto Godot.
    * `03-tilesmap\sprites`

> La parte de crear nuestros propios diseños no se va a tratar en este tutorial.

#Crear personajes/objetos

* Empezamos creando el mundo
* luego nuestro player
* y finalmente creamos la caja del tesoro

##El mundo

El mundo será un mapa de tiles 2D.

* GodotEngine -> Editamos proyecto
* Creamos nueva escena
