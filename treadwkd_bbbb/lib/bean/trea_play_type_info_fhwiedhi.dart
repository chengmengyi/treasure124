class TreaPlayTypeInfoFhwiedhi {
  TreaPlayTypeInfoFhwiedhi({
      this.playType, 
      this.currentPro, 
      this.totalPro, 
      this.unlock,});

  TreaPlayTypeInfoFhwiedhi.fromJson(dynamic json) {
    playType = json['playType'];
    currentPro = json['currentPro'];
    totalPro = json['totalPro'];
    unlock = json['unlock'];
  }
  String? playType;
  int? currentPro;
  int? totalPro;
  int? unlock;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['playType'] = playType;
    map['currentPro'] = currentPro;
    map['totalPro'] = totalPro;
    map['unlock'] = unlock;
    return map;
  }

}