void keyPressed(){
  switch( key ){
    case ENTER:
    case RETURN:
      if (GAMEMODE == GAME_START){
        GAMEMODE = GAME_PLAYING;
        song.loop();
      }
      break;
  }
}
