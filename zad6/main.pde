import java.util.List;

// Globals
List<Updateable> updateableList;
float lastMillis = 0;

void setup() {

  // Nothing special
  size(1280, 960, P3D);
  //fullScreen(P3D);
  background(0);
  noStroke();
  noCursor();

  // Fps cap
  frameRate(200);

  // Create sun (need to call emissive() before creating PShape)
  emissive(255);
  Celestial sun = new Star(createShape(SPHERE, 60), #ffffff, "assets/sun.png", 0, 0);
  emissive(0);

  // Create planets ------------------------------------------------------------------------------------------------------
  sun.addChild(new OrbitingCelestial(createShape(SPHERE, 17.0), #ffffff, "assets/planet_terra.png"));
  sun.getChild(0).addChild(new Lantern(17, PI/2.2, 4, 1)); // Lantern's spotLight needs to be called before drawing planets and moons
  ((OrbitingCelestial) sun.getChild(0)).setMaterial(1, #ccccff);
  ((OrbitingCelestial) sun.getChild(0)).setOrbit(260, 25, PI/50, 1);

  sun.addChild(new OrbitingCelestial(createShape(SPHERE, 9.0), #ffffff, "assets/planet_infernal.png"));
  ((OrbitingCelestial) sun.getChild(1)).setMaterial(20, #ff2200);
  ((OrbitingCelestial) sun.getChild(1)).setOrbit(95, 5, -PI/16, 3);

  sun.addChild(new OrbitingCelestial(createShape(SPHERE, 13.0), #ffffff, "assets/planet_sweet.png"));
  ((OrbitingCelestial) sun.getChild(2)).setMaterial(10, #0000ff);
  ((OrbitingCelestial) sun.getChild(2)).setOrbit(150, 10, 0, 2);

  sun.addChild(new OrbitingCelestial(createShape(SPHERE, 30.0), #ffffff, "assets/planet_giant.png"));
  ((OrbitingCelestial) sun.getChild(3)).setMaterial(2, #00ff00);
  ((OrbitingCelestial) sun.getChild(3)).setOrbit(410, 25, -PI/64, 0.4);

  sun.addChild(new OrbitingCelestial(createShape(SPHERE, 7.0), #ffffff, "assets/planet_ice.png"));
  ((OrbitingCelestial) sun.getChild(4)).setMaterial(0, 0);
  ((OrbitingCelestial) sun.getChild(4)).setOrbit(610, 65, PI/32, 0.2);

  // Create moons --------------------------------------------------------------------------------------------------------
  sun.getChild(0).addChild(new OrbitingCelestial(loadShape("assets/kapsel.obj"), #FF3300));
  ((OrbitingCelestial) sun.getChild(0).getChild(1)).setMaterial(5, #aaaaaa);
  ((OrbitingCelestial) sun.getChild(0).getChild(1)).setOrbit(54, -2, -PI/24, -0.9);

  sun.getChild(0).addChild(new OrbitingCelestial(createShape(SPHERE, 4.0), #AAAAAA, "assets/moon_craters.png"));
  ((OrbitingCelestial) sun.getChild(0).getChild(2)).setMaterial(0, 0);
  ((OrbitingCelestial) sun.getChild(0).getChild(2)).setOrbit(35, -4, 0, -1.5);

  sun.getChild(1).addChild(new OrbitingCelestial(createShape(BOX, 3.0), #FF2468));
  ((OrbitingCelestial) sun.getChild(1).getChild(0)).setMaterial(0, 0);
  ((OrbitingCelestial) sun.getChild(1).getChild(0)).setOrbit(16, 0, PI/24, 7);

  sun.getChild(2).addChild(new OrbitingCelestial(createShape(SPHERE, 3.0), #AAFFAA));
  ((OrbitingCelestial) sun.getChild(2).getChild(0)).setMaterial(0, 0);
  ((OrbitingCelestial) sun.getChild(2).getChild(0)).setOrbit(16, 0, PI/24, 7);

  sun.getChild(3).addChild(new OrbitingCelestial(createShape(SPHERE, 5.0), #884411, "assets/moon_craters.png"));
  ((OrbitingCelestial) sun.getChild(3).getChild(0)).setMaterial(0, 0);
  ((OrbitingCelestial) sun.getChild(3).getChild(0)).setOrbit(48, 0, -PI/12, 1.4);

  sun.getChild(3).addChild(new OrbitingCelestial(createShape(BOX, 3.5), #00FFFF));
  ((OrbitingCelestial) sun.getChild(3).getChild(1)).setMaterial(0, 0);
  ((OrbitingCelestial) sun.getChild(3).getChild(1)).setOrbit(58, -PI/24, 0, -1.7);

  sun.getChild(3).addChild(new OrbitingCelestial(createShape(SPHERE, 3.0), #FF00FF));
  ((OrbitingCelestial) sun.getChild(3).getChild(2)).setMaterial(0, 0);
  ((OrbitingCelestial) sun.getChild(3).getChild(2)).setOrbit(69, 0, 0, 1.2);

  sun.getChild(3).addChild(new OrbitingCelestial(createShape(SPHERE, 4.0), #AAFFAA, "assets/moon_mountains.png"));
  ((OrbitingCelestial) sun.getChild(3).getChild(3)).setMaterial(0, 0);
  ((OrbitingCelestial) sun.getChild(3).getChild(3)).setOrbit(33, 0, PI/6, 1.6);

  // Add dynamic elements to list --------------------------------------------------------------------------------------
  updateableList = new ArrayList<Updateable>();
  updateableList.add(sun);
  //updateableList.add(new Skybox("assets/noise.png", "assets/star_mask.png")); // Bad for performance
  updateableList.add(new SpaceShip(new PVector(100, 10, 100)));
  //updateableList.add(new CenteredCamera());
}

void draw() {

  // Clear screen
  background(0);
  ambientLight(20, 20, 40);

  // Calculate delta
  float delta = (millis() - lastMillis) / 1000.0;
  lastMillis = millis();
  print("Fps:", frameRate, "\n");

  // Update dynamic elements
  for (Updateable element : updateableList) {
    element.update(delta);
  }

  fill(#ff0000);
  sphere(1000);

  // Update statics
  Input.update();
  
  float t = millis() * 0.001;

}
