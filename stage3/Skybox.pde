class Skybox implements Updateable {
  PShape mask;
  PShape noise;
  float rotation = 0;
  float rotationRate = 0.005;

  Skybox(String noiseTexture, String maskTexture) {
    noise = createShape(SPHERE, 4100);
    noise.setTexture(loadImage(noiseTexture));
    mask = createShape(SPHERE, 4000);
    mask.setTexture(loadImage(maskTexture));
  }

  void update(float delta) {
    
    // Draw noise and mask
    pushStyle();
    noLights();
    rotateX(PI * 0.5);
    rotateY(rotation);
    shape(noise);
    rotateY(-rotation);
    shape(mask);
    popStyle();
    
    // Rotate noise
    rotation += rotationRate * delta;
  }
}
