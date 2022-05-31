// Why do I have to make it myself???
static class Input {
  static boolean mouseup = false;
  static boolean mousedown = false;

  static boolean w = false;
  static boolean s = false;
  static boolean a = false;
  static boolean d = false;
  static boolean q = false;
  static boolean z = false;

  static void update() {
    Input.mouseup = false;
    Input.mousedown = false;
  }
}

// Why you must be so useless???
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e > 0)
    Input.mouseup = true;

  if (e < 0)
    Input.mousedown = true;
}

void keyPressed() {

  switch(key) {

  case 'w':
    Input.w = true;
    break;
  case 's':
    Input.s = true;
    break;
  case 'a':
    Input.a = true;
    break;
  case 'd':
    Input.d = true;
    break;
  case 'q':
    Input.q = true;
    break;
  case 'z':
    Input.z = true;
    break;
  }
}

void keyReleased() {
  switch(key) {

  case 'w':
    Input.w = false;
    break;
  case 's':
    Input.s = false;
    break;
  case 'a':
    Input.a = false;
    break;
  case 'd':
    Input.d = false;
    break;
  case 'q':
    Input.q = false;
    break;
  case 'z':
    Input.z = false;
    break;
  }
}
