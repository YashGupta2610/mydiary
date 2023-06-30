import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_diary/controller/SplashController.dart';
import 'package:my_diary/controller/album_controller.dart';
import 'package:my_diary/utils/appstyle.dart';
import 'package:my_diary/views/album_module/album.dart';
import 'package:my_diary/views/notes_module/notes.dart';
import 'package:my_diary/views/splashScreen.dart';

import 'controller/notes_controller.dart';
import 'controller/tabviewController.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put(SplashScreenViewModel());
  Get.put(TabControl());
  Get.put(NotesController());
  Get.put(AlbumController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My boo Diary',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.deepPurple),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}

class TabV extends StatelessWidget {
  const TabV({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabControl>(builder: (ctrl) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 1,
          shadowColor: Colors.purple[900],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          title: Text(
            "My Boo's Diary",
            style: AppStyles.subHeading2,
          ),
          bottom: TabBar(
            controller: ctrl.controller,
            tabs: [
              Tab(
                icon: Icon(Icons.create_outlined),
              ),
              Tab(
                icon: Icon(Icons.photo_camera_back),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: ctrl.controller,
          children: [
            NotesPage(),
            AlbumPage(),
          ],
        ),
      );
    });
  }
}
