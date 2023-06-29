import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/notesModel.dart';

class NotesController extends GetxController {
  static NotesController to = Get.find();

  @override
  void onInit() {
    getNoteList();
    // TODO: implement onInit
    super.onInit();
  }

  final formKey = GlobalKey<FormState>();

  Rx<NotesModel> currentNote = NotesModel().obs;

  final db = FirebaseFirestore.instance;

  TextEditingController noteTitile = TextEditingController();
  TextEditingController noteDes = TextEditingController();

  final storedList = GetStorage();

  late List<NotesModel> notesList = <NotesModel>[];

  Future<void> getNoteList() async {
    final snapshot = await db.collection("notes").get();
    notesList =
        snapshot.docs.map((doc) => NotesModel.fromSnapshot(doc)).toList();
    update();
  }

  // List<NotesModel> notesList = <NotesModel>[
  //   NotesModel(
  //       notesDate: DateTime.now().toString(),
  //       notesDesc:
  //           "Lore ipsum hdklfalvnsaijdflnsdnv dhflkasdnv sdaflkanvlkjfla vasdlkvnsaljf vcnlksajdflkjasdl vvanlsdkjf advnasdlkf  seflkw fhlke lkajd valskd fkasdfljsdalkvjlksadjfklsa fkjsdlkfjslakdv sakfjskldf savkljsdflkjak vjksajdflk adkvjaslkdjf alkv lkfjlkfja",
  //       notesTitle: "Test",
  //       notesId: '1')
  // ];

  void addNote() {
    currentNote.value.notesDate = DateTime.timestamp().toString();
    print(currentNote.value.notesId);
    if (currentNote.value.notesId != '') {
      db.collection("notes").doc(currentNote.value.notesId).update({
        "title": currentNote.value.notesTitle,
        "des": currentNote.value.notesDesc,
        "date": currentNote.value.notesDate
      }).whenComplete(() => print("updated completed"));
    } else {
      db.collection("notes").add({
        "title": currentNote.value.notesTitle,
        "des": currentNote.value.notesDesc,
        "date": currentNote.value.notesDate
      }).then((value) => print("item added"));
    }
    getNoteList();
    // notesList.add(currentNote.value);
    currentNote.value = NotesModel();
    // disposeController();
    update();
    Get.back();
  }

  bool get isListEmpty => notesList.isEmpty;

  void deleteNote(NotesModel note) {
    db
        .collection("notes")
        .doc(note.notesId)
        .delete()
        .whenComplete(() => Get.snackbar(
              "Message",
              "Note has been deleted!",
              isDismissible: true,
              snackPosition: SnackPosition.BOTTOM,
              duration: Duration(seconds: 1),
            ));
    getNoteList();
    update();
  }
}
