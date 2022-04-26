import java.util.List;

// Globals
List<Dynamic> dynamicList;
float lastMillis = millis();

void setup() {
  
  // P3D caused problems with draw order, used P2D instead
  size(1280, 960, P2D);
  background(0);
  
  // Fps cap
  frameRate(200);
  
  // Create sun                    | Radius | Vertexes | Color |            Texture             |   x   |   y   |
  Celestial sun =     new StaticCelestial(40, 0, #FFFF55, loadImage("assets/sun.png")        , 0, 0);
  
  // Create planets                | Radius | Vertexes | Color |            Texture             | Orbit | Squish | Speed |
  sun.addSatellite(new OrbitingCelestial(9, 0, #FFFFFF, loadImage("assets/planet_infernal.png"), 75, 5, 3));
  sun.addSatellite(new OrbitingCelestial(13, 0, #FFFFFF, loadImage("assets/planet_sweet.png")  , 130, 10, 2));
  sun.addSatellite(new OrbitingCelestial(17, 0, #FFFFFF, loadImage("assets/planet_terra.png")  , 240, 25, 1));
  sun.addSatellite(new OrbitingCelestial(20, 0, #FFFFFF, loadImage("assets/planet_giant.png")  , 390, 25, 0.4));
  sun.addSatellite(new OrbitingCelestial(7, 0,  #FFFFFF, loadImage("assets/planet_ice.png")    , 510, 65, 0.2));
  
  // Create moons                                | Radius | Vertexes | Color |           Texture               | Orbit | Squish | Speed |
  sun.satellites.get(0).addSatellite(new OrbitingCelestial(3, 4, #FF2468, null                                   , 16, 0, 7));
  sun.satellites.get(1).addSatellite(new OrbitingCelestial(3, 0, #AAFFAA, null                                   , 20, 1, -3));
  sun.satellites.get(2).addSatellite(new OrbitingCelestial(7, 4, #AAFFAA, loadImage("assets/moon_square.png")    , 54, -2, -0.9));
  sun.satellites.get(2).addSatellite(new OrbitingCelestial(8, 0, #AAAAAA, loadImage("assets/moon_craters.png")   , 35, -4, -1.5));
  sun.satellites.get(3).addSatellite(new OrbitingCelestial(6, 0, #AAFFAA, loadImage("assets/moon_mountains.png") , 31, 0, 1.6));
  sun.satellites.get(3).addSatellite(new OrbitingCelestial(5, 0, #884411, loadImage("assets/moon_craters.png")   , 48, 0, 1.4));
  sun.satellites.get(3).addSatellite(new OrbitingCelestial(3.5, 6, #00FFFF, null                                      , 58, 0, -1.7));
  sun.satellites.get(3).addSatellite(new OrbitingCelestial(3, 4, #FF00FF, null                                   , 69, 0, 1.2));
  
  // Add dynamic elements to list
  dynamicList = new ArrayList<Dynamic>();
  dynamicList.add(new StarBackground());
  dynamicList.add(sun);
  dynamicList.add(new FadeMask());
}

void draw() {
  
  // Clear screen
  background(100);
  
  // Calculate delta
  float delta = (millis() - lastMillis) / 1000.0;
  lastMillis = millis();
  print("Fps:", frameRate, "\n");
  
  // Translate to center of screen
  translate(width/2, height/2);
  
  // Update dynamic elements
  for (Dynamic element : dynamicList) {
    element.update(delta);
  }
}
