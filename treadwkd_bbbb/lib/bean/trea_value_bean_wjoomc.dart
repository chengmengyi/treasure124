import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';

class TreaValueBeanWjoomc {
  TreaValueBeanWjoomc({
      this.adIncentives, 
      this.dailyTreasure, 
      this.lucky7Reward, 
      this.collectorWinReward, 
      this.dogWinningReward, 
      this.cardKingReward, 
      this.fruitLineupReward, 
      this.numberWinnerReward, 
      this.spinWheelPrizes, 
      this.luckyCardPrizes, 
      this.levelUpPrizes, 
      this.withdrawTask,
      this.cashPop,
      this.queueRank,
  });

  TreaValueBeanWjoomc.fromJson(dynamic json) {
    if (json['ad_incentives'] != null) {
      adIncentives = [];
      json['ad_incentives'].forEach((v) {
        adIncentives?.add(AdIncentives.fromJson(v));
      });
    }
    if (json['daily_treasure'] != null) {
      dailyTreasure = [];
      json['daily_treasure'].forEach((v) {
        dailyTreasure?.add(DailyTreasure.fromJson(v));
      });
    }
    lucky7Reward = json['lucky_7_reward'] != null ? Lucky7Reward.fromJson(json['lucky_7_reward']) : null;
    queueRank = json['queue_rank'] != null ? QueueRank.fromJson(json['queue_rank']) : null;
    collectorWinReward = json['collector_win_reward'] != null ? CollectorWinReward.fromJson(json['collector_win_reward']) : null;
    dogWinningReward = json['dog_winning_reward'] != null ? DogWinningReward.fromJson(json['dog_winning_reward']) : null;
    cardKingReward = json['card_king_reward'] != null ? CardKingReward.fromJson(json['card_king_reward']) : null;
    fruitLineupReward = json['fruit_lineup_reward'] != null ? FruitLineupReward.fromJson(json['fruit_lineup_reward']) : null;
    numberWinnerReward = json['number_winner_reward'] != null ? NumberWinnerReward.fromJson(json['number_winner_reward']) : null;
    spinWheelPrizes = json['spin_wheel_prizes'] != null ? SpinWheelPrizes.fromJson(json['spin_wheel_prizes']) : null;
    if (json['lucky_card_prizes'] != null) {
      luckyCardPrizes = [];
      json['lucky_card_prizes'].forEach((v) {
        luckyCardPrizes?.add(Reward.fromJson(v));
      });
    }
    if (json['cash_pop'] != null) {
      cashPop = [];
      json['cash_pop'].forEach((v) {
        cashPop?.add(Reward.fromJson(v));
      });
    }
    levelUpPrizes = json['level_up_prizes'] != null ? json['level_up_prizes'].cast<int>() : [];
    if (json['withdraw_task'] != null) {
      withdrawTask = [];
      json['withdraw_task'].forEach((v) {
        withdrawTask?.add(WithdrawTask.fromJson(v));
      });
    }
  }
  List<AdIncentives>? adIncentives;
  List<DailyTreasure>? dailyTreasure;
  Lucky7Reward? lucky7Reward;
  CollectorWinReward? collectorWinReward;
  DogWinningReward? dogWinningReward;
  CardKingReward? cardKingReward;
  FruitLineupReward? fruitLineupReward;
  NumberWinnerReward? numberWinnerReward;
  SpinWheelPrizes? spinWheelPrizes;
  List<Reward>? luckyCardPrizes;
  List<Reward>? cashPop;
  List<int>? levelUpPrizes;
  List<WithdrawTask>? withdrawTask;
  QueueRank? queueRank;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (adIncentives != null) {
      map['ad_incentives'] = adIncentives?.map((v) => v.toJson()).toList();
    }
    if (dailyTreasure != null) {
      map['daily_treasure'] = dailyTreasure?.map((v) => v.toJson()).toList();
    }
    if (lucky7Reward != null) {
      map['lucky_7_reward'] = lucky7Reward?.toJson();
    }
    if (queueRank != null) {
      map['queue_rank'] = queueRank?.toJson();
    }
    if (collectorWinReward != null) {
      map['collector_win_reward'] = collectorWinReward?.toJson();
    }
    if (dogWinningReward != null) {
      map['dog_winning_reward'] = dogWinningReward?.toJson();
    }
    if (cardKingReward != null) {
      map['card_king_reward'] = cardKingReward?.toJson();
    }
    if (fruitLineupReward != null) {
      map['fruit_lineup_reward'] = fruitLineupReward?.toJson();
    }
    if (numberWinnerReward != null) {
      map['number_winner_reward'] = numberWinnerReward?.toJson();
    }
    if (spinWheelPrizes != null) {
      map['spin_wheel_prizes'] = spinWheelPrizes?.toJson();
    }
    if (luckyCardPrizes != null) {
      map['lucky_card_prizes'] = luckyCardPrizes?.map((v) => v.toJson()).toList();
    }
    if (cashPop != null) {
      map['cash_pop'] = cashPop?.map((v) => v.toJson()).toList();
    }
    map['level_up_prizes'] = levelUpPrizes;
    if (withdrawTask != null) {
      map['withdraw_task'] = withdrawTask?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class WithdrawTask {
  WithdrawTask({
    this.type,
    this.count,
    this.id,
  });

  WithdrawTask.fromJson(dynamic json) {
    type = json['type'];
    count = json['count'];
    id = json['id'];
  }
  String? type;
  int? count;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['count'] = count;
    map['id'] = id;
    return map;
  }

}

class SpinWheelPrizes {
  SpinWheelPrizes({
      this.keyPoint, 
      this.reward,});

  SpinWheelPrizes.fromJson(dynamic json) {
    keyPoint = json['key_point'];
    if (json['reward'] != null) {
      reward = [];
      json['reward'].forEach((v) {
        reward?.add(Reward.fromJson(v));
      });
    }
  }
  int? keyPoint;
  List<Reward>? reward;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key_point'] = keyPoint;
    if (reward != null) {
      map['reward'] = reward?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Reward {
  Reward({
      this.lowerBound, 
      this.reward, 
      this.upperBound,});

  Reward.fromJson(dynamic json) {
    lowerBound = json['lower_bound'];
    reward = json['reward'] != null ? json['reward'].cast<int>() : [];
    upperBound = json['upper_bound'];
  }
  int? lowerBound;
  List<int>? reward;
  int? upperBound;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lower_bound'] = lowerBound;
    map['reward'] = reward;
    map['upper_bound'] = upperBound;
    return map;
  }

}

class NumberWinnerReward {
  NumberWinnerReward({
      this.point1, 
      this.point2, 
      this.point3, 
      this.point4, 
      this.point5, 
      this.reward,});

  NumberWinnerReward.fromJson(dynamic json) {
    point1 = json['point_1'];
    point2 = json['point_2'];
    point3 = json['point_3'];
    point4 = json['point_4'];
    point5 = json['point_5'];
    if (json['reward'] != null) {
      reward = [];
      json['reward'].forEach((v) {
        reward?.add(Reward.fromJson(v));
      });
    }
  }
  int? point1;
  int? point2;
  int? point3;
  int? point4;
  int? point5;
  List<Reward>? reward;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['point_1'] = point1;
    map['point_2'] = point2;
    map['point_3'] = point3;
    map['point_4'] = point4;
    map['point_5'] = point5;
    if (reward != null) {
      map['reward'] = reward?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class FruitLineupReward {
  FruitLineupReward({
      this.point1, 
      this.point2, 
      this.point3, 
      this.point4, 
      this.reward,});

  FruitLineupReward.fromJson(dynamic json) {
    point1 = json['point_1'];
    point2 = json['point_2'];
    point3 = json['point_3'];
    point4 = json['point_4'];
    if (json['reward'] != null) {
      reward = [];
      json['reward'].forEach((v) {
        reward?.add(Reward.fromJson(v));
      });
    }
  }
  int? point1;
  int? point2;
  int? point3;
  int? point4;
  List<Reward>? reward;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['point_1'] = point1;
    map['point_2'] = point2;
    map['point_3'] = point3;
    map['point_4'] = point4;
    if (reward != null) {
      map['reward'] = reward?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CardKingReward {
  CardKingReward({
      this.point1, 
      this.point2, 
      this.point3, 
      this.point4, 
      this.reward,});

  CardKingReward.fromJson(dynamic json) {
    point1 = json['point_1'];
    point2 = json['point_2'];
    point3 = json['point_3'];
    point4 = json['point_4'];
    if (json['reward'] != null) {
      reward = [];
      json['reward'].forEach((v) {
        reward?.add(Reward.fromJson(v));
      });
    }
  }
  int? point1;
  int? point2;
  int? point3;
  int? point4;
  List<Reward>? reward;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['point_1'] = point1;
    map['point_2'] = point2;
    map['point_3'] = point3;
    map['point_4'] = point4;
    if (reward != null) {
      map['reward'] = reward?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class DogWinningReward {
  DogWinningReward({
      this.point3, 
      this.point4, 
      this.point5, 
      this.point6, 
      this.point7, 
      this.point8, 
      this.point9, 
      this.point10, 
      this.reward,});

  DogWinningReward.fromJson(dynamic json) {
    point3 = json['point_3'].toString().toDouble();
    point4 = json['point_4'].toString().toDouble();
    point5 = json['point_5'].toString().toDouble();
    point6 = json['point_6'].toString().toDouble();
    point7 = json['point_7'].toString().toDouble();
    point8 = json['point_8'].toString().toDouble();
    point9 = json['point_9'].toString().toDouble();
    point10 = json['point_10'];
    if (json['reward'] != null) {
      reward = [];
      json['reward'].forEach((v) {
        reward?.add(Reward.fromJson(v));
      });
    }
  }
  double? point3;
  double? point4;
  double? point5;
  double? point6;
  double? point7;
  double? point8;
  double? point9;
  double? point10;
  List<Reward>? reward;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['point_3'] = point3;
    map['point_4'] = point4;
    map['point_5'] = point5;
    map['point_6'] = point6;
    map['point_7'] = point7;
    map['point_8'] = point8;
    map['point_9'] = point9;
    map['point_10'] = point10;
    if (reward != null) {
      map['reward'] = reward?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CollectorWinReward {
  CollectorWinReward({
      this.point1, 
      this.point2, 
      this.point3, 
      this.point4, 
      this.reward,});

  CollectorWinReward.fromJson(dynamic json) {
    point1 = json['point_1'];
    point2 = json['point_2'];
    point3 = json['point_3'];
    point4 = json['point_4'];
    if (json['reward'] != null) {
      reward = [];
      json['reward'].forEach((v) {
        reward?.add(Reward.fromJson(v));
      });
    }
  }
  int? point1;
  int? point2;
  int? point3;
  int? point4;
  List<Reward>? reward;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['point_1'] = point1;
    map['point_2'] = point2;
    map['point_3'] = point3;
    map['point_4'] = point4;
    if (reward != null) {
      map['reward'] = reward?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Lucky7Reward {
  Lucky7Reward({
      this.point, 
      this.reward,});

  Lucky7Reward.fromJson(dynamic json) {
    point = json['point'];
    if (json['reward'] != null) {
      reward = [];
      json['reward'].forEach((v) {
        reward?.add(Reward.fromJson(v));
      });
    }
  }
  int? point;
  List<Reward>? reward;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['point'] = point;
    if (reward != null) {
      map['reward'] = reward?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class DailyTreasure {
  DailyTreasure({
      this.lowerBound, 
      this.reward, 
      this.upperBound,});

  DailyTreasure.fromJson(dynamic json) {
    lowerBound = json['lower_bound'];
    reward = json['reward'] != null ? json['reward'].cast<int>() : [];
    upperBound = json['upper_bound'];
  }
  int? lowerBound;
  List<int>? reward;
  int? upperBound;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lower_bound'] = lowerBound;
    map['reward'] = reward;
    map['upper_bound'] = upperBound;
    return map;
  }

}

class AdIncentives {
  AdIncentives({
      this.lowerBound, 
      this.points, 
      this.upperBound,});

  AdIncentives.fromJson(dynamic json) {
    lowerBound = json['lower_bound'];
    points = json['points'];
    upperBound = json['upper_bound'];
  }
  int? lowerBound;
  int? points;
  int? upperBound;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lower_bound'] = lowerBound;
    map['points'] = points;
    map['upper_bound'] = upperBound;
    return map;
  }

}

class QueueRank {
  QueueRank({
    this.allRank,
    this.currentRank,});

  QueueRank.fromJson(dynamic json) {
    allRank = json['all_rank'] != null ? AllRank.fromJson(json['all_rank']) : null;
    currentRank = json['current_rank'] != null ? CurrentRank.fromJson(json['current_rank']) : null;
  }
  AllRank? allRank;
  CurrentRank? currentRank;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (allRank != null) {
      map['all_rank'] = allRank?.toJson();
    }
    if (currentRank != null) {
      map['current_rank'] = currentRank?.toJson();
    }
    return map;
  }

}

class CurrentRank {
  CurrentRank({
    this.intCurrent,
    this.intCurrentDelete,});

  CurrentRank.fromJson(dynamic json) {
    intCurrent = json['int_current'];
    intCurrentDelete = json['int_current_delete'] != null ? json['int_current_delete'].cast<int>() : [];
  }
  int? intCurrent;
  List<int>? intCurrentDelete;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['int_current'] = intCurrent;
    map['int_current_delete'] = intCurrentDelete;
    return map;
  }

}

class AllRank {
  AllRank({
    this.intAll,
    this.intAllDelete,});

  AllRank.fromJson(dynamic json) {
    intAll = json['int_all'];
    intAllDelete = json['int_all_delete'] != null ? json['int_all_delete'].cast<int>() : [];
  }
  int? intAll;
  List<int>? intAllDelete;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['int_all'] = intAll;
    map['int_all_delete'] = intAllDelete;
    return map;
  }

}