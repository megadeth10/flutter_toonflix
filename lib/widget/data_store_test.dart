import 'package:flutter/material.dart';
import 'package:toonflix/di/di.dart';
import 'package:toonflix/store/data_store.dart';

class DataStoreTest extends StatefulWidget {
  const DataStoreTest({super.key});

  @override
  State<DataStoreTest> createState() => _DataStoreTestState();
}

class _DataStoreTestState extends State<DataStoreTest> {
  final DataStore dataStore = getIt<DataStore>();
  List<String> _list = [];

  Future<void> _refreshList() async {
    final list = await dataStore.rawList();
    setState(() {
      _list = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Text(_list.toString()),
        ),
        SizedBox(
          height: 100,
          child: TextButton(
            onPressed: _refreshList,
            child: const Text('refresh'),
          ),
        ),
        SizedBox(
          height: 100,
          child: TextButton(
            onPressed: () {
              dataStore.clear();
            },
            child: const Text('clear'),
          ),
        )
      ],
    );
  }
}
