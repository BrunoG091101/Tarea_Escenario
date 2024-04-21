public class Menu {
  PVector posicionMenu = new PVector(width/2, height/2);
  PImage imagenMenu;
  
  public Menu() {
  }
  
  public void display() {
  imagenMenu = loadImage("imagenMenu.png");
  imageMode(CENTER);
  image(imagenMenu, posicionMenu.x, posicionMenu.y, width, height);
  String menu = "Presione ENTER para empezar";
  fill(#DDFF03);
  textSize(40);
  textAlign(CENTER);
  text(menu, width/2+8, height-35);
  }
}
