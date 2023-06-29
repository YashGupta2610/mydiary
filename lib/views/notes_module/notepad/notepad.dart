import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/notes_controller.dart';
import '../../../utils/appstyle.dart';
class NotepadPage extends StatelessWidget {
  const NotepadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.deepPurpleAccent.shade100.withOpacity(0.2),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ElevatedButton(onPressed: (){
                ctrl.formKey.currentState?.save();
                ctrl.addNote();
                }, child: Text("Save")),
              )
            ],
            leading: BackButton(
              color: Colors.deepPurple,
              onPressed: (){
                Get.back();
              },
            ),
          ),
          body: _showBody(context, ctrl),
        );
      }
    );
  }

  Widget _showBody(context, NotesController ctrl){
    return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: ctrl.noteTitile,
                  onChanged: (value){
                    value = ctrl.noteTitile.text;

                    ctrl.currentNote.value.notesTitle = value;
                  },
                  onSaved: (value){
                    value = ctrl.noteTitile.text;

                    ctrl.currentNote.value.notesTitle = value!;
                    print(ctrl.currentNote.value.notesTitle);
                  },
                  decoration: InputDecoration(
                    disabledBorder: InputBorder.none,
                    hintText: "Title",
                    hintStyle: AppStyles.heading
                  ),

                ),
                TextFormField(
                  controller: ctrl.noteDes,
                  onChanged: (value){
                    value = ctrl.noteDes.text;

                    ctrl.currentNote.value.notesDesc = value;
                  },
                  onSaved: (value){
                    value = ctrl.noteDes.text;
                    ctrl.currentNote.value.notesDesc = value!;
                    print(value);
                  },
                  maxLines: 800,
                  decoration: InputDecoration(
                    disabledBorder: InputBorder.none,
                    hintText: "Start writing...",
                  ),
                )

              ],
            ),
          )),
        );

  }
}
