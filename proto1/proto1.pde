import gab.opencv.*;
import processing.video.*;
import java.awt.*;
Movie myMovie;

Capture video;
OpenCV opencv;

int xLastFrame = 0;
int delta;
int firstFrame = 1;

void setup() {
  size(640, 480);
  background(0);
  myMovie = new Movie(this, "video_1_1.mp4");
  myMovie.loop();
  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  video.start();
}

void draw() {
  //scale(2);
  opencv.loadImage(video);

  image(myMovie, 0, 0);

  //image(video, 0, 0 );
  if(firstFrame == 1) myMovie.jump(40);
  else myMovie.jump(getPosition());
  noFill();
  //stroke(0, 255, 0);
  //strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  //println(faces.length);

  for (int i = 0; i < faces.length; i++) {
   // println(faces[i].x + "," + faces[i].y);
   if(firstFrame == 1) firstFrame = 0;
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
   
    delta = faces[i].x - xLastFrame;
    if (delta != 0) {println(delta);  }
     xLastFrame = faces[i].x;
  }
}

void captureEvent(Capture c) {
  c.read();
}

void movieEvent(Movie m) {
  m.read();
}

float getPosition() {
  int movTime = (int)myMovie.time();
  return movTime+delta/10;
}
