public class Enemigo {
  public PVector posicionEnemigo;
  public PVector velocidadEnemigo;
  public PImage eggman;


  public Enemigo(PVector posicionEnemigo, PVector velocidadEnemigo) {
    this.posicionEnemigo=posicionEnemigo;
    this.velocidadEnemigo=velocidadEnemigo;
  }
  
  public void display() {
    eggman=loadImage("eggman.png");
  }
    
  public void mover() {
    posicionEnemigo.x+=velocidadEnemigo.x;
    imageMode(CENTER);
    image(eggman, posicionEnemigo.x, posicionEnemigo.y, 170, 100);
    if(posicionEnemigo.x>width) {
      velocidadEnemigo.x*=-1;
    } else if(posicionEnemigo.x<0) {
      velocidadEnemigo.x*=-1;
    }
  }
}
