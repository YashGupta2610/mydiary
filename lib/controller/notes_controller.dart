import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/notesModel.dart';

class NotesController extends GetxController{
  static NotesController to = Get.find();

  final formKey = GlobalKey<FormState>();

    Rx<NotesModel> currentNote = NotesModel().obs;

    TextEditingController noteTitile =TextEditingController();
    TextEditingController noteDes = TextEditingController();

    final storedList = GetStorage();

   List<NotesModel> notesList = <NotesModel>[
     NotesModel(
       notesDate: DateTime.now().toString(),
       notesDesc: "Lore ipsum hdklfalvnsaijdflnsdnv dhflkasdnv sdaflkanvlkjfla vasdlkvnsaljf vcnlksajdflkjasdl vvanlsdkjf advnasdlkf  seflkw fhlke lkajd valskd fkasdfljsdalkvjlksadjfklsa fkjsdlkfjslakdv sakfjskldf savkljsdflkjak vjksajdflk adkvjaslkdjf alkv lkfjlkfja",
       notesTitle: "Test",
       notesId: '1'
     )
   ];

   void addNote(){
     currentNote.value.notesId= notesList.length.toString();
     currentNote.value.notesDate = DateTime.timestamp().toString();
    print(currentNote.value.notesDesc);
    print(currentNote.value.notesTitle);
     notesList.add(currentNote.value);
     currentNote.value= NotesModel();
     // disposeController();
     update();
     Get.back();

   }
  bool get isListEmpty => notesList.isEmpty;
    void deleteNote(NotesModel note){
      notesList.remove(note);
      update();
    }
}