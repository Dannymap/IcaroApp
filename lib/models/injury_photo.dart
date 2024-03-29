class InjuryPhoto {
  int id = 0;
  String imageId = '';
  String imageFullPath = '';

  InjuryPhoto(
      {required this.id, required this.imageId, required this.imageFullPath});

  InjuryPhoto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageId = json['imageId'];
    imageFullPath = json['imageFullPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageId'] = this.imageId;
    data['imageFullPath'] = this.imageFullPath;
    return data;
  }
}
