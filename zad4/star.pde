class Star {
  
  float x, y;
  float alpha = 0;
  float update_rate = 5;
  
  Star() { 
    reset();
  }
  
  void update() {
    alpha += update_rate;
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
