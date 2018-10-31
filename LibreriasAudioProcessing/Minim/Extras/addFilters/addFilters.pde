import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer player;
LowPassSP lowpass;
HighPassSP highpass;
void setup()
{
  size( 640, 480 );
  minim = new Minim( this );
  player = minim.loadFile("05.mp3");
  player.play();
  lowpass = new LowPassSP( 240, 44100 );
  player.addEffect( lowpass );
  highpass = new HighPassSP( 600, 44100 );
  player.addEffect( highpass );
}
void draw() {
  background( 255 );
}

void stop() {
     player.close();
     minim.stop();
     super.stop();
}