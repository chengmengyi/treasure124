class TreaCashTaskInfoBeanWiodow {
  TreaCashTaskInfoBeanWiodow({
      this.cashType, 
      this.cashMoney, 
      this.taskId, 
      this.currentProgress, 
      this.totalProgress,
      this.isRank,
  });

  TreaCashTaskInfoBeanWiodow.fromJson(dynamic json) {
    cashType = json['cashType'];
    cashMoney = json['cashMoney'];
    taskId = json['taskId'];
    currentProgress = json['currentProgress'];
    totalProgress = json['totalProgress'];
    isRank = json['isRank'];
  }
  String? cashType;
  int? cashMoney;
  int? taskId;
  int? currentProgress;
  int? totalProgress;
  int? isRank;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cashType'] = cashType;
    map['cashMoney'] = cashMoney;
    map['taskId'] = taskId;
    map['currentProgress'] = currentProgress;
    map['totalProgress'] = totalProgress;
    map['isRank'] = isRank;
    return map;
  }

}