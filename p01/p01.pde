
void setup() {
  background(0);
  size(800, 800);
}

void draw() {
  Ball b = new Ball();
  Paddle p = new Paddle();
  Brick B = new Brick();
 // B.display();
  p.display();
  b.display();
  b.move();
}

class Ball {

  int Bx;
  int By;
  int Bxspeed;
  int Byspeed;
  int Bsize;

  Ball() {
    Bx = width/2;
    By = height - 50;
    Bxspeed = 1;
    Byspeed = 1;
    Bsize = 50;
  }

  void display() {
    circle(Bx, By, Bsize);
  }

  void move() {
    if (Bx == width-Bsize/2 || Bx == Bsize/2) {
      Bxspeed /= -1;
    }
    if (By == Bsize/2) {
      Byspeed /= -1;
    }
    Bx += Bxspeed;
    By += Byspeed;
  }
}
class Paddle {

  int Px;
  int Py;
  int Pxsize;
  int Pysize;

  Paddle() {
    Px = mouseX - 50;
    Py = height - 40;
    Pxsize = 100;
    Pysize = 30;
    if (Px < 0) {
      Px = 0;
    } else if (Px > width - Pxsize) {
      Px = (width - Pxsize);
    }
  }

  void display() {
    background(0);
    rect(Px, Py, Pxsize, Pysize);
  }
}

class Brick {

  int[][] b;
  int bxsize;
  int bysize;

  Brick() {
    int bxsize = 80;
    int bysize = 20;
    b = new int[10][4];
    for (int x = 0; x < width / bxsize; x++) {
      for (int y = 0; y < 4; y++) {
        b[x][y] = 1;
      }
    }
  }

  void display() {
    for (int x = 0; x < (width / bxsize); ) {
      for (int y = 0; y < (height / 8 / bysize); ) {
        if (x < 20) {
          rect(x * bxsize, y * bysize, bxsize, bysize);
          x++;
        } else {
          x = 0;
          y++;
        }
      }
    }
  }
}
