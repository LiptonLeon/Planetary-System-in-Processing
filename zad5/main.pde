import java.util.List;

// Globals
List<Updateable> updateableList;
float lastMillis = millis();

void setup() {
   
  // Nothing special
  size(1280, 960, P3D);
  //fullScreen(P3D);
  background(0);
  noStroke();
  noCursor();
  
  // Fps cap
  frameRate(200);
  
  //  Create sun
  pushStyle();
  emissive(255, 220, 200);
  PShape shape = createShape(SPHERE, 40);
  shape.setTexture(loadImage("assets/sun.png"));  
  popStyle();
  Celestial sun = new StaticCelestial(shape, 0, 0);
  
  //  Create planets
  sun.addSatellite(new OrbitingCelestial(createShape(SPHERE, 9), 75, 5, -PI/16, 3));
  sun.satellites.get(0).shininess = 0.8;
  sun.satellites.get(0).shape.setTexture(loadImage("assets/planet_infernal.png"));
  
  sun.addSatellite(new OrbitingCelestial(createShape(SPHERE, 13), 130, 10, 0, 2));
  sun.satellites.get(1).shape.setTexture(loadImage("assets/planet_sweet.png"));
  
  sun.addSatellite(new OrbitingCelestial(createShape(SPHERE, 17), 240, 25, PI/50, 1));
  sun.satellites.get(2).shape.setTexture(loadImage("assets/planet_terra.png"));
  
  sun.addSatellite(new OrbitingCelestial(createShape(SPHERE, 20), 390, 25, -PI/64, 0.4));
  sun.satellites.get(3).shape.setTexture(loadImage("assets/planet_giant.png"));
  
  sun.addSatellite(new OrbitingCelestial(createShape(SPHERE, 7), 510, 65, PI/32, 0.2));
  sun.satellites.get(4).shape.setTexture(loadImage("assets/planet_ice.png"));
  
  // Create moons 
  sun.satellites.get(0).addSatellite(new OrbitingCelestial(createShape(BOX, 3), 16, 0, PI/24, 7));
  sun.satellites.get(0).satellites.get(0).shape.setFill(#FF2468);
  
  sun.satellites.get(1).addSatellite(new OrbitingCelestial(createShape(SPHERE, 3), 20, 1, 0, -3));
  sun.satellites.get(1).satellites.get(0).shape.setFill(#AAFFAA);
  
  sun.satellites.get(2).addSatellite(new OrbitingCelestial(createShape(BOX, 7), 54, -2, -PI/24, -0.9));
  sun.satellites.get(2).satellites.get(0).shape.setFill(#AAFFAA);
  sun.satellites.get(2).satellites.get(0).shape.setTexture(loadImage("assets/moon_square.png"));
  
  sun.satellites.get(2).addSatellite(new OrbitingCelestial(createShape(SPHERE, 8), 35, -4, 0, -1.5));
  sun.satellites.get(2).satellites.get(1).shape.setFill(#AAAAAA);
  sun.satellites.get(2).satellites.get(1).shape.setTexture(loadImage("assets/moon_craters.png"));
  
  sun.satellites.get(3).addSatellite(new OrbitingCelestial(createShape(SPHERE, 6), 31, 0, PI/6, 1.6));
  sun.satellites.get(3).satellites.get(0).shape.setFill(#AAFFAA);
  sun.satellites.get(3).satellites.get(0).shape.setTexture(loadImage("assets/moon_mountains.png"));
  
  sun.satellites.get(3).addSatellite(new OrbitingCelestial(createShape(SPHERE, 5), 48, 0, -PI/12, 1.4));
  sun.satellites.get(3).satellites.get(1).shape.setFill(#884411);
  sun.satellites.get(3).satellites.get(1).shape.setTexture(loadImage("assets/moon_craters.png"));
  
  sun.satellites.get(3).addSatellite(new OrbitingCelestial(createShape(BOX, 3.5), 58, -PI/24, 0, -1.7));
  sun.satellites.get(3).satellites.get(2).shape.setFill(#00FFFF);
  
  sun.satellites.get(3).addSatellite(new OrbitingCelestial(createShape(SPHERE, 3), 69, 0, 0, 1.2));
  sun.satellites.get(3).satellites.get(3).shape.setFill(#FF00FF);
  
  
  // Add dynamic elements to list
  updateableList = new ArrayList<Updateable>();
  updateableList.add(new CenteredCamera());
  updateableList.add(sun);
}

void draw() {
  
  // Clear screen
  background(0);
  ambientLight(10, 10, 20);
  
  // Calculate delta
  float delta = (millis() - lastMillis) / 1000.0;
  lastMillis = millis();
  print("Fps:", frameRate, "\n");
  
  // Update dynamic elements
  for (Updateable element : updateableList) {
    element.update(delta);
  }
  
  // Update statics
  Input.update();
}
