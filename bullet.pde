class Bullet{
  
  PVector loc;
  float vel;
  boolean isMine;
  boolean isDead;
  
  Bullet(int a){
    if (0 == a){
      loc = new PVector(myself.loc.x, myself.loc.y);
      vel = -10;
      isMine = true;
    }else if (1 == a){
      loc = new PVector(myself.loc.x + 60, myself.loc.y+20);
      vel = -10;
      isMine = true;
    }else if (2 == a){
      loc = new PVector(myself.loc.x - 60, myself.loc.y+20);
      vel = -10;
      isMine = true;
    }
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
