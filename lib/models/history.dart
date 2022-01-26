import 'detail.dart';

class History {
  int id = 0;
  String date = '';
  String dateLocal = '';
  String remarks = '';
  List<Detail> details = [];
  int detailsCount = 0;
  double totalLabor = 0;
  double totalProducts = 0;
  double total = 0;

  History(
      {required this.id,
      required this.date,
      required this.dateLocal,
      required this.remarks,
      required this.details,
      required this.detailsCount,
      required this.totalLabor,
      required this.totalProducts,
      required this.total});

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateLocal = json['dateLocal'];
    remarks = json['remarks'];
    if (json['details'] != null) {
      details = <Detail>[];
      json['details'].forEach((v) {
        details.add(new Detail.fromJson(v));
      });
    }
    detailsCount = json['detailsCount'];
    totalLabor = json['totalLabor'];
    totalProducts = json['totalProducts'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['dateLocal'] = this.dateLocal;
    data['remarks'] = this.remarks;
    data['details'] = this.details.map((v) => v.toJson()).toList();
    data['detailsCount'] = this.detailsCount;
    data['totalLabor'] = this.totalLabor;
    data['totalProducts'] = this.totalProducts;
    data['total'] = this.total;
    return data;
  }
}
