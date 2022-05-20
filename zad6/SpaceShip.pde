class SpaceShip implements Updateable {

  PVector position;
  PVector rotation = new PVector(0, 0, 0);
  PShape shape;

  SpaceShip(PVector position) {
    this.position = position;
    shape = loadShape("assets/justigue_league_flying_vehicle.obj");
  }

  void update(float delta) {
    pushMatrix();
    rotateX(PI/2);
    translate(position.x, position.y, position.z);
    rotateX(rotation.x);
    rotateY(rotation.y);
    rotateZ(rotation.z);
    scale(0.1);
    box(20);
    shape(shape);
    popMatrix();

    beginCamera();
    camera(0, 0, 0, 0, 0, 1, 0, 1, 0);
    rotateX(PI/2);
    //rotateZ(t);
    rotateZ(PI);
    rotateY(rotation.z);
    translate(-position.x, -position.z, position.y);
    translate(0, 0, -40);
    endCamera();
    
    rotation.z += 0.01;
  }
}
