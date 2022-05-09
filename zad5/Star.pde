class StaticCelestial extends Celestial {
  
  float x, y;
  
  StaticCelestial(PShape shape, color fill, String texture, float x, float y) {
    super(shape, fill, texture);
    this.x = x;
    this.y = y;
  }
  
  void update(float delta) {
    pushMatrix();
    pointLight(255, 200, 180, 0, 0, 0);
    translate(x, y);
    rotate(PI/2);
    super.update(delta);
    popMatrix();
  }

}
