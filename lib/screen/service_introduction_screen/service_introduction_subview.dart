import 'package:flutter/material.dart';
import 'package:toonflix/base_widget/base_image_widget.dart';
import 'package:toonflix/base_widget/base_sub_widget.dart';
import 'package:toonflix/custom_font/custom_font.dart';
import 'package:toonflix/interface/view_model_interface.dart';
import 'package:toonflix/router/router_test_config.dart';
import 'package:toonflix/screen/service_introduction_screen/service_introduction_scree.dart';
import 'package:toonflix/screen/view/service_introduction_button_view.dart';
import 'package:toonflix/util/color.dart';
import 'package:toonflix/util/util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// 온보딩 페이져 위젯
class ServiceIntroductionSubView extends BaseSubStatefulWidget {
  final List<IntroductionItem> itemList;
  const ServiceIntroductionSubView({
    super.key,
    super.viewModelKey,
    required this.itemList,
  });

  @override
  State<StatefulWidget> createState() => _ServiceIntroductionSubViewState();
}

class _ServiceIntroductionSubViewState
    extends BaseSubState<BaseViewModel, ServiceIntroductionSubView> {
  IntroductionIndex _pagerIndex = IntroductionIndex.first;
  final PageController _controller = PageController();
  late GlobalKey? parentViewModelKey;

  @override
  void initState() {
    super.initState();
    parentViewModelKey = widget.viewModelKey;
  }

  void changePageIndex(IntroductionIndex newIndex) {
    printLog('changePageIndex() $newIndex');
    setState(() {
      _pagerIndex = newIndex;
    });
  }

  /// 페이지 index 계산
  int getPagerIndex(int index) {
    return index;
  }

  /// 페이지 아이템 만들기
  Widget pagerItem(
    int index,
  ) {
    IntroductionItem item = widget.itemList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 114,
        ),
        BaseImageWidget(
          src: item.imageUrl,
          width: 200,
          height: 200,
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          item.title,
          style: korBold.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          item.description,
          style: korRegular.copyWith(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget makePagerWidget() {
    return SizedBox(
      height: 424,
      child: PageView.builder(
        itemBuilder: (context, index) {
          return pagerItem(index);
        },
        itemCount: IntroductionIndex.values.length,
        controller: _controller,
        onPageChanged: (value) {
          int result = getPagerIndex(value);
          IntroductionIndex newIndex;
          if (result == IntroductionIndex.second.index) {
            newIndex = IntroductionIndex.second;
          } else if (result == IntroductionIndex.third.index) {
            newIndex = IntroductionIndex.third;
          } else {
            newIndex = IntroductionIndex.first;
          }
          printLog('makePagerWidget() result: $result, newIndex: $newIndex');
          changePageIndex(newIndex);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Util.getColor(ColorName.white),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    Util.popAndgoRoute(context, ScreenName.main);
                  },
                  child: Text(
                    Util.getStringBundle(context).skip,
                    style: korRegular.copyWith(
                        color: Util.getColor(ColorName.gray666666),
                        fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
          makePagerWidget(),
          const SizedBox(
            height: 24,
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: widget.itemList.length,
            effect: WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              spacing: 14,
              type: WormType.thinUnderground,
              dotColor: Util.getColor(ColorName.gray888888),
              activeDotColor: Util.getColor(ColorName.primaryBlue),
            ),
          ),
          Expanded(
            child: Visibility(
                visible: _pagerIndex == IntroductionIndex.third,
                child: Container(
                  alignment: Alignment.center,
                  child: ServiceIntroductionButtonView(
                    onLogin: () {},
                    onSignup: () {},
                    viewModelKey: widget.viewModelKey,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  @override
  String getTagName() {
    return '_ServiceIntroductionScreenState';
  }

  @override
  void onPause() {}

  @override
  void onResume() {}
}

enum IntroductionIndex {
  first,
  second,
  third,
}
