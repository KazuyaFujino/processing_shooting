Myself myself;

ArrayList<Bullet> myBullets;
PImage img;

void setup(){
  size(640, 640);
  strokeWeight( 3 );
  frameRate(50);
  setup_music();
  setup_image();
  //img = loadImage("cat.jpg");
  myself = new Myself();
  enemies = new ArrayList<Enemy>();
  myBullets = new ArrayList<Bullet>();
  eneBullets = new ArrayList<Bullet>(); 
  rectMode(CENTER);
}

void draw(){
  PImage  back = getDispImg();
  background( back );
  // back_ground image
  //image(back_ground,0,0,640,640);
  myself.display();
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
}

class Bullet{
  
  PVector loc;
  float vel;
  boolean isMine;
  boolean isDead;
  
  Bullet(){
    loc = new PVector(myself.loc.x, myself.loc.y);
    vel = -10;
    isMine = true;
  }
  
  Bullet(Enemy enemy){
    loc = new PVector(enemy.loc.x, enemy.loc.y);
    vel = 5;
    isMine = false;
  }
  
  void display(){
    if(isMine){
      // line thick
      stroke(0, 255, 0);
    } else {
      stroke(255, 0, 0);    
    }
    // draw line
    line(loc.x, loc.y, loc.x, loc.y + vel);    
  }

  void update(){
    loc.y += vel;
    if((vel > 0 && loc.y > height) || (vel < 0 && loc.y < 0)){
      isDead = true;
    }
  }  
}
