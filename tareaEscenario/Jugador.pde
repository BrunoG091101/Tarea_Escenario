public class Jugador {
  public PVector posicionJugador;
  public PVector velocidad;
  public PImage sonic;
  public PImage izquierdaSonic;
  public PImage derechaSonic;
  public PImage agacheSonic1;
  public PImage agacheSonic2;
  public PImage saltoSonic;
  public PImage miradaArriba1;
  public PImage miradaArriba2;
  
  public Jugador(PVector posicion, PVector velocidad) {
    this.posicionJugador=posicion;
    this.velocidad=velocidad;
  }
  
  public void display() {
    sonic=loadImage("sonic.png");
    izquierdaSonic=loadImage("sonic corriendo 2.png");
    derechaSonic=loadImage("sonic corriendo.png");
    agacheSonic1=loadImage("sonic agachado.png");
    agacheSonic2=loadImage("sonic agachado 2.png");
    saltoSonic=loadImage("sonic salto.png");
    miradaArriba1=loadImage("sonic mirada arriba.png");
    miradaArriba2=loadImage("sonic mirada arriba 2.png"); //Aclaración: las variables con el número 1 representa la derecha, mientras que con el número 2 representa la izquierda
  
    if(key=='a' || key=='A' || keyCode == LEFT) {
      imageMode(CENTER);
      image(izquierdaSonic, posicionJugador.x, posicionJugador.y, 90, 60);
    } else if(key=='d' || key=='D' || keyCode==RIGHT) {
      imageMode(CENTER);
      image(derechaSonic, posicionJugador.x, posicionJugador.y, 90, 60);
    } else if(key=='w' || key=='W' || keyCode==UP) {
      imageMode(CENTER);
      image(saltoSonic, posicionJugador.x, posicionJugador.y+8, 90, 60);
    } else if(key=='q' || key=='Q') {
      imageMode(CENTER);
      image(miradaArriba2, posicionJugador.x, posicionJugador.y, 90, 60);
    } else if(key=='e' || key=='E') {
      imageMode(CENTER);
      image(miradaArriba1, posicionJugador.x, posicionJugador.y, 90, 60);
    } else if(key=='z' || key=='Z') {
      imageMode(CENTER);
      image(agacheSonic2, posicionJugador.x, posicionJugador.y+10, 90, 60);
    } else if(key=='c' || key=='C') {
      imageMode(CENTER);
      image(agacheSonic1, posicionJugador.x, posicionJugador.y+10, 90, 60);
    } else {
      imageMode(CENTER);
      image(sonic, posicionJugador.x, posicionJugador.y, 90, 60);
    }
  }
  
  public void correr() {
    if(key=='a' || key=='A' || keyCode == LEFT) {
      posicionJugador.x-=velocidad.x;
    } else if(key=='d' || key=='D' || keyCode==RIGHT) {
      posicionJugador.x+=velocidad.x;
    }
  }
  
  public void saltar() {
    if(key=='w' || key=='W' || keyCode==UP) {
      posicionJugador.y-=velocidad.y;
      if (posicionJugador.y<=330) {
        velocidad.y*=-1;
      } else if (posicionJugador.y>=450) {
        posicionJugador.y=450;
      }
    }    
  }
}  
