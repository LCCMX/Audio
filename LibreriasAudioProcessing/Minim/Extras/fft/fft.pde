import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
FFT fft;

void setup() {
  size(640, 480);
  minim = new Minim(this);
  player = minim.loadFile("05.mp3", 512);
  player.loop();

  fft = new FFT(player.bufferSize(), player.sampleRate());

  background(255);
}

void draw() {
  fill(255, 8);
  noStroke();
  rect(0, 0, width, height);

  fft.forward(player.mix);

  strokeWeight(4);
  strokeCap(SQUARE);
  stroke(0);

  for (int i = 0; i < fft.specSize(); i++) {
    line(i*4,height,i*4,height-fft.getBand(i)*20);
  }
}



void stop() {
  player.close();
  minim.stop();
  super.stop();
}
