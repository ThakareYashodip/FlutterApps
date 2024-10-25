class Player {

  String pName;
  int jerNo;
  int runs ;
  double avg;

  Player({
    required this.pName,
    required this.jerNo,
    required this.avg,
    required this.runs
  });

  Map<String,dynamic> playerMap() {
    return {
      'pName': pName,
      'jerNo': jerNo,
      'avg': avg,
      'runs': runs
    };
  }
}

