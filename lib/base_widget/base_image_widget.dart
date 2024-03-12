import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/custom_font/custom_font.dart';
import 'package:toonflix/interface/log_interface.dart';
import 'package:toonflix/util/const_values.dart';

/// 이미지 캐싱 처리를 한번에 하는 Image Widget
class BaseImageWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final bool useFileCache;
  final String src;

  const BaseImageWidget({
    super.key,
    this.width,
    this.height,
    this.useFileCache = true,
    required this.src,
  });

  @override
  State<StatefulWidget> createState() => _BaseImageState();
}

class _BaseImageState extends State<BaseImageWidget> with LogCallback {
  ImageResourceType imageType = ImageResourceType.none;

  /// 이미지 타입 체크
  void checkImageType() {
    if (widget.src.startsWith(ConstValue.assetImagePath)) {
      imageType = ImageResourceType.asset;
    } else if (widget.src.startsWith('https://') ||
        widget.src.startsWith('http://')) {
      imageType = ImageResourceType.network;
    }
  }

  /// 이미지 load 오류 알림
  Widget makeErrorWidget(
    double? width,
    double? height,
    String msg,
  ) {
    return SizedBox(
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.cancel,
            color: Colors.red,
          ),
          Text(
            msg,
            style: korRegular.copyWith(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  /// ImageResourceType 맞게 위젯 생성
  Widget makeWidget() {
    double? width = widget.width;
    double? height = widget.height;
    String src = widget.src;
    switch (imageType) {
      case ImageResourceType.asset:
        {
          return Image.asset(
            src,
            width: width,
            height: height,
          );
        }
      case ImageResourceType.network:
        {
          if (widget.useFileCache) {
            return CachedNetworkImage(
              imageUrl: src,
              width: width,
              height: height,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) {
                String msg = 'wrong src: $url';
                if (error is String) {
                  msg = '$error src: $url';
                }
                return makeErrorWidget(width, height, msg);
              },
            );
          } else {
            return Image.network(
              src,
              width: width,
              height: height,
            );
          }
        }
      default:
        {
          return makeErrorWidget(width, height, 'wrong src');
        }
    }
  }

  @override
  void initState() {
    super.initState();
    checkImageType();
  }

  @override
  Widget build(BuildContext context) {
    return makeWidget();
  }

  @override
  String getTagName() {
    return '_BaseImageState';
  }
}

/// load 할 이미지 타입
enum ImageResourceType {
  none,

  /// 초기값
  asset,

  /// 리소스 이미지
  network,

  /// 네트워크 이미지
}
