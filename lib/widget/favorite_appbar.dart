import 'package:flutter/material.dart';
import 'package:toonflix/di/di.dart';
import 'package:toonflix/store/data_store.dart';

class FavoriteAppBar extends StatefulWidget {
  final String _title;
  final String _id;
  const FavoriteAppBar({
    super.key,
    required String title,
    required String id,
  })  : _title = title,
        _id = id;

  @override
  State<FavoriteAppBar> createState() => _FavoriteAppBarState();
}

class _FavoriteAppBarState extends State<FavoriteAppBar> {
  final DataStore _store = getIt<DataStore>();
  bool _isLike = false;

  @override
  void initState() {
    super.initState();
    _initLike();
  }

  void _initLike() {
    final likeList = _store.getIdList();
    print('_initLike() $likeList');
    bool state = likeList.contains(widget._id);
    setState(() {
      _isLike = state;
    });
  }

  void storeData(bool newState) async {
    final list = _store.getIdList();
    print('storeData() before list: $list');
    final id = widget._id;
    if (newState) {
      if (!list.contains(id)) list.add(id);
    } else {
      if (list.contains(id)) list.remove(id);
    }
    print('storeData() after list: $list');
    await _store.setIdList(list);
  }

  void _toggleLike(bool newState) {
    if (_isLike != newState) {
      setState(() {
        _isLike = newState;
        storeData(_isLike);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return makeAppBar(
      title: widget._title,
      actions: [
        IconButton(
          onPressed: () {
            _toggleLike(!_isLike);
          },
          icon: Icon(
            _isLike ? Icons.favorite : Icons.favorite_outline,
          ),
        )
      ],
    );
  }
}

/// 앱바 위젯 생성
Widget makeAppBar({
  required String title,
  List<Widget>? actions,
  TextStyle? style,
}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.green,
    title: Text(
      title,
      style: style ??
          const TextStyle(
            color: Colors.black,
          ),
    ),
    actions: actions,
  );
}
