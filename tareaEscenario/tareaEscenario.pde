import ddf.minim.*;

Minim minim;
AudioPlayer musicaMenu;
AudioPlayer musicaFondo;
AudioPlayer salto;
AudioPlayer sonidoMisil;
AudioPlayer sonidoExplosion;
Fondo escenario;
Bloque piso;
Enemigo eggman;
Jugador jugador;
Menu menu;
boolean menuImagen = true;
ArrayList<Misil>misiles;
int tiempoApMisil;
boolean nuevoMisil = false;

void setup() {
  size(600, 600);
  minim = new Minim(this);
  musicaMenu = minim.loadFile("musicaMenu.mp3");
  musicaFondo = minim.loadFile("musicaJuego.mp3");
  salto = minim.loadFile("sonidoSalto.mp3");
  sonidoMisil = minim.loadFile("sonidoMisil.mp3");
  sonidoExplosion = minim.loadFile("sonidoExplosion.mp3");
  menu = new Menu();
  escenario = new Fondo();
  piso = new Bloque(new PVector(0, 480), 40, 20, #27B3C1);
  eggman = new Enemigo(new PVector(80, 120), new PVector(15, 1));
  misiles = new ArrayList<Misil>();
  tiempoApMisil = millis();
  jugador = new Jugador(new PVector(40, 450), new PVector(30, 15));
}

void draw() {
  background(0);
  if(menuImagen) {
    mostrarMenu();
  } else {
    mostrarEscenario();
  }
}

void keyPressed() {  
  if(key=='w' || key=='W' || keyCode==UP) {
    salto.rewind();
    salto.play();
  }
  if(keyCode==ENTER) {
    menuImagen = false;
    musicaFondo.play();
  }
}

void mostrarMenu() {
  menu.display();
  musicaMenu.play();
}

void mostrarEscenario() {
  escenario.display();
  piso.display();
  eggman.display();
  eggman.mover();
  for(int i=misiles.size()-1; i>0 ; i--) {
    Misil misil=misiles.get(i);
    misil.display();
    misil.mover();
    if(misil.choqueMisil()) {
      sonidoExplosion.rewind();
      sonidoExplosion.play();
      misiles.remove(i);
    }
  }
  if(!nuevoMisil && millis() - tiempoApMisil >= 1800) {
    misiles.add(new Misil(new PVector(eggman.posicionEnemigo.x, eggman.posicionEnemigo.y), new PVector(0, 15), true, new PVector(eggman.posicionEnemigo.x, eggman.posicionEnemigo.y), new PVector(eggman.posicionEnemigo.x, 450)));
    sonidoMisil.rewind();
    sonidoMisil.play();
    tiempoApMisil = millis();
    nuevoMisil = false;
  } else if (eggman.posicionEnemigo.y>=460){
    sonidoExplosion.rewind();
    sonidoExplosion.play();
  }
  jugador.display();
  jugador.correr();
  jugador.saltar();
}
