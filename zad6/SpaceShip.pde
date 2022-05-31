class SpaceShip extends Node {

  PVector position;
  PVector rotation = new PVector(0, 0, 0);
  PShape shape;

  float linear_speed = 150.0;
  float angular_speed = 1.0;

  SpaceShip(PVector position) {
    this.position = position;
    shape = loadShape("assets/justigue_league_flying_vehicle.obj");
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

    // Move scene
    pushMatrix();
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

    beginCamera();
    camera(0.0, 90.0, 40.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
    rotateZ(-rotation.z);
    endCamera();
  }

}
