class WallPaperModel {
  int? total, totalHit;
  List<Hits>? hit = [];

  WallPaperModel({this.total, this.totalHit, this.hit});
  factory WallPaperModel.mapToModel(Map m1) {
    List w1 = m1['hits'];
    return WallPaperModel(
      total: m1['total'],
      totalHit: m1['totalHits'],
      hit: w1
          .map(
            (e) => Hits.mapToModel(e),
          )
          .toList(),
    );
  }
}

class Hits {
  int? id;
  String? previewU, type;

  Hits({this.id, this.previewU, this.type});

  factory Hits.mapToModel(Map m1) {
    return Hits(
      id: m1['id'],
      previewU: m1['previewURL'],
      type: m1['type'],
    );
  }
}
