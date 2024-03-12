import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final double _width;
  final String _url;
  const ImageCard({
    super.key,
    required double width,
    required String url,
  })  : _url = url,
        _width = width;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15,
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(
              0,
              0,
            ),
            blurRadius: 7,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
      width: _width,
      child: Image.network(
        _url,
      ),
    );
  }
}
