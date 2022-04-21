import java.util.List;

// Global variables 
Celestial sun;
Celestial planet;
StarContainer starContainer = new StarContainer();
PImage img;

void setup() {
  
  // P3D caused problems with draw order, used P2D instead
  size(1280, 960, P2D);
  frameRate(60);
  
  // Consts
  int circle = 64;
  int square = 4;
  
  // Create celestials (sun is global)
  //                           Radius | Vertexes | Color | Orbit | Squish |Speed
  sun = new Celestial(40, circle, #FFFF55);
  Celestial planet1 = new MovingCelestial(9, circle, #FFAA33, 75, 5, 0.03);
  Celestial planet2 = new MovingCelestial(13, circle, #884444, 130, 10, 0.02);
  Celestial planet3 = new MovingCelestial(17, circle, #11FF55, 240, 25, 0.01);
  Celestial planet4 = new MovingCelestial(20, circle, #AAAAFF, 390, 25, 0.004);
  Celestial planet5 = new MovingCelestial(7, circle,  #99AA99, 490, 45, 0.002);
  Celestial moon1 = new MovingCelestial(3, circle, #FF2468, 16, 0, 0.07);
  Celestial moon2 = new MovingCelestial(3, circle, #AAFFAA, 20, 1, 0.002);
  Celestial moon3 = new MovingCelestial(6, square, #AAFFAA, 54, -2, 0.009);
  Celestial moon4 = new MovingCelestial(8, square, #884411, 35, -4, 0.014);
  Celestial moon5 = new MovingCelestial(4, circle, #AAFFAA, 32, 0, 0.016);
  Celestial moon6 = new MovingCelestial(5, circle, #FFFFFF, 44, 0, 0.014);
  Celestial moon7 = new MovingCelestial(6, 6, #00FFFF, 56, 0, 0.013);
  Celestial moon8 = new MovingCelestial(2, square, #FF00FF, 69, 0, 0.012);
  
  // Add planets to sun
  sun.addSatellite(planet1);
  sun.addSatellite(planet2);
  sun.addSatellite(planet3);
  sun.addSatellite(planet4);
  sun.addSatellite(planet5);
  
  // Add moons to planets
  planet1.addSatellite(moon1);
  planet2.addSatellite(moon2);
  planet3.addSatellite(moon3);
  planet3.addSatellite(moon4);
  planet4.addSatellite(moon5);
  planet4.addSatellite(moon6);
  planet4.addSatellite(moon7);
  planet4.addSatellite(moon8);
  
  img = loadImage("smile.png");
}

void draw() {
  
  // Transform system
  float time = millis()/10;
  background(0);
  starContainer.update();
  translate(width/2, height/2);
  rotate(PI/2);
  
  // Draw system

  sun.drawCelestial(time);
  pushMatrix();
  scale(1.2);
  rotate(-PI/2);
  translate(-23, -22);
  image(img, 0, 0);
  popMatrix();
  //planet.draw_celestial(time);
  /*pushStyle();
  noSmooth();
  stroke(#ffffff);
  square(random(0, width), random(0, height), 2);
  popStyle();
  */
}
