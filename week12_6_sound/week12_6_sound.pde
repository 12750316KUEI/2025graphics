//week12_6_sound
//Sketch - Library - Managed Libraries 找 sound
//會看到 Sound | Provides an simple way to work with audio
//選，右下角Install下載安裝
//裝好後，會有File - Examples 點開 Libraries 核心函式庫 Sound
//Soundfile那堆範例 看SimplePlayback簡單撥放音樂的範例
import processing.sound.*;
SoundFile mySound;
void setup(){
  size(400,400);
  mySound = new SoundFile(this,"music.mp3");
  mySound.play();
}
void draw(){
  
}
