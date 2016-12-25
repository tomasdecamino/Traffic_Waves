//@author: Tomas de Camino Beck
// www.funcostarica.org

PCars cars;
PCars lastCar;
int ncars = 60; //number of cars in lane

int x=width/2;

void setup() {
  size(1280, 720);
  //lead car
  cars = new PCars(0, height/2, 1.0, null);
  lastCar = cars;
  for (int i=0; i<ncars; i++) {
    PCars newCar = new PCars(0-i*10, height/2, 1.0, lastCar);
    lastCar=newCar;
    smooth(8);
  }
}

void draw() {
  background(255);
  strokeWeight(4);
  stroke(255, 0, 0);
  line(cars.pos.x, 0, cars.pos.x, height);
  stroke(0,150);
  PCars currentCar = lastCar;
  while (currentCar.front!= null) {
    line(currentCar.pos.x, 0, currentCar.pos.x, height);
    // the argument in currentCar.moveCar(30), indicates how
    // close the front car is detected for slowing down
    currentCar.moveCar(30);
    currentCar = currentCar.front;
  }
  //lead car drives normally 
  if (cars.pos.x<width/2-100) cars.pos.x=(cars.pos.x+5);
  //slows down for a about 250 pixels
  if (cars.pos.x>=width/2-100) cars.pos.x=(cars.pos.x+2);
  //speeds up again
  if (cars.pos.x>=width/2+150) cars.pos.x=(cars.pos.x+4); 
  saveFrame("frames/B30/####.jpg");
}