PShape materialPrimitive(int type, float size, color fill, float shininess, color specular) {
  PShape ret = createShape(type, size);
  ret.setFill(fill);
  ret.setShininess(shininess);
  ret.setSpecular(specular);
  return ret;
}

PShape materialPrimitive(int type, float size, color fill, String texture, float shininess, color specular) {
  PShape ret = createShape(type, size);
  ret.setFill(fill);
  ret.setTexture(loadImage(texture));
  ret.setShininess(shininess);
  ret.setSpecular(specular);
  return ret;
}

PShape materialMesh(String mesh, color fill, float shininess, color specular) {
  PShape ret = loadShape(mesh);
  ret.setFill(fill);
  ret.setShininess(shininess);
  ret.setSpecular(specular);
  return ret;
}

PShape materialMesh(String mesh, color fill, String texture, float shininess, color specular) {
  PShape ret = loadShape(mesh);
  ret.setFill(fill);
  ret.setTexture(loadImage(texture));
  ret.setShininess(shininess);
  ret.setSpecular(specular);
  return ret;
}


/*PShape materialShape(int type, float size, float shininess) {
  PShape ret = createShape(type, size);
  ret.setShininess(shininess);
  return ret;
}

PShape materialShape(int type, float size, color emissive) {
  pushStyle();
  emissive(emissive);
  PShape ret = createShape(type, size);
  popStyle();
  return ret;
}

PShape materialShape(PShape shape, float shininess) {
  shape.setShininess(shininess);
  return shape;
}

PShape materialShape(int type, float size, float shininess, String texture) {
  PShape ret = createShape(type, size);
  ret.setShininess(shininess);
  ret.setTexture(loadImage(texture));
  return ret;
}

PShape materialShape(int type, float size, color emissive, String texture) {
  pushStyle();
  emissive(emissive);
  PShape ret = createShape(type, size);
  ret.setTexture(loadImage(texture));
  popStyle();
  return ret;
}

PShape materialShape(PShape shape, float shininess, String texture) {
  shape.setShininess(shininess);
  shape.setTexture(loadImage(texture));
  return shape;
}

PShape materialShape(int type, float size, String texture) {
  PShape ret = createShape(type, size);
  ret.setTexture(loadImage(texture));
  return ret;
}

PShape materialShape(PShape shape, String texture) {
  shape.setTexture(loadImage(texture));
  return shape;
}

PShape colorShape(int type, float size, String texture, color fill) {
  PShape ret = createShape(type, size);
  ret.setTexture(loadImage(texture));
  ret.setFill(fill);
  return ret;
}

PShape colorShape(int type, float size, color fill) {
  PShape ret = createShape(type, size);
  ret.setFill(fill);
  return ret;
}

PShape colorShape(String path, color fill, float shininess) {
  PShape ret = loadShape(path);
  ret.setFill(fill);
  ret.setShininess(shininess);
  return ret;
}
*/

// Epic builder fail
/*
class XShape {

  public static final class Builder {

    private int type;
    private float radius;
    private color fill;
    private PShape shape;
    private String texture;
    private float shininess;
    private color emissive;

    
  static XShape builder() {
     return new XShape();
     }

    public XShape type(int type) {
      this.type = type;
      return this;
    }

    public XShape radius(float radius) {
      this.radius = radius;
      return this;
    }

    public XShape fill(color fill) {
      this.fill = fill;
      return this;
    }

    public XShape shape(PShape shape) {
      this.shape = shape;
      return this;
    }

    public XShape texture(String texture) {
      this.texture = texture;
      return this;
    }

    public XShape shininess(float shininess) {
      this.shininess = shininess;
      return this;
    }

    public XShape emissive(color emissive) {
      this.emissive = emissive;
      return this;
    }

    public PShape build() {
      if (shape == null)
        shape = createShape(type, radius);

      shape.setFill(fill);

      if (texture == null)
        shape.setTexture(loadImage(texture));

      shape.setShininess(shininess);
      shape.setEmissive(emissive);


      return shape;
    }
  }
}*/
