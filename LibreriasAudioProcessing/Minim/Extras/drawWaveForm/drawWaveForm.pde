import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup() {
  size(640, 120);
  minim = new Minim(this);
  player = minim.loadFile("05.mp3");
  player.play();

  strokeWeight(2);
}

void draw() {
  background(255);

  translate(0, height/2);

  //canal derecho
  stroke(255, 0, 0);
  for (int i = 0; i < player.right.size(); i++) {
    float y = player.right.get(i)*220;
    point (i, y);
  }

  //canal izquierdo
  stroke(0);
  for (int i = 0; i < player.left.size(); i++) {
    float y = player.left.get(i)*220;
    point (i,y);
  }
}



void stop() {
  player.close();
  minim.stop();
  super.stop();
}
