import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_diary/controller/album_controller.dart';
import 'package:my_diary/utils/appstyle.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: GetBuilder<AlbumController>(builder: (ctrl) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                "Happy Birthday🎉",
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: AppStyles.heading,
              ),
            ),
            SliverList.builder(
                itemCount: ctrl.albumList.length,
                itemBuilder: (context, index) {
                  return listBody(context, index);
                })
          ],
        ),
      );
    }));
  }

  Widget listBody(context, int index) {
    return GetBuilder<AlbumController>(builder: (ctrl) {
      return Card(
        shadowColor: Colors.purpleAccent,
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 5),
                child: Text(
                  ctrl.albumList[index].date,
                  style: AppStyles.subHeading,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: CachedNetworkImage(
                  imageUrl: ctrl.albumList[index].image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  // placeholder: (context, url) => CircularProgressIndicator(),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8),
                child: Text(
                  ctrl.albumList[index].des,
                  style: AppStyles.paraBlack,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
