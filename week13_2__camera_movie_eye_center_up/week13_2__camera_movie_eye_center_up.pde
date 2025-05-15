//week13_2__camera_movie_eye_center_up
import processing.video.*;
Movie movie;
void setup(){
  size(720,480,P3D);
  movie = new Movie(this, "street.mov");
  movie.loop();
}
void draw(){
  background(128);
  camera(mouseX, mouseY, 500, 360, 240, 0, 0, 1, 0);
  if(movie.available()) movie.read();
  image(movie,0,0);
}
