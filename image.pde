final int SCROLL_SPEED = 2; 
PImage jiki;
PImage enemy;
PImage back_ground;
PImage start;
PImage end;
int       sx, sy;           

void setup_image(){
  jiki = loadImage("./image/jiki.png");
  enemy = loadImage("./image/enemy.png");
  back_ground = loadImage("./image/back_ground.png");
  start = loadImage("./image/start.png");
  end = loadImage("./image/clear.png");
  sx=0;
  sy=0;
}

PImage  getDispImg(){
  int  cutWidth = height;  //image size
  int  overWidth = 0;     //overfloo
  
  PImage  map = createImage( width, height, ARGB );
  
  if(0 < sy){
    overWidth = sy;  
    cutWidth = height - overWidth;
  }
  
  PImage  cutLeftImg = back_ground.get( 0, 0, width, cutWidth );//ok
  map.set( 0, sy, cutLeftImg );

  if( overWidth > 0 ){
    PImage  cutRightImg = back_ground.get( 0, cutWidth, width, overWidth );
    map.set( 0, 0, cutRightImg );
  }
  
  sy = sy + SCROLL_SPEED;//ok
  if( sy >= height ){
    sy = 0;
  }
  
  return( map );
}
