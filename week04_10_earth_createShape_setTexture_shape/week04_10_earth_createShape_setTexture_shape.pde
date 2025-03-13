//week04_10_earth_createShape_setTexture_shape
//google:earth map texture 下載一張地球的地圖earth.jpg
//把圖檔拉到程式裏面
size(400, 400, P3D);
PShape earth = createShape(SPHERE, 100);
PImage img = loadImage("earth.jpg");
earth.setTexture(img);
shape(earth);
