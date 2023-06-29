import 'package:cloud_firestore/cloud_firestore.dart';

class NotesModel {
  String notesId;
  String notesTitle;
  String notesDesc;
  String notesDate;

  NotesModel({
    this.notesDate = '',
    this.notesTitle = '',
    this.notesDesc = '',
    this.notesId = '',
  });

  toJson() {
    return {
      "id": notesId,
      "title": notesTitle,
      "des": notesDesc,
      "date": notesDate
    };
  }

  factory NotesModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    // print(document.id);
    final data = document.data()!;

    return NotesModel(
      notesId: document.id ?? '',
      notesTitle: data["title"] ?? '',
      notesDesc: data["des"] ?? '',
      notesDate: data["date"] ?? '',
    );
  }

  Map<String, dynamic> toFirestore(Map<String, dynamic> data, String userId) {
    return {};
  }
}
