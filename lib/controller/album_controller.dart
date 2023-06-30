import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_diary/models/album%20model.dart';

class AlbumController extends GetxController {
  static AlbumController to = Get.find();

  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getAlbum();
    // TODO: implement onInit
    super.onInit();
  }

  List<AlbumModel> albumList = [];

  void getAlbum() async {
    isLoading.value = true;
    final snapshot = await db.collection("album").get();
    albumList =
        snapshot.docs.map((doc) => AlbumModel.fromSnapshot(doc)).toList();
    isLoading.value = false;
    update();
  }
}
