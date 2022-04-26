class FadeMask implements Updateable {
  
  float alpha;
  float alpha_rate = 160;
  
  FadeMask() {
    // Alpha exceeds 255 to keep screen black for a while
    alpha = 1400;
  }
  
  // Call every frame
  void update(float delta) {
    // Alpha overflow would make screen completly dark
    if (alpha >= 0) {
      alpha -= alpha_rate * delta;
    }
    pushStyle();
    fill(#000000, alpha);
    rect(-width/2, -height/2, width, height);
    popStyle();
  }
  
}
