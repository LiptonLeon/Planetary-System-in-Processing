class Lantern extends Node {
  
  // Draw variables
  float z, angle, size;
 
  // Blink variables
  float phaseRate;
  float phase = 0;
  
  Lantern(float z, float angle, float size, float phaseRate) {
    this.z = z;
    this.angle = angle;
    this.size = size;
    this.phaseRate = phaseRate;
  }

  void update(float delta) {
    // Calculate how bright is lantern
    phase += phaseRate * delta;
    int brightness = int(abs(sin(phase)) * 255);
    color bulbFill = color(brightness, brightness, 0);
    
    pushMatrix();
    
    // Draw base of lantern
    rotateX(angle);
    translate(0, 0, z);
    PShape base = createShape(BOX, size);
    base.setFill(#888888);
    shape(base);
    
    // Draw bulb of lantern
    translate(0, 0, size);
    PShape bulb = createShape(SPHERE, size * 0.5);
    bulb.setFill(#ffff00);
    bulb.setEmissive(bulbFill );
    shape(bulb);
    
    // Add spotlight
    spotLight(brightness, brightness, 0, 
              0, 0, 0,
              0, 0, 1,
              PI/1.3, 2);
    
    popMatrix();
  }

}
