public class Data {
  
 public Player getPlayer(String name) {
  for (Player p : players) {
    if (name.equalsIgnoreCase(p.getName())) {
    return p;
  }
  }
  return null;
}

public boolean doesThisPlayerExist(String name) {
for (Player p : players) {
  if (p.getName().equalsIgnoreCase(name)) {
  return true;
}
}
return false;
}
  public String checkCountry(String name) {
    Table table;
      table = loadTable("/data/player_countries.csv");
      for (int i = 0; i < table.getRowCount();i++) {
        if (table.getString(i,0).equalsIgnoreCase(name)) {
          return table.getString(i,1);
        }
      }
  return "none";
}
  
  public void calculateTop() {
    playerELO.clear();
  for (Player p : players) {
    if (p.isActive()) {
    playerELO.put(p.getName(),p.getELO());
    }
  }
  
 GFG gfg = new GFG();
playerELO =  gfg.sortByValue(playerELO);

int i = 1;
for (Map.Entry<String, Integer> entry : playerELO.entrySet()) {
   String key = entry.getKey();
    Player p = getPlayer(key);
  if (p.getLowestPosition() == 0 || p.getLowestPosition() < i) {
     p.setLowestPosition(i);
     p.setWhenLP(tournament + "," + roundname);
   }
   
   if (p.getLowestELO() == 0 || p.getLowestELO() >= p.getELO()) {
     p.setLowestELO(p.getELO());
     p.setWhenLELO(tournament + "," + roundname);
   }
   
   if (p.getHighestELO() == 0 || p.getHighestELO() <= p.getELO()) {
     p.setHighestELO(p.getELO());
     p.setWhenHELO(tournament + "," + roundname);
   }
  if (i<=15) {
     if (ms==100) {
       if (it+1 <= tournaments.size()) {
    p.setRoundsInRowTop15(p.getRoundsInRowTop15()+1);
    p.setRoundsInTop15(p.getRoundsInTop15()+1);
       }
     }
  if (i==1) {
      if (ms==100) {
        if (it+1 <= tournaments.size()) {
     p.setRoundsInRowTop1(p.getRoundsInRowTop1()+1);
    p.setRoundsInTop1(p.getRoundsInTop1()+1);
        }
      }
    p.setFutureY(420);
    top1name = p.getName();
  } else {
      p.setRoundsInRowTop1(0);
  if (i==2) {
    p.setFutureY(460);
  } else if (i==3) {
    p.setFutureY(500);
  } else if (i==4) {
    p.setFutureY(540);
  } else if (i==5) {
    p.setFutureY(580);
  } else if (i==6) {
    p.setFutureY(620);
  } else if (i==7) {
    p.setFutureY(660);
  } else if (i==8) {
    p.setFutureY(700);
  } else if (i==9) {
    p.setFutureY(740);
  }else if (i==10) {
    p.setFutureY(780);
  } else if (i==11) {
    p.setFutureY(820);
  } else if (i==12) {
    p.setFutureY(860);
  }else if (i==13) {
    p.setFutureY(900);
  } else if (i==14) {
    p.setFutureY(940);
  } else if (i==15) {
    p.setFutureY(980);
  }
  }
} else {  
    p.setRoundsInRowTop15(0);  
    p.setFutureY(1500);
  }
i++;
}
}


public void finalStats() {
      topWins.clear();
    topGames.clear();
    topLoses.clear();
    highest1streak.clear();
    highest15streak.clear();
    highest15streak.clear();
    topAt1.clear();
    topAt15.clear();
    for (Player p : players) {
     topWins.put(p.getName(),p.getWins());
   topLoses.put(p.getName(),p.getLoses());
   int games = p.getWins()+p.getLoses();
   double KD = (double) 0;
        if (p.getLoses()==0) {
          KD =  (double) p.getWins();
        } else {
          KD = (double) p.getWins()/p.getLoses();
        }
  topWL.put(p.getName(),KD);
   topGames.put(p.getName(),games);
   topAt1.put(p.getName(),p.getRoundsInTop1());
   topAt15.put(p.getName(),p.getRoundsInTop15());
    }
    
     GFG gfg = new GFG();
playerELO =  gfg.sortByValue(playerELO);
topWins = gfg.sortByValue(topWins);
topLoses = gfg.sortByValue(topLoses);
topGames = gfg.sortByValue(topGames);
topAt1 = gfg.sortByValue(topAt1);
topAt15 = gfg.sortByValue(topAt15);
topWL = gfg.sortByValueDouble(topWL);
}


public void cups(Player p) {
              List<Cup> list = new ArrayList<Cup>();
            for (Cup c : cups) {
              if (c.getType()==1) {
              if (c.getWinner().equalsIgnoreCase(p.getName())) {
                list.add(c);
              }
            }
            }
            
            for (Cup c : cups) {
              if (c.getType()==2) {
              if (c.getWinner().equalsIgnoreCase(p.getName())) {
                list.add(c);
              }
            }
            }
            for (Cup c : cups) {
              if (c.getType()==3) {
              if (c.getWinner().equalsIgnoreCase(p.getName())) {
                list.add(c);
              }
            }
            }

    int x = 1210;
    for (Cup c : list) {
      image(c.getImage(),x,65,22,30);
      x=x+25;
    }
  }
  
  public void playMatches() {
   if (ms==200) {
    ms =0;
  if (it+1 <= tournaments.size()) {
    Tournament t = tournaments.get(it);
     Table table = t.getTable();
     tournament = t.getName();
     displayname = t.getDisplayName();
     first = t.getGanador();
     second = t.getSegundo();
     third = t.getTercero();
     fourth = t.getCuarto();   
     if (ir <= t.getMaxRounds()) {
      for (int y =0; y < table.getRowCount() ;y++) {
        if (table.getInt(y,5)==ir) {
          roundname = table.getString(y,4);
  List<Player> ganadores = new ArrayList<Player>();
   List<Player> perdedores = new ArrayList<Player>();
              
          String ganador = table.getString(y,0);
        String perdedor = table.getString(y,3);  
        if (t.getSize()==1) {
      Player p1 = getPlayer(ganador);
      Player p2 = getPlayer(perdedor);   
      ganadores = Arrays.asList(p1);
      perdedores = Arrays.asList(p2);
        } else if (t.getSize()==2) {
           Player ganador1 = getPlayer(ganador.split("-")[0]);
          Player ganador2 = getPlayer(ganador.substring(ganador.indexOf("-")+1));        
           Player perdedor1 = getPlayer(perdedor.split("-")[0]);
           Player perdedor2 = getPlayer(perdedor.substring(perdedor.indexOf("-")+1));
           ganadores = Arrays.asList(ganador1,ganador2);
           perdedores = Arrays.asList(perdedor1,perdedor2);
        }
      
      int newELO = 0;
      List<Player> total = ganadores;
      total.addAll(perdedores);
      for (Player p : total) {
        if (p.getInRowLives() < 3) {
              p.resetInRowLives();
              p.beActive();
            }   
      }
       int p1 = 0;
        int p2 = 0;
        for (Player p : ganadores) {
          p1 = p1+p.getELO();
        }
        for (Player p : perdedores) {
          p2 = p2+p.getELO();
        }
        p1 = p1 / ganadores.size();
        p2 = p2 / perdedores.size();
        
          if (table.getInt(y,1) != table.getInt(y,2)) { 
            for (Player p : ganadores) {
              p.addWin();
            }
            for (Player p : perdedores) {
              p.addLose();
            }

         newELO = calculateELO(p1,p2,false);      
          } else {
            if (p1>p2) {
                 newELO = calculateELO(p1,p2,true);   
            } else if (p2>p1) {
               newELO = calculateELO(p2,p1,true);   
            } 
            for (Player p : total) {
            p.addDraw();
          }
          }
            for (Player p : ganadores) {
            p.setFutureELO(p.getELO()+newELO);
          }
          for (Player p : perdedores) {
            p.setFutureELO(p.getELO()-newELO);
          }
      
      List<String> perdedoresname = new ArrayList<String>();
      for (Player p : perdedores) {
      perdedoresname.add(p.getName());
    }
      
          if (boxking==null ||perdedoresname.contains(boxking.getName())) {
       boxking= ganadores.get(0);
     }      
     
     if (!boxking.isActive()) {
       boxking = ganadores.get(0);
     }
       
      }
      }    
        if (ir==1) {
       for (Player p : players) { 
        p.doInRowLives();
        if (p.getInRowLives()<=0) {
          p.beInactive();
        }       
       }
     } else if (ir == t.getMaxRounds()) {
       int f = 1;
       int s = 1;
       int te = 1;
       for (Player p : players) {
         if (p.getName().equalsIgnoreCase(first)) {
           if (f==1) {
             f++;
           p.addFirst();
          Cup c = new Cup(p.getName(),1);
            cups.add(c);
           }        
         } else if (p.getName().equalsIgnoreCase(second)) {
           if (s==1) {
             s++;
           p.addSecond();
              Cup c = new Cup(p.getName(),2);
              cups.add(c);
           }           
         } else if (p.getName().equalsIgnoreCase(third) || p.getName().equalsIgnoreCase(fourth)) {
           if (te<=2) {
             te++;
           p.addThird();
              Cup c = new Cup(p.getName(),3);
           cups.add(c);
           }
         }
       }    
       f = 1;
       s = 1;
       te = 1;
     }
     ir++;
     } else {
       it++;
       ir=1;
     }
} else {
   Iterator it = playerELO.entrySet().iterator();
   int i = 1;
    while (it.hasNext()) {
        Map.Entry<String,Integer> pair = (Map.Entry)it.next();
        String name = pair.getKey();
        int ELO = pair.getValue();
       String country = getPlayer(name).getCountry();
        String[] list = split(i + name + ELO + country, ' ');
        saveStrings("players.txt",list);
        
        it.remove();
    }
}
} else {
ms++;
}
}

public double round(double value, int places) {
    if (places < 0) throw new IllegalArgumentException();

    long factor = (long) Math.pow(10, places);
    value = value * factor;
    long tmp = Math.round(value);
    return (double) tmp / factor;
}


}
