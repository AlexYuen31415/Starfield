PImage fire;
PImage eye;
PImage beam;
ArrayList<Particle> EyeOfRah = new ArrayList<Particle>();

void setup()
{
  size(400, 400);
  background(255);
  fire = loadImage("fireofrah.jpg");
  eye = loadImage("eyeofrah.jpeg");
  beam = loadImage("beamofrah.png");
}

void draw()
{
  background(255);
  image(eye, -40, -50, 440, 450);
  for (int i = 0; i < EyeOfRah.size(); i++) {
    Particle eor = EyeOfRah.get(i);
    eor.show();
    eor.move();
    if (dist(0, 0, (float)eor.myX, (float)eor.myY) > 500) {
      EyeOfRah.remove(i);
    }
  }
  if (mousePressed) {
    for (int i = 0; i < 100; i++) {
      EyeOfRah.add(new Particle());
    }
    EyeOfRah.add(new OddballParticle());
  }
}
class Particle
{
  double myAngle = Math.random()*TWO_PI;
  double myX = Math.cos(myAngle);
  double myY = Math.sin(myAngle);
  double size = Math.random()*100;
  double mySpeed;
  
  public Particle() {

  }
  
  void show() {
    pushMatrix();
    translate(200 + (float)myX, 200 + (float)myY);
    rotate((float)myAngle);
    image(fire, 0, 0, (float)size, (float)size);
    popMatrix();
  }
  
  void move() {
    double c = dist(0, 0, (float)myX, (float)myY);
    
    mySpeed = 500/(c+25);
    size += 0.1;
    
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
  }
}

class OddballParticle extends Particle
{
  
  double vectorwithdirectionandmagnitude = (((int)(Math.random()+0.5))*2-1);
  
  OddballParticle() {
    
  }
  
  void show() {
    pushMatrix();
    translate(200, 200);
    translate((float)myX, (float)myY);
    rotate((float)myAngle);
    translate(-5, 0);
    image(beam, 0, 0, 35, 300);
    popMatrix();
  }
  
  void move() {
    myAngle += vectorwithdirectionandmagnitude*(Math.random()*TWO_PI)/40;
  }
}
