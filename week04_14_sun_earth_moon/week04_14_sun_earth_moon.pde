//week04_14_sun_earth_moon
//把圖檔拉到程式裏面
PShape sun,earth,moon;
void setup() {
  size(400, 400, P3D);
  sun = createShape(SPHERE, 50);
  PImage img = loadImage("sun.jpg");
  sun.setTexture(img);
  
  earth = createShape(SPHERE, 30);
  img = loadImage("earth.jpg");
  earth.setTexture(img);
  
  moon = createShape(SPHERE, 10);
  img = loadImage("moon.jpg");
  moon.setTexture(img);
}

//week04_08_sun_earth_moon
void draw() {
  background(128);
  translate(width/2,height/2);
  shape(sun);//sphere(50);
  rotateY(radians(frameCount));
  pushMatrix();
     translate(150, 0);
     rotateY(radians(frameCount));
     shape(earth);//sphere(30);
     pushMatrix();
       translate(50, 0);
       rotateY(radians(frameCount));
       shape(moon);//sphere(10);
     popMatrix();
  popMatrix();
}
