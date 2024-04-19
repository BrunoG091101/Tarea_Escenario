import ddf.minim.*;

Minim minim;
AudioPlayer musicaFondo;
AudioPlayer salto;
Bloque piso;
Enemigo eggman;
Fondo escenario;
Jugador jugador;

void setup() {
  size(600, 600);
  minim = new Minim(this);
  musicaFondo = minim.loadFile("musicaJuego.mp3");
  salto = minim.loadFile("sonidoSalto.mp3");
  escenario = new Fondo();
  piso = new Bloque(new PVector(0, 480), 40, 20, #27B3C1);
  eggman = new Enemigo(new PVector(80, 120), new PVector(15, 1));
  jugador = new Jugador(new PVector(40, 450), new PVector(30, 15));
}

void draw() {
  background(0);
  escenario.display();
  piso.display();
  eggman.display();
  eggman.mover();
  jugador.display();
  jugador.correr();
  jugador.saltar();
}

void keyPressed() {  
  if(key=='w' || key=='W' || keyCode==UP) {
    salto.rewind();
    salto.play();
  }
  if(keyCode==ENTER) {
    musicaFondo.play();
  }
}
