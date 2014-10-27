import processing.video.*;
Movie myMovie;

void setup() {
  size(640, 480);
  background(0);
  myMovie = new Movie(this, "video_1_1.mp4");
  myMovie.loop();
}

void draw() {
  image(myMovie, 0, 0);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}

