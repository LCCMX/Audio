import ddf.minim.*;

Minim minim;
AudioInput in;

float[]base;
float n = 10;

void setup() {
  size(640, 480);
  smooth();

  minim = new Minim(this);

  in = minim.getLineIn( Minim.STEREO, 512);

  background(0);
  base = new float [360];
}

void draw() {
  fill(0, 15);

  noStroke();
  rect(0, 0, width, height);


  stroke(255, 30);
  float r = 0;
  for (int i = 0; i < in.bufferSize(); i++) {
    r += abs(in.mix.get(i))*50;
  }
  for (float i = n; i < width-n; i += n) {
    line(i, 0, width/2, r);
  }
  
  
}

void stop() {
  in.close();
  minim.stop();
  super.stop();
}
