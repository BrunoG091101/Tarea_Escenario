public class Bloque {
  public PVector posicionBloque;
  public int anchoBloque;
  public int altoBloque;
  public color colorBloque;
  
  public Bloque(PVector posicionPiso, int anchoPiso, int altoPiso, color colorPiso) {
    this.posicionBloque=posicionPiso;
    this.anchoBloque=anchoPiso;
    this.altoBloque=altoPiso;
    this.colorBloque=colorPiso;
  }
  
  void display() {
    fill(colorBloque);
    for(float x=posicionBloque.x; x<width; x+=(anchoBloque+posicionBloque.x)) {
      for(float y=posicionBloque.y; y<height; y+=altoBloque) {
      rect(x, y, anchoBloque, altoBloque);
      }
    }
  }
}
