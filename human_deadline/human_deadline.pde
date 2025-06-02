PShape body,head; // 這些 PShape 變數將不再使用，可以移除
PShape uparm1,upuparm1,hand1; // 這些 PShape 變數將不再使用，可以移除
PShape uparm2,upuparm2,hand2; // 這些 PShape 變數將不再使用，可以移除

// 這些變數現在要用來控制各個關節的旋轉角度，我們需要更多來控制腿部
float [] angleX = new float[12]; // 增加到 12 個，預留給頭、身體、手臂、腿、腳
float [] angleY = new float[12]; // 增加到 12 個

int ID=0;
int R = 0;
ArrayList<String> lines = new ArrayList<String>();

import processing.sound.*;
SoundFile mySound;

void setup(){
  size(1000,1000,P3D); // 依然使用 P3D 模式以支援 3D 旋轉

  // 不再載入任何 .obj 檔案

  mySound = new SoundFile(this,"Coincidance-cut.mp3");
  mySound.play();
}

void keyPressed(){
  if(key=='1') ID=1; // 左上臂
  if(key=='2') ID=2; // 左下臂
  if(key=='3') ID=3; // 左手
  if(key=='4') ID=4; // 右上臂
  if(key=='5') ID=5; // 右下臂
  if(key=='6') ID=6; // 右手
  if(key=='7') ID=7; // 身體
  if(key=='8') ID=8; // 左大腿
  if(key=='9') ID=9; // 左小腿/腳
  if(key=='0') ID=0; // 頭部
  if(key=='-') ID=10; // 右大腿 (通常在數字鍵盤 0 右邊)
  if(key=='=') ID=11; // 右小腿/腳 (通常在數字鍵盤 - 右邊)

  // ... (儲存和播放邏輯不變)
}

void draw(){
  background(204);
  lights(); // 加入光源讓 3D 效果更明顯，如果不需要可以移除

  // 設定線條樣式
  stroke(0); // 黑色線條
  strokeWeight(3); // 線條粗細為 3 像素

  // 將整個火柴人平移到畫布中央偏下方
  translate(width/2, height/2 + 100); // 調整 Y 軸讓火柴人站在中間偏下方

  // 為了讓火柴人看起來是直立的，Y 軸朝上，需要將整個坐標系旋轉
  rotateX(radians(90)); // 將 X 軸旋轉 90 度，讓 Y 軸向上

  // 身體 (ID=7)
  pushMatrix();
    rotateY(angleX[7]); // 身體 Y 軸旋轉
    rotateX(angleY[7]); // 身體 X 軸旋轉

    // 繪製身體
    // 假設身體中心為 (0,0,0)，身體長度為 40 單位
    line(0, -20, 0, 0, 20, 0); // 從 Y=-20 到 Y=20 繪製身體中線

    // 頭部 (ID=0) - 附著在身體頂部
    pushMatrix();
      translate(0, -20, 0); // 移到身體頂端作為頭部連接點
      rotateY(angleX[0]); // 頭部 Y 軸旋轉
      rotateX(angleY[0]); // 頭部 X 軸旋轉
      line(0,0,0, 0, -15, 0); // 繪製頭部，長度 15
      // 可以在頭部上方畫一個小球或圓圈作為頭部形狀
      pushMatrix();
        translate(0,-15,0);
        sphere(5); // 頭部球體
      popMatrix();
    popMatrix();

    // 左臂 (ID=1, ID=2, ID=3)
    pushMatrix();
      translate(-10, -10, 0); // 移到左肩關節點 (假設從身體中心左移10，上移10)
      rotateY(angleX[1]); // 左上臂 Y 軸旋轉
      rotateX(angleY[1]); // 左上臂 X 軸旋轉
      line(0,0,0, -15, 0, 0); // 繪製左上臂，長度 15，沿著 X 軸負方向延伸
      pushMatrix();
        translate(-15, 0, 0); // 移到左肘關節點
        rotateY(angleX[2]); // 左下臂 Y 軸旋轉
        rotateX(angleY[2]); // 左下臂 X 軸旋轉
        line(0,0,0, -15, 0, 0); // 繪製左下臂，長度 15
        pushMatrix();
          translate(-15, 0, 0); // 移到左手腕關節點
          rotateY(angleX[3]); // 左手 Y 軸旋轉
          rotateX(angleY[3]); // 左手 X 軸旋轉
          line(0,0,0, -5, 0, 0); // 繪製左手，長度 5
        popMatrix();
      popMatrix();
    popMatrix();

    // 右臂 (ID=4, ID=5, ID=6)
    pushMatrix();
      translate(10, -10, 0); // 移到右肩關節點
      rotateY(angleX[4]); // 右上臂 Y 軸旋轉
      rotateX(angleY[4]); // 右上臂 X 軸旋轉
      line(0,0,0, 15, 0, 0); // 繪製右上臂，長度 15，沿著 X 軸正方向延伸
      pushMatrix();
        translate(15, 0, 0); // 移到右肘關節點
        rotateY(angleX[5]); // 右下臂 Y 軸旋轉
        rotateX(angleY[5]); // 右下臂 X 軸旋轉
        line(0,0,0, 15, 0, 0); // 繪製右下臂，長度 15
        pushMatrix();
          translate(15, 0, 0); // 移到右手腕關節點
          rotateY(angleX[6]); // 右手 Y 軸旋轉
          rotateX(angleY[6]); // 右手 X 軸旋轉
          line(0,0,0, 5, 0, 0); // 繪製右手，長度 5
        popMatrix();
      popMatrix();
    popMatrix();

    // 左腿 (ID=8, ID=9)
    pushMatrix();
      translate(-5, 20, 0); // 移到左髖關節點 (從身體底部左移5)
      rotateY(angleX[8]); // 左大腿 Y 軸旋轉
      rotateX(angleY[8]); // 左大腿 X 軸旋轉
      line(0,0,0, 0, 15, 0); // 繪製左大腿，長度 15，沿著 Y 軸正方向延伸
      pushMatrix();
        translate(0, 15, 0); // 移到左膝關節點
        rotateY(angleX[9]); // 左小腿 Y 軸旋轉
        rotateX(angleY[9]); // 左小腿 X 軸旋轉
        line(0,0,0, 0, 15, 0); // 繪製左小腿，長度 15
      popMatrix();
    popMatrix();

    // 右腿 (ID=10, ID=11)
    pushMatrix();
      translate(5, 20, 0); // 移到右髖關節點
      rotateY(angleX[10]); // 右大腿 Y 軸旋轉
      rotateX(angleY[10]); // 右大腿 X 軸旋轉
      line(0,0,0, 0, 15, 0); // 繪製右大腿，長度 15
      pushMatrix();
        translate(0, 15, 0); // 移到右膝關節點
        rotateY(angleX[11]); // 右小腿 Y 軸旋轉
        rotateX(angleY[11]); // 右小腿 X 軸旋轉
        line(0,0,0, 0, 15, 0); // 繪製右小腿，長度 15
      popMatrix();
    popMatrix();

  popMatrix(); // 結束身體的變換
}
