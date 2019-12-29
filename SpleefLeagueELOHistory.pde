import java.util.*; 
import java.lang.*; 
import java.util.Iterator;
import static java.util.stream.Collectors.*;
import static java.util.Map.Entry.*;


String type = "splegg";

HashMap<String, PImage> countries = new HashMap<String, PImage>();
PFont zigBlack;
ArrayList<Player> players = new ArrayList<Player>();
ArrayList<Tournament> tournaments = new ArrayList<Tournament>();
int i_tournament;
int i_round;
Player boxking;
List<Cup> cups = new ArrayList<Cup>();
HashMap<String, Integer> playerELO = new HashMap<String, Integer>();
HashMap<String, Integer> topWins = new HashMap<String, Integer>();
HashMap<String, Integer> topGames = new HashMap<String, Integer>();
HashMap<String, Integer> topLoses = new HashMap<String, Integer>();
HashMap<String, Integer> highest1streak = new HashMap<String, Integer>();
HashMap<String, Integer> highest15streak = new HashMap<String, Integer>();
HashMap<String, Integer> topAt15 = new HashMap<String, Integer>();
HashMap<String, Integer> topAt1 = new HashMap<String, Integer>();
HashMap<String, Double> topWL = new HashMap<String, Double>();
int it = 0;
int ir = 1; 
int ms = 0;

int state = 0;
String roundname = "";
String tournament = "";
String displayname = "";
String top1name;
String first;
String second;
String third;
String fourth;
PImage unknown; 
PImage bg;
void setup() {
  bg = loadImage("fondo.png");
  size(1920, 1080);
  stroke(255);
  frameRate(200);
  loadData();
}



void loadData() {

  String[] countries_txt = loadStrings("/data/countries.txt");
  PImage img;
  for (String s : countries_txt) {


    img = loadImage("/data/countries/"+s+".png");
    countries.put(s, img);
  }



  String[] tournaments_txt = loadStrings("/data/"+ type+ "_tournaments.txt");
  Table table;
  for (String s : tournaments_txt) {
    table = loadTable("/data/"+ type+ "_tournaments/"+s+".csv");

    String ganador = table.getString(0, 6);
    String segundo = table.getString(0, 7);
    String tercero = table.getString(0, 8);
    String cuarto = table.getString(0, 9);
    int maxrounds = table.getInt(0, 10);
    String displayname = table.getString(1, 6);
    Tournament t = new Tournament(ganador, segundo, tercero, cuarto, s, table, maxrounds, displayname);
    tournaments.add(t);
  }



  for (Tournament t : tournaments) {
    Table ta = t.getTable();
    for (int i = 0; i < ta.getRowCount(); i++) {
      String ganador = ta.getString(i, 0);
      String perdedor = ta.getString(i, 3);
      Data data = new Data();
      String country1 = data.checkCountry(ganador);
      String country2 = data.checkCountry(perdedor);

      if (!data.doesThisPlayerExist(ganador)) {
        Player p1 = new Player(ganador, country1);
        players.add(p1);
      }
      if (!data.doesThisPlayerExist(perdedor)) {
        Player p2 = new Player(perdedor, country2);
        players.add(p2);
      }
    }
  }


  unknown = loadImage("/data/countries/Unknown.png");
}

int calculateELO(Player winner, Player loser, boolean draw) {
   int k = 48;
  if (draw) {
    k = 16;
  } 
  double p1 = ((double) winner.getELO()/ (double) 400); //2
  double p1_ = Math.pow(10, p1); //100

  double p2 = ((double)loser.getELO()/(double)400); 
  double p2_ = Math.pow(10, p2);

  double d = p1_ + p2_;

  double ex1 = (double)p1_/(double)d;   
  double a1 = ((double)k*(1-(double)ex1));
  return (int) a1;
}


void draw() {

  doBackground();
  if (state==0) {
    for (Player p : players) {
      if (!p.isActive()) {
        p.setFutureY(1500);
      }
      if (p.getY()!=p.getFutureY()) {
        if (p.getY() >= p.getFutureY()) {
          int diference = p.getY()-p.getFutureY();
          if (diference >100) {
            p.setY(p.getY()-15);
          } else
            if (diference > 50) {
              p.setY(p.getY()-5);
            } else if (diference >10) {
              p.setY(p.getY()-3);
            } else {
              p.setY(p.getY()-1);
            }
        } else {
          int diference = p.getFutureY()-p.getY();
          if (diference >100) {
            p.setY(p.getY()+15);
          } else if (diference > 50) {
            p.setY(p.getY()+5);
          } else if (diference > 10) {
            p.setY(p.getY()+3);
          } else {
            p.setY(p.getY()+1);
          }
        }
      }        
      if (p.getELO()!=p.getFutureELO()) {
        if (p.getELO() >= p.getFutureELO()) {
          if (ms%8 == 0) {
            p.setELO(p.getELO()-1);
          }
        } else {
          if (ms%8 == 0) {
            p.setELO(p.getELO()+1);
          }
        }
      }   
      if (p.getFutureY() <1200 && p.getFutureY()!= 0) {
        zigBlack = createFont("Ziggurat-Black", 25);
        textFont(zigBlack);
        text(p.getName() + ":"+playerELO.get(p.getName()), 110, p.getY());
        int a = 0;
        try {
          a = playerELO.get(p.getName());
        } 
        catch(Exception e) {
          state = 1;
        }
        float size = ((8*a)/5)-1400;
        if (p.getY()>980) {
        } else {
          pushStyle();
          if (p.getCountry().equalsIgnoreCase("Argentina")) {
            fill(116, 172, 223);
          } else if (p.getCountry().equalsIgnoreCase("UnitedStates")) {
            fill(178, 34, 52);
          } else if (p.getCountry().equalsIgnoreCase("Alemania")) {
            fill(255, 206, 0  );
          } else if (p.getCountry().equalsIgnoreCase("Spain")) {
            fill(255, 196, 0);
          } else if (p.getCountry().equalsIgnoreCase("Suecia")) {
            fill(0, 106, 167);
          } else if (p.getCountry().equalsIgnoreCase("Canada")) {
            fill(255, 0, 0  );
          } else if (p.getCountry().equalsIgnoreCase("Serbia")) {
            fill(12, 64, 118  );
          } else if (p.getCountry().equalsIgnoreCase("Austria")) {
            fill(237, 41, 57);
          } else if (p.getCountry().equalsIgnoreCase("Belgica")) {
            fill(237, 41, 57);
          } else if (p.getCountry().equalsIgnoreCase("Filipinas")) {
            fill(0, 56, 168);
          } else if (p.getCountry().equalsIgnoreCase("Holanda")) {
            fill(174, 28, 40);
          } else if (p.getCountry().equalsIgnoreCase("Mexico")) {
            fill(0, 104, 71);
          } else if (p.getCountry().equalsIgnoreCase("Polonia")) {
            fill(255, 255, 255);
          } else if (p.getCountry().equalsIgnoreCase("Portugal")) {
            fill(0, 102, 0);
          } else if (p.getCountry().equalsIgnoreCase("Rusia")) {
            fill(255, 255, 255);
          } else if (p.getCountry().equalsIgnoreCase("UnitedKingdom")) {
            fill(0, 36, 125);
          } else if (p.getCountry().equalsIgnoreCase("Italia")) {
            fill(0, 146, 70);
          } else {
            fill(95, 95, 95);
          }             
          rect(385, p.getY()-22, size, 24);       
          popStyle();
          zigBlack = createFont("Ziggurat-Black", 13);
          textFont(zigBlack);
          double KD = (double) 0;
          if (p.getLoses()==0) {
            KD =  (double) p.getWins();
          } else {
            KD = (double) p.getWins()/p.getLoses();
          }
          Data data = new Data();
          text("W:"+p.getWins() + " L: "+ p.getLoses() + " W/L: " + data.round(KD, 2), 445+size, p.getY()-1);
          if (!p.getCountry().equalsIgnoreCase("none")) {    
            image(countries.get(p.getCountry()), 80, p.getY()-19, 28, 18);
          } else {           
            image(unknown, 80, p.getY()-19, 28, 18);
          }
          if (p.getSkin()!=null) {
            image(p.getSkin(), 400+size, p.getY()-26, 32, 32);
          }
          if (p.getName().equalsIgnoreCase(top1name)) {

            try {
              image(p.getBodySkin(), 1650, 0, 270, 370);
            } 
            catch(Exception e) {
            }
            zigBlack = createFont("Ziggurat-Black", 40);
            textFont(zigBlack);
            text(p.getName(), 1210, 50);
            zigBlack = createFont("Ziggurat-Black", 20);
            textFont(zigBlack);
            text("Current ELO:" + p.getELO(), 1210, 125);
            text("Highest ELO: " + p.getHighestELO(), 1210, 150);
            text("Lowest ELO: " + p.getLowestELO(), 1210, 175);

            text("Lowest Ranking: " + p.getLowestPosition() + "°", 1210, 225);

            text("Total Rounds at #1:" + p.getRoundsInTop1(), 1210, 275);
            text("Rounds at #1 in Row:" + p.getRoundsInRowTop1(), 1210, 300);
            text("Total Rounds in Top 15:" + p.getRoundsInTop15(), 1210, 325);
            text("Total Rounds in Top 15 in Row:" + p.getRoundsInRowTop15(), 1210, 350);

            zigBlack = createFont("Ziggurat-Black", 11);
            textFont(zigBlack);
            text("(" + p.getWhenHELO()+")", 1400, 122);  
            text("(" + p.getWhenLELO()+")", 1400, 147);
            text("(" + p.getWhenLP()+")", 1400, 222);
          }
        }
      }
    }
  }
  Data data = new Data();
  data.calculateTop();
  data.playMatches();
}

public void doBackground() {

  background(bg);
  if (state!=2) {
    zigBlack = createFont("Ziggurat-Black", 20);
    textFont(zigBlack);

    pushStyle();
    fill(255, 0, 0);
    // line(0,375,2000,375);
    //line(1600,375,1600,2000);
    //line(1600,700,2000,700);
    //line(0,175,1200,175);
    //line (1200,375,1200,0);

    popStyle();


    text("Random facts", 100, 300);
    if (boxking!=null) {
      text(boxking.getName(), 100, 350);
    }
    text("  1st", 10, 420); 
    text("  2nd", 10, 460); 
    text("  3rd", 10, 500); 
    text("  4th", 10, 540); 
    text("  5th", 10, 580); 
    text("  6th", 10, 620); 
    text("  7th", 10, 660); 
    text("  8th", 10, 700); 
    text("  9th", 10, 740); 
    text("10th", 10, 780); 
    text("11th", 10, 820); 
    text("12th", 10, 860); 
    text("13th", 10, 900); 
    text("14th", 10, 940); 
    text("15th", 10, 980); 

    zigBlack = createFont("Ziggurat-Black", 40);
    textFont(zigBlack);
    text(displayname, 10, 60);

    zigBlack = createFont("Ziggurat-Black", 17);
    textFont(zigBlack);
    text("Short Name: "+ tournament, 550, 30);
    text("Total Rounds: 10", 550, 50);
    text("Round: "+ roundname, 550, 70);
    zigBlack = createFont("Ziggurat-Black", 25);
    textFont(zigBlack);
    image(loadImage("first_place.png"), 825, 3, 22, 30);
    text("Winner: " + first, 850, 30);
    zigBlack = createFont("Ziggurat-Black", 22);
    textFont(zigBlack);
    text("2nd: " + second, 850, 70);
    text("3rd: " + third, 850, 110);
    text("4th: " + fourth, 850, 150);

    image(loadImage("second_place.png"), 825, 43, 24, 34);
    image(loadImage("third_place.png"), 825, 83, 24, 34);
    image(loadImage("third_place.png"), 825, 123, 24, 34);
  } else {
    Data data = new Data();
    data.finalStats();
    GFG gfg = new GFG();
  topWL =  gfg.sortByValueDouble(topWL);
    Iterator iterator = topWL.entrySet().iterator();
    int a = 0;
    int i = 1;
    while (iterator.hasNext()) {
      Map.Entry<String, Double> pair = (Map.Entry<String, Double>)iterator.next();
      String player = pair.getKey();
      Double value = pair.getValue();
      zigBlack = createFont("Ziggurat-Black", 20);
      textFont(zigBlack);
      if (i<11) {
        text("top WL: #"+i+" "+ player + " " + value, 0, 50+a);
      a = a + 30;
      }
      i++;
    }
    
  }
}
