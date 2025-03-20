//week05_03b_atan2_dy_dx_text_radians_degrees
//degrees vs. radians 結合 week04_1 和 week05_2
void setup() {
  size(400, 400);
}
void draw() {
  background(128);
  line(200,200,400,200);
  line(200,200,mouseX,mouseY);
  float dx = mouseX-200, dy = mouseY-200;
  float a = atan2(dy, dx);
  //arc(200,200,200,200,0,a,PIE);
  if(a<0) arc(200,200,200,200,a,0,PIE);
  else    arc(200,200,200,200,0,a,PIE);
  textSize(30);
  text("radians:"+a,100,100);
  text("degrees:"+degrees(a),100,130);
}
