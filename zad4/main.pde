import java.util.List;

// Global variables 
Celestial star;
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
  //                           Radius | Vertexes | Color | Squish | Orbit |Speed
  star = new Celestial(45, circle, #FFFF55);
  Celestial planet1 = new MovingCelestial(9, circle, #FFAA33, 75, 5, 0.03);
  Celestial planet2 = new MovingCelestial(13, circle, #884444, 130, 10, 0.02);
  Celestial planet3 = new MovingCelestial(17, circle, #11FF55, 240, 25, 0.01);
  Celestial planet4 = new MovingCelestial(20, circle, #AAAAFF, 390, 25, 0.004);
  Celestial planet5 = new MovingCelestial(7, circle,  #99AA99, 490, 30, 0.002);
  Celestial moon1 = new MovingCelestial(3, circle, #FF2468, 16, 0, 0.07);
  Celestial moon2 = new MovingCelestial(3, circle, #AAFFAA, 20, 1, 0.002);
  Celestial moon3 = new MovingCelestial(7, square, #AAFFAA, 54, 0, 0.009);
  Celestial moon4 = new MovingCelestial(8, square, #884411, 35, 0, 0.014);
  Celestial moon5 = new MovingCelestial(4, circle, #AAFFAA, 32, 0, 0.016);
  Celestial moon6 = new MovingCelestial(5, circle, #FFFFFF, 44, 0, 0.014);
  Celestial moon7 = new MovingCelestial(6, 6, #00FFFF, 56, 0, 0.013);
  Celestial moon8 = new MovingCelestial(2, square, #FF00FF, 69, 0, 0.012);
  
  // Add planets to sun
  star.add_satellite(planet1);
  star.add_satellite(planet2);
  star.add_satellite(planet3);
  star.add_satellite(planet4);
  star.add_satellite(planet5);
  
  // Add moons to planets
  planet1.add_satellite(moon1);
  planet2.add_satellite(moon2);
  planet3.add_satellite(moon3);
  planet3.add_satellite(moon4);
  planet4.add_satellite(moon5);
  planet4.add_satellite(moon6);
  planet4.add_satellite(moon7);
  planet4.add_satellite(moon8);
  
  img = loadImage("smile.png");
}

void draw() {
  
  // Transform system
    float time = millis()/10;
    background(0);
  starContainer.update();
  translate(width/2, height/2);
  scale(0.90);
  rotate(PI/2);
  
  // Draw system

  star.draw_celestial(time);
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
