Myself myself;

ArrayList<Bullet> myBullets;
ArrayList<Bullet> leftBullets;
ArrayList<Bullet> eneBullets;
ArrayList<Enemy> enemies;

int GAMEMODE = 0;
int GAME_START = 0;
int GAME_PLAYING = 1;
int GAME_CLEAR = 2;

int score=0;
int player_hp = 3;

float angle=0; 

void setup(){
  size(640, 640, P3D);
  frameRate(50);
  setup_music();
  setup_image();
  myself = new Myself();
  enemies = new ArrayList<Enemy>();
  myBullets = new ArrayList<Bullet>();
  leftBullets = new ArrayList<Bullet>();
  eneBullets = new ArrayList<Bullet>(); 

  PFont font = createFont("MS Gothic",48,true);
  textFont(font);
  textSize(24); 
  rectMode(CENTER);
}

void draw(){
  if(GAMEMODE == GAME_START){
    image(start, 0, 0, 640, 640);
  }
  else if(GAMEMODE == GAME_PLAYING){
    PImage  back = getDispImg();
    background( back );
    lights();
    
    strokeWeight( 3 );
    myself.display();
    strokeWeight( 3 );
    for(Enemy enemy: enemies){
      enemy.display();
    }
    for(Bullet bullet: myBullets){
      bullet.display();
    }
    for(Bullet bullet: eneBullets){
      bullet.display();
    }
  
    myself.update();
    ArrayList<Enemy> nextEnemies = new ArrayList<Enemy>();
    for(Enemy enemy: enemies){
      enemy.update();
      if(!enemy.isDead){
        nextEnemies.add(enemy);
      }
    }
    enemies = nextEnemies;
    
    ArrayList<Bullet> nextMyBullets = new ArrayList<Bullet>();
    for(Bullet bullet: myBullets){
      bullet.update();
      if(!bullet.isDead){
        nextMyBullets.add(bullet);
      }
    }
    myBullets = nextMyBullets;
    
    ArrayList<Bullet> nextEneBullets = new ArrayList<Bullet>();
    for(Bullet bullet: eneBullets){
      bullet.update();
      if(!bullet.isDead){
        nextEneBullets.add(bullet);
      }
    }
    eneBullets = nextEneBullets;
    if(random(1) < 0.02){
      enemies.add(new Enemy());
    } 
    text("SCORE: "+score, 450, 40);
  }
  else if(GAMEMODE == GAME_CLEAR){
    background(0);
    PFont font = createFont("MS Gothic",48,true);
    textFont(font);
    textSize(80);
    text("GAME OVER", 150, 100);
    textSize(30);
    text("SCORE: "+score, 170, 400);
  }
}
