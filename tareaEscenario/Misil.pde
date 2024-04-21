public class Misil {
  public PVector posicionMisil;
  public PVector velocidadMisil;
  public PVector explosionMisil;
  public PImage misilEggman;
  public PImage explosion;
  public boolean visible;
  public PVector caidaMisil;
  
  public Misil(PVector posicionMisil, PVector velocidadMisil, boolean visible, PVector explosionMisil, PVector caidaMisil) {
    this.posicionMisil = posicionMisil;
    this.velocidadMisil = velocidadMisil;
    this.visible = visible;
    this.explosionMisil = explosionMisil;
    this.caidaMisil = caidaMisil;
  }
  
  public void display() {
    misilEggman=loadImage("Misil.png");
    explosion=loadImage("explosionMisil.png");
  }
  
  public void mover() {
    if(visible) {
      posicionMisil.y+=velocidadMisil.y;
      imageMode(CENTER);
      image(misilEggman, posicionMisil.x, posicionMisil.y, 50, 50);
      if(posicionMisil.y>=450) {
        visible = false;
        imageMode(CENTER);
        image(explosion, posicionMisil.x, posicionMisil.y+10, 70, 70);
      }
    }
  }
  public boolean choqueMisil() {
    float distancia = PVector.dist(posicionMisil, caidaMisil);
    return distancia < 2;
  }
}
