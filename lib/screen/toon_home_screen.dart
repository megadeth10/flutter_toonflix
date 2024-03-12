import 'package:flutter/material.dart';
import 'package:toonflix/store/webtoon_store.dart';
import 'package:toonflix/base_widget/safearea_scaffold_widget.dart';
import 'package:toonflix/widget/data_store_test.dart';
import 'package:toonflix/widget/webtoon_card.dart';
import 'package:toonflix/service/api_service.dart';
import 'package:toonflix/service/data/webtoon_model.dart';

class ToonHomeScreen extends StatelessWidget {
  ToonHomeScreen({super.key});

  final WebtoonStore webtoonStore = WebtoonStore();

  final Future<List<WebToonModel>> _list = ApiService.getTodays();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeAresScaffold(
        title: "튠",
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: FutureBuilder(
                future: _list,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<WebToonModel> list = snapshot.data!;
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        print("ListView() itemBuilder: index: $index");
                        final item = list[index];
                        return WebtoonCard(model: item, list: list);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                      itemCount: list.length,
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                },
              ),
            ),
            const DataStoreTest(),
          ],
        ),
      ),
    );
  }
}
