import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/notes_controller.dart';
import '../../utils/appstyle.dart';
import 'notepad/notepad.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<NotesController>(builder: (ctrl) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.deepPurple,
            ),
            onPressed: () {
              ctrl.noteDes.text = '';
              ctrl.noteTitile.text = '';

              Get.to(NotepadPage());
            },
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text("Notes🤌"),
                  titleTextStyle: AppStyles.heading,
                ),
                ctrl.isListEmpty
                    ? _noListItem()
                    : SliverGrid.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: ctrl.notesList.length,
                        itemBuilder: (context, index) {
                          return gridTile(context, index);
                        })
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _noListItem() {
    return SliverFillRemaining(
        child: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/1.svg",
              height: 300,
              placeholderBuilder: (context) => CircularProgressIndicator(),
            ),
            Text(
              "Write your 💜 out boo boo ! ",
              style: AppStyles.para,
            ),
          ],
        ),
      ),
    ));
  }

  Widget gridTile(context, index) {
    return GetBuilder<NotesController>(builder: (ctrl) {
      return GestureDetector(
        onTap: () {
          ctrl.noteTitile.text = ctrl.notesList[index].notesTitle;
          ctrl.noteDes.text = ctrl.notesList[index].notesDesc;
          ctrl.currentNote.value.notesId = ctrl.notesList[index].notesId;
          Get.to(NotepadPage());
        },
        child: Container(
          margin: EdgeInsets.all(2),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.shade100.withOpacity(0.3),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        ctrl.deleteNote(ctrl.notesList[index]);
                      },
                      icon: Icon(
                        Icons.delete,
                        size: 20,
                        // color: Colors.,
                      ),
                    ),
                    Text(
                      ctrl.notesList[index].notesTitle,
                      maxLines: 1,
                      style: AppStyles.subHeading,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Text(
                ctrl.notesList[index].notesDesc,
                style: AppStyles.para,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      );
    });
  }
}
