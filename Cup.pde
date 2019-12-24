public class Cup {
  int type;
  String winner;
  PImage image;
  
  
  Cup(String winner, int type) {
    this.winner = winner;
    this.type = type;
    if (type==1) {
      image = loadImage("first_place.png");
    } else if (type==2) {
       image = loadImage("second_place.png");
    } else {
       image = loadImage("third_place.png");
    }
  }
  
  int getType() {
  return this.type;
}

  String getWinner() {
  return this.winner;
}

PImage getImage() {
return this.image;
}
  
}
