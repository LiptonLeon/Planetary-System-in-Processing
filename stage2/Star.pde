class Star extends Celestial {
  
  float x, y;
  
  Star(PShape shape, color fill, String texture, float x, float y) {
    super(shape, fill, texture);
    this.x = x;
    this.y = y;
  }
  
  void update(float delta) {
    pushMatrix();
    translate(x, y);
    rotate(PI/2);
    lightSpecular(255, 255, 255); // Why do I have to call it exactly here?
    pointLight(255, 200, 180, 0, 0, 0);
    super.update(delta);
    popMatrix();
  }

}
