import java.util.List;

List<Dynamic> dynamicList;
float delta;

void setup() {
  
  // P3D caused problems with draw order, used P2D instead
  size(1280, 960, P2D);
  
  // Fps cap
  frameRate(144);
  
  // Vertex count consts
  int circle = 64;
  int square = 4;
  
  // Create sun                     | Radius | Vertexes | Color |          Texture         |   x   |   y   |
  Celestial sun =     new StaticCelestial(40, circle, #FFFF55, loadImage("assets/sun.png"), width/2, height/2);
  
  // Create moving celestials       | Radius | Vertexes | Color |           Texture            | Orbit | Squish | Speed |
  Celestial planet1 = new MovingCelestial(9, circle, #FFFFFF, loadImage("assets/planet_infernal.png"), 75, 5, 3);
  Celestial planet2 = new MovingCelestial(13, circle, #FFFFFF, loadImage("assets/planet_sweet.png") , 130, 10, 2);
  Celestial planet3 = new MovingCelestial(17, circle, #FFFFFF, loadImage("assets/planet_terra.png") , 240, 25, 1);
  Celestial planet4 = new MovingCelestial(20, circle, #FFFFFF, loadImage("assets/planet_giant.png") , 390, 25, 0.4);
  Celestial planet5 = new MovingCelestial(7, circle,  #FFFFFF, loadImage("assets/planet_ice.png")   , 510, 65, 0.2);
  Celestial moon1 =   new MovingCelestial(3, square, #FF2468, null                                   , 16, 0, 7);
  Celestial moon2 =   new MovingCelestial(3, circle, #AAFFAA, null                                   , 20, 1, -3);
  Celestial moon3 =   new MovingCelestial(7, square, #AAFFAA, loadImage("assets/moon_square.png")    , 54, -2, -0.9);
  Celestial moon4 =   new MovingCelestial(8, circle, #AAAAAA, loadImage("assets/moon_craters.png")   , 35, -4, -1.5);
  Celestial moon5 =   new MovingCelestial(6, circle, #AAFFAA, loadImage("assets/moon_mountains.png") , 31, 0, 1.6);
  Celestial moon6 =   new MovingCelestial(5, circle, #884411, loadImage("assets/moon_craters.png")   , 48, 0, 1.4);
  Celestial moon7 =   new MovingCelestial(3.5, 6, #00FFFF, null                                        , 58, 0, -1.7);
  Celestial moon8 =   new MovingCelestial(3, square, #FF00FF, null                                   , 69, 0, 1.2);
  
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
  
  dynamicList = new ArrayList<Dynamic>();
  dynamicList.add(new StarContainer());
  dynamicList.add(sun);
  dynamicList.add(new FadeMask());
}

// For delta calculations
float lastMillis = millis();

void draw() {
  
  // Clear screen
  background(0);
  
  // Calculate delta
  float delta = (millis() - lastMillis) / 1000.0;
  lastMillis = millis();
  
  // Update dynamic elements
  for(Dynamic element : dynamicList){
    element.update(delta);
  }
  
}
