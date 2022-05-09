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
  Celestial sun = new StaticCelestial(createShape(SPHERE, 60), 255, "assets/sun.png", 0, 0);
  sun.setMaterial(color(255, 220, 200), 0, 0);
  
//PShape a = new XShape.Builder().type(SPHERE).size(9.0).shininess(0.8).texture("assets/planet_infernal.png").build();
  //  Create planets
  
  sun.addChild(new OrbitingCelestial(materialPrimitive(SPHERE, 9.0, 255, "assets/planet_infernal.png", 0, 0), 95, 5, -PI/16, 3));
  sun.getChild(0).setMaterial();
  sun.getChild(0).setOrbit();
  
  //sun.addChild(new XShape.Builder().type(SPHERE).size(9.0).shininess(0.8).texture("assets/planet_infernal.png").build(), 95, 5, -PI/16, 3));
  
  
  sun.addChild(new OrbitingCelestial(materialShape(SPHERE, 13.0, "assets/planet_sweet.png"), 150, 10, 0, 2));
  
  sun.addChild(new OrbitingCelestial(materialShape(SPHERE, 17, "assets/planet_terra.png"), 260, 25, PI/50, 1));
  
  sun.addChild(new OrbitingCelestial(materialShape(SPHERE, 30, "assets/planet_giant.png"), 410, 25, -PI/64, 0.4));
  
  sun.addChild(new OrbitingCelestial(materialShape(SPHERE, 7, "assets/planet_ice.png"), 610, 65, PI/32, 0.2));
  
  // Create moons 
  sun.getChild(0).addChild(new OrbitingCelestial(colorShape(BOX, 3, #FF2468), 16, 0, PI/24, 7));
  
  sun.getChild(1).addChild(new OrbitingCelestial(colorShape(SPHERE, 3, #AAFFAA), 20, 1, 0, -3));

  sun.getChild(2).addChild(new OrbitingCelestial(colorShape("assets/kapsel.obj", #FF3300, 1), 54, -2, -PI/24, -0.9));
  
  sun.getChild(2).addChild(new OrbitingCelestial(colorShape(SPHERE, 4, "assets/moon_craters.png", #AAAAAA), 35, -4, 0, -1.5));
  
  sun.getChild(3).addChild(new OrbitingCelestial(colorShape(SPHERE, 6, "assets/moon_mountains.png", #AAFFAA), 31, 0, PI/6, 1.6));
  
  sun.getChild(3).addChild(new OrbitingCelestial(colorShape(SPHERE, 5, "assets/moon_craters.png", #884411), 48, 0, -PI/12, 1.4));
  
  sun.getChild(3).addChild(new OrbitingCelestial(colorShape(BOX, 3.5, #00FFFF), 58, -PI/24, 0, -1.7));
  
  sun.getChild(3).addChild(new OrbitingCelestial(colorShape(SPHERE, 3, #FF00FF), 69, 0, 0, 1.2));
  
  // Create lantern
  sun.getChild(2).addChild(new Lantern(17, PI/2.2, 4, 1));
  
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