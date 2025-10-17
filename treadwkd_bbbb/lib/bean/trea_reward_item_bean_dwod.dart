class TreaRewardItemBeanDwod{
  double reward;
  String content;
  bool isKey;
  bool isText;
  bool win;
  bool showKey;
  String bg;
  TreaRewardItemBeanDwod({
    required this.reward,
    required this.content,
    required this.win,
    this.isKey=false,
    this.isText=false,
    this.showKey=true,
    this.bg="",
});
}