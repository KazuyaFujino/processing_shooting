class Myself{
  
  PVector loc;
  float size;
  int coolingTime;
  boolean isDead;
  
  Myself(){
    size = 50;
    loc = new PVector(width / 2, height - size / 2 - 10);
    coolingTime = 0;
    isDead = false;
  }
  
  void display(){
    if(isDead){
      fill(255, 255, 0);
      stroke(0, 255, 0); 
    } else {
      noFill();
      stroke(0, 255, 0);
    }
    // jiki
    rect(loc.x, loc.y, size, size);
    image(jiki,loc.x - size / 2, loc.y - size / 2 , size, size);
  }
  
  void update(){
    isDead = false;
    // mouse move
    float dmx = mouseX - loc.x;
    dmx = constrain(dmx, -5, 5);
    loc.x += dmx;
    coolingTime++;
    //mouse click
    if(mousePressed && coolingTime >= 10){
      myBullets.add(new Bullet());
      coolingTime = 0;
      shot.play(0);
    }
    
    /********************/
    // player hit
    /********************/
    for(Bullet b: eneBullets){
      if((loc.x - size / 2 <= b.loc.x && b.loc.x <= loc.x + size / 2)
         && (loc.y - size / 2 <= b.loc.y && b.loc.y <= loc.y + size / 2)){
        isDead = true;
        damage.play(0);
        b.isDead = true;
        break;
      }
    }

    for(Enemy e: enemies){
      if(abs(loc.x - e.loc.x) < size / 2 + e.size / 2 && abs(loc.y - e.loc.y) < size / 2 + e.size / 2){
        isDead = true;
        e.isDead = true;
        break;
      }
    }
  }
}
