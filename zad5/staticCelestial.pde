class StaticCelestial extends Celestial {
  
  float x, y;
  
  StaticCelestial(float radius, int points, color fill, PImage texture, float x, float y) {
    super(radius, points, fill, texture);
    this.x = x;
    this.y = y;
  }
  
  void update(float delta) {
    pushMatrix();
    translate(x, y);
    rotate(PI/2);
    super.update(delta);
    popMatrix();
  }

}
