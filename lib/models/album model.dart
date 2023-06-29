import 'package:cloud_firestore/cloud_firestore.dart';

class AlbumModel {
  String date;
  String des;
  String image;

  AlbumModel({
    this.date = '',
    this.des = '',
    this.image = '',
  });

  toJson() {
    return {
      "date": date,
      "des": des,
      "image": image,
    };
  }

  factory AlbumModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    // print(document.id);
    final data = document.data()!;

    return AlbumModel(
      // notesId: document.id ?? '',
      image: data["image"] ?? '',
      des: data["des"] ?? '',
      date: data["date"] ?? '',
    );
  }
}
