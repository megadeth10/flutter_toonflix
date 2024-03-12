import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toonflix/service/data/webtoon_model.dart';
import 'package:toonflix/util/util.dart';
import 'package:toonflix/widget/image_card.dart';

class WebtoonCard extends StatelessWidget {
  final WebToonModel model;
  final List<WebToonModel> list;
  WebtoonCard({
    super.key,
    required this.model,
    required this.list,
  }) {
    print('WebtoonCard construture model: ${model.thumb}');
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Util.getScreenSize(context);
    // ignore: unused_local_variable
    double screenWidth = screenSize.width - 60;
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (BuildContext context) {
        //         return DetailWebtoonScreen(
        //           model: model,
        //         );
        //       },
        //       fullscreenDialog: false,
        //       settings: const RouteSettings(name: "DetailWebtoonScreen")),
        // );
        context.go('/toons/toonsDetail', extra: model);
      },
      child: Column(
        children: [
          Hero(
            tag: model.id,
            child: ImageCard(
              width: 100,
              url: model.thumb,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(model.title),
        ],
      ),
    );
  }
}
