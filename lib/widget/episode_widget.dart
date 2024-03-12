import 'package:flutter/material.dart';
import 'package:toonflix/service/data/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher.dart';

class EpisodeWidget extends StatelessWidget {
  const EpisodeWidget({
    super.key,
    required WebtoonEpisodeModel model,
    required String id,
  })  : _model = model,
        _id = id;

  final String _id;
  final WebtoonEpisodeModel _model;

  void _onClickEpisode() async {
    Uri url = Uri.parse(
        "https://comic.naver.com/webtoon/detail?titleId=$_id&no=${_model.id}");
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onClickEpisode,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        width: 80,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _model.title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
