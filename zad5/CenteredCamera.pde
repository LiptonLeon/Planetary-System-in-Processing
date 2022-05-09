class CenteredCamera implements Updateable {

  float zoom = 600;
  float zoom_rate = 50;

  CenteredCamera() {}

  void update(float delta) {

    // Change zoom
    if (Input.mouseup)
      zoom += zoom_rate;
    if (Input.mousedown)
      zoom -= zoom_rate;

    // Move camera;
    beginCamera();
    float rotation = (-mouseY + height) / 700.0;
    camera(0, zoom * sin(rotation), zoom * cos(rotation),
      0.0, 0.0, 0.0,
      0, 1, 0);
    rotateZ(-mouseX/100.0);
    endCamera();
  }
}
