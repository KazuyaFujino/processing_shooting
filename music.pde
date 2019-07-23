import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
AudioPlayer shot;
AudioPlayer damage;
AudioPlayer e_damage;


void setup_music() {
  minim = new Minim(this);
  song = minim.loadFile("./sound/bgm.mp3"); 
  shot = minim.loadFile("./sound/shot.mp3");
  damage = minim.loadFile("./sound/player_damage.mp3");
  e_damage = minim.loadFile("./sound/enemy_damage.mp3");
  song.loop();
}
