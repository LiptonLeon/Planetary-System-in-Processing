class FadeMask implements Dynamic {
  
  float alpha;
  float alpha_rate = 60;
  
  FadeMask () {
    alpha = 255;
  }
  
  // Call every frame
  void update(float delta) {
    // Alpha overflow would make screen completly dark
    if (alpha >= 0) {
      alpha -= alpha_rate * delta;
    }
    pushStyle();
    fill(#000000, alpha);
    rect(0, 0, width, height);
    popStyle();
  }
  
}
