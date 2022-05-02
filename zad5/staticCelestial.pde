class StaticCelestial extends Celestial {
  
  float x, y;
  
  StaticCelestial(PShape shape, float x, float y) {
    super(shape);
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
