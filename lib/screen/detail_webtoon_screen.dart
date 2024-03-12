import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toonflix/service/api_service.dart';
import 'package:toonflix/service/data/webtoon_detail_model.dart';
import 'package:toonflix/service/data/webtoon_episode_model.dart';
import 'package:toonflix/service/data/webtoon_model.dart';
import 'package:toonflix/util/util.dart';
import 'package:toonflix/base_widget/safearea_scaffold_widget.dart';
import 'package:toonflix/widget/episode_widget.dart';
import 'package:toonflix/widget/favorite_appbar.dart';
import 'package:toonflix/widget/image_card.dart';

class DetailWebtoonScreen extends StatefulWidget {
  final WebToonModel _model;
  DetailWebtoonScreen({
    super.key,
    required WebToonModel model,
  }) : _model = model {
    print('DetailWebtoonScreen() model: $_model');
  }

  @override
  State<DetailWebtoonScreen> createState() => _DetailWebtoonScreenState();
}

class _DetailWebtoonScreenState extends State<DetailWebtoonScreen> {
  late Future<List<WebtoonEpisodeModel>> _episodes;
  late Future<WebtoonDetailModel> _detail;

  @override
  void initState() {
    super.initState();
    _episodes = ApiService.getEpisodeByid(widget._model.id);
    _detail = ApiService.getDetailbyId(widget._model.id);
  }

  @override
  void didChangeDependencies() {
    /*
      TODO: initState 다음에 바로 호출 된다.
      또한 위젯이 의존하는 데이터의 객체가 호출될때마다 호출된다. 예를 들면 업데이트되는 위젯을 상속한 경우.
      공식문서 또한 상속한 위젯이 업데이트 될때 네트워크 호출
    */
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant DetailWebtoonScreen oldWidget) {
    // TODO: didUpdateWidget()는 부모 위젯이 변경되어 이 위젯을 재 구성해야 하는 경우(다은 데이터를 제공 해야하기 때문)
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Util.getScreenSize(context);
    // ignore: unused_local_variable
    double screenWidth = screenSize.width - 60;
    return SafeAresScaffold(
      title: "",
      appBar: FavoriteAppBar(
        id: widget._model.id,
        title: widget._model.title,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: widget._model.id,
                      child: ImageCard(
                        width: 100,
                        url: widget._model.thumb,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: _detail,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.about,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          ),
                        ],
                      );
                    }
                    return const Text("...");
                  },
                ),
                TextButton(
                  onPressed: () {
                    context.go('/');
                  },
                  child: const Text('홈으로'),
                ),
                const SizedBox(
                  height: 20,
                ),
                // makeEpisodsAsColumn(_episodes),
                makeEpisods(_episodes),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeEpisodsAsColumn(Future<List<WebtoonEpisodeModel>> futureList) {
    return FutureBuilder(
      future: futureList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<WebtoonEpisodeModel> list = snapshot.data!;
          return Column(
            children: [
              for (var item in list)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
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
                          item.title,
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
                ),
            ],
          );
        }
        return Container();
      },
    );
  }

  Widget makeEpisods(Future<List<WebtoonEpisodeModel>> futureList) {
    return FutureBuilder(
      future: futureList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<WebtoonEpisodeModel> list = snapshot.data!;
          int listLength = list.length;
          return SizedBox(
            height: 60,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                WebtoonEpisodeModel model = list[index];
                // print("makeEpisods() model: ${model.title}");
                return EpisodeWidget(
                  model: model,
                  id: widget._model.id,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemCount: listLength,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
