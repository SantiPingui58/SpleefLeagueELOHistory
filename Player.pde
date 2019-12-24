public class Player {

    int wins;
    int loses;
    int torneosganados;
    int inrowlives;
    Tournament torneodebut;
    boolean isActive;
    int current_ELO;
    
    PImage skin;
    PImage body;
    String name;
    String country;
    int current_y;
    int future_y;  
    int future_ELO;
    int roundsintop1;
    int roundsintop15;
    int roundsinrowtop1;
    int roundsinrowtop15;
    int lowestposition;
    String whenlp;
    String whenhelo;
    String whenlelo;
    int highestelo;
    int lowestelo;
    int first;
    int second;
    int third;
    Data data = new Data();
    
    Player(String name, String country) {
      name.replaceAll("\\s+","");
    this.name = name;
    this.country = country;
    if (country!=null) {
      this.country = data.checkCountry(name);
    }
    this.inrowlives =  3;
    this.current_y = 1500;
    this.future_y = 1500;
    this.current_ELO = 1000;
    this.future_ELO = 1000;
    
    
   try {
        skin = loadImage("/data/skins/"+getName()+".png");
   } catch(Exception e) {  
   }
  
  
   try {
     body = loadImage("/skins/"+getName()+"_body.png");
    } catch (Exception e) {}

    
  }
    PImage getBodySkin() {
    return body;
  }
  
  PImage getSkin() {
    if (skin!=null) {
  return skin;
    } else {
       return loadImage("/data/skins/Steve.png");
     }
}
    int getFirst() {
      return this.first;
    }
    
    void addFirst() {
      this.first= this.first+1;
    }
         
    int getSecond() {
      return this.second;
    }
    
    void addSecond() {
      this.second= this.second+1;
    }
         
    int getThird() {
      return this.third;
    }
    
    void addThird() {
      this.third= this.third+1;
    }
    
    
  String getWhenHELO() {
  return this.whenhelo;
  }

  void setWhenHELO(String s) {
  this.whenhelo = s;
  }
    
    int getHighestELO() {
      return this.highestelo;
    }
    
    void setHighestELO(int i) {
    this.highestelo = i;
  } 
  String getWhenLELO() {
  return this.whenlelo;
  }

  void setWhenLELO(String s) {
  this.whenlelo = s;
  }
    
    int getLowestELO() {
      return this.lowestelo;
    }
    
    void setLowestELO(int i) {
    this.lowestelo = i;
  } 

  String getWhenLP() {
  return this.whenlp;
  }

  void setWhenLP(String s) {
  this.whenlp = s;
  }
    
    int getLowestPosition() {
      return this.lowestposition;
    }
    
    void setLowestPosition(int i) {
    this.lowestposition = i;
  } 
    int getRoundsInTop1() {
    return this.roundsintop1;
  }
    void setRoundsInTop1(int i) {
      this.roundsintop1 = i;
    }
    
    int getRoundsInTop15() {
    return this.roundsintop15;
  }

  void setRoundsInTop15(int i) {
    this.roundsintop15 = i;
  }

    int getRoundsInRowTop1() {
    return this.roundsinrowtop1;
  }
    void setRoundsInRowTop1(int i) {
      this.roundsinrowtop1 = i;
    }
    
    int getRoundsInRowTop15() {
    return this.roundsinrowtop15;
  }

  void setRoundsInRowTop15(int i) {
    this.roundsinrowtop15 = i;
  }
  
    String getCountry() {
    return this.country;
  }
    
  
    boolean isActive() {
    return this.isActive;
  }

  void beInactive() {
  this.isActive = false;
  }

  void beActive() {
  this.isActive = true;
  }
    
    int getY() {
    return this.current_y;
  }

  void setY(int i) {
    this.current_y = i;
  }

  int getFutureY() {
  return this.future_y;
  }

  void setFutureY(int i) {
  this.future_y = i;
  }
    
    int getInRowLives() {
      return this.inrowlives;
    }
    
    void doInRowLives() {
      if (this.inrowlives > 0) {
    this.inrowlives = this.inrowlives-1;
      }
  }
    
    
    void resetInRowLives() {
    this.inrowlives = 3;
  }

    int getELO() {
    return this.current_ELO;
  }
    void setELO(int i) {
    this.current_ELO = i;
  }

   int getFutureELO() {
    return this.future_ELO;
  }
    void setFutureELO(int i) {
    this.future_ELO = i;
  }

  int getWins() {
  return this.wins;
  }

  void addWin() {
  this.wins = this.wins+1;
  }

   int getLoses() {
   return this.loses;
   }
   
   void addLose() {
   this.loses = this.loses+1;
   }

    String getName() {
    return this.name;
  }

  Tournament getTorneoDebut() {
  return this.torneodebut;
  }


  }
