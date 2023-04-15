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
    required this.Apr2023,
  });
  late final String Apr2023;

  Graph.fromJson(Map<String, dynamic> json){
    Apr2023 = json['Apr 2023'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Apr 2023'] = Apr2023;
    return _data;
  }
}