import 'package:flutter/material.dart';
import 'package:toonflix/base_widget/base_image_widget.dart';
import 'package:toonflix/base_widget/base_stateless_screen.dart';
import 'package:toonflix/util/util.dart';

class ImageTestScreen extends BaseStatelessScreen {
  const ImageTestScreen({super.key});

  @override
  Widget? getAppbar(BuildContext context) => null;

  @override
  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BaseImageWidget(
            src: Util.getAssetImagePath('graphic_img.jpg'),
          ),
          const BaseImageWidget(
            src:
                'https://image-comic.pstatic.net/webtoon/790713/thumbnail/thumbnail_IMAG21_3919364435331003700.jpg',
            width: 200,
            height: 300,
            useFileCache: false,
          ),
          const BaseImageWidget(
            src:
                'https://image-comic.pstatic.net/webtoon/654774/thumbnail/thumbnail_IMAG21_4048794550434817075.jpg',
            width: 200,
            height: 300,
          ),
        ],
      ),
    );
  }

  @override
  TextStyle? getTextStyle(BuildContext context) => null;

  @override
  String getTitle(BuildContext context) => 'ImageTestScreen';

  @override
  String getTagName() {
    return 'ImageTestScreen';
  }
}
