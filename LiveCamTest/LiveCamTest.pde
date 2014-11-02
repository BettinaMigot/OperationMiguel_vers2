import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

int xLastFrame = 0;
int firstFrame = 1;

void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);
  opencv.loadCascade("fist.xml");  

  video.start();
}

void draw() {
  //scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  //println(faces.length);

  for (int i = 0; i < faces.length; i++) {
   // println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    int delta = faces[i].x - xLastFrame;
    if (delta != 0) {println(delta);  }
     xLastFrame = faces[i].x;

  }
     
}

void captureEvent(Capture c) {
  c.read();
}

