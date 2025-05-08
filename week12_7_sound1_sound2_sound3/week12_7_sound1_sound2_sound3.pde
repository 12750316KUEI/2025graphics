//week12_7_sound1_sound2_sound3
//Sketch - Library - Managed Libraries 找 sound
//會看到 Sound | Provides an simple way to work with audio
//選，右下角Install下載安裝
//裝好後，會有File - Examples 點開 Libraries 核心函式庫 Sound
//Soundfile那堆範例 看SimplePlayback簡單撥放音樂的範例
import processing.sound.*;
SoundFile sndInGame, sndIntro, sndMonkey, sndSword;
void setup(){
  size(400,400);
  sndInGame = new SoundFile(this,"In Game Music.mp3");
  sndIntro = new SoundFile(this,"Intro Song_Final.mp3");
  sndMonkey = new SoundFile(this,"Monkey 1.mp3");
  sndSword = new SoundFile(this,"sword slash.mp3");
  sndInGame.play();
}
boolean playingIntro = true;
void keyPressed(){
  if(playingIntro){
    sndIntro.stop();
    sndInGame.play();
    playingIntro = false;
  }
  else{
    sndInGame.stop();
    sndIntro.play();
    playingIntro = true;
  }
}
void mousePressed(){
  if(mouseButton==LEFT) sndSword.play();
  if(mouseButton==RIGHT) sndMonkey.play();
}


void draw(){
  
}
