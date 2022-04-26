class StarBackground implements Dynamic {

  PImage noise = loadImage("assets/noise.png");
  PImage starMask = loadImage("assets/star_mask.png");
  float pos = 0;
  float pos_rate = 1.5;
  
  StarBackground() {}
  
  void update(float delta) {
    
    // Move noise map;
    pos += delta * pos_rate;
    
    // White background lights up stars
    background(255);
    drawNoise();
    drawMask();
    
  }
  
  // Draw noise map
  void drawNoise(){
    pushMatrix();
    beginShape();
    
    float size = max(height, width) * 0.5;  
    //translate(width/2, height/2);
    
    textureWrap(REPEAT);
    texture(noise);
    
    // Shift texture every frame
    vertex(-size, -size, 0+pos, 0);
    vertex(size, -size, width+pos, 0);
    vertex(size, size, width+pos, height);
    vertex(-size, size, 0+pos, height);
    
    endShape();
    popMatrix();
  }
  
  // Draw star mask
  void drawMask(){
    pushMatrix();
    beginShape();
    
    textureWrap(NORMAL); 
    texture(starMask);
    translate(-width/2, -height/2);
    
    vertex(0, 0, 0, 0);
    vertex(width, 0, width, 0);
    vertex(width, height, width, height);
    vertex(0, height, 0, height);
    
    endShape();
    popMatrix();
  }
  
}
