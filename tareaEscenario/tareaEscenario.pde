import ddf.minim.*;

Minim minim;
AudioPlayer musicaFondo;
AudioPlayer salto;
Bloque piso;
Enemigo eggman;
Fondo escenario;
Jugador jugador;
boolean menu = true;

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
  if(menu) {
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
    menu = false;
    musicaFondo.play();
  }
}

void mostrarMenu() {
  String menu = "Presione ENTER para empezar";
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text(menu, width/2, height/2);
}

void mostrarEscenario() {
  escenario.display();
  piso.display();
  eggman.display();
  eggman.mover();
  jugador.display();
  jugador.correr();
  jugador.saltar();
}
