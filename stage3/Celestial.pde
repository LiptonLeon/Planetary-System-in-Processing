class Celestial extends Node {
 
  PShape shape;
  
  color fill = 255;
  PImage texture = null;
  color emission = 0;
  float shininess = 0;
  color specular = 0;
  
  Celestial(PShape shape, color fill, String texture) {
    super();
    this.shape = shape;
    this.fill = fill;
    shape.setFill(fill);
    shape.setTexture(loadImage(texture));
  }
  
  Celestial(PShape shape, color fill) {
    super();
    this.shape = shape;
    this.fill = fill;
    shape.setFill(fill);
  }
  
  void setMaterial(float shininess, color specular) {
    shape.setShininess(shininess);
    shape.setSpecular(specular);
  }
  
  void addSatellite(Celestial satellite) {
    children.add(satellite);
  }
  
  void update(float time) {
    
    // Draw sattelites
    for (Node child : children) {
      child.update(time);
    }
    
    // Draw celestial
    rotateX(PI * 0.5);
    shape(shape);
    rotateX(-PI * 0.5);
  }
  
}
