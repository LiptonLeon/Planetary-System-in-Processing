class SpaceShip extends Node {

  PVector position;
  PVector rotation = new PVector(0, 0, 0);
  PVector camPos;
  PVector camExt = new PVector(0.0, 90.0, 40.0);
  PVector camInt = new PVector(0.0, 5.0, 0.1);
  boolean isInt = false;
  PShape shape;
  PImage gui;

  float linear_speed = 150.0;
  float angular_speed = 1.0;

  SpaceShip(PVector position) {
    this.position = position;
    shape = loadShape("assets/justigue_league_flying_vehicle.obj");
    gui = loadImage("assets/gui.png");
    camPos = camExt;
  }

  // Move scene before drawing spaceship
  void move(float delta) {

    // Update spaceship position
    PVector velocity = new PVector(0, 0, 0);
    if (Input.w)
      velocity.y -= 1;
    if (Input.s)
      velocity.y += 1;
    if (Input.q)
      velocity.z += 1;
    if (Input.z)
      velocity.z -= 1;
    if (Input.a)
      rotation.z -= angular_speed * delta;
    if (Input.d)
      rotation.z += angular_speed * delta;

    velocity.normalize();
    velocity.mult(linear_speed * delta);
    velocity.rotate(rotation.z);
    position.add(velocity);

    // Switch camera
    if (Input.space) {
      isInt = !isInt;
      if (isInt) {
        camPos = camInt;
      } else {
        camPos = camExt;
      }
    }

    // Move scene
    pushMatrix();

    // Draw gui
    //rotateX(-rotation.x);
    //rotateY(-rotation.y);
    //rotateZ(-rotation.z);
    translate(-position.x, -position.y, -position.z);
  }

  // Draw spaceship after moving and drawing scene
  void update(float delta) {

    // Draw ship
    popMatrix();

    scale(0.03);
    rotateZ(rotation.z);

    rotateX(PI/2);
    shape(shape);
    rotateX(-PI/2);
    
        drawGUI();
    
    beginCamera();
    camera(camPos.x, camPos.y, camPos.z, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
    rotateZ(-rotation.z);
    endCamera();
    
  }

  void drawGUI() {
    if (isInt) {
      camera();
      beginShape();
      texture(gui);
      vertex(0, 0, 0, 0);
      vertex(width, 0, gui.width, 0);
      vertex(width, height, gui.width, gui.height);
      vertex(0, height, 0, gui.height);
      endShape();
    }
  }
}
