class JwtTokenInfo {
  bool? istokenstr;
  String? tokenstr;
  String? createtime;
  String? expirytime;
  String? tokenmsg;

  JwtTokenInfo({
    this.istokenstr,
    this.tokenstr,
    this.createtime,
    this.expirytime,
    this.tokenmsg,
  });
  JwtTokenInfo.fromJson(Map<String, dynamic> json) {
    istokenstr = json['istokenstr'];
    tokenstr = json['tokenstr'];
    createtime = json['createtime'];
    expirytime = json['expirytime'];
    tokenmsg = json['tokenmsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['istokenstr'] = istokenstr;
    data['tokenstr'] = tokenstr;
    data['createtime'] = createtime;
    data['expirytime'] =expirytime;
    data['tokenmsg'] = tokenmsg;

    return data;
  }
}
