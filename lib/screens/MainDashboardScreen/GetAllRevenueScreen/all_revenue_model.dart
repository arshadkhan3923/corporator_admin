class AllRevenueModel {
  AllRevenueModel({
    required this.totalEarning,
    required this.downloadActivity,
    required this.uploadActivity,
    required this.usercount,
    required this.graph,
  });
  late final String totalEarning;
  late final int downloadActivity;
  late final int uploadActivity;
  late final int usercount;
  late final Graph graph;

  AllRevenueModel.fromJson(Map<String, dynamic> json){
    totalEarning = json['totalEarning'];
    downloadActivity = json['downloadActivity'];
    uploadActivity = json['uploadActivity'];
    usercount = json['usercount'];
    graph = Graph.fromJson(json['graph']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['totalEarning'] = totalEarning;
    _data['downloadActivity'] = downloadActivity;
    _data['uploadActivity'] = uploadActivity;
    _data['usercount'] = usercount;
    _data['graph'] = graph.toJson();
    return _data;
  }
}

class Graph {
  Graph({
    required this.Jan,
    required this.Feb,
    required this.Mar,
    required this.Apr,
    required this.May,
    required this.Jun,
    required this.Jul,
    required this.Aug,
    required this.Sep,
    required this.Oct,
    required this.Nov,
    required this.Dec,
  });
  late final String Jan;
  late final String Feb;
  late final String Mar;
  late final String Apr;
  late final String May;
  late final String Jun;
  late final String Jul;
  late final String Aug;
  late final String Sep;
  late final String Oct;
  late final String Nov;
  late final String Dec;

  Graph.fromJson(Map<String, dynamic> json){
    Jan = json['Jan'];
    Feb = json['Feb'];
    Mar = json['Mar'];
    Apr = json['Apr'];
    May = json['May'];
    Jun = json['Jun'];
    Jul = json['Jul'];
    Aug = json['Aug'];
    Sep = json['Sep'];
    Oct = json['Oct'];
    Nov = json['Nov'];
    Dec = json['Dec'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Jan'] = Jan;
    _data['Feb'] = Feb;
    _data['Mar'] = Mar;
    _data['Apr'] = Apr;
    _data['May'] = May;
    _data['Jun'] = Jun;
    _data['Jul'] = Jul;
    _data['Aug'] = Aug;
    _data['Sep'] = Sep;
    _data['Oct'] = Oct;
    _data['Nov'] = Nov;
    _data['Dec'] = Dec;
    return _data;
  }
}