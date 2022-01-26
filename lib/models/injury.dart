import 'package:icaros_app/models/history.dart';
import 'package:icaros_app/models/injury_photo.dart';
import 'package:icaros_app/models/injury_type.dart';

class Injury {
  int id = 0;
  InjuryType injuryType = InjuryType(id: 0, description: '');
  String date = '';
  String remarks = '';
  List<InjuryPhoto> injuryPhotos = [];
  int injuryPhotosCount = 0;
  String imageFullPath = '';
  List<History> histories = [];
  int historiesCount = 0;

  Injury(
      {required this.id,
      required this.injuryType,
      required this.date,
      required this.remarks,
      required this.injuryPhotos,
      required this.injuryPhotosCount,
      required this.imageFullPath,
      required this.histories,
      required this.historiesCount});

  Injury.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    injuryType = InjuryType.fromJson(json['injuryType']);
    date = json['date'];
    remarks = json['remarks'];
    if (json['injuryPhotos'] != null) {
      injuryPhotos = <InjuryPhoto>[];
      json['injuryPhotos'].forEach((v) {
        injuryPhotos!.add(new InjuryPhoto.fromJson(v));
      });
    }
    injuryPhotosCount = json['injuryPhotosCount'];
    imageFullPath = json['imageFullPath'];
    if (json['histories'] != null) {
      histories = <History>[];
      json['histories'].forEach((v) {
        histories.add(new History.fromJson(v));
      });
    }
    historiesCount = json['historiesCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['injuryType'] = this.injuryType!.toJson();
    data['date'] = this.date;
    data['remarks'] = this.remarks;
    data['injuryPhotos'] = this.injuryPhotos!.map((v) => v.toJson()).toList();
    data['injuryPhotosCount'] = this.injuryPhotosCount;
    data['imageFullPath'] = this.imageFullPath;
    data['histories'] = this.histories.map((v) => v.toJson()).toList();
    data['historiesCount'] = this.historiesCount;
    return data;
  }
}
