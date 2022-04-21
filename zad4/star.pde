class Star implements Dynamic {
  
  float x, y;
  float alpha = 0;
  float alpha_rate = 10;
  
  Star() { 
    reset();
  }
  
  // Call every frame
  void update (float delta) {
    alpha += alpha_rate * delta;
    drawStar(color(255, -abs(alpha - 255) + 255));
    if (alpha > 512) {
      reset();
    }
  }
  
  void drawStar (color fill) {
    pushStyle();
    fill(fill);
    square(x, y, 2);
    popStyle();
  }
  
  void reset () {
    x = random(0, width);
    y = random(0, height);
    alpha = 0;
  }
}
