import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../controller/notes_controller.dart';
import '../../utils/appstyle.dart';
import 'notepad/notepad.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: GetBuilder<NotesController>(
        builder: (ctrl) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add,color: Colors.deepPurple,),
              onPressed: (){
                ctrl.noteDes.text ='';
                ctrl.noteTitile.text ='';
                Get.to(NotepadPage());
              },
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        title: Text("My Notes"),
                        titleTextStyle: AppStyles.heading,
                      ),
                     ctrl.isListEmpty ? SliverFillRemaining(child : Center(child: Text("Add Notes"),)) :
                     SliverGrid.builder(

                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemCount: ctrl.notesList.length,
                           itemBuilder: (context, index){
                        return gridTile(context, index);

                  })
                    ],

              ),
            ),
          );
        }
      ),
    );
  }
  Widget gridTile(context, index){
    return GetBuilder<NotesController>(
      builder: (ctrl) {
        return GestureDetector(
          onTap: (){
            ctrl.noteTitile.text= ctrl.notesList[index].notesTitle;
            ctrl.noteDes.text = ctrl.notesList[index].notesDesc;
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
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(ctrl.notesList[index].notesTitle,
                        maxLines: 1,
                        style: GoogleFonts.montserrat(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                          overflow: TextOverflow.ellipsis,
                      ),
                      IconButton(

                          onPressed: (){
                            ctrl.deleteNote(ctrl.notesList[index]);
                          }, icon: Icon(Icons.delete_outline_outlined, size: 20,))
                    ],
                  ),
                ),
                Text(ctrl.notesList[index].notesDesc,
                  style: GoogleFonts.montserrat(
                      color: Colors.deepPurple,
                      // fontWeight: FontWeight.bold,
                    fontSize: 12
                  ),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,)
              ],
            ),
          ),
        );
      }
    );
  }
}
