public class Tournament {
  
  String displayname;
  String ganador;
  String segundo;
  String tercero;
  String cuarto;
  String name;
  Table table;
  int maxrounds;
  
  int size;
  Tournament(String ganador, String segundo, String tercero, String cuarto, String name, Table table, int maxrounds,String displayname, int size) {
    this.ganador = ganador;
    this.segundo = segundo;
    this.tercero = tercero;
    this.cuarto = cuarto;
    this.name = name;
    this.table = table;
    this.maxrounds = maxrounds;
    this.displayname = displayname;
    this.size = size;
  }
  
  
  public int getSize() {
  return this.size;
}
  String getDisplayName() {
  return this.displayname;
}
  
  int getMaxRounds() {
  return this.maxrounds;
}

  String getGanador() {
  return this.ganador;
  }
  
  String getSegundo() {
    return this.segundo;
  }
  
  String getTercero() {
  return this.tercero;
}

String getCuarto() {
  return this.cuarto;
}

  String getName() {
  return this.name;
}
Table getTable() {
return this.table;
}

}
