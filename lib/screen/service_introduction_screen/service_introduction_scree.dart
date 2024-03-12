import 'package:flutter/material.dart';
import 'package:toonflix/base_widget/base_stateless_screen.dart';
import 'package:toonflix/screen/service_introduction_screen/service_introduction_subview.dart';
import 'package:toonflix/util/util.dart';

/// 쉽배송 온보딩 화면
class ServiceIntroductionScreen extends BaseStatelessScreen {
  const ServiceIntroductionScreen({super.key});

  List<IntroductionItem> getItemList(BuildContext context) {
    List<IntroductionItem> list = [];
    list.add(
      IntroductionItem(
        Util.getStringBundle(context).onboarding_title1,
        Util.getStringBundle(context).onboarding_description1,
        Util.getAssetImagePath('OB_1.png'),
      ),
    );
    list.add(
      IntroductionItem(
        Util.getStringBundle(context).onboarding_title2,
        Util.getStringBundle(context).onboarding_description2,
        Util.getAssetImagePath('OB_2.png'),
      ),
    );
    list.add(
      IntroductionItem(
        Util.getStringBundle(context).onboarding_title3,
        Util.getStringBundle(context).onboarding_description3,
        Util.getAssetImagePath('OB_3.png'),
      ),
    );
    return list;
  }

  @override
  Widget getBody(BuildContext context) {
    final list = getItemList(context);
    return ServiceIntroductionSubView(
      itemList: list,
    );
  }

  @override
  String getTagName() => 'ServiceIntroductionScreen';

  @override
  String? getTitle(BuildContext context) => null;
}

class IntroductionItem {
  String title;
  String description;
  String imageUrl;
  IntroductionItem(
    this.title,
    this.description,
    this.imageUrl,
  );
}
