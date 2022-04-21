import java.util.List;

// Globals
List<Dynamic> dynamicList;
float delta;
float lastMillis = millis();

void setup() {
  
  // P3D caused problems with draw order, used P2D instead
  size(1280, 960, P2D);
  background(0);
  
  // Fps cap
  frameRate(300);
  
  // Vertex count consts
  int circle = 64;
  int square = 4;
  
  // Create sun                    | Radius | Vertexes | Color |            Texture             |   x   |   y   |
  Celestial sun =     new StaticCelestial(40, circle, #FFFF55, loadImage("assets/sun.png")        , width/2, height/2);
  
  // Create planets                | Radius | Vertexes | Color |            Texture             | Orbit | Squish | Speed |
  sun.addSatellite(new MovingCelestial(9, circle, #FFFFFF, loadImage("assets/planet_infernal.png"), 75, 5, 3));
  sun.addSatellite(new MovingCelestial(13, circle, #FFFFFF, loadImage("assets/planet_sweet.png")  , 130, 10, 2));
  sun.addSatellite(new MovingCelestial(17, circle, #FFFFFF, loadImage("assets/planet_terra.png")  , 240, 25, 1));
  sun.addSatellite(new MovingCelestial(20, circle, #FFFFFF, loadImage("assets/planet_giant.png")  , 390, 25, 0.4));
  sun.addSatellite(new MovingCelestial(7, circle,  #FFFFFF, loadImage("assets/planet_ice.png")    , 510, 65, 0.2));
  
  // Create moons                                 | Radius | Vertexes | Color |           Texture               | Orbit | Squish | Speed |
  sun.satellites.get(0).addSatellite(new MovingCelestial(3, square, #FF2468, null                                   , 16, 0, 7));
  sun.satellites.get(1).addSatellite(new MovingCelestial(3, circle, #AAFFAA, null                                   , 20, 1, -3));
  sun.satellites.get(2).addSatellite(new MovingCelestial(7, square, #AAFFAA, loadImage("assets/moon_square.png")    , 54, -2, -0.9));
  sun.satellites.get(2).addSatellite(new MovingCelestial(8, circle, #AAAAAA, loadImage("assets/moon_craters.png")   , 35, -4, -1.5));
  sun.satellites.get(3).addSatellite(new MovingCelestial(6, circle, #AAFFAA, loadImage("assets/moon_mountains.png") , 31, 0, 1.6));
  sun.satellites.get(3).addSatellite(new MovingCelestial(5, circle, #884411, loadImage("assets/moon_craters.png")   , 48, 0, 1.4));
  sun.satellites.get(3).addSatellite(new MovingCelestial(3.5, 6, #00FFFF, null                                      , 58, 0, -1.7));
  sun.satellites.get(3).addSatellite(new MovingCelestial(3, square, #FF00FF, null                                   , 69, 0, 1.2));
  
  // Add dynamic elements to list
  dynamicList = new ArrayList<Dynamic>();
  dynamicList.add(new StarContainer());
  dynamicList.add(sun);
  dynamicList.add(new FadeMask());
}

void draw() {
  
  // Clear screen
  background(0);
  
  // Calculate delta
  float delta = (millis() - lastMillis) / 1000.0;
  lastMillis = millis();
  
  // Update dynamic elements
  for (Dynamic element : dynamicList) {
    element.update(delta);
  }
  
}
