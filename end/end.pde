PShape body,head;
PShape uparm1,upuparm1,hand1;
PShape uparm2,upuparm2,hand2;

float [] angleX = new float[10];
float [] angleY = new float[10];

int ID=0;
int R = 0;
ArrayList<String> lines = new ArrayList<String>();

import processing.sound.*;
SoundFile mySound;

void setup(){
  size(400,400,P3D);
  body = loadShape("body.obj");
  head = loadShape("head.obj");
  uparm1 = loadShape("uparm1.obj");
  upuparm1 = loadShape("upuparm1.obj");
  hand1 = loadShape("hand1.obj");
  uparm2 = loadShape("uparm2.obj");
  upuparm2 = loadShape("upuparm2.obj");
  hand2 = loadShape("hand2.obj");
  
  mySound = new SoundFile(this,"Coincidance-cut.mp3");
  mySound.play();
}

void mouseDragged(){
  angleX[ID]+=radians(mouseX-pmouseX);
  angleY[ID]+=radians(mouseY-pmouseY);
}
void keyPressed(){
  if(key=='1') ID=1;
  if(key=='2') ID=2;
  if(key=='3') ID=3;
  if(key=='4') ID=4;
  if(key=='5') ID=5;
  if(key=='6') ID=6;
  if(key=='7') ID=7;
  if(key=='8') ID=8;
  if(key=='9') ID=9;
  if(key=='0') ID=0;
  
  if (key == 's') { // 存檔
    String now = "";
    for (int i = 0; i < 10; i++) {
      now += angleX[i] + " " + angleY[i] + " ";
    }
    lines.add(now);

    String[] arr = new String[lines.size()];
    lines.toArray(arr);
    saveStrings("angles.txt", arr);
  }

  if (key == 'r') { // 播放
    if (R == 0) {
      String[] file = loadStrings("angles.txt");
      if (file != null) {
        for (int i = 0; i < file.length; i++) {
          lines.add(file[i]);
        }
      }
    }
    if (R < lines.size()) {
      float[] now = float(split(lines.get(R), ' '));
      for (int i = 0; i < 10; i++) {
        angleX[i] = now[i * 2];
        angleY[i] = now[i * 2 + 1];
      }
      R = (R + 1) % lines.size();
    }
  }
}

void draw(){
  background(204);
  translate(200,300);
  sphere(10);
  
  scale(10,-10,10);
  
  // Apply transformations for the body
  pushMatrix();
    rotateY(angleX[7]); // Apply rotation based on ID=7
    rotateX(angleY[7]); // Apply rotation based on ID=7
    shape(body,0,0);
  
    pushMatrix();
      translate(0,22.5);
      rotateY(angleX[0]);
      rotateX(angleY[0]);
      translate(0,-22.5);
      shape(head,0,0);
    popMatrix();
    
    // ... (rest of your draw function for arms and hands)
    pushMatrix();
      translate(-2.9,20.8);
      rotateY(angleX[1]);
      rotateX(angleY[1]);
      translate(2.9,-20.8);
      //translate(mouseX/10.0,-mouseY/10.0);
      //println(mouseX/10.0,-mouseY/10.0);
      shape(upuparm1,0,0);
      pushMatrix();
        translate(-4.1,19.9);
        rotateZ(angleY[2]);
        rotateY(angleX[2]);
        translate(4.1,-19.9);
        shape(uparm1,0,0);
        pushMatrix();
          translate(-4.1,16.9);
          rotateX(angleY[3]);
          rotateY(angleX[3]);
          translate(4.1,-16.9);
          shape(hand1,0,0);
        popMatrix();
      popMatrix();
    popMatrix();
    
      
    pushMatrix();
      translate(2.9,20.8);
      rotateY(angleX[4]);
      rotateX(angleY[4]);
      translate(-2.9,-20.8);
      //translate(mouseX/10.0,-mouseY/10.0);
      //println(mouseX/10.0,-mouseY/10.0);
      shape(upuparm2,0,0);
      pushMatrix();
        translate(4.1,19.9);
        rotateZ(angleY[5]);
        rotateY(angleX[5]);
        translate(-4.1,-19.9);
        shape(uparm2,0,0);
        pushMatrix();
          translate(4.1,16.9);
          rotateY(angleX[6]);
          rotateX(angleY[6]);
          translate(-4.1,-16.9);
          shape(hand2,0,0);
        popMatrix();
      popMatrix();
    popMatrix();
  popMatrix();
}

    
  
