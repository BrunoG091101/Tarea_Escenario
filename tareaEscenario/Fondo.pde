public class Fondo {
  PVector posicionFondo = new PVector(width/2, height/2);
  PImage escenario;
  
  public Fondo() {
  }
  
  public void display() {
    escenario=loadImage("fondo.png");
    imageMode(CENTER);
    image(escenario, posicionFondo.x, posicionFondo.y, width, height);
  }
}
