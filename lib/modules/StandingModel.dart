class StandingModel {
  int? standing;
  String? club;
  int? MP;
  int? W;
  int? D;
  int? L;
  int? GF;
  int? GA;
  int? GD;
  int? Pts;
  String? logo;
  
  StandingModel({
    this.standing,
    this.club,
    this.MP,
    this.W,
    this.D,
    this.L,
    this.GF,
    this.GA,
    this.GD,
    this.Pts,
    this.logo,
  });
  

  StandingModel.fromJson(Map<dynamic, dynamic> json) {
    standing = json['standing'];
    club = json['club'];
    MP = json['MP'];
    W = json['W'];
    D = json['D'];
    L = json['L'];
    GF = json['GF'];
    GA = json['GA'];
    GD = json['GD'];
    Pts = json['Pts'];
    logo = json['logo'];
  }

  Map<String, dynamic> toMap() {
    return {
      'club': club,
      'MP': MP,
      'W': W,
      'D': D,
      'L': L,
      'GF': GF,
      'GA': GA,
      'GD': GD,
      'Pts': Pts,
      'logo': logo,
    };
  }
}
